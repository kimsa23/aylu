unit ORM.Mdfe;

interface

uses
  SysUtils, Contnrs, db, classes, dialogs, system.uitypes,
  ACBrMDFe,
  uconstantes, dialogo.SelecionarEntrada, rotina.rotinas,
  orm.empresa, rotina.retornasql, classe.query, orm.cliente, orm.cte, classe.dao,
  classe.executasql, orm.serie, orm.TpMDFE, orm.MDFEveiculo, orm.MDFETransportadora,
  orm.MDFEPedagio, orm.MDFECarregamento, orm.MDFELacre, orm.MDFENFE, orm.MDFECTE,
  orm.MDFEDescarregamento, orm.MDFEMunicipioPercurso, orm.MDFEUFPercurso, orm.mdfeautxml;

type
  TMDFE = class(TRegistroQuipos)
  private
    ftpmdfe : ttpmdfe;
    fcdmdfe : Integer;
    fcdserie : Integer;
    fcduf : Integer;
    fcdmdfetpemitente : Integer;
    fcdmdfemodalidade : Integer;
    fcdmdfeformaemissao : integer;
    fcdufinicio : Integer;
    fcduffim : Integer;
    fcdunidade : Integer;
    fcdveiculo : Integer;
    fcdtpmdfe : Integer;
    fcdstmdfe : Integer;
    fnumdfe : Integer;
    fdtemissao : TDate;
    fdtencerramento : TDate;
    fhremissao : TTime;
    fnuchave : string;
    fcdverificadorchave : string;
    fqtcte : Integer;
    fqtnfe : Integer;
    fvlcarga : Currency;
    fnurntrc : string;
    fcdciot : string;
    fqtcarga : Double;
    fnuprotocoloautorizacao : string;
    fnulote : Integer;
    fdsxml : string;
    ftsprotocoloautorizacao : TDateTime;
    fnuchavenfe : string;
    fnurecibonfe : string;
    fdscancelamento : string;
    fnuprotocolocancelamento : string;
    fdsxmlcancel : string;
    fnuseqevento : integer;
    fnuprotocoloencerramento : string;
    fdsxmlencerramento : string;
    Fmdfeveiculo: TMdfeveiculolist;
    Fmdfetransportadora: TMDFETransportadoraList;
    Fmdfepedagio: TMDFEPedagioList;
    Fmdfecarregamento: Tmdfecarregamentolist;
    Fmdfedescarregamento: TMDFEDescarregamentolist;
    Fmdfelacre: TMDFELacreList;
    Fmdfemunicipiopercurso: tmdfemunicipiopercursolist;
    Fmdfeufpercurso: tmdfeufpercursolist;
    FACBrMDFe: TACBrMDFe;
    FSerie: TSerie;
    fdsobservacao: string;
    ftptransp: string;
    fcdfornecedor: Largeint;
    fnaver: string;
    fnapol: string;
    fcdmdferespseg: integer;
    fmdfeautxml: TMDFEAutXMLList;
    fnucnpjcpf: string;
  public
    property ACBrMDFe: TACBrMDFe read FACBrMDFe write FACBrMDFe;
    property mdfeufpercurso : tmdfeufpercursolist read Fmdfeufpercurso write Fmdfeufpercurso;
    property mdfemunicipiopercurso : tmdfemunicipiopercursolist read Fmdfemunicipiopercurso write Fmdfemunicipiopercurso;
    property mdfelacre : TMDFELacreList read Fmdfelacre write Fmdfelacre;
    property mdfedescarregamento : TMDFEDescarregamentolist read Fmdfedescarregamento write Fmdfedescarregamento;
    property mdfecarregamento : Tmdfecarregamentolist read Fmdfecarregamento write Fmdfecarregamento;
    property mdfeveiculo : TMdfeveiculolist read Fmdfeveiculo write Fmdfeveiculo;
    property mdfetransportadora : TMDFETransportadoraList read Fmdfetransportadora write Fmdfetransportadora;
    property mdfepedagio : TMDFEPedagioList read Fmdfepedagio write Fmdfepedagio;
    property tpmdfe : TTpmdfe read ftpmdfe write ftpmdfe;
    property Serie : TSerie read FSerie write FSerie;
    [keyfield]
    property cdmdfe : integer read fcdmdfe write fcdmdfe;
    [fk]
    property cdserie : Integer read fcdserie write fcdserie;
    [fk]
    property cduf : integer read fcduf write fcduf;
    [fk]
    property cdmdfetpemitente : integer read fcdmdfetpemitente write fcdmdfetpemitente;
    [fk]
    property cdmdfemodalidade : integer read fcdmdfemodalidade write fcdmdfemodalidade;
    [fk]
    property cdmdfeformaemissao : integer read fcdmdfeformaemissao write fcdmdfeformaemissao;
    [fk]
    property cdufinicio : Integer read fcdufinicio write fcdufinicio;
    [fk]
    property cduffim : integer read fcduffim write fcduffim;
    [fk]
    property cdunidade : integer read fcdunidade write fcdunidade;
    [fk]
    property cdveiculo : integer read fcdveiculo write fcdveiculo;
    [fk]
    property cdtpmdfe : integer read fcdtpmdfe write fcdtpmdfe;
    [fk]
    property cdstmdfe : integer read fcdstmdfe write fcdstmdfe;
    [FK]
    property cdfornecedor: Largeint read fcdfornecedor write fcdfornecedor;
    [FK]
    property cdmdferespseg: integer read fcdmdferespseg write fcdmdferespseg;
    property napol: string read fnapol write fnapol;
    property naver: string read fnaver write fnaver;
    property numdfe : integer read fnumdfe write fnumdfe;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property hremissao : TTime read fhremissao write fhremissao;
    property nuchave : string read fnuchave write fnuchave;
    property cdverificadorchave : string read fcdverificadorchave write fcdverificadorchave;
    [AObrigatorio]
    property qtcte : integer read fqtcte write fqtcte;
    [AObrigatorio]
    property qtnfe : integer read fqtnfe write fqtnfe;
    property vlcarga : currency read fvlcarga write fvlcarga;
    property nurntrc : string read fnurntrc write fnurntrc;
    property cdciot : string read fcdciot write fcdciot;
    property qtcarga : double  read fqtcarga write fqtcarga;
    property nuprotocoloautorizacao : string read fnuprotocoloautorizacao write fnuprotocoloautorizacao;
    property nulote : integer read fnulote write fnulote;
    property dsxml : string read fdsxml write fdsxml;
    property tsprotocoloautorizacao : tdatetime read ftsprotocoloautorizacao write ftsprotocoloautorizacao;
    property nuchavenfe : string read fnuchavenfe write fnuchavenfe;
    property nurecibonfe : string read fnurecibonfe write fnurecibonfe;
    property dscancelamento : string read fdscancelamento write fdscancelamento;
    property nuprotocolocancelamento : string read fnuprotocolocancelamento write fnuprotocolocancelamento;
    property dsxmlcancel : string read fdsxmlcancel write fdsxmlcancel;
    property nuseqevento : integer read fnuseqevento write fnuseqevento;
    property nuprotocoloencerramento : string read fnuprotocoloencerramento write fnuprotocoloencerramento;
    property dsxmlencerramento : string read fdsxmlencerramento write fdsxmlencerramento;
    property dtencerramento : TDate read fdtencerramento write fdtencerramento;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property tptransp: string read ftptransp write ftptransp;
    property mdfeautxml: TMDFEAutXMLList read fmdfeautxml write fmdfeautxml;
    property nucnpjcpf: string read fnucnpjcpf write fnucnpjcpf;
    function CodigoMDFE(numdfe, a:string):integer;overload;
    function CodigoMDFE(nu:string):integer;overload;
    function ListaEmailRemetenteCTE:string;
    function Update(boscript:boolean=false): string;
    constructor create;
    destructor destroy; override;
    function ImportarXML:boolean;
    function carregarxml(xml:string): Boolean;
    function Cancelar(dsjustificativa:string; nuprotocolo:string; xmlcancel:string):boolean;
    function VerificarUFPercurso:Boolean;
    function cnpjcpfResponsavelSeguro:string;
  end;

implementation

uses
  orm.UF;

destructor TMDFE.destroy;
begin
  FreeAndNil(fmdfeautxml);
  FreeAndNil(fserie);
  FreeAndNil(ftpmdfe);
  FreeAndNil(fmdfeufpercurso);
  freeandnil(fmdfemunicipiopercurso);
  freeandnil(fmdfelacre);
  freeandnil(fmdfedescarregamento);
  freeandnil(fmdfecarregamento);
  freeandnil(fmdfepedagio);
  freeandnil(fmdfetransportadora);
  freeandnil(fmdfeveiculo);
  inherited;
end;

function TMDFE.ImportarXML: boolean;
var
  xml : TStrings;
  filename : string;
begin
  result := false;
  xml := TStringlist.create;
  try
    if not QRotinas.SelecionarNomeArquivo(filename) then // selecionar o arquivo
    begin
      exit;
    end;
    xml.loadfromfile(filename);
    carregarxml(xml.text); // carregar em nfe
    // verificar dados do xml
    if ACBrMDFe.manifestos.Items[0].MDFe.Ide.cMDF <> numdfe then
    begin
      messagedlg('Número da nota fiscal diferente.', mtinformation, [mbok], 0);
      abort;
    end;
    // update nos campos
    dsxml := ACBrMDFe.manifestos.Items[0].XML;
    nuchavenfe := ACBrMDFe.manifestos.Items[0].MDFe.procMDFe.chMDFe;
    nuprotocoloautorizacao := ACBrMDFe.manifestos.Items[0].MDFe.procMDFe.nProt;
    TSPROTOCOLOAUTORIZACAO := ACBrMDFe.manifestos.Items[0].MDFe.procMDFe.dhRecbto;
    //dados.NURECIBONFE := dados.ACBrNFe.NotasFiscais.Items[0].NFe.Ide. autXML.Items[0]. Ide. nRec;
    cdstmdfe := 2;
    update;
    result := true;
  finally
    freeandnil(xml);
  end;
end;

constructor TMDFE.create;
begin
  fmdfeautxml            := TMDFEAutXMLList.Create;
  fserie                 := tserie.create;
  fmdfeufpercurso        := tmdfeufpercursolist.Create;
  fmdfemunicipiopercurso := tmdfemunicipiopercursolist.Create;
  fmdfelacre             := tmdfelacrelist.Create;
  fmdfedescarregamento   := tmdfedescarregamentolist.Create;
  fmdfecarregamento      := tmdfecarregamentolist.Create;
  fmdfeveiculo           := tmdfeveiculoList.create;
  fmdfepedagio           := tmdfepedagiolist.Create;
  fmdfetransportadora    := tmdfetransportadoralist.Create;
  ftpmdfe                := ttpmdfe.create;
end;

function TMDFE.Cancelar(dsjustificativa:string; nuprotocolo:string; xmlcancel:string): boolean;
var
  sql : TStrings;
begin
  dscancelamento          := dsjustificativa;
  nuprotocolocancelamento := nuprotocolo;
  dsxmlcancel             := xmlcancel;
  cdstmdfe                := 3;
  nuseqevento             := nuseqevento + 1;
  qtcte                   := 0;
  qtnfe                   := 0;
  vlcarga                 := 0;
  qtcarga                 := 0;
  sql := tstringlist.Create;
  try
    sql.add(update(true));
    sql.text := sql.Text + mdfedescarregamento.Cancelar(true);
    result   := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

function TMDFE.carregarxml(xml: string): Boolean;
var
  texto : TStringStream;
begin
  texto := TStringStream.Create('');
  try
    ACBrMDFe.manifestos.Clear;
    texto.WriteString(xml);
    ACBrMDFe.manifestos.LoadFromStream(texto);
    result := True;
  finally
    freeandnil(texto);
  end;
end;

function TMDFE.cnpjcpfResponsavelSeguro: string;
begin
  if cdmdferespseg = 1 then
  begin
    result := empresa.nucnpj_;
  end
  else
  begin
    result := nucnpjcpf;
  end;
end;

function TMDFE.CodigoMDFE(nu:string):integer;
var
  cont : integer;
begin
  cont := RetornaSQLInteger('select count(*) from mdfe where cdempresa='+empresa.cdempresa.ToString+' and numdfe='+nu);
  if cont = 0 then
  begin
    result := 0;
    exit
  end;
  if cont = 1 then
  begin
    result := RetornaSQLInteger('select cdmdfe from mdfe where cdempresa='+empresa.cdempresa.ToString+' and numdfe='+nu)
  end
  else if cont > 1 then
  begin
    result := selecionar_Entrada(_mdfe, nu);
    if result = 0 then
    begin
      result := -1;
    end;
  end;
end;

function TMDFE.CodigoMDFE(numdfe, a:string):integer;
begin
  Result := RetornaSQLInteger('select cdmdfe from mdfe where cdempresa='+empresa.cdempresa.ToString+' and cdserie='+inttostr(tpmdfe.cdserie)+' and numdfe='+numdfe);
end;

function TMDFE.ListaEmailRemetenteCTE: string;
var
  x, i : integer;
  cliente : tclientelist;
  cte : TCte;
begin
  result := '';
  cliente := tclientelist.Create;
  try
    mdfedescarregamento.Ler(cdmdfe);
    for i := 0 to mdfedescarregamento.Count - 1 do
    begin
      mdfedescarregamento.Items[i].mdfecte.Ler('cdmdfe='+inttostr(cdmdfe)+' and cdmunicipio='+inttostr(mdfedescarregamento.Items[i].cdmunicipio));
      for x := 0 to mdfedescarregamento.Items[i].mdfecte.Count - 1 do
      begin
        cte := TCte.create;
        try
          cte.Select(mdfedescarregamento.Items[i].mdfecte.Items[x].cdcte);
          if not cliente.ExisteNaLista(cte.cdremetente) then
          begin
            cliente.new;
            cliente.items[cliente.count-1].cdcliente := cte.cdremetente;
          end;
        finally
          freeandnil(cte);
        end;
      end;
    end;
    for i := 0 to cliente.Count - 1 do
    begin
      cliente.Items[i].select(cliente.Items[i].cdcliente);
      result := result + cliente.Items[i].ObterListaEmailNFE;
    end;
  finally
    freeandnil(cliente);
  end;
end;

function TMDFE.Update(boscript: boolean): string;
begin
  if cdmdferespseg = 0 then
  begin
    cdmdferespseg := 1;
  end;
  result        := inherited update(boscript);
end;

function TMDFE.VerificarUFPercurso: Boolean;
var
  uf : tuf;
begin
  Result := True;
  if cdufinicio = cduffim then
  begin
    exit;
  end;
  uf := TUF.create;
  try
    uf.uflimite.Ler(cdufinicio);
    if (not uf.uflimite.Elimite(cduffim)) and (mdfeufpercurso.Count = 0) then
    begin
      result := False;
    end;
  finally
    FreeAndNil(uf);
  end;
end;

end.
