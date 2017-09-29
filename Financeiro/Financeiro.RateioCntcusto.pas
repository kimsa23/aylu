unit Financeiro.RateioCntcusto;

interface

uses
  System.Actions, System.UITypes,System.Variants,
  forms, Windows, dialogs, graphics, Mask, Buttons, Controls, ToolWin, ExtCtrls, types,
  sysutils, StdCtrls, ComCtrls, Spin, Classes, ActnList, Menus,
  FMTBcd, DBClient, Provider, DBCtrls, DB, Grids, sqlexpr,
  dialogo.exportarexcel, rotina.datahora, rotina.registro, uconstantes, Impressao.MenuRelatorio,
  classe.gerar, classe.registro, classe.form, orm.movbancario, orm.cntcusto,
  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxGroupBox, cxButtons,
  dxBar, cxClasses, cxGraphics, cxLookAndFeels, cxLabel, cxPC, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTimeEdit, cxButtonEdit, cxCalc, cxCurrencyEdit, cxPCdxBarPopupMenu,
  cxCheckBox, cxNavigator, dxBarBuiltInMenu, cxDBLabel, cxMemo,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TfrmRateiocntcusto = class(TForm)
    act: TActionList;
    actNovo: TAction;
    actAbrir: TAction;
    actSalvar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actEditar: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actfechar: TAction;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrManager1Bar1: TdxBar;
    dxbrsbtmRegistro: TdxBarSubItem;
    dxbrlrgbtnNovo: TdxBarLargeButton;
    dxbrlrgbtnEditar: TdxBarLargeButton;
    dxbrlrgbtnAbrir: TdxBarLargeButton;
    dxbrlrgbtnsalvar: TdxBarLargeButton;
    dxbrlrgbtncancelar: TdxBarLargeButton;
    dxbrlrgbtnexcluir: TdxBarLargeButton;
    dxbrsprtr1: TdxBarSeparator;
    dxbrlrgbtnprimeiro: TdxBarLargeButton;
    dxbrlrgbtnanterior: TdxBarLargeButton;
    dxbrlrgbtnproximo: TdxBarLargeButton;
    dxbrlrgbtnultimo: TdxBarLargeButton;
    dxbrsprtr2: TdxBarSeparator;
    dxbrsprtr3: TdxBarSeparator;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    sds: TSQLDataSet;
    sdsdetail: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    dts: TDataSource;
    dts1: TDataSource;
    cdsdetail: TClientDataSet;
    dtsdetail: TDataSource;
    btnimprimir: TdxBarLargeButton;
    pumimprimir: TdxBarPopupMenu;
    btnopcoes: TdxBarLargeButton;
    actopcoes: TAction;
    pumopcoes: TdxBarPopupMenu;
    pnl: TcxLabel;
    pnltop: TPanel;
    Label1: TLabel;
    edtcodigo: TcxTextEdit;
    lblcdtpapontamentomanual: TLabel;
    cbxCDSTRATEIOcntcusto: TcxDBLookupComboBox;
    grd: TcxGrid;
    lvl: TcxGridLevel;
    actabrirtpapontamentomanual: TAction;
    actabrirfuncionario: TAction;
    actabrirtpequipamento: TAction;
    actaplicarcodigoordproducao: TAction;
    dxBarButton1: TdxBarButton;
    actabrirordproducao: TAction;
    actremovercodigoordproducao: TAction;
    dxBarButton2: TdxBarButton;
    actinsertgride: TAction;
    Label3: TLabel;
    edtnome: TcxDBTextEdit;
    tbv: TcxGridDBTableView;
    tbvNUcntcusto: TcxGridDBColumn;
    tbvPRRATEIO: TcxGridDBColumn;
    tbvNMcntcusto: TcxGridDBColumn;
    sdsCDEMPRESA: TLargeintField;
    sdsCDRATEIOcntcusto: TIntegerField;
    sdsCDSTRATEIOcntcusto: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsNMRATEIOcntcusto: TStringField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsdetailCDEMPRESA: TLargeintField;
    sdsdetailCDITRATEIOcntcusto: TIntegerField;
    sdsdetailCDRATEIOcntcusto: TIntegerField;
    sdsdetailCDcntcusto: TIntegerField;
    sdsdetailCDUSUARIOI: TIntegerField;
    sdsdetailCDUSUARIOA: TIntegerField;
    sdsdetailCDCOMPUTADORI: TIntegerField;
    sdsdetailCDCOMPUTADORA: TIntegerField;
    sdsdetailNUcntcusto: TStringField;
    sdsdetailPRRATEIO: TFloatField;
    sdsdetailTSINCLUSAO: TSQLTimeStampField;
    sdsdetailTSALTERACAO: TSQLTimeStampField;
    sdsdetailNMcntcusto: TStringField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDRATEIOcntcusto: TIntegerField;
    cdsCDSTRATEIOcntcusto: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsNMRATEIOcntcusto: TStringField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdssdsdetail: TDataSetField;
    cdsdetailCDEMPRESA: TLargeintField;
    cdsdetailCDITRATEIOcntcusto: TIntegerField;
    cdsdetailCDRATEIOcntcusto: TIntegerField;
    cdsdetailCDcntcusto: TIntegerField;
    cdsdetailCDUSUARIOI: TIntegerField;
    cdsdetailCDUSUARIOA: TIntegerField;
    cdsdetailCDCOMPUTADORI: TIntegerField;
    cdsdetailCDCOMPUTADORA: TIntegerField;
    cdsdetailNUcntcusto: TStringField;
    cdsdetailPRRATEIO: TFloatField;
    cdsdetailTSINCLUSAO: TSQLTimeStampField;
    cdsdetailTSALTERACAO: TSQLTimeStampField;
    cdsdetailNMcntcusto: TStringField;
    procedure actAbrirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure actfecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actopcoesExecute(Sender: TObject);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actinsertgrideExecute(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure tbvNUcntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsdetailNUcntcustoValidate(Sender: TField);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsdetailNewRecord(DataSet: TDataSet);
    procedure cdsdetailBeforePost(DataSet: TDataSet);
    procedure tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private      { Private declarations }
    tbl : string;
    exibe : string;
  public  { Public declarations }
    registro : TRegistro;
    function  Abrir(codigo:Integer):boolean;
  end;

var
  frmRateiocntcusto: TfrmRateiocntcusto;

implementation

uses uDtmMain,
  uMain;

{$R *.DFM}

function TfrmRateiocntcusto.Abrir(codigo:integer):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure TfrmRateiocntcusto.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

procedure TfrmRateiocntcusto.actNovoExecute(Sender: TObject);
begin
  registro.novo(sender);
end;

procedure TfrmRateiocntcusto.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure TfrmRateiocntcusto.edtCodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure TfrmRateiocntcusto.FormShow(Sender: TObject);
begin
  registro.set_readonly_dados(self, true);
  pnl.caption := exibe;
  edtCodigo.SetFocus;
end;

procedure TfrmRateiocntcusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmRateiocntcusto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(registro);
end;

procedure TfrmRateiocntcusto.cdsdetailBeforePost(DataSet: TDataSet);
begin
  registro.set_update(DataSet);
end;

procedure TfrmRateiocntcusto.cdsdetailNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName(_cditrateiocntcusto).AsInteger := qgerar.GerarCodigo(_itrateiocntcusto);
end;

procedure TfrmRateiocntcusto.cdsdetailNUcntcustoValidate(Sender: TField);
begin
  tcntcusto.validarnucntcusto(sender.dataset, '');
end;

procedure TfrmRateiocntcusto.cdsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName(_cdstrateiocntcusto).AsInteger := qregistro.Codigo_status_novo( tbl);
  registro.NewRecord;
end;

procedure TfrmRateiocntcusto.actEditarExecute(Sender: TObject);
begin
  registro.editar;
end;

procedure TfrmRateiocntcusto.actSalvarExecute(Sender: TObject);
begin
  registro.Salvar;
end;

procedure TfrmRateiocntcusto.actExcluirExecute(Sender: TObject);
begin
  if registro.Confirmar_Exclusao then
  begin
    registro.Excluir_registro;
  end;
end;

procedure TfrmRateiocntcusto.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmRateiocntcusto.actCancelarExecute(Sender: TObject);
begin
  registro.cancelar;
end;

procedure TfrmRateiocntcusto.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure TfrmRateiocntcusto.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure TfrmRateiocntcusto.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure TfrmRateiocntcusto.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure TfrmRateiocntcusto.edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key, tbl);
end;

procedure TfrmRateiocntcusto.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure TfrmRateiocntcusto.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmRateiocntcusto.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmRateiocntcusto.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure TfrmRateiocntcusto.tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  registro.ExibirInformacaoRegistro(cdsdetail, key);
  if (key = __KeySearch) and (LowerCase(tbv.Controller.FocusedColumn.DataBinding.FilterFieldName) = _nucntcusto) then
  begin
    tbvNUcntcustoPropertiesButtonClick(sender, 0);
  end;
end;

procedure TfrmRateiocntcusto.tbvNUcntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEdit(cdsdetail, _cntcusto, _nucntcusto, false);
end;

procedure TfrmRateiocntcusto.cdsBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cds);
end;

procedure TfrmRateiocntcusto.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmRateiocntcusto.FormCreate(Sender: TObject);
begin
  tbl := _rateiocntcusto;
  exibe := 'Rateio Plano Contas';
  cbxCDSTRATEIOcntcusto.Properties.ListSource := abrir_tabela(_strateiocntcusto);
  GeraMenuRelatorio ('', btnimprimir, 66, cds, _rateiocntcusto);
  registro := tregistro.create(self, tbl, exibe, 'o', cds, dts, edtcodigo);
end;

procedure TfrmRateiocntcusto.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure TfrmRateiocntcusto.actinsertgrideExecute(Sender: TObject);
begin
  if actsalvar.Enabled then
  begin
    cdsdetail.Insert;
    grd.SetFocus;
  end;
end;

procedure TfrmRateiocntcusto.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmRateiocntcusto.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure TfrmRateiocntcusto.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

end.
