unit uimportacao;

interface

uses
  System.Actions, System.UITypes,
  forms, Windows, StdCtrls, Controls, ComCtrls, ToolWin, ExtCtrls, dialogs, Classes,
  Menus, sysutils, Mask, ActnList,
  Grids, DB, FMTBcd, Provider, DBClient, sqlexpr,
  rotina.montarsql, rotina.strings, dialogo.ExportarExcel, rotina.registro, rotina.datahora,
  uconstantes,
  orm.empresa, orm.usuario, rotina.consiste,
  classe.registrainformacao, classe.gerar, rotina.retornasql,
  classe.Registro, classe.form, classe.aplicacao, classe.query,
  orm.Importacao,
  dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxDBEdit, cxButtonEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar,
  cxLabel, cxDBLabel, cxButtons, cxGroupBox, cxCurrencyEdit, cxBarEditItem,
  cxNavigator;

type
  TfrmImportacao = class(TForm)
    pnl: TPanel;
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
    pnl1: TPanel;
    Label1: TLabel;
    lvl: TcxGridLevel;
    grd: TcxGrid;
    cds: TClientDataSet;
    dts: TDataSource;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    sdsdetail: TSQLDataSet;
    cdsdetail: TClientDataSet;
    dtsdetail: TDataSource;
    edtcodigo: TcxTextEdit;
    dts1: TDataSource;
    cdssdsdetail: TDataSetField;
    actgerarremessa: TAction;
    actfiltrar: TAction;
    actadicionarnota: TAction;
    actadicionarfaturamento: TAction;
    actabrirduplicata: TAction;
    actabrircliente: TAction;
    actimprimirboleto: TAction;
    actdebitoautomatico: TAction;
    tbv: TcxGridDBTableView;
    sdsCDEMPRESA: TLargeintField;
    sdsCDIMPORTACAO: TIntegerField;
    sdsCDTPIMPORTACAO: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsNMIMPORTACAO: TStringField;
    sdsNMTABELA: TStringField;
    sdsdetailCDEMPRESA: TLargeintField;
    sdsdetailCDITIMPORTACAO: TIntegerField;
    sdsdetailCDIMPORTACAO: TIntegerField;
    sdsdetailCDUSUARIOI: TIntegerField;
    sdsdetailCDUSUARIOA: TIntegerField;
    sdsdetailCDCOMPUTADORI: TIntegerField;
    sdsdetailCDCOMPUTADORA: TIntegerField;
    sdsdetailTSINCLUSAO: TSQLTimeStampField;
    sdsdetailTSALTERACAO: TSQLTimeStampField;
    sdsdetailNMCAMPO: TStringField;
    sdsdetailNMCELULA: TStringField;
    sdsdetailVLPADRAO: TStringField;
    sdsdetailNMTABELA2: TStringField;
    sdsdetailNMCAMPO2: TStringField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDIMPORTACAO: TIntegerField;
    cdsCDTPIMPORTACAO: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdsNMIMPORTACAO: TStringField;
    cdsNMTABELA: TStringField;
    cdsdetailCDEMPRESA: TLargeintField;
    cdsdetailCDITIMPORTACAO: TIntegerField;
    cdsdetailCDIMPORTACAO: TIntegerField;
    cdsdetailCDUSUARIOI: TIntegerField;
    cdsdetailCDUSUARIOA: TIntegerField;
    cdsdetailCDCOMPUTADORI: TIntegerField;
    cdsdetailCDCOMPUTADORA: TIntegerField;
    cdsdetailTSINCLUSAO: TSQLTimeStampField;
    cdsdetailTSALTERACAO: TSQLTimeStampField;
    cdsdetailNMCAMPO: TStringField;
    cdsdetailNMCELULA: TStringField;
    cdsdetailVLPADRAO: TStringField;
    cdsdetailNMTABELA2: TStringField;
    cdsdetailNMCAMPO2: TStringField;
    tbvNMCAMPO: TcxGridDBColumn;
    tbvNMCELULA: TcxGridDBColumn;
    tbvVLPADRAO: TcxGridDBColumn;
    tbvNMTABELA2: TcxGridDBColumn;
    tbvNMCAMPO2: TcxGridDBColumn;
    edtnome: TcxDBTextEdit;
    Label3: TLabel;
    Label2: TLabel;
    edtNMTABELA: TcxDBTextEdit;
    cbxcdtpimportacao: TcxDBLookupComboBox;
    lblcdtpimportacao: TLabel;
    btnbuscarcampos: TButton;
    actbuscarcampos: TAction;
    actimportar: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure actAbrirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actfecharExecute(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtnomePropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsdetailBeforePost(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure cdsdetailNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure actbuscarcamposExecute(Sender: TObject);
    procedure actimportarExecute(Sender: TObject);
  private { Private declarations }
    importacao  : Timportacao;
  public  { Public declarations }
    registro : tregistro;
    function  Abrir(codigo:integer):boolean;
  end;

var
  frmImportacao: TfrmImportacao;

implementation

uses uDtmMain,
  uMain;

{$R *.DFM}

const
  tbl      = _Importacao;
  exibe    = 'Importação';
  artigoI  = 'a';

function TfrmImportacao.Abrir(codigo:integer):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure TfrmImportacao.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

procedure TfrmImportacao.actNovoExecute(Sender: TObject);
begin
  registro.novo(sender);
end;

procedure TfrmImportacao.actSalvarExecute(Sender: TObject);
begin
  registro.Salvar;
end;

procedure TfrmImportacao.actExcluirExecute(Sender: TObject);
begin
  registro.excluir;
end;

procedure TfrmImportacao.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmImportacao.actCancelarExecute(Sender: TObject);
begin
  registro.cancelar;
end;

procedure TfrmImportacao.actEditarExecute(Sender: TObject);
begin
  registro.editar;
end;

procedure TfrmImportacao.FormShow(Sender: TObject);
begin
  importacao := Timportacao.create;
  registro.set_readonly_dados(self, true);
  cdsdetail.Open;
  edtCodigo.SetFocus;
  pnl.caption := exibe;
end;

procedure TfrmImportacao.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure TfrmImportacao.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure TfrmImportacao.actbuscarcamposExecute(Sender: TObject);
begin
  importacao.Select(cds);
  if importacao.BuscarCampos then
  begin
    importacao.itimportacao.Atribuir(cdsdetail);
  end;
end;

procedure TfrmImportacao.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure TfrmImportacao.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure TfrmImportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmImportacao.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmImportacao.actimportarExecute(Sender: TObject);
begin
  if importacao.importar then
  begin
    MessageDlg('Importação concluída!', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmImportacao.edtcodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure TfrmImportacao.edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure TfrmImportacao.edtcodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure TfrmImportacao.edtnomePropertiesChange(Sender: TObject);
begin
  pnl.Caption := exibe+' '+ cds.FieldByName(_cdimportacao).asstring + ' - ' + cds.FieldByName(_nmimportacao).asstring;
end;

procedure TfrmImportacao.FormDestroy(Sender: TObject);
begin
  freeandnil(importacao);
  freeandnil(registro);
end;

procedure TfrmImportacao.cdsBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cds);
end;

procedure TfrmImportacao.cdsdetailBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cdsdetail);
end;

procedure TfrmImportacao.cdsNewRecord(DataSet: TDataSet);
begin
  registro.NewRecord;
end;

procedure TfrmImportacao.cdsAfterScroll(DataSet: TDataSet);
begin
  importacao.Select(cds);
  importacao.itimportacao.Ler(cdsdetail);
end;

procedure TfrmImportacao.cdsdetailNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName(_cditimportacao).AsInteger := QGerar.GerarCodigo(_itimportacao);
end;

procedure TfrmImportacao.FormCreate(Sender: TObject);
begin
  importacao := timportacao.create;
  registro := tregistro.create(self, tbl, exibe, artigoI, cds, dts, edtcodigo);
  cbxcdtpimportacao.Properties.ListSource := abrir_tabela(_tpimportacao);
end;

procedure TfrmImportacao.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmImportacao.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmImportacao.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure TfrmImportacao.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

end.
