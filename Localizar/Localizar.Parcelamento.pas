unit Localizar.Parcelamento;

interface

uses
  forms, Classes, sysutils, dialogs, Controls, StdCtrls, Mask, Buttons, ComCtrls,
  ExtCtrls, system.UITypes,
  uconstantes, rotina.registro,
  orm.empresa, rotina.sqlmontar,
  classe.form, classe.query,
  cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGraphics, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  cxButtonEdit, cxCheckBox, cxCalc, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, cxLookAndFeelPainters, Menus,
  cxButtons, cxGroupBox, cxCurrencyEdit, cxLookAndFeels, ActnList, dxBar,
  dxCore, cxDateUtils, cxNavigator, System.Actions, Classe.Localizar;

type
  TfrmLocalizarparcelamento = class(TForm)
    lblautpagto: TLabel;
    lblstatus: TLabel;
    lbldtemissao: TLabel;
    lblfornecedor: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    btnFind: TcxButton;
    btnCancelar: TcxButton;
    btnok: TcxButton;
    edtdtEmissaoi: TcxDateEdit;
    cbxcdstparcelamento: TcxLookupComboBox;
    edtnuautpagtoi: TcxTextEdit;
    edtDtemissaoF: TcxDateEdit;
    edtvlautpagtoi: TcxCalcEdit;
    edtvlautpagtof: TcxCalcEdit;
    grd: TcxGrid;
    tbv: TcxGridDBTableView;
    tbvCDPARCELAMENTO: TcxGridDBColumn;
    tbvDTEMISSAO: TcxGridDBColumn;
    tbvNMFORNECEDOR: TcxGridDBColumn;
    tbvVLENTRADA: TcxGridDBColumn;
    tbvVLSAIDA: TcxGridDBColumn;
    tbvNMSTPARCELAMENTO: TcxGridDBColumn;
    lvl: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    lbl1: TLabel;
    act: TActionList;
    actfiltro: TAction;
    actagrupar: TAction;
    actexcel: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnfiltro: TdxBarButton;
    btnagrupar: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    actlimpacriterio: TAction;
    dxBarButton1: TdxBarButton;
    edtnuautpagtof: TcxTextEdit;
    Label1: TLabel;
    actmodograde: TAction;
    dxBarButton3: TdxBarButton;
    edtcdfornecedor: TcxButtonEdit;
    lblnmfornecedor: TLabel;
    procedure btnFindClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tbvDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnexportarexcelClick(Sender: TObject);
    procedure tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actexcelExecute(Sender: TObject);
    procedure actagruparExecute(Sender: TObject);
    procedure actfiltroExecute(Sender: TObject);
    procedure actlimpacriterioExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure actmodogradeExecute(Sender: TObject);
    procedure edtcdfornecedorExit(Sender: TObject);
    procedure edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private   { Private declarations }
    codigo : integer;
    q : TClasseQuery;
    d : TDataSource;
    procedure qAfterScroll(DataSet: TDataSet);
    procedure AbrirTabelas;
    function makesql: string;
    function sqlwhere: string;
  public    { Public declarations }
  end;

function Localizarparcelamento:integer;

var
  frmLocalizarparcelamento: TfrmLocalizarparcelamento;

implementation

uses uLocalizar, dialogo.ExportarExcel, uDtmMain, classe.registro;

{$R *.DFM}

function Localizarparcelamento:integer;
begin
  result := 0;
  if not QForm.ExisteFormulario(_frm+_localizar+_parcelamento) then
  begin
    frmLocalizarparcelamento := tfrmLocalizarparcelamento.Create(application);
  end;
  if frmLocalizarparcelamento.q.q.Active then
  begin
    frmLocalizarparcelamento.btnfindclick(frmLocalizarparcelamento.btnfind);
  end;
  frmLocalizarparcelamento.showmodal;
  if frmLocalizarparcelamento.ModalResult = mrok then
  begin
    result := frmLocalizarparcelamento.codigo;
  end;
end;

function TfrmLocalizarparcelamento.makesql:string;
begin
  result := 'SELECT PARCELAMENTO.CDPARCELAMENTO' +
                  ',PARCELAMENTO.DTEMISSAO'+
                  ',FORNECEDOR.NMFORNECEDOR'+
                  ',PARCELAMENTO.VLENTRADA'+
                  ',PARCELAMENTO.VLSAIDA'+
                  ',STPARCELAMENTO.NMSTPARCELAMENTO '+
            'FROM PARCELAMENTO '+
            'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDFORNECEDOR=PARCELAMENTO.CDPARCELAMENTO and PARCELAMENTO.cdempresa=FORNECEDOR.cdempresa '+
            'LEFT JOIN STPARCELAMENTO ON STPARCELAMENTO.CDSTPARCELAMENTO=PARCELAMENTO.CDSTPARCELAMENTO '+
            'left join PARCELAMENTOentrada on PARCELAMENTOENTRADA.cdempresa=PARCELAMENTO.cdempresa and PARCELAMENTOENTRADA.CDPARCELAMENTO=PARCELAMENTO.CDPARCELAMENTO '+
            'left join PARCELAMENTOSAIDA on PARCELAMENTOSAIDA.cdempresa=PARCELAMENTO.cdempresa and PARCELAMENTOSAIDA.CDPARCELAMENTO=PARCELAMENTO.CDPARCELAMENTO '+
            sqlwhere+
            ' group by PARCELAMENTO.CDPARCELAMENTO' +
                     ',PARCELAMENTO.DTEMISSAO'+
                     ',FORNECEDOR.NMFORNECEDOR'+
                     ',PARCELAMENTO.VLENTRADA'+
                     ',PARCELAMENTO.VLSAIDA'+
                     ',STPARCELAMENTO.NMSTPARCELAMENTO';
end;

function TfrmLocalizarparcelamento.sqlwhere: string;
var
  criterio : string;
begin
  result := 'where PARCELAMENTO.cdempresa=' + empresa.cdempresa.tostring + ' ';
  criterio := result;
  sqlmontarcodigo(edtcdfornecedor.text, _PARCELAMENTO, _cdfornecedor, result);
  sqlmontarnomedireto(edtnuautpagtoi.Text, _parcelamentoentrada, _nuautpagto, result);
  sqlmontarnomedireto(edtnuautpagtof.Text, _parcelamentoentrada, _nuautpagto, result);
  sqlmontarcodigo(cbxcdstPARCELAMENTO.EditValue, _PARCELAMENTO, _cdstPARCELAMENTO, result);
  sqlmontardata(edtdtemissaoi.text, edtdtemissaof.text, _PARCELAMENTO, _dtemissao, result);
  if criterio = result  then
  begin
    messagedlg('É obrigatório o preenchimento de algum critério para realizar a consulta.', mtinformation, [mbok], 0);
    abort;
  end;
end;

procedure TfrmLocalizarparcelamento.btnFindClick(Sender: TObject);
begin
  q.q.close;
  q.q.sql.text := makesql;
  q.q.open;
  btnOk.Enabled := q.q.RecordCount > 0;
end;

procedure TfrmLocalizarparcelamento.btnOkClick(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TfrmLocalizarparcelamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    modalresult := mrcancel;
  end;
end;

procedure TfrmLocalizarparcelamento.qAfterScroll(DataSet: TDataSet);
begin
  codigo := q.q.fieldbyname(_cdPARCELAMENTO).AsInteger;
end;

procedure TfrmLocalizarparcelamento.AbrirTabelas;
begin
  cbxcdstPARCELAMENTO.Properties.ListSource := abrir_tabela(_stPARCELAMENTO);
end;

procedure TfrmLocalizarparcelamento.tbvDblClick(Sender: TObject);
begin
  if btnok.enabled then
  begin
    btnOkClick(sender);
  end;
end;

procedure TfrmLocalizarparcelamento.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLocalizarparcelamento.btnexportarexcelClick(Sender: TObject);
begin
  exportarexcel(grd);
end;

procedure TfrmLocalizarparcelamento.tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmLocalizarparcelamento.FormCreate(Sender: TObject);
begin
  q := TClasseQuery.Create;
  d := TDataSource.Create(self);
  q.q.AfterScroll := qAfterScroll;
  TRegistro.SetQueryLocalizar(q, d, tbv);
  AbrirTabelas;
end;

procedure TfrmLocalizarparcelamento.FormDestroy(Sender: TObject);
begin
  freeandnil(q);
end;

procedure TfrmLocalizarparcelamento.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmLocalizarparcelamento.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmLocalizarparcelamento.edtcdfornecedorExit(Sender: TObject);
begin
  QForm.EditLocalizarExit(self, _fornecedor, _fornecedor);
  colorexit(sender);
end;

procedure TfrmLocalizarparcelamento.edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedorPropertiesButtonClick(sender, 0);
  end;
end;

procedure TfrmLocalizarparcelamento.edtcdfornecedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tlocalizar.edtcdfornecedorPropertiesButtonClick(edtcdfornecedor, lblnmfornecedor);
end;

procedure TfrmLocalizarparcelamento.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure TfrmLocalizarparcelamento.actexcelExecute(Sender: TObject);
begin
  exportarexcel(grd);
end;

procedure TfrmLocalizarparcelamento.actagruparExecute(Sender: TObject);
begin
  tbv.OptionsView.GroupByBox := btnagrupar.down;
end;

procedure TfrmLocalizarparcelamento.actfiltroExecute(Sender: TObject);
begin
  tbv.FilterRow.Visible := btnfiltro.down;
end;

procedure TfrmLocalizarparcelamento.actlimpacriterioExecute(Sender: TObject);
begin
  TLocalizar.LimparCriterio(self);
end;

procedure TfrmLocalizarparcelamento.actmodogradeExecute(Sender: TObject);
begin
  TRegistro.SetModoGrade(actmodograde.Checked, q, tbv);
end;

procedure TfrmLocalizarparcelamento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not q.q.Active) or (q.q.RecordCount <= 0) then
  begin
    Exit;
  end;
  if key = 40 then
  begin
    q.q.Next;
    key := 0;
  end
  else if key = 38 then
  begin
    q.q.Prior;
    key := 0;
  end;
end;

end.
