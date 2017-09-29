unit acbr.MDFEGerar;

interface

uses Vcl.Dialogs, System.SysUtils, System.UITypes,
  ACBrMDFe, pmdfeConversaoMDFe, pcnConversao, pmdfeMDFe,
  uConstantes,
  Rotina.Registro, Rotina.Strings,
  ORM.Mdfe, orm.cte, orm.empresa, orm.veiculo, orm.transportadora, orm.MDFEDescarregamento,
  orm.MDFECTE, ORM.Fornecedor, orm.mdfeinfunidtranspcte, orm.MDFEInfunidcargacte;

type
  TMDFEGerar = class
  private
    mdfe : TMDFE;
    ACBrMDFe1: tACBrMDFe;
    procedure Adicionar;
    procedure AutorizacaoXML;
    procedure Carregamento;
    procedure Condutor;
    procedure Consistir;
    procedure CTE(item: TMDFEDescarregamento; item2: TinfMunDescargaCollectionItem);
    procedure Emitente;
    procedure EmitenteEndereco;
    procedure Lacre;
    procedure Identificacao;
    procedure InfDoc;
    procedure NFE(item: TMDFEDescarregamento; item2: TinfMunDescargaCollectionItem);
    procedure Pedagio;
    procedure Proprietario(veiculo:TVeiculo);
    procedure ProprietarioReboque(item: TveicReboqueCollectionItem; veiculo: TVeiculo);
    procedure Rodoviario;
    procedure InfAntt;
    procedure VeiculoReboque;
    procedure Veiculotracao;
    procedure Seguro;
    procedure Tot;
    procedure UFPercurso;
    procedure UnidadeTransporteCTE(Item: TMDFECTE; item2:TinfCTeCollectionItem);
    function ObterTpEmis: TpcnTipoEmissao;
    function ObterRespSeg(cdrespseg:Integer):TRspSegMDFe;
    function ObterTpEmit:TTpEmitenteMDFe;
    function ObterModal:TModalMDFe;
    function ObtercUnid (nmunidade:string):TUnidMed;
    function ObtertpRod (cdctetprodado:string):TpcteTipoRodado;
    function ObtertpCar (cdctetpcarroceria:string):TpcteTipoCarroceria;
    function ObtertpProp(cdctetpproprietario:Integer):TpcteProp;
    function ObtertpTransp:TTransportadorMDFe;
    function ObtertpUnidTransp(cdtpunidtransp:Integer):TpcnUnidTransp;
    procedure LacreUnidadeTransporteCTe(Item: Tmdfeinfunidtranspcte; item2: TinfUnidTranspCollectionItem);
    procedure UnidadeCarga(Item: Tmdfeinfunidtranspcte; item2: TinfUnidTranspCollectionItem);
    function ObtertpUnidCarga(cdtpunidcarga: integer): TpcnUnidCarga;
    procedure LacreUnidadeCargaCTE(Item: TMDFEInfunidcargacte; item2: TinfUnidCargaCollectionItem);
  public
    class procedure Gerar(amdfe: TMDFE; aACBrMDFe1: tACBrMDFe);
  end;

implementation

procedure TMDFEGerar.Adicionar;
begin
  ACBrMDFe1.Manifestos.Clear;
  ACBrMDFe1.Manifestos.Add;
  ACBrMDFe1.Manifestos.Items[0].MDFe.infAdic.infCpl := mdfe.DSOBSERVACAO;
  Identificacao;
  Emitente;
  Rodoviario;
  InfDoc;
  Tot;
  Lacre;
  AutorizacaoXML;
  Seguro;
end;

procedure TMDFEGerar.Condutor;
var
  i : Integer;
begin
  for I := 0 to mdfe.mdfetransportadora.Count - 1 do
  begin
    with ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.condutor.Add do
    begin
      xNome :=                   qregistro.NomedoCodigo  (_transportadora, mdfe.mdfetransportadora.Items[i].cdtransportadora);
      CPF   := removercaracteres(qregistro.StringdoCodigo(_transportadora, mdfe.mdfetransportadora.Items[i].cdtransportadora, _NUCPF));
    end;
  end;
end;

procedure TMDFEGerar.Consistir;
begin
  if mdfe.cdufinicio = 0 then
  begin
    messagedlg('UF de Carregamento é um campo obrigatório.', mtinformation, [mbok], 0);
    abort;
  end;
  if mdfe.cduffim = 0 then
  begin
    messagedlg('UF de Descarregamento é um campo obrigatório.', mtinformation, [mbok], 0);
    abort;
  end;
  if not mdfe.VerificarUFPercurso then
  begin
    messagedlg('UF´S do percurso obrigatório de acordo com a UF de início e fim.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if Length(qregistro.StringdoCodigo(_veiculo, mdfe.cdveiculo, _nurntrc)) > 8 then
  begin
    messagedlg('O número RNTRC do veículo '+qregistro.StringdoCodigo(_veiculo, mdfe.cdveiculo, _nuplaca)+
               ' está maior do 8 caracteres.', mtInformation, [mbok], 0);
    abort;
  end;
  if mdfe.mdfetransportadora.Count = 0 then
  begin
    messagedlg('O preenchimento do Condutor é obrigatório.', mtinformation, [mbok], 0);
    abort;
  end;
  if (lowercase(qregistro.NomedoCodigo(_unidade, mdfe.cdunidade)) <> _KG) and
     (lowercase(qregistro.NomedoCodigo(_unidade, mdfe.cdunidade)) <> _ton) then
  begin
    MessageDlg('Código de Unidade '+lowercase(qregistro.NomedoCodigo(_unidade, mdfe.cdunidade))+' não identificado.', mtInformation, [mbok], 0);
    Abort;
  end;
end;

procedure TMDFEGerar.CTE(item: TMDFEDescarregamento; item2: TinfMunDescargaCollectionItem);
var
  i : Integer;
  nuchave : string;
begin
  for I := 0 to Item.mdfecte.Count - 1 do
  begin
    item2.infCTe.Add;
    item2.infCTe.Items[i].chCTe := QRegistro.StringdoCodigo(_cte, item.mdfecte.Items[i].cdcte, _nuchavenfe);
    // item2.infCTe.Items[i].indReentrega :=
    nuchave                     := QRegistro.StringdoCodigo(_cte , Item.mdfecte.Items[i].cdcte, _nuchavecontingencia);
    if nuchave <> '' then
    begin
      item2.infCTe.Items[i].SegCodBarra := nuchave;
    end;
    if item.mdfecte.Items[i].indreentrega = _s then
    begin
      item2.infCTe.Items[i].indReentrega := _1;
    end;
    UnidadeTransporteCTE(Item.mdfecte.Items[i], item2.infCTe.Items[i]);
  end;
end;

procedure TMDFEGerar.AutorizacaoXML;
var
  I: Integer;
begin
  for I := 0 to mdfe.mdfeautxml.Count - 1 do
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.autXML.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.autXML.Items[i].CNPJCPF := mdfe.mdfeautxml.Items[i].nucnpjcpf;
  end;
end;

procedure TMDFEGerar.Carregamento;
var
  i : Integer;
begin
  for I := 0 to mdfe.mdfecarregamento.Count - 1 do
  begin
    with ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.infMunCarrega.Add do
    begin
      cMunCarrega := mdfe.mdfecarregamento.Items[i].cdmunicipio;
      xMunCarrega := qregistro.NomedoCodigo(_municipio, mdfe.mdfecarregamento.Items[i].CDMUNICIPIO);
    end;
  end;
end;

class procedure TMDFEGerar.Gerar(amdfe: TMDFE; aACBrMDFe1: tACBrMDFe);
var
  vGerar : TMDFEGerar;
begin
  vGerar := TMDFEGerar.Create;
  try
    vGerar.mdfe      := amdfe;
    vGerar.ACBrMDFe1 := aACBrMDFe1;
    vGerar.Consistir;
    vGerar.Adicionar;
  finally
    freeandnil(vGerar);
  end;
end;

procedure TMDFEGerar.ProprietarioReboque(item: TveicReboqueCollectionItem; veiculo: TVeiculo);
var
  transportadora : ttransportadora;
begin
  transportadora := ttransportadora.create;
  try
    transportadora.Select(veiculo.cdtransportadora);
    if (transportadora.tppessoa = _F) or
       ((transportadora.tppessoa = _j) and (transportadora.nucnpj <> empresa.nucnpj)) then
    begin
      item.prop.CNPJCPF := transportadora.GetCodigoCNPJCPF;
      item.prop.RNTRC   := veiculo.nurntrc;
      item.prop.xNome   := transportadora.rzsocial;
      item.prop.IE      := removercaracteres(transportadora.nuinscest);
      item.prop.UF      := qregistro.StringdoCodigo(_uf, transportadora.cduf, _sguf);
      item.prop.tpProp  := ObtertpProp(veiculo.cdctetpproprietario);
    end;
  finally
    FreeAndNil(transportadora);
  end;
end;

procedure TMDFEGerar.EmitenteEndereco;
begin
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.xLgr    := empresa.endereco.dsendereco;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.nro     := empresa.endereco.dsnumero;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.xCpl    := empresa.endereco.dscomplemento;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.xBairro := empresa.endereco.nmbairro;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.cMun    := empresa.endereco.cdmunicipio;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.xMun    := empresa.endereco.nmmunicipio;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.CEP     := strtoint(removercaracteres(empresa.endereco.nucep));
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.UF      := empresa.endereco.sguf;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.EnderEmit.fone    := empresa.nufone1;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.enderEmit.email   := Empresa.email;
end;

procedure TMDFEGerar.Emitente;
begin
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.CNPJ  := Empresa.nucnpj_;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.IE    := empresa.nuinscest_;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.xNome := empresa.rzsocial;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Emit.xFant := empresa.nmempresa;
  EmitenteEndereco;
end;

procedure TMDFEGerar.Identificacao;
begin
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.cUF     := mdfe.CDUF; // Dados de Identificação do MDF-e
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpAmb   := ACBrMDFe1.Configuracoes.WebServices.Ambiente;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpEmit  := ObterTpEmit;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpTransp := ObtertpTransp;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.modelo  := _58;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.serie   := StrToInt(NomedoCodigo(_serie, mdfe.CDSERIE.ToString, _nuserie));
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.nMDF    := mdfe.NUMDFE;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.cMDF    := -1;  // Código não Aleatório
  //ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.cDV    := campo ignorado por causa da opcao acima
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.modal   := ObterModal;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.dhEmi   := mdfe.DTEMISSAO + mdfe.HREMISSAO;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.tpEmis  := ObterTpEmis;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.procEmi := peAplicativoContribuinte; // TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoFisco);
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.verProc := Empresa.nuversao;
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.UFIni   := qregistro.StringdoCodigo(_uf, mdfe.cdufinicio, _sguf);
  ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.UFFim   := qregistro.StringdoCodigo(_uf, mdfe.cduffim, _sguf);
  Carregamento;
  UFPercurso;
end;

procedure TMDFEGerar.InfAntt;
begin
  ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.RNTRC            := Empresa.faturamento.cte.nurntrc;
  if mdfe.CDCIOT <> '' then
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.infCIOT.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.infCIOT.Items[0].CIOT    := mdfe.CDCIOT;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.infCIOT.Items[0].CNPJCPF := empresa.nucnpj_;
  end;
  Pedagio;
end;

procedure TMDFEGerar.InfDoc;
var
  i : Integer;
begin
  for I := 0 to mdfe.mdfedescarregamento.Count - 1 do
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[i].cMunDescarga := mdfe.mdfedescarregamento.Items[i].CDMUNICIPIO;
    ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[i].xMunDescarga := qregistro.NomedoCodigo(_municipio, mdfe.mdfedescarregamento.Items[i].CDMUNICIPIO);
    NFE(mdfe.mdfedescarregamento.Items[i], ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[i]);
    cte(mdfe.mdfedescarregamento.Items[i], ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[i]);
  end;
end;

procedure TMDFEGerar.Lacre;
var
  i : integer;
begin
  for I := 0 to mdfe.mdfelacre.Count - 1 do
  begin
    with ACBrMDFe1.Manifestos.Items[0].MDFe.lacres.Add do
    begin
      nLacre := mdfe.mdfelacre.Items[i].nulacre;
    end;
  end;
end;

procedure TMDFEGerar.Rodoviario;
begin
  InfAntt;
  VeiculoTracao;
  VeiculoReboque;
end;

procedure TMDFEGerar.Seguro;
var
  fornecedor : TFornecedor;
begin
  ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Add;
  ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].respSeg := ObterRespSeg(mdfe.cdmdferespseg);
  ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].CNPJCPF := mdfe.cnpjcpfResponsavelSeguro;
  fornecedor := TFornecedor.create;
  try
    if not fornecedor.Select(mdfe.cdfornecedor) then
    begin
      Exit;
    end;
    ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].xSeg := fornecedor.rzsocial;
    ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].CNPJ := removercaracteres(fornecedor.nucnpj);
    ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].nApol := mdfe.napol;
    ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].aver.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.seg.Items[0].aver.Items[0].nAver := mdfe.napol;
  finally
    FreeAndNil(fornecedor);
  end;
end;

procedure TMDFEGerar.Tot;
begin
  if mdfe.CDMDFETPEMITENTE = 2 then
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.tot.qNFe := mdfe.QTNFE;
  end;
  ACBrMDFe1.Manifestos.Items[0].MDFe.tot.qCTe   := mdfe.QTCTE;
  ACBrMDFe1.Manifestos.Items[0].MDFe.tot.vCarga := mdfe.VLCARGA;
  ACBrMDFe1.Manifestos.Items[0].MDFe.tot.cUnid  := ObtercUnid(lowercase(qregistro.NomedoCodigo(_unidade, mdfe.cdunidade)));
  ACBrMDFe1.Manifestos.Items[0].MDFe.tot.qCarga := mdfe.QTCARGA;
end;

procedure TMDFEGerar.NFE(item: TMDFEDescarregamento; item2: TinfMunDescargaCollectionItem);
var
  i : Integer;
begin
  if mdfe.CDMDFETPEMITENTE = 2 then
  begin
    for I := 0 to Item.mdfenfe.Count - 1 do
    begin
      item2.infNFe.Add;
      item2.infNFe.items[i].chNFe := Item.mdfenfe.Items[i].NUCHAVENFE;
      if item.mdfenfe.Items[i].indreentrega = _s then
      begin
        item2.infNFe.Items[i].indReentrega := _1;
      end;
    end;
  end;
end;

function TMDFEGerar.ObtercUnid(nmunidade:string): TUnidMed;
begin
  if nmunidade = _KG  then
  begin
    result := uKG
  end
  else if nmunidade = _ton then
  begin
    result := uTON;
  end;
end;

function TMDFEGerar.ObterModal:TModalMDFe;
begin
  case mdfe.CDMDFEMODALIDADE of
    1 : result := moRodoviario;
    2 : result := moAereo;
    3 : result := moAquaviario;
    4 : result := moFerroviario;
  end;
end;

function TMDFEGerar.ObterRespSeg(cdrespseg: Integer): TRspSegMDFe;
begin
  case cdrespseg of
    1 : result := rsEmitente;
    2 : result := rsTomadorServico;
  end;
end;

function TMDFEGerar.ObtertpCar(cdctetpcarroceria: string): TpcteTipoCarroceria;
begin
       if cdctetpcarroceria = _00 then result := tcNaoAplicavel
  else if cdctetpcarroceria = _01 then result := tcAberta
  else if cdctetpcarroceria = _02 then result := tcFechada
  else if cdctetpcarroceria = _03 then result := tcGraneleira
  else if cdctetpcarroceria = _04 then result := tcPortaContainer
  else if cdctetpcarroceria = _05 then result := tcSider;
end;

function TMDFEGerar.ObterTpEmis: TpcnTipoEmissao;
begin
  case mdfe.CDMDFEFORMAEMISSAO of
    1 : result := teNormal;
    2 : result := teContingencia;
  end;
end;

function TMDFEGerar.ObterTpEmit:TTpEmitenteMDFe;
begin
  case mdfe.CDMDFETPEMITENTE of
    1 : result := teTransportadora; // TMDFeTpEmitente = ( teTransportadora, teTranspCargaPropria );
    2 : result := teTranspCargaPropria; // TMDFeTpEmitente = ( teTransportadora, teTranspCargaPropria );
  end;
end;

function TMDFEGerar.ObtertpProp(cdctetpproprietario: Integer): TpcteProp;
begin
  case cdctetpproprietario of
    0 : result := tpTACAgregado;
    1 : result := tpTACIndependente;
    2 : result := tpOutros;
  end;
end;

function TMDFEGerar.ObtertpRod(cdctetprodado:string): TpcteTipoRodado;
begin
       if cdctetprodado = _00 then result := trNaoAplicavel
  else if cdctetprodado = _01 then result := trTruck
  else if cdctetprodado = _02 then result := trToco
  else if cdctetprodado = _03 then result := trCavaloMecanico
  else if cdctetprodado = _04 then result := trVAN
  else if cdctetprodado = _05 then result := trUtilitario
  else if cdctetprodado = _06 then result := trOutros;
end;

function TMDFEGerar.ObtertpTransp: TTransportadorMDFe;
begin
  if mdfe.tptransp = _ETC then
  begin
    result := ttCTC;
  end
  else if mdfe.tptransp = _TAC then
  begin
    result := ttTAC;
  end
  else if mdfe.tptransp = _CTC then
  begin
    result := ttETC;
  end
  else
  begin
    result := ttNenhum;
  end;
end;

function TMDFEGerar.ObtertpUnidTransp(cdtpunidtransp:Integer): TpcnUnidTransp;
begin
  case cdtpunidtransp of
    1: result := utRodoTracao;
    2: result := utRodoReboque;
    3: result := utNavio;
    4: result := utBalsa;
    5: result := utAeronave;
    6: result := utVagao;
    7: result := utOutros;
  end;
end;

procedure TMDFEGerar.Pedagio;
var
  i : Integer;
begin
  for I := 0 to mdfe.mdfepedagio.Count - 1 do
  begin
    with ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.valePed.disp.Add do
    begin
      CNPJForn := removercaracteres(qregistro.StringdoCodigo(_fornecedor, mdfe.mdfepedagio.items[i].CDFORNECEDOR, _nucnpj));
      CNPJPg   := removercaracteres(qregistro.StringdoCodigo(_fornecedor, mdfe.mdfepedagio.items[i].CDRESPONSAVEL, _nucnpj));
      nCompra  := mdfe.mdfepedagio.items[i].NUCOMPROVANTE;
      vValePed := mdfe.mdfepedagio.items[i].vvaleped;
    end;
  end;
  if mdfe.mdfepedagio.Count > 0 then
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.infContratante.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.infANTT.infContratante.Items[0].CNPJCPF := empresa.nucnpj_;
  end;
end;

procedure TMDFEGerar.Proprietario(veiculo:TVeiculo);
var
  transportadora : TTransportadora;
begin
  transportadora := TTransportadora.Create;
  try
    transportadora.Select(veiculo.cdtransportadora);
    if (transportadora.tppessoa = _F) or ((transportadora.tppessoa = _j) and (transportadora.nucnpj <> empresa.nucnpj))  then
    begin
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.CNPJCPF := transportadora.GerarCodigoCNPJCPF;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.RNTRC   := veiculo.nurntrc;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.xNome   := transportadora.rzsocial;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.IE      := removercaracteres(transportadora.nuinscest);
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.UF      := qregistro.StringdoCodigo(_uf, transportadora.cduf, _sguf);
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.prop.tpProp  := ObtertpProp(veiculo.cdctetpproprietario);
    end;
  finally
    freeandnil(transportadora);
  end;
end;

procedure TMDFEGerar.UFPercurso;
var
  i : Integer;
begin
  for I := 0 to mdfe.mdfeufpercurso.Count -1 do
  begin
    ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.infPercurso.Add;
    ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.infPercurso.Items[i].UFPer := qregistro.StringdoCodigo(_uf, mdfe.mdfeufpercurso.Items[i].CDUF, _sguf);
    // ACBrMDFe1.Manifestos.Items[0].MDFe.Ide.infPercurso.Items[i].dhiniviagem
  end;
end;

procedure TMDFEGerar.UnidadeTransporteCTE(Item: TMDFECTE; item2: TinfCTeCollectionItem);
var
  I: Integer;
begin
  for I := 0 to Item.mdfeinfunidtranspcte.Count - 1 do
  begin
    item2.infUnidTransp.Add;
    item2.infUnidTransp.Items[i].tpUnidTransp := ObtertpUnidTransp(Item.mdfeinfunidtranspcte.Items[i].cdtpunidtransp);
    item2.infUnidTransp.Items[i].idUnidTransp := Item.mdfeinfunidtranspcte.Items[i].idunidtransp;
    LacreUnidadeTransporteCTe(Item.mdfeinfunidtranspcte.Items[i], item2.infUnidTransp.Items[i]);
    UnidadeCarga(Item.mdfeinfunidtranspcte.Items[i], item2.infUnidTransp.Items[i]);
  end;
end;

procedure TMDFEGerar.UnidadeCarga(Item: Tmdfeinfunidtranspcte; item2: TinfUnidTranspCollectionItem);
var
  I: Integer;
begin
  for I := 0 to Item.mdfeinfunidcargacte.Count - 1 do
  begin
    item2.infUnidCarga.Add;
    item2.infUnidCarga.Items[i].tpUnidCarga  := ObtertpUnidCarga(Item.mdfeinfunidcargacte.Items[i].cdtpunidcarga);
    item2.infUnidCarga.Items[i].idUnidCarga  := Item.mdfeinfunidcargacte.Items[i].idunidcarga;
    item2.infUnidCarga.Items[i].qtdRat       := Item.mdfeinfunidcargacte.Items[i].qtdRat;
    LacreUnidadeCargaCTE(Item.mdfeinfunidcargacte.Items[i], item2.infUnidCarga.Items[i]);
  end;
end;

procedure TMDFEGerar.LacreUnidadeCargaCTE(Item: TMDFEInfunidcargacte; item2: TinfUnidCargaCollectionItem);
var
  I: Integer;
begin
  for I := 0 to Item.mdfelacunidcargacte.Count - 1 do
  begin
    item2.lacUnidCarga.Add;
    item2.lacUnidCarga.Items[i].nLacre := Item.mdfelacunidcargacte.Items[i].nlacre;
  end;
end;

function TMDFEGerar.ObtertpUnidCarga(cdtpunidcarga: integer):TpcnUnidCarga;
begin
  case cdtpunidcarga of
    1 : result := ucContainer;
    2 : result := ucULD;
    3 : result := ucPallet;
    4 : result := ucOutros;
  end;
end;


procedure TMDFEGerar.LacreUnidadeTransporteCTe(Item: Tmdfeinfunidtranspcte; item2: TinfUnidTranspCollectionItem);
var
  I: Integer;
begin
  for I := 0 to Item.mdfeLacunidTranspcte.Count - 1 do
  begin
    item2.lacUnidTransp.Add;
    item2.lacUnidTransp.Items[i].nLacre := Item.mdfeLacunidTranspcte.Items[i].nlacre;
  end;
end;

procedure TMDFEGerar.VeiculoReboque;
var
  veiculo : TVeiculo;
  i : integer;
begin
  for I := 0 to mdfe.mdfeveiculo.Count -1 do
  begin
    veiculo := TVeiculo.Create;
    try
      veiculo.Select(mdfe.mdfeveiculo.Items[i].cdveiculo);
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Add;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].cInt  := IntToStr(veiculo.cdveiculo);
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].placa := veiculo.nuplaca;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].tara  := veiculo.pstara;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].capKG := veiculo.pscapacidade;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].capM3 := veiculo.pscapacidadem3;
      ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i].UF    := qregistro.StringdoCodigo(_uf, veiculo.cduf, _sguf);
      ProprietarioReboque(ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicReboque.Items[i], veiculo);
    finally
      freeandnil(veiculo);
    end;
  end;
end;

procedure TMDFEGerar.Veiculotracao;
var
  veiculo: TVeiculo;
begin
  veiculo := TVeiculo.Create;
  try
    veiculo.select(mdfe.CDVEICULO);
    {
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.RNTRC            := Empresa.faturamento.cte.nurntrc;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.CIOT             := mdfe.CDCIOT;
    }
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.cInt  := IntToStr(veiculo.cdveiculo);
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.placa := veiculo.nuplaca;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.tara  := veiculo.pstara;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.capKG := veiculo.pscapacidade;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.capM3 := veiculo.pscapacidadem3;
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.tpRod := ObtertpRod(veiculo.cdctetprodado);
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.UF    := qregistro.StringdoCodigo(_uf, veiculo.cduf, _sguf);
    ACBrMDFe1.Manifestos.Items[0].MDFe.rodo.veicTracao.tpCar := ObtertpCar(veiculo.cdctetpcarroceria);
    Proprietario(veiculo);
    Condutor;
  finally
    FreeAndNil(veiculo);
  end;
end;

end.
