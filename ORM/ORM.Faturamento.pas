unit ORM.Faturamento;

interface

uses
  forms, sysutils, classes, dialogs, controls, gauges, Math, ActnList, ExtCtrls,
  system.uitypes, Contnrs, data.db,
  Variants, Windows, Excelxp, OleServer,
  rotina.datahora, rotina.Rotinas, uRichEdit, rotina.montarsql, uconstantes, dialogo.progressbar,
  rotina.strings, rotina.registro, orm.ItFatCliente, orm.ItFatPedido, orm.ItFatProduto,
  orm.ItFatSaida, orm.tpfaturamento, orm.stfaturamento, orm.tpgradevalor,
  classe.executasql, rotina.retornasql, classe.gerar, orm.empresa, classe.query, orm.pedido,
  classe.aplicacao, classe.registrainformacao, orm.usuario, orm.saida, classe.dao, orm.produto,
  orm.cliente, orm.contrato, orm.Serie, orm.conta, orm.duplicata, orm.itclientecampanha,
  acbr.Boleto, ACBrBoleto, orm.tpsaida, orm.tpcliente, orm.tpclientemensalidade;

type
  TFaturamento = class(TRegistroQuipos)
  private
    Fcdsetboleto: integer;
    Fdtfaturamento: TDate;
    Fcdstfaturamento: integer;
    Fcdtpfaturamento: integer;
    Fdtvencimento: TDate;
    Fdttermino: TDate;
    Fcdfaturamento: integer;
    Fdtinicio: TDate;
    Ftpfaturamento: TTPFaturamento;
    fitfatsaida: TItfatsaidaList;
    fitfatproduto: TItFatProdutoList;
    fitfatpedido: titfatpedidolist;
    fitfatcliente: titfatclientelist;
    fstfaturamento: TStfaturamento;
    function GerarNotaFiscalPedido:string;
    function GerarDuplicatadasNotas:string;
    function AplicarDiaMensalidadeNoVencimento:string;
    function GerarBoleto:string;
    function GerarNotaFiscalAvulso:string;
    function InserirItSaidadeItFatSaida:string;
  public
    property stfaturamento : TStfaturamento read fstfaturamento write fstfaturamento;
    property itfatcliente : titfatclientelist read fitfatcliente write fitfatcliente;
    property itfatpedido : titfatpedidolist read fitfatpedido write fitfatpedido;
    property itfatproduto : TItFatProdutoList read fitfatproduto write fitfatproduto;
    property itfatsaida : TItfatsaidaList read fitfatsaida write fitfatsaida;
    property tpfaturamento : TTPFaturamento read Ftpfaturamento write Ftpfaturamento;
    [keyfield]
    property cdfaturamento : integer read Fcdfaturamento write Fcdfaturamento;
    [fk]
    property cdstfaturamento : integer read Fcdstfaturamento write Fcdstfaturamento;
    [fk]
    property cdsetboleto : integer read Fcdsetboleto write Fcdsetboleto;
    [fk]
    property cdtpfaturamento : integer read Fcdtpfaturamento write Fcdtpfaturamento;
    property dtfaturamento : TDate read Fdtfaturamento write Fdtfaturamento;
    property dtvencimento : TDate read Fdtvencimento write Fdtvencimento;
    property dtinicio : TDate read Fdtinicio write Fdtinicio;
    property dttermino : TDate read Fdttermino write Fdttermino;
    procedure AtualizarParaValorContrato(gau: TGauge; pnl: TPanel);
    constructor create;
    destructor destroy; override;
    function excluirpedidopelotipo(cdtppedido:integer):Boolean;
    function excluirsaida:Boolean;
    function GerarCampanha:boolean;
    function ObterDtvencimento(nudiamensalidade:integer):TDate;
    function GerarFaturamentoPedido:string;
    function GerarFaturamentoAvulso:string;
    function GerarFaturamentoProduto:string;
    function InserirSaida(cdcliente:LargeInt):string;
    function ImportarCSV:boolean;
    function ImportarCSVMeioAcesso:boolean;
    function ImportarProduto:boolean;
    function ImportarBanco(bomensalidade:boolean):boolean;
  end;
  TFaturamentoBanco = class(TObject)
  private
    sqlstring : tstrings;
    cdstpedido, cdstitpedido : integer;
    faturamento : TFaturamento;
    pedido : tpedidolist;
    procedure GerarMensalidade(pnl:TPanel; gau: TGauge);
    function  PeriodoCarencia(dtcadastro, dttermino: TDate):boolean;
    function  JaFoiGeradoPedidoMensalidade(cdcliente:LargeInt):boolean;
    procedure GerarPedidoMensalidade(cdcliente: LargeInt; cdproduto:integer; vlmensalidade : currency; dtf: TDate);
    function importar(faturamento_:TFaturamento; bomensalidade : boolean):boolean;
  public
    constructor create;
    destructor  destroy; override;
    class function ImportarBanco(Faturamento_:TFaturamento; bomensalidade: boolean):boolean;
  end;
  TGerarFaturamento = class(TObject)
  private
    faturamento : TFaturamento;
    sqlstring : TStrings;
    function Gerar(faturamento_:TFaturamento):boolean;
  public
    constructor create;
    destructor destroy; override;
    class function GerarFaturamento(faturamento_: TFaturamento): boolean;
  end;

implementation

constructor TFaturamento.create;
begin
  inherited;
  ftpfaturamento := ttpfaturamento.create;
  fstfaturamento := tstfaturamento.create;
  fitfatsaida    := titfatsaidalist.create;
  fitfatproduto  := titfatprodutolist.create;
  fitfatpedido   := titfatpedidolist.create;
  fitfatcliente  := titfatclientelist.create;
end;

destructor TFaturamento.destroy;
begin
  freeandnil(ftpfaturamento);
  freeandnil(fstfaturamento);
  freeandnil(fitfatsaida);
  freeandnil(fitfatproduto);
  freeandnil(fitfatpedido);
  freeandnil(fitfatcliente);
  inherited;
end;

function TFaturamento.GerarBoleto: string;
var
  i: Integer;
  boletoacbr : TBoletoAcbr;
  Titulo : TACBrTitulo;
begin
  result := '';
  frmprogressbar := tfrmprogressbar.create(nil);
  boletoacbr := tboletoacbr.create;
  titulo := TACBrTitulo.Create(boletoacbr.ACBrBoleto);
  try
    frmprogressbar.gau.maxvalue := itfatsaida.count;
    frmprogressbar.show;

    boletoacbr.setboleto.Select(cdsetboleto);
    boletoacbr.conta.Select(boletoacbr.setboleto.cdconta);
    boletoacbr.ConfigurarCedente;
    boletoacbr.Configurarbanco;

    for i := 0 to itfatsaida.count - 1 do
    begin
      frmprogressbar.pnl.caption := 'Gerar boleto';
      frmprogressbar.gau.progress := i + 1;
      application.ProcessMessages;
      if itfatsaida.items[i].saida.cliente.bongerarboletofaturamento <> _s then
      begin
        boletoacbr.setboleto.nuboleta := boletoacbr.setboleto.nuboleta + 1;
        titulo.Vencimento             := itfatsaida.items[i].saida.duplicata.Items[0].dtvencimento;
        titulo.NossoNumero            := boletoacbr.setboleto.nuboleta.ToString;
        titulo.ValorDocumento         := itfatsaida.items[i].saida.duplicata.Items[0].vlsaldo;
        Titulo.Carteira               := boletoacbr.setboleto.nucarteira;
        itfatsaida.items[i].saida.duplicata.Items[0].nunossonumero := RemoverCaracterInicio(boletoacbr.ACBrBoleto.Banco.MontarCampoNossoNumero(Titulo), _0);
        result                                                     := result + itfatsaida.items[i].saida.duplicata.Items[0].update(true)+#13;
      end;
    end;
    result := result + boletoacbr.setboleto.update(true)+#13;
  finally
    freeandnil(frmprogressbar);
    freeandnil(boletoacbr);
    freeandnil(titulo);
  end;
end;

function TFaturamento.GerarCampanha: boolean;
var
  sql : tstrings;
  cdstitpedido, cdstpedido : integer;
  itclientecampanha : titclientecampanhaList;
  I: Integer;
begin
  result := false;
  sql    := tstringlist.create;
  cdstpedido   := QRegistro.CodigoStatusNovo( _pedido);
  cdstitpedido := QRegistro.CodigoStatusNovo( _itpedido);
  itclientecampanha := titclientecampanhaList.create;
  try
    itclientecampanha.Ler('cdempresa='+empresa.cdempresa.tostring+' and dtinicio<='+GetDtBanco(dtinicio)+' and dttermino>='+getdtbanco(dtinicio));
    for I := 0 to itclientecampanha.count - 1 do
    begin
      if itfatpedido.pedido_campanha_ja_existe(cdfaturamento, itclientecampanha.items[i].cdcliente, itclientecampanha.items[i].cdproduto) then
      begin
        continue;
      end;
      itfatpedido.new;

      itfatpedido.items[itfatpedido.Count-1].pedido.cdpedido   := qgerar.gerarcodigo(_pedido);
      itfatpedido.items[itfatpedido.Count-1].pedido.cdstpedido := cdstpedido;
      itfatpedido.items[itfatpedido.Count-1].pedido.cdcliente  := itclientecampanha.items[i].cdcliente;
      itfatpedido.items[itfatpedido.Count-1].pedido.cdtppedido := tpfaturamento.cdtppedidocampanha;
      itfatpedido.items[itfatpedido.Count-1].pedido.nupedido   := itfatpedido.items[itfatpedido.Count-1].pedido.cdpedido.tostring;
      itfatpedido.items[itfatpedido.Count-1].pedido.dtemissao  := dtinicio;
      itfatpedido.items[itfatpedido.Count-1].pedido.vltotal    := itclientecampanha.items[i].vlunitario * itclientecampanha.items[i].qtitem;
      sql.add(itfatpedido.items[itfatpedido.Count-1].pedido.insert(true));

      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.new;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].cdpedido     := itfatpedido.items[itfatpedido.Count-1].pedido.cdpedido;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].cditpedido   := qgerar.gerarcodigo(_itpedido);
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].cdproduto    := itclientecampanha.items[i].cdproduto;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].cdstitpedido := cdstitpedido;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].qtitem       := itclientecampanha.items[i].qtitem;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].vlunitario   := itclientecampanha.items[i].vlunitario;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].cddigitado   := itclientecampanha.items[i].cddigitado;
      itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].vltotal      := itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].qtitem * itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].vlunitario;
      sql.add(itfatpedido.items[itfatpedido.Count-1].pedido.itpedido.items[0].insert(true));

      itfatpedido.items[itfatpedido.Count-1].cdfaturamento := cdfaturamento;
      itfatpedido.items[itfatpedido.Count-1].cdpedido      := itfatpedido.items[itfatpedido.Count-1].pedido.cdpedido;
      itfatpedido.items[itfatpedido.Count-1].nupedido      := itfatpedido.items[itfatpedido.Count-1].pedido.nupedido;
      sql.add(itfatpedido.items[itfatpedido.Count-1].Insert(true));
    end;
    if sql.count > 0 then
    begin
      result := ExecutaScript(sql);
    end;
  finally
    freeandnil(sql);
    freeandnil(itclientecampanha);
  end;
end;

function TFaturamento.GerarDuplicatadasNotas: string;
var
  i : integer;
  texto : string;
begin
  result := '';
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := itfatsaida.Count;
    frmprogressbar.show;
    for I := 0 to itfatsaida.Count-1 do
    begin
      frmprogressbar.gau.progress := i + 1;
      frmprogressbar.pnl.caption := 'Gerar contas a receber de notas fiscais';
      application.ProcessMessages;
      if itfatsaida.items[i].saida.vltotal <= 0 then
      begin
        MessageDlg('N�o � poss�vel gerar Contas a Receber com valor menor ou igual a zero.'#13+
                   'Cliente: '+itfatsaida.items[i].saida.cdcliente.tostring+' - '+qregistro.nomedocodigo(_cliente, itfatsaida.items[i].saida.cdcliente)+#13+
                   'Valor : '+formatarmoeda(itfatsaida.items[i].saida.vltotal, 20)+'.', mtInformation, [mbOK], 0);
        abort;
      end;
      itfatsaida.items[i].saida.duplicata.New;
      itfatsaida.items[i].saida.duplicata.Items[0].cdduplicata      := qgerar.gerarcodigo(_duplicata);
      itfatsaida.items[i].saida.duplicata.Items[0].cdsaida          := itfatsaida.items[i].saida.cdsaida;
      itfatsaida.items[i].saida.duplicata.Items[0].cdcliente        := itfatsaida.items[i].saida.cdcliente;
      itfatsaida.items[i].saida.duplicata.Items[0].cdtpcobranca     := tpfaturamento.cdtpcobranca;
      itfatsaida.items[i].saida.duplicata.Items[0].nuduplicata      := itfatsaida.items[i].saida.nusaida.tostring;
      itfatsaida.items[i].saida.duplicata.Items[0].dtentrada        := dtfaturamento;
      itfatsaida.items[i].saida.duplicata.Items[0].dtemissao        := dtfaturamento;
      itfatsaida.items[i].saida.duplicata.Items[0].dtvencimento     := dtvencimento;
      itfatsaida.items[i].saida.duplicata.Items[0].dtprorrogacao    := dtvencimento;
      itfatsaida.items[i].saida.duplicata.Items[0].vlduplicata      := itfatsaida.items[i].saida.vltotal;
      itfatsaida.items[i].saida.duplicata.Items[0].vlsaldo          := itfatsaida.items[i].saida.vltotal;
      texto := itfatsaida.items[i].saida.duplicata.Items[0].insert(true);
      result := result + itfatsaida.items[i].saida.duplicata.Items[0].insert(true)+#13;
    end;
  finally
    freeandnil(frmprogressbar);
  end;
end;

function TFaturamento.GerarFaturamentoAvulso: string;
begin
  result := GerarNotaFiscalAvulso;
end;

function TFaturamento.GerarFaturamentoPedido: string;
begin
  result := GerarNotaFiscalPedido +
            itfatsaida.TotalizarNotas +
            GerarDuplicatadasNotas +
            AplicarDiaMensalidadeNoVencimento +
            GerarBoleto;
end;

function TFaturamento.GerarFaturamentoProduto: string;
var
  cliente : tclienteList;
  I: Integer;
begin
  cliente := tclientelist.create;
  try
    cliente.Ler(3, _cdtpcliente);
    for I := 0 to cliente.count - 1 do
    begin
      result := result +
                InserirSaida(cliente.items[i].cdcliente)+
                InserirItSaidadeItFatSaida;
    end;
    result := result +
              itfatsaida.TotalizarNotas +
              GerarDuplicatadasNotas +
              GerarBoleto;
  finally
    freeandnil(cliente);
  end;
end;

function TFaturamento.GerarNotaFiscalAvulso: string;
var
  i : integer;
begin
  result := '';
  for I := 0 to itfatcliente.count - 1 do
  begin
    result := result +
              InserirSaida(itfatcliente.items[i].cdcliente) +
              InserirItSaidadeItFatSaida;
  end;
  result := result +
            itfatsaida.TotalizarNotas +
            GerarDuplicatadasNotas +
            GerarBoleto;
end;

function TFaturamento.GerarNotaFiscalPedido:string;
var
  y, x, i : integer;
begin
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := itfatpedido.count;
    frmprogressbar.show;
    result := '';
    for I := 0 to itfatpedido.count - 1 do
    begin
      frmprogressbar.pnl.caption := 'Gerar nota fiscal a partir do pedido';
      frmprogressbar.gau.progress := i + 1;
      application.ProcessMessages;
      if itfatpedido.items[i].pedido.cdpedido = 0 then
      begin
        itfatpedido.items[i].pedido.Select(itfatpedido.items[i].cdpedido);
      end;
      if itfatpedido.items[i].pedido.itpedido.Count = 0 then
      begin
        itfatpedido.items[i].pedido.itpedido.Ler(itfatpedido.items[i].pedido.cdpedido);
      end;
      y := itfatsaida.IndiceNotadoCliente(itfatpedido.items[i].pedido.cdcliente);
      if y = -1 then
      begin
        result := result + InserirSaida(itfatpedido.items[i].pedido.cdcliente);
        y      := itfatsaida.Count -1;
      end;

      for x := 0 to itfatpedido.items[i].pedido.itpedido.Count - 1 do
      begin
        with itfatsaida.items[y].saida.itsaida.New do
        begin
          cdsaida    := itfatsaida.items[y].saida.cdsaida;
          cditsaida  := qgerar.gerarcodigo(_itsaida);
          cdcfop     := itfatsaida.items[y].saida.cdcfop;
          cdproduto  := itfatpedido.items[i].pedido.itpedido.items[x].cdproduto;
          cddigitado := itfatpedido.items[i].pedido.itpedido.items[x].cddigitado;
          qtitem     := itfatpedido.items[i].pedido.itpedido.items[x].qtitem;
          vlunitario := itfatpedido.items[i].pedido.itpedido.items[x].vlunitario;
          vltotal    := itfatpedido.items[i].pedido.itpedido.items[x].vltotal;
          cdpedido   := itfatpedido.items[i].pedido.cdpedido;
          nupedido   := itfatpedido.items[i].pedido.nupedido;
          result     := result + insert(true)+#13;
        end;
      end;
    end;
  finally
    freeandnil(frmprogressbar);
  end;
end;

function TFaturamento.ImportarBanco(bomensalidade:boolean): boolean;
begin
  result := TFaturamentoBanco.ImportarBanco(self, bomensalidade);
end;

function TFaturamento.ImportarCSV:boolean;
const
  c_coluna_cliente    = _g;
  c_coluna_produto    = _s;
  c_coluna_qtitem     = _t;
  c_coluna_vlunitario = _u;
  c_coluna_vltotal    = _v;
var
  Aplicacao : TExcelApplication;
  Planilha : TExcelWorksheet;
  cdstitpedido, cdstpedido, linha, LCID : integer;
  wkbk : _Workbook;
  cdcliente : string;
  cdproduto : integer;
  cdcliente2, filename : string;
  sql : TStrings;
begin
  result        := False;
  if not QRotinas.SelecionarNomeArquivo(filename) then
  begin
    exit;
  end;
  cdstpedido      := QRegistro.CodigoStatusNovo( _pedido);
  cdstitpedido    := QRegistro.CodigoStatusNovo( _itpedido);

  Aplicacao       := TExcelApplication.Create(nil);
  Planilha        := TExcelWorksheet.Create(nil);
  LCID            := GetUserDefaultLCID;

  sql             := TStringList.create;
  frmprogressbar  := Tfrmprogressbar.Create(application);
  if tpfaturamento.cdtpfaturamento = 0 then
  begin
    tpfaturamento.Select(cdtpfaturamento);
  end;
  try
    wkbk := Aplicacao.Workbooks.Open(filename, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                               EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, LCID);
    Planilha.ConnectTo(wkbk.Worksheets[1] as _Worksheet);
    Planilha.Activate;
    linha                       := 2;
    frmprogressbar.gau.MaxValue := 100;
    frmprogressbar.Show;
    while Planilha.Range[_A+inttostr(linha),_A+inttostr(linha)].Value2 <> '' do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      cdcliente := Planilha.Range[c_coluna_cliente+inttostr(linha),c_coluna_cliente+inttostr(linha)].Value2;
      cdcliente := Copy(cdcliente, 1, Pos('-', cdcliente)-2);
      if (not codigoexiste(_cliente, cdcliente)) and
         (MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [cdcliente, _cliente])+#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
      begin
        abort;
      end;
      cdproduto := qregistro.CodigodoNomeInteiro(_produto, RetiraAcentos(Planilha.Range[c_coluna_produto+inttostr(linha),c_coluna_produto+inttostr(linha)].Value2));
      if (cdproduto = 0)and
         (MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [RetiraAcentos(Planilha.Range[c_coluna_produto+inttostr(linha),c_coluna_produto+inttostr(linha)].Value2), _produto])+#13+
                     _msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
      begin
        abort;
      end;
      if cdcliente <> cdcliente2 then
      begin
        cdcliente2 := cdcliente;
        itfatpedido.new;
        itfatpedido.items[itfatpedido.count-1].pedido.cdpedido   := qgerar.GerarCodigo(_pedido);
        itfatpedido.items[itfatpedido.count-1].pedido.cdstpedido := cdstpedido;
        itfatpedido.items[itfatpedido.count-1].pedido.cdcliente  := cdcliente.ToInt64;
        itfatpedido.items[itfatpedido.count-1].pedido.cdtppedido := tpfaturamento.cdtppedidoarquivo;
        itfatpedido.items[itfatpedido.count-1].pedido.nupedido   := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido.tostring;
        itfatpedido.items[itfatpedido.count-1].pedido.dtemissao  := dttermino;

        itfatpedido.items[itfatpedido.count-1].cdfaturamento := cdfaturamento;
        itfatpedido.items[itfatpedido.count-1].cdpedido      := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido;
        itfatpedido.items[itfatpedido.count-1].nupedido      := itfatpedido.items[itfatpedido.count-1].pedido.nupedido;

        //sql.add(itfatpedido.items[itfatpedido.count-1].pedido.insert(true));
        //sql.add(itfatpedido.items[itfatpedido.count-1].insert(true));
        itfatpedido.items[itfatpedido.count-1].pedido.insert;
        itfatpedido.items[itfatpedido.count-1].insert;
      end;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.new;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].cdpedido     := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].cditpedido   := QGerar.GerarCodigo(_Itpedido);
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].cdproduto    := cdproduto;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].cdstitpedido := cdstitpedido;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].qtitem       := Planilha.Range[c_coluna_qtitem     + inttostr(linha), c_coluna_qtitem     + inttostr(linha)].Value2;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].vlunitario   := Planilha.Range[c_coluna_vlunitario + inttostr(linha), c_coluna_vlunitario + inttostr(linha)].Value2;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].cddigitado   := cdproduto.ToString;
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].vltotal      := Planilha.Range[c_coluna_vltotal    + inttostr(linha), c_coluna_vltotal    + inttostr(linha)].Value2;
      //sql.add(itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].insert(true));
      itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Items[itfatpedido.items[itfatpedido.count-1].pedido.itpedido.Count-1].insert;
      inc(linha);
    end;
    //sql.text := sql.text + itfatpedido.TotalizarPedidos;
    itfatpedido.TotalizarPedidos;
    //if (sql.count > 0) and ExecutaScript(sql) then
    //begin
      MessageDlg(_msg_Importacao_concluida, mtInformation, [mbOK], 0);
      result := True;
    //end;
  finally
    Aplicacao.Workbooks.Close(lcid);
    FreeAndNil(aplicacao);
    FreeAndNil(Planilha);
    FreeAndNil(sql);
    freeandnil(frmprogressbar);
  end;
end;

function TFaturamento.ImportarCSVMeioAcesso: boolean;
var
  Aplicacao : TExcelApplication;
  Planilha : TExcelWorksheet;
  wkbk : _Workbook;
  texto, cdcliente : string;
  cdstitpedido, cdstpedido, l, LCID, x, i, cdtpgradevalor, cdproduto : integer;
  filename : string;
  sql : TStrings;
  dtf : TDate;
  contrato : TContratoList;
  produto : TProdutoList;
  tpgradevalor : ttpgradevalorlist;
  function ObterVlUnitario(cdcontrato, cdproduto, cdtpgradevalor: integer; quantidade:Double):currency;
  var
    i : integer;
  begin
    result := 0;
    if cdcontrato <> 0 then
    begin
      if not contrato.Existe(cdcontrato) then
      begin
        contrato.new;
        contrato.items[contrato.count-1].select(cdcontrato);
        contrato.items[contrato.count-1].itcontrato.Ler(cdcontrato);
      end;
      result := contrato.items[contrato.indice(cdcontrato)].itcontrato.VlUnitario(cdproduto);
    end;
    if result > 0 then
    begin
      Exit;
    end;
    i := tpgradevalor.indice(cdtpgradevalor);
    if i = - 1 then
    begin
      tpgradevalor.new;
      i := tpgradevalor.count-1;
      tpgradevalor.items[i].Select(cdtpgradevalor);
      tpgradevalor.items[i].itgradevalor.Ler(cdtpgradevalor, _cdtpgradevalor);
    end;
    result := tpgradevalor.items[i].itgradevalor.Valor(cdproduto, quantidade);
    if result > 0 then
    begin
      exit;
    end;
    i := produto.indice(cdproduto);
    if i = - 1 then
    begin
      produto.new;
      i := produto.count-1;
      produto.items[i].select(cdproduto);
    end;
    result := produto.items[i].vlvenda;
  end;
begin
  result        := False;
  if not QRotinas.SelecionarNomeArquivo(filename) then
  begin
    exit;
  end;
  cdstpedido      := QRegistro.CodigoStatusNovo(_pedido);
  cdstitpedido    := QRegistro.CodigoStatusNovo(_itpedido);
  Aplicacao       := TExcelApplication.Create(nil);
  Planilha        := TExcelWorksheet.Create(nil);
  LCID            := GetUserDefaultLCID;
  sql             := TStringList.create;
  frmprogressbar  := Tfrmprogressbar.Create(application);
  if tpfaturamento.cdtpfaturamento = 0 then
  begin
    tpfaturamento.Select(cdtpfaturamento);
  end;
  contrato     := tcontratolist.create;
  tpgradevalor := ttpgradevalorList.create;
  produto      := tprodutolist.create;
  try
    wkbk := Aplicacao.Workbooks.Open(filename, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, LCID);
    Planilha.ConnectTo(wkbk.Worksheets[1] as _Worksheet);
    Planilha.Activate;
    l                       := 2;
    frmprogressbar.gau.MaxValue := 100;
    frmprogressbar.Show;
    texto := Planilha.Range[_c+l.tostring,_c+l.tostring].Value2;
    while texto <> '' do
    begin
      frmprogressbar.pnl.Caption := Planilha.Range[_c+l.ToString,_c+l.ToString].Value2 + ' - '+Planilha.Range[_e+l.ToString,_e+l.ToString].Value2;
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      cdcliente := Planilha.Range[_c+l.ToString,_c+l.ToString].Value2;
      cdcliente := Copy(cdcliente, 1, Pos('-', cdcliente)-2);
      if (not codigoexiste(_cliente, cdcliente)) and
         (MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [cdcliente, _cliente])+#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
      begin
        abort;
      end;
      cdproduto := qregistro.CodigodoString(_produto, RetiraAcentos(Planilha.Range[_e+l.ToString,_e+l.ToString].Value2), _dsproduto);
      if (cdproduto = 0)and
         (MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [RetiraAcentos(Planilha.Range[_e+l.ToString,_e+l.ToString].Value2), _produto])+#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
      begin
        abort;
      end;
      cdtpgradevalor := qregistro.CodigodoNomeInteiro(_tpgradevalor, RetiraAcentos(Planilha.Range[_f+l.ToString,_f+l.ToString].Value2));
      if (cdtpgradevalor = 0) and
         (MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [RetiraAcentos(Planilha.Range[_f+l.ToString,_f+l.ToString].Value2), _Tipo+' '+_grade+' '+_valor])+#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
      begin
        abort;
      end;
      i := itfatpedido.Indice(itfatpedido.ObterCdPedido(cdcliente.toint64, tpfaturamento.cdtppedidoarquivo));
      if i = -1 then
      begin
        itfatpedido.new;
        itfatpedido.items[itfatpedido.count-1].pedido.cdpedido   := qgerar.GerarCodigo(_pedido);
        itfatpedido.items[itfatpedido.count-1].pedido.cdstpedido := cdstpedido;
        itfatpedido.items[itfatpedido.count-1].pedido.cdcliente  := cdcliente.ToInt64;
        itfatpedido.items[itfatpedido.count-1].pedido.cliente.select(itfatpedido.items[itfatpedido.count-1].pedido.cdcliente);
        itfatpedido.items[itfatpedido.count-1].pedido.cdtppedido := tpfaturamento.cdtppedidoarquivo;
        itfatpedido.items[itfatpedido.count-1].pedido.nupedido   := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido.tostring;
        itfatpedido.items[itfatpedido.count-1].pedido.dtemissao  := dttermino;
        sql.add(itfatpedido.items[itfatpedido.count-1].pedido.insert(true));
        itfatpedido.items[itfatpedido.count-1].cdfaturamento := cdfaturamento;
        itfatpedido.items[itfatpedido.count-1].cdpedido      := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido;
        itfatpedido.items[itfatpedido.count-1].nupedido      := itfatpedido.items[itfatpedido.count-1].pedido.nupedido;
        sql.add(itfatpedido.items[itfatpedido.count-1].insert(true));
        i := itfatpedido.Indice(itfatpedido.ObterCdPedido(cdcliente.toint64, tpfaturamento.cdtppedidoarquivo));
      end;
      x := itfatpedido.items[i].pedido.itpedido.Indice(cdproduto, cdtpgradevalor);
      if x = -1 then
      begin
        itfatpedido.items[i].pedido.itpedido.new;
        x := itfatpedido.items[i].pedido.itpedido.Count-1;
        itfatpedido.items[i].pedido.itpedido.Items[x].cdpedido     := itfatpedido.items[i].pedido.cdpedido;
        itfatpedido.items[i].pedido.itpedido.Items[x].cditpedido   := QGerar.GerarCodigo(_Itpedido);
        itfatpedido.items[i].pedido.itpedido.Items[x].cdproduto    := cdproduto;
        itfatpedido.items[i].pedido.itpedido.Items[x].cdstitpedido := cdstitpedido;
        itfatpedido.items[i].pedido.itpedido.Items[x].qtitem       := 0;
        itfatpedido.items[i].pedido.itpedido.Items[x].cddigitado   := cdproduto.ToString;
      end;
      itfatpedido.items[i].pedido.itpedido.Items[x].qtitem := itfatpedido.items[i].pedido.itpedido.Items[x].qtitem + 1;
      inc(l);
      texto := Planilha.Range[_c+l.tostring,_c+l.tostring].Value2;
    end;
    for I := 0 to itfatpedido.count - 1 do
    begin
      for x := 0 to itfatpedido.items[i].pedido.itpedido.count - 1 do
      begin
        itfatpedido.items[i].pedido.itpedido.Items[x].vlunitario := ObterVlUnitario(itfatpedido.items[i].pedido.cliente.cdcontrato,
                                                                                    itfatpedido.items[i].pedido.itpedido.Items[x].cdproduto,
                                                                                    itfatpedido.items[i].pedido.itpedido.Items[x].cdtpgradevalor,
                                                                                    itfatpedido.items[i].pedido.itpedido.Items[x].qtitem);
        itfatpedido.items[i].pedido.itpedido.Items[x].vltotal    := itfatpedido.items[i].pedido.itpedido.Items[x].qtitem * itfatpedido.items[i].pedido.itpedido.Items[x].vlunitario;
        sql.add(itfatpedido.items[i].pedido.itpedido.Items[x].insert(true));
        itfatpedido.items[i].pedido.vltotal := itfatpedido.items[i].pedido.vltotal + itfatpedido.items[i].pedido.itpedido.Items[x].vltotal;
      end;
      sql.add(itfatpedido.items[i].pedido.Update(true));
    end;
    if (sql.count > 0) and ExecutaScript(sql) then
    begin
      MessageDlg(_msg_Importacao_concluida, mtInformation, [mbOK], 0);
      result := True;
    end;
  finally
    Aplicacao.Workbooks.Close(lcid);
    FreeAndNil(aplicacao);
    FreeAndNil(Planilha);
    freeandnil(frmprogressbar);
    freeandnil(contrato);
    freeandnil(tpgradevalor);
    freeandnil(produto);
  end;
end;

function TFaturamento.ImportarProduto: boolean;
var
  erros, sql : TStrings;
  cdstpedido, cdstitpedido : Integer;
  cdcontrato, cdproduto, cdcliente : string;
  vlunitario : Currency;
  y, x, i, LCID : integer;
  filename:string;
  vlvendacontrato, vlvenda : Currency;
  Aplicacao : TExcelApplication;
  Planilha : TExcelWorksheet;
  wkbk : _Workbook;
begin
  result := False;
  if not QRotinas.SelecionarNomeArquivo(filename) then
  begin
    exit;
  end;
  cdstitpedido := QRegistro.CodigoStatusNovo( _itpedido);
  cdstpedido   := QRegistro.CodigoStatusNovo( _pedido);

  Aplicacao    := TExcelApplication.Create(nil);
  Planilha     := TExcelWorksheet.Create(nil);
  LCID         := GetUserDefaultLCID;
  wkbk         := Aplicacao.Workbooks.Open(filename,
                                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, LCID);
  frmprogressbar              := Tfrmprogressbar.Create(application);
  frmprogressbar.gau.MaxValue := 100;
  frmprogressbar.Show;
  if tpfaturamento.cdtpfaturamento = 0 then
  begin
    tpfaturamento.Select(cdtpfaturamento);
  end;
  sql := TStringList.Create;
  erros := TStringList.Create;
  try
    Planilha.ConnectTo(wkbk.Worksheets[1] as _Worksheet);
    Planilha.Activate; // torna a planilha da lista a planilha ativa
    cdproduto := Planilha.Range[_A+_1,_A+_1].Value2;
    if not codigoexiste(_produto, cdproduto) then
    begin
      erros.Add('Produto '+cdproduto+' inexistente.');
    end;
    i            := 2;
    cdcliente    := Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2;
    vlvenda      := ValordoCodigo(_produto, cdproduto, _vlvenda);
    while cdcliente <> '' do
    begin
      application.Title           := cdcliente;
      frmprogressbar.pnl.Caption  := cdcliente;
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      Application.ProcessMessages;
      if Pos('-', cdcliente) > 0 then
      begin
        cdcliente := Copy(cdcliente, 1, Pos('-', cdcliente)-2);
      end;
      if not CodigoExiste(_cliente, cdcliente) then
      begin
        erros.Add('Cliente '+cdcliente+' inexistente.');
      end;
      vlunitario := vlvenda;
      cdcontrato := NomedoCodigo(_cliente, cdcliente, _cdcontrato);
      if cdcontrato <> '' then
      begin
        vlvendacontrato := RetornaSQLCurrency('select vlunitario from itcontrato where cdproduto='+cdproduto+' and cdcontrato='+cdcontrato);
        if vlvendacontrato > 0 then
        begin
          vlunitario := vlvendacontrato;
        end;
      end;
      itfatpedido.new;
      x := itfatpedido.count-1;
      itfatpedido.items[x].pedido.cdpedido   := qgerar.gerarcodigo(_pedido);
      itfatpedido.items[x].pedido.cdstpedido := cdstpedido;
      itfatpedido.items[x].pedido.cdcliente  := cdcliente.ToInt64;
      itfatpedido.items[x].pedido.cdtppedido := tpfaturamento.cdtppedidoarquivo;
      itfatpedido.items[x].pedido.nupedido   := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido.tostring;
      itfatpedido.items[x].pedido.dtemissao  := dttermino;
      itfatpedido.items[x].pedido.vltotal    := vlunitario*Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
      itfatpedido.items[x].pedido.vlproduto  := vlunitario*Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
      itfatpedido.items[x].pedido.qtpedido   := Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
      sql.add(itfatpedido.items[x].pedido.insert(true));
      itfatpedido.items[x].cdfaturamento := cdfaturamento;
      itfatpedido.items[x].cdpedido      := itfatpedido.items[x].pedido.cdpedido;
      itfatpedido.items[x].nupedido      := itfatpedido.items[x].pedido.nupedido;
      sql.add(itfatpedido.items[x].insert(true));
      itfatpedido.items[x].pedido.itpedido.New;
      y := itfatpedido.items[x].pedido.itpedido.Count-1;
      itfatpedido.items[x].pedido.itpedido.Items[y].cdpedido := itfatpedido.items[itfatpedido.count-1].pedido.cdpedido;
      itfatpedido.items[x].pedido.itpedido.Items[y].cditpedido := qgerar.gerarcodigo(_itpedido);;
      itfatpedido.items[x].pedido.itpedido.Items[y].cdproduto := cdproduto.tointeger;
      itfatpedido.items[x].pedido.itpedido.Items[y].cdstitpedido := cdstitpedido;
      itfatpedido.items[x].pedido.itpedido.Items[y].qtitem := Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
      itfatpedido.items[x].pedido.itpedido.Items[y].vlunitario := vlunitario;
      itfatpedido.items[x].pedido.itpedido.Items[y].cddigitado := cdproduto;
      itfatpedido.items[x].pedido.itpedido.Items[y].vltotal := vlunitario*Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
      sql.add(itfatpedido.items[x].pedido.itpedido.Items[y].Insert(true));
      Inc(i);
      cdcliente := Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2;
    end;
    if erros.Count = 0 then
    begin
      result := ExecutaScript(sql);
    end;
  finally
    if erros.Count = 0 then
    begin
      MessageDlg('A importa��o foi realizada com sucesso!', mtConfirmation, [mbOk], 0);
    end
    else if erros.count > 0 then
    begin
      MessageDlg('N�o foi poss�vel concluir a importa��o!', mtError, [mbOk], 0);
      if MessageDlg('H� erro(s) na importa��o!'#13'Deseja visualiz�-los?', mtError, [mbYes, mbNo], 0) = mrYes then
      begin
        ExibirSaidaVideo(erros);
      end;
    end;
    FreeAndNil(sql);
    FreeAndNil(erros);
    freeandnil(frmprogressbar);
    Aplicacao.Workbooks.Close(lcid);
    Planilha.Free;
    Aplicacao.Free;
  end;
end;

function TFaturamento.InserirItSaidadeItFatSaida: string;
var
  x : integer;
begin
  result := '';
  for x := 0 to itfatproduto.count - 1 do
  begin
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.new;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].cditsaida  := qgerar.gerarcodigo(_itsaida);
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].cdsaida    := itfatsaida.items[itfatsaida.count-1].saida.cdsaida;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].cdcfop     := itfatsaida.items[itfatsaida.count-1].saida.cdcfop;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].cdproduto  := itfatproduto.items[x].cdproduto;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].cddigitado := itfatproduto.items[x].cddigitado;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].qtitem     := itfatproduto.items[x].qtitem;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].vlunitario := itfatproduto.items[x].vlunitario;
    itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].vltotal    := itfatproduto.items[x].vltotal;
    result := result + itfatsaida.items[itfatsaida.count-1].saida.itsaida.items[itfatsaida.items[itfatsaida.count-1].saida.itsaida.count-1].insert(true) + #13;
  end;
end;

function TFaturamento.InserirSaida(cdcliente: LargeInt): string;
begin
  itfatsaida.new;
  if tpfaturamento.tpsaida.serie.cdserie = 0 then
  begin
    tpfaturamento.tpsaida.serie.select(tpfaturamento.tpsaida.cdserie);
  end;
  tpfaturamento.tpsaida.serie.nusequencia                  := tpfaturamento.tpsaida.serie.nusequencia + 1;
  itfatsaida.items[itfatsaida.count-1].saida.cdsaida       := qgerar.gerarcodigo(_saida);
  itfatsaida.items[itfatsaida.Count-1].saida.cdserie       := tpfaturamento.tpsaida.serie.cdserie;
  itfatsaida.items[itfatsaida.Count-1].saida.cdcliente     := cdcliente;
  itfatsaida.items[itfatsaida.Count-1].saida.cliente.Select(itfatsaida.items[itfatsaida.Count-1].saida.cdcliente);
  itfatsaida.items[itfatsaida.Count-1].saida.cdcfop        := tpfaturamento.tpsaida.ObterCfop(itfatsaida.items[itfatsaida.Count-1].saida.cliente.cduf);
  itfatsaida.items[itfatsaida.Count-1].saida.nusaida       := tpfaturamento.tpsaida.serie.nusequencia;
  itfatsaida.items[itfatsaida.Count-1].saida.cdtpsaida     := tpfaturamento.cdtpsaida;
  itfatsaida.items[itfatsaida.Count-1].saida.nustdocumento := _00;
  itfatsaida.items[itfatsaida.Count-1].saida.cdcondpagto   := tpfaturamento.cdcondpagto;
  itfatsaida.items[itfatsaida.Count-1].saida.cdtpcobranca  := tpfaturamento.cdtpcobranca;
  itfatsaida.items[itfatsaida.Count-1].saida.tpentsai      := _s;
  itfatsaida.items[itfatsaida.Count-1].saida.dtemissao     := dtfaturamento;
  itfatsaida.items[itfatsaida.Count-1].saida.dtsaida       := dtfaturamento;
  itfatsaida.items[itfatsaida.Count-1].saida.hrsaida       := HrBanco;
  itfatsaida.items[itfatsaida.count-1].cdfaturamento := cdfaturamento;
  itfatsaida.items[itfatsaida.count-1].cdsaida       := itfatsaida.items[itfatsaida.count-1].saida.cdsaida;
  result := tpfaturamento.tpsaida.serie.update(true) + #13 +
            itfatsaida.items[itfatsaida.Count-1].saida.insert(true) + #13 +
            itfatsaida.items[itfatsaida.Count-1].Insert(true) + #13;
end;

function TFaturamento.AplicarDiaMensalidadeNoVencimento: string;
var
  i: Integer;
begin
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := itfatsaida.count;
    frmprogressbar.show;
    result := '';
    for I := 0 to itfatsaida.count -1 do
    begin
      frmprogressbar.pnl.caption := 'Aplicar dia da mensalidade no vencimento do contas a receber';
      frmprogressbar.gau.progress := i + 1;
      application.ProcessMessages;
      if itfatsaida.items[i].saida.cliente.nudiamensalidade > 0 then
      begin
        itfatsaida.items[i].saida.duplicata.items[0].dtvencimento  := ObterDtvencimento(itfatsaida.items[i].saida.cliente.nudiamensalidade);
        itfatsaida.items[i].saida.duplicata.items[0].dtprorrogacao := itfatsaida.items[i].saida.duplicata.items[0].dtvencimento;
        result := result + itfatsaida.items[i].saida.duplicata.items[0].update(true)+#13;
      end;
    end;
  finally
    freeandnil(frmprogressbar);
  end;
end;

procedure TFaturamento.AtualizarParaValorContrato(gau: TGauge; pnl: TPanel);
var
  sql : tstrings;
  vltotal : Currency;
  cdstitpedido : integer;
  I: Integer;
  contrato : TContratoList;
  procedure AdicionarItem(cdproduto: integer; vlunitario:currency);
  begin
    itfatpedido.items[i].pedido.itpedido.new;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].cdpedido     := itfatpedido.items[i].cdpedido;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].cditpedido   := qgerar.GerarCodigo(_itpedido);
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].cdproduto    := cdproduto;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].cdstitpedido := cdstitpedido;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].qtitem       := 1;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].qtatendida   := 0;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].cddigitado   := cdproduto.tostring;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].vlunitario   := vlunitario;
    itfatpedido.items[i].pedido.itpedido.items[itfatpedido.items[i].pedido.itpedido.count-1].vltotal      := vlunitario;
  end;
  procedure ProcessarValorContrato;
  begin
    itfatpedido.items[i].pedido.itpedido.ZerarVlTotalUnitario;
    sql.text := sql.text + itfatpedido.items[i].pedido.itpedido.sqlUpdate;
    AdicionarItem(contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].cdproduto, contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].vlcontrato);
  end;
begin
  contrato := tcontratolist.create;
  sql := TStringList.create;
  try
    gau.MaxValue := itfatpedido.count;
    // acumular por cliente
    for I := 0 to itfatpedido.count - 1 do
    begin
      gau.Progress := i + 1;
      pnl.Caption  := 'Registro '+gau.Progress.tostring+' de '+itfatpedido.count.ToString;
      Application.ProcessMessages;
      if itfatpedido.items[i].pedido.cdpedido = 0 then
      begin
        itfatpedido.items[i].pedido.select(itfatpedido.items[i].cdpedido);
      end;
      if itfatpedido.items[i].pedido.cdtppedido = tpfaturamento.cdtppedidoarquivo then
      begin
        itfatpedido.items[i].pedido.itpedido.Ler(itfatpedido.items[i].cdpedido);
        if not itfatpedido.items[i].pedido.cliente.select(itfatpedido.items[i].pedido.cdcliente) then
        begin
          continue;
        end;
        if itfatpedido.items[i].pedido.cliente.cdcontrato = 0 then
        begin
          continue;
        end;
        if contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato) = -1 then
        begin
          contrato.new.select(itfatpedido.items[i].pedido.cliente.cdcontrato);
        end;
        if itfatpedido.items[i].pedido.itpedido.vltotal > contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].vlcontrato  then
        begin
          vltotal := itfatpedido.items[i].pedido.itpedido.vltotal;
          processarValorContrato;
          AdicionarItem(contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].cdprodutoexcedente, vltotal - contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].vlcontrato);// excedente
        end
        else
        begin
          ProcessarValorContrato;
          itfatpedido.items[i].pedido.vltotal := contrato.Items[contrato.indice(itfatpedido.items[i].pedido.cliente.cdcontrato)].vlcontrato;
          sql.add(itfatpedido.items[i].pedido.update(true));
        end;
      end;
    end;
    if sql.count > 0 then
    begin
      ExecutaScript(sql);
    end;
  finally
    freeandnil(contrato);
    freeandnil(sql);
  end;
end;

function TFaturamento.ObterDtvencimento(nudiamensalidade:integer): TDate;
var
  udm : Integer;
begin
  result := dtvencimento;
  if (tpfaturamento.bopedido = _s) and (nudiamensalidade <> 0) and (tpfaturamento.bodtvencimentofixa <> _s) then
  begin
    if (nudiamensalidade = 30) or (nudiamensalidade = 31) then
    begin
      udm := StrToInt(formatdatetime(_dd, Ultimo_Dia_Mes(strtodate(_01+ QRotinas.GetDateSeparator+ formatdatetime(_mm+QRotinas.GetDateSeparator+_yyyy, dtvencimento)))));
      if udm < nudiamensalidade then
      begin
        nudiamensalidade := udm;
      end;
    end;
    result := strtodate(nudiamensalidade.tostring + QRotinas.GetDateSeparator+ formatdatetime(_mm+QRotinas.GetDateSeparator+_yyyy, dtvencimento));
  end;
end;

function TFaturamento.excluirsaida: Boolean;
var
  sql : TStrings;
begin
  sql := TStringList.Create;
  try
    cdstfaturamento := 2;
    sql.text        := itfatsaida.sqlExcluir;
    sql.add(update(true));
    Result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

function TFaturamento.excluirpedidopelotipo(cdtppedido: integer): Boolean;
var
  sql : TStrings;
  I: Integer;
begin
  result := False;
  sql := TStringList.Create;
  try
    for I := 0 to itfatpedido.count do
    begin
      if itfatpedido.items[i].pedido.cdpedido = 0 then
      begin
        itfatpedido.items[i].pedido.select(Itfatpedido.items[i].cdpedido);
      end;
      if itfatpedido.items[i].pedido.cdtppedido = cdtppedido then
      begin
        sql.add(itfatpedido.items[i].delete(true));
        sql.add(itfatpedido.items[i].pedido.delete(true));
      end;
    end;
    if sql.count > 0 then
    begin
      ExecutaScript(sql);
    end;
  finally
    FreeAndNil(sql);
  end;
end;

constructor TGerarFaturamento.create;
begin
  sqlstring      := TStringList.Create;
end;

destructor TGerarFaturamento.destroy;
begin
  freeandnil(sqlstring);
  inherited;
end;

function TGerarFaturamento.Gerar(faturamento_: TFaturamento): boolean;
begin
  faturamento := faturamento_;
  faturamento.tpfaturamento.Select(faturamento.cdtpfaturamento);
  if faturamento.tpfaturamento.cdtpsaida = 0 then
  begin
    messagedlg('N�o est� configurado o tipo de nota fiscal no tipo de faturamento.', mtinformation, [mbok], 0);
    abort;
  end;
  if faturamento.tpfaturamento.tpsaida.cdtpsaida = 0 then
  begin
    faturamento.tpfaturamento.tpsaida.select(faturamento.tpfaturamento.cdtpsaida);
  end;
  if faturamento.tpfaturamento.tpsaida.cdcfopduf = 0 then
  begin
    messagedlg('N�o est� definido o cfop no tipo de nota fiscal do tipo de faturamento.', mtinformation, [mbok], 0);
    abort;
  end;
  if faturamento.tpfaturamento.bopedido = _s then
  begin
    sqlstring.text := sqlstring.text + faturamento.GerarFaturamentoPedido;
  end
  else
  begin
    if faturamento.tpfaturamento.bocliente = _s then // tipo de faturamento = avulso
    begin
      sqlstring.text := sqlstring.text + Faturamento.GerarFaturamentoAvulso;
    end
    else
    begin
      sqlstring.text := sqlstring.text + Faturamento.GerarFaturamentoProduto;
    end
  end;
  faturamento.cdstfaturamento := 4;
  sqlstring.add(faturamento.update(true));
  ExecutaScript(sqlstring);
  result := true;
end;

class function TGerarFaturamento.GerarFaturamento(faturamento_: TFaturamento): boolean;
var
  gerar : TGerarFaturamento;
begin
  gerar := tgerarfaturamento.create;
  try
    result := gerar.Gerar(faturamento_);
  finally
    freeandnil(gerar);
  end;
end;

constructor TFaturamentoBanco.create;
begin
  cdstitpedido   := QRegistro.CodigoStatusNovo( _itpedido);
  cdstpedido     := QRegistro.CodigoStatusNovo( _pedido);
  sqlstring      := TStringList.Create;
  frmprogressbar := tfrmprogressbar.create(nil);
  pedido := tpedidolist.create;
end;

destructor TFaturamentoBanco.destroy;
begin
  freeandnil(sqlstring);
  freeandnil(frmprogressbar);
  freeandnil(pedido);
  inherited;
end;

function TFaturamentoBanco.Importar(faturamento_:TFaturamento; bomensalidade : boolean): boolean;
var
  I: Integer;
begin
  faturamento := faturamento_;
  if faturamento.tpfaturamento.cdtpfaturamento = 0 then
  begin
    faturamento.tpfaturamento.Select(faturamento.cdfaturamento);
  end;
  sqlstring.clear;
  frmprogressbar.Show;
  pedido.ler(_cdstpedido+'='+cdstpedido.tostring+' and dtemissao between '+getdtbanco(faturamento.dtinicio)+' and '+getdtbanco(faturamento.dttermino));
  if bomensalidade then
  begin
    GerarMensalidade(frmprogressbar.pnl, frmprogressbar.gau);
    ExecutaScript(sqlstring);
    sqlstring.Clear;
  end;
  frmprogressbar.gau.MaxValue  := pedido.count;
  for I := 0 to pedido.count - 1 do
  begin
    frmprogressbar.pnl.Caption  := 'Inserindo pedido do Banco... Pedido '+pedido.items[i].nupedido;
    frmprogressbar.gau.Progress := i + 1;
    Application.ProcessMessages;
    if faturamento.itfatpedido.Indice(pedido.items[i].cdpedido) = -1 then
    begin
      faturamento.itfatpedido.new;
      faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].cdfaturamento := faturamento.cdfaturamento;
      faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].cdpedido      := pedido.items[i].cdpedido;
      faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].nupedido      := pedido.items[i].nupedido;
      sqlstring.add(faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].Insert(true));
    end;
  end;
  result := true;
  ExecutaScript(sqlstring);
  sqlstring.clear;
  faturamento.AtualizarParaValorContrato(frmprogressbar.gau, frmprogressbar.pnl);
end;

class function TFaturamentoBanco.ImportarBanco(Faturamento_: TFaturamento; bomensalidade: boolean): boolean;
var
  faturamentobanco : tfaturamentobanco;
begin
  faturamentobanco := tfaturamentobanco.create;
  try
    result := faturamentobanco.importar(faturamento_, bomensalidade);
  finally
    freeandnil(faturamentobanco);
  end;
end;

function TFaturamentoBanco.JaFoiGeradoPedidoMensalidade(cdcliente:LargeInt):boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to pedido.count - 1 do
  begin
    if (pedido.items[i].cdcliente = cdcliente) and (faturamento.tpfaturamento.cdtppedidomensalidade = pedido.items[i].cdtppedido) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TFaturamentoBanco.GerarMensalidade(pnl:TPanel; gau: TGauge);
var
  cliente : tclientelist;
  tpcliente : ttpclientelist;
  tpclientemensalidade : TtpclientemensalidadeList;
  contrato : tcontratolist;
  I: Integer;
begin
  cliente := tclientelist.create;
  contrato := tcontratolist.create;
  tpcliente := ttpclientelist.create;
  tpclientemensalidade := TtpclientemensalidadeList.create;
  try
    tpcliente.Ler(_bogerarmensalidade+'='+quotedstr(_s));
    cliente.Ler(_cdtpcliente+' in ('+tpcliente.codigoIn+')');
    gau.Visible   := true;
    gau.MaxValue  := cliente.count;
    for I := 0 to cliente.count - 1 do
    begin
      pnl.caption := 'Gerando mensalidade... Cliente '+cliente.items[i].cdcliente.tostring;
      gau.Progress := i + 1;
      Application.ProcessMessages;
      if PeriodoCarencia(faturamento.dttermino, cliente.Items[i].dtcadastrosocio) or JaFoiGeradoPedidoMensalidade(cliente.items[i].cdcliente) then
      begin
        continue;
      end;
      if cliente.items[i].cdcontrato = 0 then
      begin
        if tpclientemensalidade.indice(cliente.items[i].cdtpclientemensalidade) = -1 then
        begin
          tpclientemensalidade.new;
          tpclientemensalidade.Items[tpclientemensalidade.Count-1].Select(cliente.items[i].cdtpclientemensalidade);
        end;
        GerarPedidoMensalidade(cliente.items[i].cdcliente,
                               faturamento.tpfaturamento.cdprodutomensalidade,
                               tpclientemensalidade.items[tpclientemensalidade.indice(cliente.items[i].cdtpclientemensalidade)].vltpclientemensalidade,
                               faturamento.dttermino)
      end
      else
      begin
        if not faturamento.itfatpedido.ExistePedido(cliente.items[i].cdcliente, faturamento.tpfaturamento.cdtppedidoarquivo) then
        begin
          if contrato.indice(cliente.items[i].cdcliente) = -1 then
          begin
            contrato.new;
            contrato.items[contrato.count-1].Select(cliente.items[i].cdcontrato);
          end;
          GerarPedidoMensalidade(cliente.items[i].cdcliente,
                                 contrato.items[contrato.indice(cliente.items[i].cdcontrato)].cdproduto,
                                 contrato.items[contrato.indice(cliente.items[i].cdcontrato)].vlcontrato,
                                 faturamento.dttermino);
        end;
      end;
    end;
  finally
    freeandnil(cliente);
    freeandnil(contrato);
    freeandnil(tpcliente);
    freeandnil(tpclientemensalidade);
  end;
end;

function TFaturamentoBanco.PeriodoCarencia(dtcadastro, dttermino: TDate):boolean;
begin
  result := false;
  if (dttermino - dtcadastro) > faturamento.tpfaturamento.nudiascarenciamensalidade then
  begin
    result := True;
    exit;
  end;
end;

procedure TFaturamentoBanco.GerarPedidoMensalidade(cdcliente: LargeInt; cdproduto:Integer; vlmensalidade : currency; dtf: TDate);
begin
  faturamento.itfatpedido.new;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdpedido   := qgerar.gerarcodigo(_pedido);
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdstpedido := cdstpedido;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdcliente  := cdcliente;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdtppedido := faturamento.tpfaturamento.cdtppedidomensalidade;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.nupedido   := faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdpedido.ToString;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.dtemissao  := dtf;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.vltotal    := vlmensalidade;
  sqlstring.add(faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.insert(true));

  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].cdfaturamento := faturamento.cdfaturamento;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].cdpedido      := faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdpedido;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].nupedido      := faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.nupedido;
  sqlstring.add(faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].insert(true));

  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.New;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].cdpedido     := faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.cdpedido;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].cditpedido   := qgerar.GerarCodigo(_itpedido);
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].cdproduto    := cdproduto;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].cdstitpedido := cdstitpedido;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].qtitem       := 1;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].vlunitario   := vlmensalidade;;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].vltotal      := vlmensalidade;
  faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].cddigitado   := cdproduto.ToString;
  sqlstring.add(faturamento.itfatpedido.items[faturamento.itfatpedido.Count-1].pedido.itpedido.Items[0].Insert(true));
end;

end.
