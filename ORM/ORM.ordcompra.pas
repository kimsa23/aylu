unit ORM.ordcompra;

interface

uses
  Forms, Dialogs, ComCtrls, sysutils, ExtCtrls, Controls, Menus, ActnList, Classes, Contnrs, system.uitypes,
  System.Generics.Collections,
  DBClient, DB,
  classe.executasql, classe.aplicacao, classe.copiarregistro, orm.empresa, classe.gerar,
  classe.registrainformacao, rotina.retornasql, classe.query, classe.dao,
  orm.OrdCompraAutpagto, orm.OrdcompraAprovacao, orm.produto, orm.fornecedor, orm.pedidomaterial,
  orm.StOrdCompra, orm.TpOrdCompra, orm.ITordcompra, orm.pedidomaterialfornecedor,
  rotina.Registro, dialogo.progressbar, rotina.strings, uconstantes, rotina.datahora,
  cxCalendar, orm.condpagto;

Type
  TOrdCompra = class(TRegistroQuipos)
  private
    Fbocertificado: string;
    Fbofinanceiro: string;
    Fvlicmssubtrib: Currency;
    Fvldesconto: Currency;
    Fvltotal: Currency;
    Fvlfrete: Currency;
    Falipi: Double;
    Falicms: Double;
    Fpsfrete: Double;
    Fcdtpcobranca: Integer;
    Fcditcontfornecedor: Integer;
    Fcdtpordcompra: Integer;
    Fcdstordcompra: Integer;
    Fcdfinalidadeordcompra: Integer;
    Fcdtpfrete: String;
    Fcdfuncionariosolicitante: Integer;
    Fcdtpaplicacao: Integer;
    Fcdtpipi: Integer;
    Fcdcntcusto: Integer;
    Fcdfuncionarioaprovacao: Integer;
    Fcdcondpagto: Integer;
    Fcdfuncionariocontato: Integer;
    Fcdtpfornecedor: Integer;
    Fcdpedidomaterial: Integer;
    Fnudias: Integer;
    Fdsaplicacao: string;
    Fdslocal: string;
    Fprentrega: string;
    Fdssolicitante: string;
    Fcdtransportadora: LargeInt;
    Fdsobservacao: string;
    Fcdfornecedortransportadora: LargeInt;
    Fcdordcompra: integer;
    Fcdfornecedor: LargeInt;
    Fnusolicitacao: string;
    Fdtaprovacao: TDate;
    Fdtemissao: TDate;
    Fdtentrega: TDate;
    Fdtfechamento: TDate;
    Ftpordcompra: TTpOrdCompra;
    FItOrdCompra: TItOrdCompraList;
    Fordcompraaprovacao: tordcompraaprovacaoList;
    fstordcompra: TStOrdCompra;
    FOrdCompraAutpagto: TOrdCompraAutpagtoList;
    fcondpagto: tcondpagto;
    ffornecedor: tfornecedor;
    ffornecedortransportadora: tfornecedor;
    fbocontrolerecebimento: string;
    fbofreteitem: string;
    fbodescontoitem: string;
    fnucntcusto: string;
  public
    property fornecedortransportadora: tfornecedor read ffornecedortransportadora write ffornecedortransportadora;
    property fornecedor: tfornecedor read ffornecedor write ffornecedor;
    property condpagto: tcondpagto read fcondpagto write fcondpagto;
    property stordcompra : TStOrdCompra read fstordcompra write fstordcompra;
    property ordcompraaprovacao : tordcompraaprovacaoList read Fordcompraaprovacao write Fordcompraaprovacao;
    property ItOrdCompra : TItOrdCompraList read FItOrdCompra write FItOrdCompra;
    property OrdCompraAutpagto : TOrdCompraAutpagtoList read FOrdCompraAutpagto write FOrdCompraAutpagto;
    property tpordcompra : TTpOrdCompra read Ftpordcompra write Ftpordcompra;
    [keyfield]
    property cdordcompra : integer read Fcdordcompra write Fcdordcompra;
    [fk]
    property cdstordcompra : Integer read Fcdstordcompra write Fcdstordcompra;
    [fk]
    property cdpedidomaterial : Integer read Fcdpedidomaterial write Fcdpedidomaterial;
    [fk]
    property cdfornecedortransportadora : LargeInt read Fcdfornecedortransportadora write Fcdfornecedortransportadora;
    [fk]
    property cdtpordcompra : Integer read Fcdtpordcompra write Fcdtpordcompra;
    [fl]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdcondpagto : Integer read Fcdcondpagto write Fcdcondpagto;
    [fk]
    property cdfuncionariosolicitante : Integer read Fcdfuncionariosolicitante write Fcdfuncionariosolicitante;
    [fk]
    property cdfuncionarioaprovacao : Integer read Fcdfuncionarioaprovacao write Fcdfuncionarioaprovacao;
    [fk]
    property cdtpfrete : String read Fcdtpfrete write Fcdtpfrete;
    [fk]
    property cdfuncionariocontato : Integer read Fcdfuncionariocontato write Fcdfuncionariocontato;
    [fk]
    property cdtpaplicacao : Integer read Fcdtpaplicacao write Fcdtpaplicacao;
    [fk]
    property cdtpcobranca : Integer read Fcdtpcobranca write Fcdtpcobranca;
    [fk]
    property cdfinalidadeordcompra : Integer read Fcdfinalidadeordcompra write Fcdfinalidadeordcompra;
    [fk]
    property cdtpfornecedor : Integer read Fcdtpfornecedor write Fcdtpfornecedor;
    [fk]
    property cdcntcusto : Integer read Fcdcntcusto write Fcdcntcusto;
    [fk]
    property cdtpipi : Integer read Fcdtpipi write Fcdtpipi;
    [fk]
    property cditcontfornecedor : Integer read Fcditcontfornecedor write Fcditcontfornecedor;
    [fk]
    property cdtransportadora : LargeInt read Fcdtransportadora write Fcdtransportadora;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtentrega : TDate read Fdtentrega write Fdtentrega;
    property dtaprovacao : TDate read Fdtaprovacao write Fdtaprovacao;
    property nudias : Integer read Fnudias write Fnudias;
    property nusolicitacao : string read Fnusolicitacao write Fnusolicitacao;
    property vltotal : Currency read Fvltotal write Fvltotal;
    property prentrega : string read Fprentrega write Fprentrega;
    property alipi : Double read Falipi write Falipi;
    property alicms : Double read Falicms write Falicms;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property vlfrete : Currency read Fvlfrete write Fvlfrete;
    property dsaplicacao : string read Fdsaplicacao write Fdsaplicacao;
    property dslocal : string read Fdslocal write Fdslocal;
    property dssolicitante : string read Fdssolicitante write Fdssolicitante;
    property vldesconto : Currency read Fvldesconto write Fvldesconto;
    property dtfechamento : TDate read Fdtfechamento write Fdtfechamento;
    property vlicmssubtrib : Currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property bocertificado : string read Fbocertificado write Fbocertificado;
    property psfrete : Double read Fpsfrete write Fpsfrete;
    property bofinanceiro : string read Fbofinanceiro write Fbofinanceiro;
    property bocontrolerecebimento : string read fbocontrolerecebimento write fbocontrolerecebimento;
    property bofreteitem: string read fbofreteitem write fbofreteitem;
    property bodescontoitem: string read fbodescontoitem write fbodescontoitem;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    function copiar:integer;
    constructor create;
    destructor destroy; override;
    procedure gerarparcelas;
    class function Novo(cdpedidomaterial1: integer; cdfornecedor1:LargeInt; cdtpordcompra1: integer):integer;
    procedure gravartotais;
    procedure AtualizarPedidoMaterialFornecedor;
    function ordcompraNaoAtendidoCompletamente: Boolean;
    procedure DistribuicaoFreteItem;
    procedure DistribuicaoDescontoItem;
  end;

implementation

constructor TOrdCompra.create;
begin
  inherited;
  ffornecedortransportadora := tfornecedor.create;
  ffornecedor         := tfornecedor.create;
  fcondpagto          := tcondpagto.create;
  ftpOrdCompra        := TTpOrdCompra.create;
  fOrdCompraAutpagto  := tOrdCompraAutpagtoList.create;
  fitOrdCompra        := titOrdCompraList.create;
  fordcompraaprovacao := TordcompraAprovacaoList.create;
  fstordcompra        := TStOrdCompra.create;
end;

procedure TOrdCompra.gerarparcelas;
var
  i: Integer;
begin
  ordcompraautpagto.Clear;
  condpagto.GerarParcela(dtentrega, vltotal);
  if (cdcondpagto = 0) or (vltotal = 0) or (condpagto.itcondpagto.Count = 0) then
  begin
    Exit;
  end;
  for i := 0 to condpagto.parcela.Count - 1 do
  begin
    ordcompraautpagto.New;
    ordcompraautpagto.Items[i].cdordcompra         := cdordcompra;
    ordcompraautpagto.Items[i].dtprorrogacao       := condpagto.parcela.Items[i].dtvencimento;
    ordcompraautpagto.Items[i].dtemissao           := dtentrega;
    ordcompraautpagto.Items[i].vlsaldo             := condpagto.parcela.Items[i].valor;
    ordcompraautpagto.Items[i].vlordcompraautpagto := condpagto.parcela.Items[i].valor;
  end;
end;

procedure TOrdCompra.gravartotais;
begin
  itordcompra.CalcularTotal;
  if cdtpfrete = _9 then
  begin
    itordcompra.zerarfrete;
    vlfrete                    := 0;
    cdfornecedortransportadora := 0;
    cdtransportadora           := 0;
    bofreteitem := '';
  end
  else if bofreteitem = _s then
  begin
    vlfrete := itordcompra.vlfrete;
  end
  else
  begin
    DistribuicaoFreteItem;
    itordcompra.CalcularTotal;
  end;
  if bodescontoitem = _s then
  begin
    vldesconto := itordcompra.vldesconto;
  end
  else
  begin
    DistribuicaoDescontoItem;
  end;
  vltotal := itordcompra.vltotal + itordcompra.vlipi + vlfrete - vldesconto;
end;

class function TOrdCompra.Novo(cdpedidomaterial1: integer; cdfornecedor1:LargeInt; cdtpordcompra1: integer):integer;
var
  pedidomaterial : TPedidomaterial;
  I: Integer;
  x: Integer;
  ordcompra : tordcompra;
begin
  result := 0;
  pedidomaterial := tpedidomaterial.create;
  ordcompra := tordcompra.create;
  try
    pedidomaterial.Select(cdpedidomaterial1);
    pedidomaterial.pedidomaterialfornecedor.new;
    pedidomaterial.pedidomaterialfornecedor.items[0].select(_cdfornecedor+'='+cdfornecedor1.tostring+' and '+_cdpedidomaterial+'='+cdpedidomaterial1.tostring);

    ordcompra.dtemissao                := dtbanco;
    ordcompra.cdstordcompra            := qregistro.Codigo_status_novo(_ordcompra);
    ordcompra.cdordcompra              := qgerar.gerarcodigo(_ordcompra);
    ordcompra.dsaplicacao              := pedidomaterial.dsaplicacao;
    ordcompra.cdtpaplicacao            := pedidomaterial.cdtpaplicacao;
    ordcompra.cdfornecedor             := pedidomaterial.pedidomaterialfornecedor.items[0].cdfornecedor;
    ordcompra.cditcontfornecedor       := pedidomaterial.pedidomaterialfornecedor.items[0].cditcontfornecedor;
    ordcompra.cdpedidomaterial         := pedidomaterial.cdpedidomaterial;
    ordcompra.cdcondpagto              := pedidomaterial.pedidomaterialfornecedor.items[0].cdcondpagto;
    ordcompra.dtentrega                := pedidomaterial.pedidomaterialfornecedor.items[0].dtprventrega;
    ordcompra.cdtpordcompra            := cdtpordcompra1;
    ordcompra.tpordcompra.select(ordcompra.cdtpordcompra);
    if ordcompra.tpordcompra.boobservacaotpordcompra = _s then
    begin
      ordcompra.dsobservacao := ordcompra.tpordcompra.dsobservacao;
    end;
    ordcompra.cdfuncionariosolicitante := pedidomaterial.cdfuncionariosolicitante;
    ordcompra.cdfuncionariocontato     := pedidomaterial.cdfuncionariocomprador;

    pedidomaterial.itpedidomaterial.ler(pedidomaterial.cdpedidomaterial);
    for I := 0 to pedidomaterial.itpedidomaterial.count -1 do
    begin
      if pedidomaterial.itpedidomaterial.items[i].qtsolicitada > 0 then
      begin
        if pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.ler(_cditpedidomaterial+'='+pedidomaterial.itpedidomaterial.items[i].cditpedidomaterial.tostring+' and '+
                                                                                _cdfornecedor+'='+ordcompra.cdfornecedor.tostring+' and '+
                                                                                _bovencedor+'=''S''') then
        begin
          ordcompra.itordcompra.new;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].cditordcompra   := qgerar.gerarcodigo(_itordcompra);
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].cdordcompra     := ordcompra.cdordcompra;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].bocertificado   := pedidomaterial.itpedidomaterial.items[i].bocertificado;
          if pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].dtpreventrega > 0 then
          begin
            ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].dtpreventrega := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].dtpreventrega;
          end
          else if pedidomaterial.pedidomaterialfornecedor.items[0].dtprventrega > 0 then
          begin
            ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].dtpreventrega := pedidomaterial.pedidomaterialfornecedor.items[0].dtprventrega;
          end;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].cdcntcusto     := pedidomaterial.itpedidomaterial.items[i].cdcntcusto;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].cdproduto      := pedidomaterial.itpedidomaterial.items[i].cdproduto;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].cddigitado     := pedidomaterial.itpedidomaterial.items[i].cddigitado;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].qtpeca         := pedidomaterial.itpedidomaterial.items[i].qtpeca;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].qtpesounitario := pedidomaterial.itpedidomaterial.items[i].qtpesounitario;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].dsformula      := pedidomaterial.itpedidomaterial.items[i].dsformula;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].qtitem         := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].qtitem;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].vlunitario     := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].vlunitario;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].vltotal        := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].vltotal;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].alicms         := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].alicms;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].alipi          := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].alipi;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].vldesconto     := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].vldesconto;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].vlicmssubtrib  := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].vlicmssubtrib;
          ordcompra.itordcompra.items[ordcompra.itordcompra.count-1].vlfrete        := pedidomaterial.itpedidomaterial.items[i].itpedidomaterialfornecedor.items[0].vlfrete;
        end;
      end;
    end;
    if ordcompra.itordcompra.vlfrete > 0 then
    begin
      ordcompra.bofreteitem := _s;
      ordcompra.cdtpfrete   := _0;
    end
    else
    begin
      ordcompra.cdtpfrete   := _9;
      ordcompra.bofreteitem := _n;
    end;
    if ordcompra.itordcompra.vldesconto > 0 then
    begin
      ordcompra.bodescontoitem := _s;
    end
    else
    begin
      ordcompra.bodescontoitem := _n;
    end;
    ordcompra.gravartotais;
    ordcompra.condpagto.select(ordcompra.cdcondpagto);
    ordcompra.condpagto.itcondpagto.ler(ordcompra.cdcondpagto);
    ordcompra.gerarparcelas;
    ordcompra.insert;
    ordcompra.itordcompra.inserir;
    ordcompra.ordcompraautpagto.inserir;
    pedidomaterial.SetStatus(2);
    pedidomaterial.pedidomaterialfornecedor.items[0].cdordcompra := ordcompra.cdordcompra;
    pedidomaterial.pedidomaterialfornecedor.items[0].update;
    result := ordcompra.cdordcompra;
  finally
    freeandnil(pedidomaterial);
    freeandnil(ordcompra);
  end;
end;

function TOrdCompra.ordcompraNaoAtendidoCompletamente: Boolean;
var
  I: Integer;
begin
  result := False;
  for I := 0 to itordcompra.count - 1 do
  begin
    if itordcompra.items[i].qtatendida < itordcompra.items[i].qtitem then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure TOrdCompra.AtualizarPedidoMaterialFornecedor;
var
  pedidomaterialfornecedor : tpedidomaterialfornecedor;
begin
  if cdpedidomaterial = 0 then
  begin
    exit;
  end;
  pedidomaterialfornecedor := tpedidomaterialfornecedor.create;
  try
    if pedidomaterialfornecedor.select(_CDPEDIDOMATERIAL+'='+CDPEDIDOMATERIAL.tostring+' AND '+_CDFORNECEDOR+'='+CDFORNECEDOR.toString) then
    begin
      pedidomaterialfornecedor.cdordcompra := cdordcompra;
      pedidomaterialfornecedor.update;
    end;
  finally
    freeandnil(pedidomaterialfornecedor);
  end;
end;

function TOrdCompra.copiar: integer;
begin
  result := copiar_registro(cdordcompra, _ordcompra        , _cdordcompra,     0, _dtfechamento, '');
            copiar_registro(cdordcompra, _ordcompraautpagto, _cdordcompra, result,            '', '');
            copiar_registro(cdordcompra, _itordcompra      , _cdordcompra, result,            '', _QTATENDIDA);
end;

destructor TOrdCompra.destroy;
begin
  FreeAndNil(ffornecedortransportadora);
  FreeAndNil(ffornecedor);
  FreeAndNil(fcondpagto);
  FreeAndNil(ftpOrdCompra);
  FreeAndNil(fItOrdCompra);
  FreeAndNil(fOrdCompraAutpagto);
  FreeAndNil(fordcompraaprovacao);
  FreeAndNil(fstordcompra);
  inherited;
end;

procedure TOrdCompra.DistribuicaoFreteItem;
var
  vlfreterateado : currency;
  I: Integer;
begin
  vlfreterateado := 0;
  for I := 0 to itordcompra.Count - 1 do
  begin
    itordcompra.Items[i].vlfrete := vlfrete / itordcompra.qtitem * itordcompra.Items[i].qtitem;
    vlfreterateado               := vlfreterateado + itordcompra.Items[i].vlfrete;
    if i = itordcompra.Count -1 then
    begin
      if vlfreterateado < vlfrete then
      begin
        itordcompra.Items[i].vlfrete := itordcompra.Items[i].vlfrete + (vlfrete - vlfreterateado)
      end
      else if vlfreterateado > vlfrete then
      begin
        itordcompra.Items[i].vlfrete := itordcompra.Items[i].vlfrete - (vlfreterateado - vlfrete);
      end;
    end;
  end;
end;

procedure TOrdCompra.DistribuicaoDescontoItem;
var
  vldescontorateado : currency;
  I: Integer;
begin
  vldescontorateado := 0;
  for I := 0 to itordcompra.Count - 1 do
  begin
    itordcompra.Items[i].vldesconto := vldesconto / itordcompra.qtitem * itordcompra.Items[i].qtitem;
    vldescontorateado               := vldescontorateado + itordcompra.Items[i].vldesconto;
    if i = itordcompra.Count -1 then
    begin
      if vldescontorateado < vldesconto then
      begin
        itordcompra.Items[i].vldesconto := itordcompra.Items[i].vldesconto + (vldesconto - vldescontorateado)
      end
      else if vldescontorateado > vldesconto then
      begin
        itordcompra.Items[i].vldesconto := itordcompra.Items[i].vldesconto - (vldescontorateado - vldesconto);
      end;
    end;
  end;
end;

end.
