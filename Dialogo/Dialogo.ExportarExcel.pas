unit Dialogo.ExportarExcel;

interface

uses
  System.Actions, System.UITypes,
  forms, StdCtrls, Buttons, Controls, Classes, ExtCtrls, shellapi, windows, variants,
  dialogs, sysutils,

  uConstantes, Rotina.System,

  orm.usuario, classe.form, classe.executasql, classe.aplicacao, classe.query,

  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxButtons, cxButtonEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxClasses, cxGroupBox,
  cxGridExportLink, cxLookAndFeels, cxNavigator,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.DB;

type
  TfrmExporExcel = class(TForm)
    Panel1: TPanel;
    memsql: TMemo;
    pnl1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    tbv: TcxGridDBTableView;
    lvl: TcxGridLevel;
    grd: TcxGrid;
    qry: TFDQuery;
    dts: TDataSource;
    btn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private    { Private declarations }
  public    { Public declarations }
  end;

procedure ExportarExcel;overload;
procedure ExportarExcel(grd:TcxGrid);overload;
procedure ExportarExcel(key : Word; sender: TObject);overload;

var
  frmExporExcel: TfrmExporExcel;

implementation

uses
  uDtmMain;

{$R *.dfm}

procedure ExportarExcel(key : Word; sender: TObject);
var
  vfilename : string;
begin
  if key <> __keyexportarexcel then
  begin
    Exit;
  end;
  vfilename := getSpecialDir+'\'+NomeTemporario+'.'+_xls;
  ExportGridToExcel(vfilename, TcxGrid(TcxGridDBTableView(Sender).GetParentComponent));
  if FileExists(vfilename) then
  begin
    ShellExecute(Application.handle, PChar(_OPEN), PChar(vFileName), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure ExportarExcel(grd:TcxGrid);
var
  vfilename : string;
begin
  vfilename := getSpecialDir+'\'+NomeTemporario+'.'+_xls;
  ExportGridToExcel(vfilename, grd);
  if FileExists(vfilename) then
  begin
    ShellExecute(Application.handle, PChar(_OPEN), PChar(vFileName), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure ExportarExcel;
begin
  frmExporExcel := TfrmExporExcel.Create(nil);
  try
    frmExporExcel.ShowModal;
  finally
    freeandnil(frmExporExcel);
  end;
end;

procedure TfrmExporExcel.BitBtn2Click(Sender: TObject);
begin
  ExportarExcel(grd)
end;

procedure TfrmExporExcel.BitBtn3Click(Sender: TObject);
begin
  qry.Close;
  qry.SQL.Text := memsql.Lines.Text;
  qry.ExecSQL;
end;

procedure TfrmExporExcel.btn1Click(Sender: TObject);
begin
  qry.Close;
  qry.SQL.Text := memsql.Lines.Text;
  qry.Open;
  tbv.DataController.CreateAllItems;
end;

procedure TfrmExporExcel.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmExporExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmExporExcel.tbvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

end.
