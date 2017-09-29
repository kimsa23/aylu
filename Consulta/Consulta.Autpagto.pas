unit Consulta.Autpagto;

interface

uses
  System.Actions, System.UITypes,
  forms, Classes, ActnList, ComCtrls, StdCtrls, Mask, ExtCtrls, ToolWin, windows,
  dialogs, sysutils, Buttons, Controls,
  SqlExpr,
  rotina.registro, uconstantes, rotina.AdicionarListView, rotina.montarsql,
  rotina.strings, classe.form, classe.InstrucaoSQL,
  orm.empresa,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxPC, dxBar, cxClasses,
  cxSplitter, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxListView, cxLabel,
  cxGroupBox, cxRadioGroup, cxPCdxBarPopupMenu, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils, dxBarBuiltInMenu;

type
  TfrmConsultaAutpagto = class(TForm)
    ActionList1: TActionList;
    actGerar: TAction;
    actfechar: TAction;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ntb: TNotebook;
    pnl1: TPanel;
    Bevel4: TBevel;
    lblemissao: TLabel;
    lblateemissao: TLabel;
    lblvencimento: TLabel;
    lblatevencimento: TLabel;
    lblbaixa: TLabel;
    lblatebaixa: TLabel;
    lblinicial: TLabel;
    lblfinal: TLabel;
    lbldshistorico: TLabel;
    lblentrada: TLabel;
    lblateentrada: TLabel;
    lblorder: TLabel;
    Bevel8: TBevel;
    pgc: TcxPageControl;
    tbsfornecedor: TcxTabSheet;
    Bevel2: TBevel;
    lblnmfornecedor: TLabel;
    lblcdfornecedor: TLabel;
    ckbfornecedorinversa: TcxCheckBox;
    edtnucnpjcpf: TMaskEdit;
    edtcdfornecedor: TEdit;
    edtnmfornecedor: TEdit;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton8: TToolButton;
    lsvfornecedor: TcxListView;
    tbsstautpagto: TcxTabSheet;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    edtcdstautpagto: TEdit;
    edtnmstautpagto: TEdit;
    ToolBar4: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    lsvstautpagto: TcxListView;
    tbsstaprovacao: TcxTabSheet;
    Bevel5: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    edtcdstencontrocontas: TEdit;
    edtnmstencontrocontas: TEdit;
    lsvstaprovacao: TcxListView;
    tbscntcusto: TcxTabSheet;
    Bevel6: TBevel;
    Label6: TLabel;
    Label5: TLabel;
    edtcdcntcusto: TEdit;
    edtnmcntcusto: TEdit;
    ToolBar2: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    lsvcntcusto: TcxListView;
    tbsplconta: TcxTabSheet;
    Bevel7: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtnmplconta: TEdit;
    edtcdplconta: TEdit;
    ToolBar5: TToolBar;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton22: TToolButton;
    lsvplconta: TcxListView;
    tbstpentrada: TcxTabSheet;
    Bevel1: TBevel;
    Label10: TLabel;
    Label9: TLabel;
    edtcdtpentrada: TEdit;
    edtnmtpentrada: TEdit;
    ToolBar6: TToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton29: TToolButton;
    lsvtpentrada: TcxListView;
    ckbsentrada: TcxCheckBox;
    edtdshistorico: TcxTextEdit;
    cbxtpdata: TComboBox;
    cbxorder: TComboBox;
    rdgorder: TRadioGroup;
    spl1: TcxSplitter;
    trv: TTreeView;
    pnl: TcxLabel;
    tbstpcobranca: TcxTabSheet;
    ToolBar7: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton11: TToolButton;
    Bevel9: TBevel;
    edtnmtpcobranca: TEdit;
    edtcdtpcobranca: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    lsvtpcobranca: TcxListView;
    edtdtiE: TcxDateEdit;
    edtdtfE: TcxDateEdit;
    edtdtfb: TcxDateEdit;
    edtdtib: TcxDateEdit;
    edtdtiv: TcxDateEdit;
    edtdtfv: TcxDateEdit;
    edtdtin: TcxDateEdit;
    edtdtfn: TcxDateEdit;
    edtdti: TcxDateEdit;
    edtdtf: TcxDateEdit;
    tbsempresa: TcxTabSheet;
    ToolBar10: TToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton17: TToolButton;
    Bevel14: TBevel;
    edtnmempresa: TEdit;
    edtcdempresa: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    lsvempresa: TcxListView;
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure actGerarExecute(Sender: TObject);
    procedure trvChange(Sender: TObject; Node: TTreeNode);
    procedure edtnmstautpagtoChange(Sender: TObject);
    procedure edtnmstautpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnmfornecedorChange(Sender: TObject);
    procedure edtnmfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnucnpjcpfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnucnpjcpfKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdstautpagtoKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure edtcdstencontrocontasKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmstencontrocontasChange(Sender: TObject);
    procedure edtnmstencontrocontasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actfecharExecute(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure edtcdcntcustoKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmcntcustoChange(Sender: TObject);
    procedure edtnmcntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure edtcdplcontaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmplcontaChange(Sender: TObject);
    procedure edtnmplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure ToolButton29Click(Sender: TObject);
    procedure edtcdtpentradaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmtpentradaChange(Sender: TObject);
    procedure edtnmtpentradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure edtcdtpcobrancaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmtpcobrancaChange(Sender: TObject);
    procedure edtnmtpcobrancaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure edtcdempresaKeyPress(Sender: TObject; var Key: Char);
    procedure edtnmempresaChange(Sender: TObject);
    procedure edtnmempresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private    { Private declarations }
    tpcodigo : string;
    bloco : TInstrucaoSQL;
    executar_on_change_empresa : boolean;
    executar_on_change_stAutpagto : boolean;
    executar_on_change_Fornecedor : boolean;
    executar_on_change_staprovacao : boolean;
    executar_on_change_cntcusto : boolean;
    executar_on_change_plconta : boolean;
    executar_on_change_tpcobrana : boolean;
    executar_on_change_tpentrada : boolean;
    procedure set_treeview;
    procedure set_data_b(bostatus: Boolean);
    procedure set_data_e(bostatus: Boolean);
    procedure set_data_i(bostatus: Boolean);
    procedure set_data_n(bostatus: Boolean);
    procedure set_data_v(bostatus: boolean);
  public    { Public declarations }
  end;

var
  frmConsultaAutpagto: TfrmConsultaAutpagto;

implementation

uses
  uMain,
  //uconsultaautpagtoImprimirPosicaoDespesasNF,
  impressao.referenciacruzada,
  impressao.relatoriopadrao,
  uDtmMain;

{$R *.dfm}

procedure TfrmConsultaAutpagto.FormShow(Sender: TObject);
begin
  tpcodigo              := 'C�digo';
  ntb.ActivePage        := 'Default';
  tbsplconta.tabvisible := empresa.financeiro.boplconta;
  trv.Items[0].Expand(true);
end;

procedure TfrmConsultaAutpagto.ToolButton1Click(Sender: TObject);
begin
  AdicionarListView(lsvfornecedor);
end;

procedure TfrmConsultaAutpagto.ToolButton2Click(Sender: TObject);
begin
  ExcluirListview(lsvfornecedor);
end;

procedure TfrmConsultaAutpagto.ToolButton8Click(Sender: TObject);
begin
  lsvFornecedor.Clear;
end;

procedure TfrmConsultaAutpagto.ToolButton9Click(Sender: TObject);
begin
  AdicionarListView(lsvstautpagto);
end;

procedure TfrmConsultaAutpagto.ToolButton10Click(Sender: TObject);
begin
  ExcluirListview(lsvstAutpagto);
end;

procedure TfrmConsultaAutpagto.ToolButton12Click(Sender: TObject);
begin
  lsvstAutpagto.Clear;
end;

procedure TfrmConsultaAutpagto.actGerarExecute(Sender: TObject);
const
  order1 = 'C�digo'#13'Data Emiss�o'#13'Data Vencimento'#13'Data Prorroga��o'#13'Data Baixa'#13'Valor'#13'C�digo Fornecedor'#13'Nome Fornecedor';
  order2 = 'a.cdautpagto'#13'a.DTEMISSAO'#13'a.dtvencimento'#13'a.dtprorrogacao'#13'a.dtbaixa'#13'a.vlautpagto'#13'a.cdfornecedor'#13'f.nmfornecedor';
var
  nopai, dshistorico, tpdata, consulta :string;
  cdempresa, cdtpcobranca, cdtpentrada, cdplconta, cdcntcusto, cdstAutpagto, cdFornecedor, cdstaprovacao : TStrings;
  dti, dtf : TDate;
  bofornecedorinversa : boolean;
  procedure criar_objetos;
  begin
    cdFornecedor  := TStringList.create;
    cdempresa     := TStringList.create;
    cdstAutpagto  := TStringList.create;
    cdtpcobranca  := TStringList.create;
    cdstaprovacao := tstringlist.Create;
    cdcntcusto    := TStringList.create;
    cdplconta     := TStringList.create;
    cdtpentrada   := TStringList.create;
  end;
  procedure preencher_lista;
  var
    i : Integer;
  begin
    for I := 0 to lsvFornecedor.Items.count  - 1 do
    begin
      cdFornecedor.add (lsvFornecedor.items [i].Caption);
    end;
    for I := 0 to lsvempresa.Items.count - 1 do
    begin
      cdempresa.add(lsvempresa.items[i].Caption);
    end;
    for I := 0 to lsvstAutpagto.Items.count  - 1 do
    begin
      cdstAutpagto.add (lsvstAutpagto.items [i].caption);
    end;
    for I := 0 to lsvtpcobranca.Items.count  - 1 do
    begin
      cdtpcobranca.add (lsvtpcobranca.items [i].caption);
    end;
    for I := 0 to lsvstaprovacao.Items.Count - 1 do
    begin
      cdstaprovacao.Add(lsvstaprovacao.Items[i].caption);
    end;
    for I := 0 to lsvcntcusto.Items.count - 1 do
    begin
      cdcntcusto.add(CodigodoCampo(_cntcusto, lsvcntcusto.items[i].caption, _nunivel));
    end;
    for I := 0 to lsvtpentrada.Items.count - 1 do
    begin
      cdtpentrada.add(lsvtpentrada.items[i].Caption);
    end;
    for I := 0 to lsvplconta.Items.count - 1 do
    begin
      cdplconta.add(CodigodoCampo(_plconta, lsvplconta.items[i].caption, _nunivel));
    end;
  end;
  procedure destruir_objetos;
  begin
    cdempresa.free;
    cdFornecedor.free;
    cdtpentrada.free;
    cdstAutpagto.free;
    cdtpcobranca.free;
    cdstaprovacao.free;
    cdcntcusto.free;
    cdplconta.free;
  end;
  function nmdata:string;
  begin
    if tpdata = qstring.maiuscula(__emissao) then
    begin
      result := _dtemissao
    end
    else if tpdata = qstring.maiuscula(_Baixa) then
    begin
      result := _dtbaixa
    end
    else if tpdata = 'Prorroga��o' then
    begin
      result := _dtprorrogacao
    end
    else if tpdata = qstring.maiuscula(_Vencimento) then
    begin
      result := _dtprorrogacao
    end
    else if tpdata = qstring.maiuscula(_Entrada) then
    begin
      result := _dtentrada;
    end;
  end;
  function MakeSQLDiario(nmdata: string):string;
  begin
    result := 'where ';
    if nmdata = _baixa then
    begin
      result := result + _baixa
    end
    else
    begin
      result := result + _autpagto;
    end;
    result := result + '.dt'+nmdata+' between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    if dshistorico <> '' then
    begin
      result := result + 'and autpagto.dshistorico like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      result := result + 'and autpagto.cdentrada is null ';
    end;
    sqlmontarlista(cdfornecedor, _autpagto, _cdfornecedor, result, 0, bofornecedorinversa);
    sqlmontarlista(cdstautpagto, _autpagto, _cdstautpagto, result);
    sqlmontarlista(cdtpcobranca, _autpagto, _cdtpcobranca, result);
    sqlmontarlista(cdcntcusto  , _autpagto, _cdcntcusto, result);
    sqlmontarlista(cdplconta   , _autpagto, _cdplconta   , result);
    sqlmontarlista(cdempresa   , _autpagto, _cdempresa   , result);
  end;
  function sqlwhere:string;
  var
    t : Integer;
  begin
    t := 0;
    InsercaoDataSQl(edtdtie, edtdtfe, result, _a+'.'+_dtemissao, t);
    InsercaoDataSQl(edtdtin, edtdtfn, result, _a+'.'+_dtentrada, t);
    InsercaoDataSQl(edtdtib, edtdtfb, result, _a+'.'+_dtbaixa, t);
    InsercaoDataSQl(edtdtiv, edtdtfv, result, _a+'.'+_dtprorrogacao, t);
    sqlmontarlista(cdfornecedor, _a, _cdfornecedor, result, t, bofornecedorinversa);
    sqlmontarlista(cdstautpagto, _a, _cdstautpagto, result, t);
    sqlmontarlista(cdtpcobranca, _a, _cdtpcobranca, result, t);
    sqlmontarlista(cdcntcusto  , _a, _cdcntcusto, result, t);
    sqlmontarlista(cdplconta   , _a, _cdplconta   , result, t);
    sqlmontarlista(cdempresa   , _a, _cdempresa   , result, t);
    if dshistorico <> ''   then
    begin
      if t = 0 then
      begin
        result := 'where'
      end
      else
      begin
        result := result + 'and';
      end;
      result := result + ' a.dshistorico like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      if t = 0 then
      begin
        result := 'where'
      end
      else
      begin
        result := result + 'and';
      end;
      result := result + ' a.cdentrada is null ';
    end;
  end;
  function sqlwheresinteticocntcusto:string;
  begin
    Result := ' ';
    //Result := ' and a.cdempresa='+empresa.cdempresa.tostring+' ';
    InsercaoDataSQl(edtdtie, edtdtfe, result, _a+'.'+_dtemissao);
    InsercaoDataSQl(edtdtin, edtdtfn, result, _a+'.'+_dtentrada);
    InsercaoDataSQl(edtdtib, edtdtfb, result, _a+'.'+_dtbaixa);
    InsercaoDataSQl(edtdtiv, edtdtfv, result, _a+'.'+_dtprorrogacao);
    if dshistorico <> ''   then
    begin
      result := result + 'and a.'+_dshistorico+' like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      result := result + 'and a.'+_cdentrada+' is null ';
    end;
    sqlmontarlista(cdfornecedor, _a, _cdfornecedor, result, 0, bofornecedorinversa);
    sqlmontarlista(cdstautpagto, _a, _cdstautpagto, result);
    sqlmontarlista(cdtpcobranca, _a, _cdtpcobranca, result);
    sqlmontarlista(cdcntcusto  , _a, _cdcntcusto, result);
    sqlmontarlista(cdplconta   , _a, _cdplconta   , result);
    sqlmontarlista(cdempresa   , _a, _cdempresa   , result);
  end;
  function sqlwherefornecedor2:string;
    function getorder:string;
    begin
      if cbxorder.text = 'Nome Fornecedor' then
      begin
        result := _nmfornecedor
      end
      else if cbxorder.text = 'Raz�o Social' then
      begin
        result := _rzsocial
      end
      else
      begin
        result := _cdfornecedor;
      end;
    end;
  var
    t : integer;
  begin
    result := ' ';
    t := 1;
    InsercaoDataSQl(edtdtiE, edtdtfe, result, _autpagto+'.'+_dtemissao, t);
    InsercaoDataSQl(edtdtib, edtdtfb, result, _autpagto+'.'+_dtbaixa, t);
    InsercaoDataSQl(edtdtiv, edtdtfv, result, _autpagto+'.'+_dtprorrogacao, t);
    sqlmontarlista(cdfornecedor, _autpagto, _cdfornecedor, result, t);
    sqlmontarlista(cdstautpagto, _autpagto, _cdstautpagto, result, t);
    sqlmontarlista(cdtpcobranca, _autpagto, _cdtpcobranca, result, t);
    sqlmontarlista(cdplconta   , _autpagto, _cdplconta   , result, t);
    sqlmontarlista(cdempresa   , _autpagto, _cdempresa   , result, t);
    result := result + ' order by fornecedor.'+getorder+',autpagto.cdautpagto'
  end;
  function makesqlPosicaoDespesas:string;
  begin
    result := 'where ';
    if nmdata = _dtsaida then
    begin
      Result := result + _entrada + '.'
    end
    else
    begin
      Result := result + _autpagto + '.';
    end;

    result := Result + nmdata+'<='+getdtbanco(edtdti.Date)+' and (dtbaixa>'+getdtbanco(edtdti.Date)+' or dtbaixa is null) and cdstautpagto in (1,2) ';

    if dshistorico <> '' then
    begin
      result := result + ' and autpagto.dshistorico like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      result := result + ' and autpagto.cdentrada is null ';
    end;

    sqlmontarlista(cdfornecedor, _autpagto, _cdfornecedor, result, 0, bofornecedorinversa);
    sqlmontarlista(cdcntcusto  , _autpagto, _cdcntcusto, result, 0);
    sqlmontarlista(cdplconta   , _autpagto, _cdplconta   , result);
    sqlmontarlista(cdempresa   , _autpagto, _cdempresa   , result);
    sqlmontarlista(cdtpcobranca, _autpagto, _cdtpcobranca, result);
  end;
  function makesqlPagtoSinteticoBaixa:string;
  var
    t: Integer;
  begin
    result := ' ';
    t := length(result);

    InsercaoDataSQl(edtdtie, edtdtfe, result, _autpagto+'.'+_dtemissao    , t);
    InsercaoDataSQl(edtdtib, edtdtfb, result, _autpagto+'.'+_dtbaixa      , t);
    InsercaoDataSQl(edtdtin, edtdtfn, result, _autpagto+'.'+_dtentrada    , t);
    InsercaoDataSQl(edtdtiv, edtdtfv, result, _autpagto+'.'+_dtprorrogacao, t);

    if dshistorico <> ''  then
    begin
      if T < length(result) then
      begin
        result := result + ' and '
      end
      else
      begin
        result := result + 'where ';
      end;
      result := result + _autpagto + '.dshistorico like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      if T < length(result) then
      begin
         result := result + ' and '
      end
      else
      begin
        result := result + 'where ';
      end;
      result := result + _autpagto + '.cdentrada is null ';
    end;

    sqlmontarlista(cdfornecedor, _autpagto, _cdfornecedor, result, t, bofornecedorinversa);
    sqlmontarlista(cdstautpagto, _autpagto, _cdstautpagto, result, T);
    sqlmontarlista(cdcntcusto  , _autpagto, _cdcntcusto  , result, T);
    sqlmontarlista(cdplconta   , _autpagto, _cdplconta   , result, T);
    sqlmontarlista(cdempresa   , _autpagto, _cdempresa, result, T);
    sqlmontarlista(cdtpcobranca, _autpagto, _cdtpcobranca   , result, T);
  end;
  function makesqlPagtoSinteticoProrrogadas:string;
  var
    T: integer;
  begin
    t := 0;
    result := makesqlPagtoSinteticoBaixa;
    if t = length(result) then
    begin
      result := result + 'where '
    end
    else
    begin
      result := result + 'and ';
    end;
    result := result + 'dtvencimento<>dtprorrogacao';
  end;
  function imprimirconsultaautpagtosintetico:boolean;
    function makesqlwhere: string;
    var
      T: integer;
      ord1, ord2 : TStrings;
    begin
      result := ' ';
      T := length(result);
      InsercaoDataSQl(edtdtie, edtdtfe, result, _a+'.'+_dtemissao    , t);
      InsercaoDataSQl(edtdtib, edtdtfb, result, _a+'.'+_dtbaixa      , t);
      InsercaoDataSQl(edtdtiv, edtdtfv, result, _a+'.'+_dtprorrogacao, t);
      InsercaoDataSQl(edtdtin, edtdtfn, result, _A+'.'+_dtentrada    , t);
      sqlmontarlista (cdfornecedor, _a, _cdfornecedor, result, t, bofornecedorinversa);
      sqlmontarlista (cdstautpagto, _a, _cdstautpagto, result, T);
      sqlmontarlista (cdtpentrada , _e, _cdtpentrada , result, T);
      sqlmontarlista (cdcntcusto  , _a, _cdcntcusto, result, T);
      sqlmontarlista (cdplconta   , _a, _cdplconta   , result, T);
      sqlmontarlista (cdempresa   , _a, _cdempresa   , result, T);
      sqlmontarlista (cdtpcobranca, _a, _cdtpcobranca, result, T);
      if dshistorico <> ''  then
      begin
        if T < length(result) then
        begin
          result := result + ' and '
        end
        else
        begin
          result := result + 'where ';
        end;
        result := result + 'a.dshistorico like '''+dshistorico+'%'' ';
      end;
      if ckbsentrada.checked then
      begin
        if T < length(result) then
        begin
          result := result + ' and '
        end
        else
        begin
          result := result + 'where ';
        end;
        result := result + 'a.cdentrada is null ';
      end;
      ord1 := TStringList.create;
      ord2 := TStringlist.create;
      try
        ord1.Text := order1;
        ord2.Text := order2;
        result := result + 'order by '+ord2[ord1.indexof(cbxorder.text)];
      finally
        freeandnil(ord1);
        freeandnil(ord2);
      end;
      if rdgorder.itemindex = 1 then
      begin
        result := result + ' desc';
      end;
    end;
  begin
    ImpimirRelatorioPadrao1(342, makesqlwhere);
    result := True;
  end;
  function makesqlmensal(nmdata:string):string;
  begin
    result := 'where autpagto.cdempresa='+empresa.cdempresa.tostring+' and ';
    if nmdata = _baixa then
    begin
      result := result + _baixa
    end
    else
    begin
      result := result + _autpagto;
    end;
    result := result +'.dt'+nmdata+' between '+getdtbanco(dti)+' and '+getdtbanco(dtf)+' ';
    if dshistorico <> ''  then
    begin
      result := result + _and+' autpagto.dshistorico like '''+dshistorico+'%'' ';
    end;
    if ckbsentrada.checked then
    begin
      result := result + _and+' autpagto.cdentrada is null ';
    end;
    sqlmontarlista(cdfornecedor, _autpagto, _cdfornecedor, result, 0, bofornecedorinversa);
    sqlmontarlista(cdstautpagto, _autpagto, _cdstautpagto, result);
    sqlmontarlista(cdtpcobranca, _autpagto, _cdtpcobranca, result);
    sqlmontarlista(cdcntcusto  , _autpagto, _cdcntcusto  , result);
    sqlmontarlista(cdplconta   , _autpagto, _cdplconta   , result);
  end;
begin
  criar_objetos;
  try
    preencher_lista;
    nopai       := trv.selected.parent.text;
    consulta    := trv.selected.text;
    dti         := edtdti.Date;
    dtf         := edtdtf.Date;
    tpdata      := cbxtpdata.Text;
    dshistorico := edtdshistorico.text;
    bofornecedorinversa := ckbfornecedorinversa.Checked;
    dtmmain.LogSiteAction(self.name, consulta);
    QForm.mudarcontroles(self, false);
    try
           if consulta = '353 - Di�rio Emiss�o'                then ImpimirRelatorioPadrao1(353, MakeSQLdiario(_emissao))
      else if consulta = '654 - Di�rio Vencimento'             then ImpimirRelatorioPadrao1(654, MakeSQLdiario(_prorrogacao))
      else if consulta = '655 - Di�rio Baixa'                  then ImpimirRelatorioPadrao1(655, MakeSQLdiario(_baixa))
      else if consulta = '523 - Di�rio Centro Custo'           then ImpimirRelatorioPadrao1(523, sqlwhere)
      else if consulta = '427 - Di�rio por Data de Emiss�o'    then ImpimirRelatorioPadrao1(427, sqlwhere)
      else if consulta = '428 - Di�rio por Data de Vencimento' then ImpimirRelatorioPadrao1(428, sqlwhere)
      else if consulta = '522 - Por Centro Custo'              then ImpimirRelatorioPadrao1(522, sqlwhere)
      else if consulta = '429 - Por Fornecedor'                then ImpimirRelatorioPadrao1(429, sqlwhere)
      else if consulta = '430 - Por Tipo Cobran�a'             then ImpimirRelatorioPadrao1(430, sqlwhere)
      else if consulta = '250 - Encontro de contas'            then
      begin
        With Bloco do
        begin
          clear;
          addRule('where', sqlmontarlista(cdstaprovacao, _A, 'cdstaprovacao'));
          if ckbsentrada.checked then
          begin
            appendRule('where',' and autpagto.cdentrada is null ');
          end;
          addRule('datainicial', GetDtBanco(dti));
          addRule('datafinal', GetDtBanco(dtf));
          ImpimirRelatorioPadrao1(250, Search('where').newText, Bloco, consulta, dti, dtf);
        end;
      end
      else if consulta = '651 - Mensal Emiss�o'                       then ImpimirRelatorioPadrao1(651, makesqlmensal(_emissao))
      else if consulta = '652 - Mensal Vencimento'                    then ImpimirRelatorioPadrao1(652, makesqlmensal(_vencimento))
      else if consulta = '653 - Mensal Baixa'                         then ImpimirRelatorioPadrao1(653, makesqlmensal(_baixa))
      else if consulta = '522 - Mensal Centro Custo'                  then ImpimirRelatorioPadrao1(522, sqlwhere)
      else if nopai = 'Refer�ncia Cruzada' then
      begin
             if consulta = 'Plano de Contas versus Centro de Custo' then reportReferenciaCruzada(consulta, 'Centro Custo', 'Plano Contas', _vlautpagto, _dtemissao, ' '+_autpagto, dti, dtf)
        else if consulta = 'Fornecedor versus M�s'                  then reportReferenciaCruzada(consulta, _Mes         , qstring.maiuscula(_Fornecedor), _vlautpagto, _dtemissao, ' '+_autpagto, dti, dtf);
      end
      else if consulta = '558 - Posi��o das Despesas'                       then ImpimirRelatorioPadrao1(558, makesqlPosicaoDespesas, GetDtBanco(dti))
      else if consulta = '560 - Posi��o das Despesas (total)'               then ImpimirRelatorioPadrao1(560, makesqlPosicaoDespesas, GetDtBanco(dti))
      else if consulta = 'Posi��o das Despesas - Nota Fiscal'               then //imprimirconsultafornecedorposicaodespesasnf   (cdfornecedor, bofornecedorinversa,               cdcntcusto, cdplconta, cdtpcobranca, tpdata, dti, dshistorico, ckbsentrada.checked)
      else if consulta = '559 - Posi��o das Despesas - Nota Fiscal (total)' then ImpimirRelatorioPadrao1(559, makesqlPosicaoDespesas, dti, GetDtBanco(dti))
      else if consulta = '342 - Sint�tico'                                  then imprimirconsultaautpagtosintetico
      else if consulta = '561 - Sint�tico (Contas Prorrogadas)'             then ImpimirRelatorioPadrao1(561, makesqlPagtoSinteticoProrrogadas)
      else if consulta = '343 - Sint�tico Baixa (hist�rico)'                then ImpimirRelatorioPadrao1(343, makesqlPagtoSinteticoBaixa)
      else if consulta = '350 - Sint�tico Vencimento'                       then ImpimirRelatorioPadrao1(350, sqlwhere)
      else if consulta = '351 - Sint�tico Tipo Cobran�a'                    then ImpimirRelatorioPadrao1(351, sqlwhere)
      else if consulta = '349 - Sint�tico Centro Custo'                     then ImpimirRelatorioPadrao1(349, sqlwheresinteticocntcusto)//, sqlwhere2sinteticocntcusto)
      else if consulta = '507 - Sint�tico por Fornecedor 2'                 then
      begin
        ImpimirRelatorioPadrao1(507, sqlwherefornecedor2)
      end
      else if consulta = '352 - Sint�tico Hist�rico'                        then ImpimirRelatorioPadrao1(352, sqlwhere);
    finally
      QForm.mudarcontroles(self, true);
    end;
  finally
    destruir_objetos;
  end;
end;

procedure TfrmConsultaAutpagto.set_data_i(bostatus:Boolean);
begin
  edtdti.Visible     := bostatus;
  edtdtf.Visible     := bostatus;
  lblinicial.Visible := bostatus;
  lblfinal.Visible   := bostatus;
end;

procedure TfrmConsultaAutpagto.set_data_e(bostatus:Boolean);
begin
  edtdtiE.Visible       := bostatus;
  edtdtfE.Visible       := bostatus;
  lblemissao.visible    := bostatus;
  lblateemissao.Visible := bostatus;
end;

procedure TfrmConsultaAutpagto.set_data_v(bostatus:boolean);
begin
  lblvencimento.Visible    := bostatus;
  lblatevencimento.Visible := bostatus;
  edtdtiv.Visible          := bostatus;
  edtdtfv.Visible          := bostatus;
end;

procedure TfrmConsultaAutpagto.set_data_b(bostatus:Boolean);
begin
  lblbaixa.Visible       := bostatus;
  lblatebaixa.Visible    := bostatus;
  edtdtib.Visible        := bostatus;
  edtdtfb.Visible        := bostatus;
end;

procedure TfrmConsultaAutpagto.set_data_n(bostatus:Boolean);
begin
  lblentrada.Visible     := bostatus;
  lblateentrada.Visible  := bostatus;
  edtdtin.Visible        := bostatus;
  edtdtfn.Visible        := bostatus;
end;

procedure TfrmConsultaAutpagto.trvChange(Sender: TObject; Node: TTreeNode);
var
  consulta : string;
begin
  actGerar.Enabled          := False;
  ntb.ActivePage            := 'Default';
  consulta                  := node.text;
  if (consulta = '427 - Di�rio por Data de Emiss�o') or
     (consulta = '353 - Di�rio') or
     (consulta = '428 - Di�rio por Data de Vencimento') or
     (consulta = '429 - Por Fornecedor') or
     (consulta = '522 - Por Centro Custo') or
     (consulta = '430 - Por Tipo Cobran�a') then
  begin
    actGerar.Enabled          := true;
    pgc.Visible               := true;
    tbsFornecedor.TabVisible  := true;
    tbsstautpagto.TabVisible  := true;
    tbscntcusto.TabVisible    := True;
    tbsplconta.TabVisible     := True;
    tbsSTAPROVACAO.tabvisible := false;
    tbstpentrada.TabVisible   := false;
    set_data_i(false);
    set_data_e(true);
    set_data_v(true);
    set_data_b(true);
    set_data_n(true);

    ckbsentrada.Visible    := true;
    rdgorder.Visible       := false;
    cbxorder.Visible       := false;
    lblorder.Visible       := false;
    lbldshistorico.visible := true;
    edtdshistorico.Visible := true;
  end
  else if consulta = 'Fornecedor versus M�s' then
  begin
    actGerar.Enabled          := true;
    pgc.Visible               := false;
    tbsFornecedor.TabVisible  := true;
    tbsSTAPROVACAO.tabvisible := false;
    tbsstautpagto.TabVisible  := true;
    tbstpentrada.TabVisible   := false;
    set_data_i(True);
    set_data_e(False);
    set_data_v(False);
    set_data_b(False);
    set_data_n(False);

    ckbsentrada.Visible    := false;
    rdgorder.Visible       := false;
    cbxorder.Visible       := false;
    lblorder.Visible       := false;
    lbldshistorico.visible := false;
    edtdshistorico.Visible := false;
  end;
  if consulta = '342 - Sint�tico' then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;

    set_data_i(false);
    set_data_e(true);
    set_data_v(true);
    set_data_b(true);
    set_data_n(true);

    tbsstautpagto.TabVisible := true;
    tbsfornecedor.TabVisible := true;
    tbscntcusto.TabVisible := true;
    tbsplconta.TabVisible := true;
    tbsempresa.TabVisible := true;
    tbstpcobranca.TabVisible := true;
    lbldshistorico.visible := true;
    edtdshistorico.Visible := true;
    ckbsentrada.Visible := true;
    lblorder.Visible := true;
    cbxorder.Visible := true;
    rdgorder.Visible := true;

    cbxtpdata.Visible  := false;
  end;
  if consulta = '507 - Sint�tico por Fornecedor 2' then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;
    lblorder.Visible := true;
    cbxorder.Visible := true;
    rdgorder.Visible := true;

    set_data_e(true);
    set_data_b(true);
    set_data_v(true);

    tbsfornecedor.TabVisible := true;
    tbsstautpagto.TabVisible := true;
    tbstpcobranca.TabVisible := true;
    tbsplconta.TabVisible    := true;
    tbsempresa.TabVisible    := true;
  end
  else
  begin
    lblorder.Visible := false;
    cbxorder.Visible := false;
    rdgorder.Visible := false;
  end;
  if (consulta = '561 - Sint�tico (Contas Prorrogadas)') or
     (consulta = '350 - Sint�tico Vencimento') or
     (consulta = '522 - Mensal Centro Custo') or
     (consulta = '523 - Di�rio Centro Custo') or
     (consulta = '351 - Sint�tico Tipo Cobran�a') or
     (consulta = '349 - Sint�tico Centro Custo') or
     (consulta = '352 - Sint�tico Hist�rico') or
     (consulta = '343 - Sint�tico Baixa (hist�rico)') then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;

    set_data_i(false);
    set_data_e(true);
    set_data_v(true);
    set_data_b(true);
    set_data_n(true);

    cbxtpdata.Visible  := false;
  end
  else if (consulta = '353 - Di�rio Emiss�o') or
          (consulta = '654 - Di�rio Vencimento') or
          (consulta = '655 - Di�rio Baixa') or
          (consulta = '651 - Mensal Emiss�o') or
          (consulta = '652 - Mensal Vencimento') or
          (consulta = '653 - Mensal Baixa') then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;
    set_data_i(true);
    set_data_e(False);
    set_data_v(false);
    set_data_b(false);
    set_data_n(false);
    cbxtpdata.Visible  := false;
  end
  else if (consulta = '558 - Posi��o das Despesas'                      ) or
          (consulta = '560 - Posi��o das Despesas (total)'              ) or
          (consulta = 'Posi��o das Despesas - Nota Fiscal'        ) or
          (consulta = '559 - Posi��o das Despesas - Nota Fiscal (total)') then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;
    set_data_i(false);
    set_data_e(False);
    set_data_v(false);
    set_data_b(false);
    set_data_n(false);

    lblinicial.Visible := true;
    edtdti.Visible     := true;
    cbxtpdata.Visible  := true;

    tbsstautpagto.TabVisible := false;
  end
  else if consulta = '250 - Encontro de contas' then
  begin
    actGerar.Enabled := true;
    pgc.Visible      := true;
    set_data_i(true);
    set_data_e(False);
    set_data_v(false);
    set_data_b(false);
    set_data_n(false);

    edtdshistorico.Visible    := false;
    lbldshistorico.Visible    := false;
    tbsFornecedor.TabVisible  := false;
    tbsstautpagto.TabVisible  := false;
    tbsSTAPROVACAO.TabVisible := true;

    cbxtpdata.Visible  := false;
  end
end;

procedure TfrmConsultaAutpagto.edtnmstautpagtoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_stAutpagto);
end;

procedure TfrmConsultaAutpagto.edtnmstautpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvstautpagto, executar_on_change_stAutpagto, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmfornecedorChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_Fornecedor);
end;

procedure TfrmConsultaAutpagto.edtnmfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvFornecedor, executar_on_change_Fornecedor, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnucnpjcpfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 119 then
  begin
    if (tpcodigo = 'C�digo') or (tpcodigo = 'CNPJ') then
    begin
      if tpcodigo = 'C�digo' then
      begin
        tpcodigo := 'CNPJ'
      end
      else if tpcodigo = 'CNPJ'   then
      begin
        tpcodigo := 'CPF';
      end;
      edtnucnpjcpf.Clear;
      edtnucnpjcpf.Enabled   := true;
      edtnucnpjcpf.Visible   := true;
      edtnucnpjcpf.EditMask  := MascaraDocumento(tpcodigo);
      edtnucnpjcpf.SetFocus;
      edtcdFornecedor.Enabled := false;
      edtcdFornecedor.visible := false;
    end
    else if tpcodigo = 'CPF' then
    begin
      tpcodigo               := 'C�digo';
      edtcdFornecedor.Enabled := true;
      edtcdFornecedor.visible := true;
      edtcdFornecedor.SetFocus;
      edtnucnpjcpf.Enabled   := false;
      edtnucnpjcpf.Visible   := false;
    end;
    lblcdFornecedor.Caption := tpcodigo;
  end;
end;

procedure TfrmConsultaAutpagto.edtnucnpjcpfKeyPress(Sender: TObject; var Key: Char);
var
  ListItem: TListItem;
  cdFornecedor : string;
  i : integer;
begin
  if key = #13 then
  begin
    if tpcodigo = 'C�digo' then
    begin
      if not codigoexiste(_Fornecedor, edtcdFornecedor.text) then
      begin
        exit;
      end;
      cdFornecedor := edtcdFornecedor.text;
      edtcdFornecedor.Clear;
    end
    else
    begin
      cdFornecedor := CodigodoCampo(_Fornecedor, edtnucnpjcpf.Text, _nu+tpcodigo);
    end;
    if cdFornecedor <> '' then
    begin
      tpcodigo := 'C�digo';
      lblcdFornecedor.Caption := tpcodigo;
      edtcdFornecedor.Enabled := true;
      edtcdFornecedor.Visible := true;
      edtcdFornecedor.SetFocus;
      //
      edtnucnpjcpf.Enabled := false;
      edtnucnpjcpf.Visible := false;
      //
      for i := 0 to lsvFornecedor.Items.Count - 1 do
      begin
        if lsvFornecedor.Items.Item[i].Caption = cdFornecedor then
        begin
          exit;
        end;
      end;
      ListItem := lsvFornecedor.Items.Add;
      ListItem.Caption := cdFornecedor;
      ListItem.SubItems.Add(NomedoCodigo(_Fornecedor, cdFornecedor));
    end;
  end;
end;

procedure TfrmConsultaAutpagto.edtcdstautpagtoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvstautpagto, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.ToolButton4Click(Sender: TObject);
begin
  AdicionarListView(lsvstaprovacao);
end;

procedure TfrmConsultaAutpagto.ToolButton5Click(Sender: TObject);
begin
  ExcluirListview(lsvstaprovacao);
end;

procedure TfrmConsultaAutpagto.ToolButton7Click(Sender: TObject);
begin
  lsvstaprovacao.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdstencontrocontasKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvstaprovacao, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmstencontrocontasChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_staprovacao);
end;

procedure TfrmConsultaAutpagto.edtnmstencontrocontasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvstaprovacao, executar_on_change_staprovacao, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmConsultaAutpagto.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(lowercase(copy(self.Name, 4, length(self.Name) - 3)), frmmain.tlbnew);
end;

procedure TfrmConsultaAutpagto.ToolButton15Click(Sender: TObject);
begin
  AdicionarListView(lsvcntcusto);
end;

procedure TfrmConsultaAutpagto.ToolButton16Click(Sender: TObject);
begin
  ExcluirListView(lsvcntcusto);
end;

procedure TfrmConsultaAutpagto.ToolButton18Click(Sender: TObject);
begin
  lsvcntcusto.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdcntcustoKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvcntcusto, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmcntcustoChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_cntcusto);
end;

procedure TfrmConsultaAutpagto.edtnmcntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvcntcusto, executar_on_change_cntcusto, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.ToolButton19Click(Sender: TObject);
begin
  AdicionarListView(lsvplconta);
end;

procedure TfrmConsultaAutpagto.ToolButton20Click(Sender: TObject);
begin
  ExcluirListView(lsvplconta);
end;

procedure TfrmConsultaAutpagto.ToolButton22Click(Sender: TObject);
begin
  lsvplconta.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdplcontaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvplconta, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmplcontaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_plconta);
end;

procedure TfrmConsultaAutpagto.edtnmplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvplconta, executar_on_change_plconta, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.ToolButton23Click(Sender: TObject);
begin
  AdicionarListView(lsvtpentrada);
end;

procedure TfrmConsultaAutpagto.ToolButton24Click(Sender: TObject);
begin
  ExcluirListView(lsvtpentrada);
end;

procedure TfrmConsultaAutpagto.ToolButton29Click(Sender: TObject);
begin
  lsvtpentrada.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdtpentradaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvtpentrada, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmtpentradaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_tpentrada);
end;

procedure TfrmConsultaAutpagto.edtnmtpentradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvtpentrada, executar_on_change_tpentrada, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvfornecedor, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.FormCreate(Sender: TObject);
begin
  bloco := TInstrucaoSQL.create(self);
  set_treeview;
end;

procedure TfrmConsultaAutpagto.ToolButton3Click(Sender: TObject);
begin
  AdicionarListView(lsvtpcobranca);
end;

procedure TfrmConsultaAutpagto.ToolButton6Click(Sender: TObject);
begin
  ExcluirListView(lsvtpcobranca);
end;

procedure TfrmConsultaAutpagto.ToolButton11Click(Sender: TObject);
begin
  lsvtpcobranca.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdtpcobrancaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvtpcobranca, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmtpcobrancaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_tpcobrana);
end;

procedure TfrmConsultaAutpagto.edtnmtpcobrancaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvtpcobranca, executar_on_change_tpcobrana, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.ToolButton13Click(Sender: TObject);
begin
  AdicionarListView(lsvempresa);
end;

procedure TfrmConsultaAutpagto.ToolButton14Click(Sender: TObject);
begin
  ExcluirListView(lsvempresa);
end;

procedure TfrmConsultaAutpagto.ToolButton17Click(Sender: TObject);
begin
  lsvempresa.Clear;
end;

procedure TfrmConsultaAutpagto.edtcdempresaKeyPress(Sender: TObject; var Key: Char);
begin
  AdicionarCodigoListView(lsvempresa, TEdit(sender), key);
end;

procedure TfrmConsultaAutpagto.edtnmempresaChange(Sender: TObject);
begin
  preencherNomeListview(TEdit(sender), executar_on_change_empresa);
end;

procedure TfrmConsultaAutpagto.edtnmempresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AdicionarNomeListView(lsvempresa, executar_on_change_empresa, tedit(sender), key);
end;

procedure TfrmConsultaAutpagto.set_treeview;
var
  no1, no2 : TTreeNode;
begin
  no1 := trv.Items.AddChild(nil, qstring.maiuscula(__relatorio));
  trv.Items.AddChild(no1, '655 - Di�rio Baixa');
  trv.Items.AddChild(no1, '353 - Di�rio Emiss�o');
  trv.Items.AddChild(no1, '654 - Di�rio Vencimento');
  trv.Items.AddChild(no1, '523 - Di�rio Centro Custo');
  trv.Items.AddChild(no1, '250 - Encontro de contas');
  trv.Items.AddChild(no1, '653 - Mensal Baixa');
  trv.Items.AddChild(no1, '651 - Mensal Emiss�o');
  trv.Items.AddChild(no1, '652 - Mensal Vencimento');
  trv.Items.AddChild(no1, '522 - Mensal Centro Custo');
  trv.Items.AddChild(no1, '558 - Posi��o das Despesas');
  trv.Items.AddChild(no1, '560 - Posi��o das Despesas (total)');
  trv.Items.AddChild(no1, 'Posi��o das Despesas - Nota Fiscal');
  trv.Items.AddChild(no1, '559 - Posi��o das Despesas - Nota Fiscal (total)');
  trv.Items.AddChild(no1, '342 - Sint�tico');
  trv.Items.AddChild(no1, '561 - Sint�tico (Contas Prorrogadas)');
  trv.Items.AddChild(no1, '343 - Sint�tico Baixa (hist�rico)');
  trv.Items.AddChild(no1, '349 - Sint�tico Centro Custo');
  trv.Items.AddChild(no1, '507 - Sint�tico por Fornecedor 2');
  trv.Items.AddChild(no1, '350 - Sint�tico Vencimento');
  trv.Items.AddChild(no1, '352 - Sint�tico Hist�rico');
  trv.Items.AddChild(no1, '351 - Sint�tico Tipo Cobran�a');
  no2 := trv.Items.AddChild(no1, 'Refer�ncia Cruzada');
  trv.Items.AddChild(no2, 'Fornecedor versus M�s');
  no1 := trv.Items.AddChild(nil, qstring.maiuscula(__grafico));
  trv.Items.AddChild(no1, '427 - Di�rio por Data de Emiss�o');
  trv.Items.AddChild(no1, '428 - Di�rio por Data de Vencimento');
  trv.Items.AddChild(no1, '522 - Por Centro Custo');
  trv.Items.AddChild(no1, '429 - Por Fornecedor');
  trv.Items.AddChild(no1, '430 - Por Tipo Cobran�a');
end;

end.
