unit Localizar.Livro;

interface

uses
  forms, Buttons, StdCtrls, ComCtrls, Mask, Classes, ExtCtrls, dialogs,
  Menus, sysutils, ActnList, Controls,
  FMTBcd, DB, DBClient, Provider, Grids,
  sqlexpr,
  ulocalizar, uconstantes,
  dialogo.exportarexcel,
  orm.empresa, classe.form, rotina.sqlmontar, classe.query, classe.localizar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLookAndFeelPainters, cxButtons, cxGroupBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxStatusBar, cxLookAndFeels, dxBar, dxCore, cxDateUtils,
  cxNavigator, System.Actions;

type
  TfrmLocalizarLivro = class(TForm)
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtdttf: TcxDateEdit;
    edtdtif: TcxDateEdit;
    edtdtti: TcxDateEdit;
    edtdtii: TcxDateEdit;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    btnFind: TcxButton;
    grd: TcxGrid;
    tbv: TcxGridDBTableView;
    tbvCDLIVRO: TcxGridDBColumn;
    tbvDTINICIO: TcxGridDBColumn;
    tbvDTTERMINO: TcxGridDBColumn;
    grdLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
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
    dxBarButton1: TdxBarButton;
    actlimparcriterio: TAction;
    actmodograde: TAction;
    dxBarButton3: TdxBarButton;
    procedure btnFindClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure tbvDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure actexcelExecute(Sender: TObject);
    procedure actagruparExecute(Sender: TObject);
    procedure actfiltroExecute(Sender: TObject);
    procedure actlimparcriterioExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actmodogradeExecute(Sender: TObject);
  private   { Private declarations }
    codigo : Integer;
    q : TClasseQuery;
    d : TDataSource;
    procedure qAfterScroll(DataSet: TDataSet);
  public    { Public declarations }
  end;

function LocalizarLivro:Integer;

var
  frmLocalizarLivro: TfrmLocalizarLivro;

implementation

uses uDtmMain, classe.registro;

{$R *.DFM}

function LocalizarLivro:Integer;
begin
  if not QForm.ExisteFormulario(_frm+_Localizar+_Livro) then
  begin
    frmLocalizarLivro := TfrmLocalizarLivro.Create(application);
  end;
  if frmLocalizarLivro.q.q.Active then
  begin
    frmLocalizarLivro.btnfindclick(frmLocalizarLivro.btnfind);
  end;
  frmLocalizarLivro.showmodal;
  if frmLocalizarLivro.ModalResult = mrok then
  begin
    result := frmLocalizarLivro.codigo;
  end;
end;

procedure TfrmLocalizarLivro.btnFindClick(Sender: TObject);
  function makesql : string;
  begin
    result := 'SELECT CDLIVRO,DTINICIO,DTTERMINO FROM LIVRO where cdempresa='+empresa.cdempresa.tostring+' ';
    sqlmontardata(edtdtii.text, edtdtif.text, _livro, _dtinicio , result);
    sqlmontardata(edtdtti.text, edtdttf.text, _livro, _dttermino, result);
  end;
begin
  q.q.close;
  q.q.sql.text := makesql;
  q.q.open;
  btnOk.Enabled := q.q.RecordCount > 0;
end;

procedure TfrmLocalizarLivro.btnOkClick(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TfrmLocalizarLivro.qAfterScroll(DataSet: TDataSet);
begin
  codigo := q.q.fieldbyname(_cdlivro).AsInteger;
end;

procedure TfrmLocalizarLivro.tbvDblClick(Sender: TObject);
begin
  if btnok.enabled then
  begin
    btnOkClick(sender);
  end;
end;

procedure TfrmLocalizarLivro.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLocalizarLivro.tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmLocalizarLivro.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmLocalizarLivro.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmLocalizarLivro.actexcelExecute(Sender: TObject);
begin
  exportarexcel(grd);
end;

procedure TfrmLocalizarLivro.actagruparExecute(Sender: TObject);
begin
  tbv.OptionsView.GroupByBox := btnagrupar.down;
end;

procedure TfrmLocalizarLivro.actfiltroExecute(Sender: TObject);
begin
  tbv.FilterRow.Visible := btnfiltro.down;
end;

procedure TfrmLocalizarLivro.actlimparcriterioExecute(Sender: TObject);
begin
  TLocalizar.LimparCriterio(self);
end;

procedure TfrmLocalizarLivro.actmodogradeExecute(Sender: TObject);
begin
  TRegistro.SetModoGrade(actmodograde.Checked, q, tbv);
end;

procedure TfrmLocalizarLivro.FormCreate(Sender: TObject);
begin
  q := TClasseQuery.Create;
  d := TDataSource.Create(self);
  q.q.AfterScroll := qAfterScroll;
  TRegistro.SetQueryLocalizar(q, d, tbv);
end;

procedure TfrmLocalizarLivro.FormDestroy(Sender: TObject);
begin
  freeandnil(q);
end;

procedure TfrmLocalizarLivro.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
