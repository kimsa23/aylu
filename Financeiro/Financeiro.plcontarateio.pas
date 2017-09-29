unit Financeiro.plcontarateio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions, Data.DB,
  Vcl.ActnList, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.UITypes,
  uConstantes,
  ORM.Empresa, orm.plconta,
  classe.gerar, classe.Registro,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxTextEdit, cxCheckBox, cxGridLevel,
  cxGridDBTableView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridCustomView,
  cxGrid, cxButtons, cxContainer, cxCurrencyEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxButtonEdit, cxCalc;

type
  TplcontarateioParametro = record
    tabela : string;
    cdnatureza : string;
    codigo : Integer;
    dtemissao : TDate;
    valor : Currency;
  end;
  Tfrmplcontarateio = class(TForm)
    act: TActionList;
    btnok: TcxButton;
    btncancelar: TcxButton;
    grd: TcxGrid;
    tbv: TcxGridDBTableView;
    lvl: TcxGridLevel;
    Label11: TLabel;
    edtvalor: TcxCurrencyEdit;
    qry: TFDQuery;
    dts: TDataSource;
    tbvVLTOTAL: TcxGridDBColumn;
    tbvNUPLCONTA: TcxGridDBColumn;
    tbvNMPLCONTA: TcxGridDBColumn;
    qryCDEMPRESA: TLargeintField;
    qryCDPLCONTARATEIO: TIntegerField;
    qryCDCOMPUTADORA: TIntegerField;
    qryCDCOMPUTADORI: TIntegerField;
    qryCDUSUARIOA: TIntegerField;
    qryCDUSUARIOI: TIntegerField;
    qryCDPLCONTA: TIntegerField;
    qryCDSAIDA: TIntegerField;
    qryCDDUPLICATA: TIntegerField;
    qryCDENTRADA: TIntegerField;
    qryCDAUTPAGTO: TIntegerField;
    qryDTEMISSAO: TDateField;
    qryVLTOTAL: TBCDField;
    qryTSINCLUSAO: TSQLTimeStampField;
    qryTSALTERACAO: TSQLTimeStampField;
    qryNUPLCONTA: TStringField;
    qryNMPLCONTA: TStringField;
    procedure qryNewRecord(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure tbvNUPLCONTAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure qryNUPLCONTAValidate(Sender: TField);
    procedure btnokClick(Sender: TObject);
    procedure qryVLTOTALValidate(Sender: TField);
  private { Private declarations }
    parametro : TplcontarateioParametro;
    procedure ConfiguraSql;
    procedure DefinirNatureza;
    procedure DatasetStatus;
    procedure ConsistirValor;
  public { Public declarations }
    class function PlContaRateioValor(avalue : TplcontarateioParametro):boolean;
  end;
{
var
  frmplcontarateio: Tfrmplcontarateio;
}
implementation

uses
  uDtmMain;

{$R *.dfm}

procedure Tfrmplcontarateio.btnokClick(Sender: TObject);
begin
  datasetStatus;
  ModalResult := mrOk;
end;

procedure Tfrmplcontarateio.ConfiguraSql;
begin
  edtvalor.Value := parametro.valor;
  qry.sql.text := 'SELECT PLCONTARATEIO.*'+
                        ',PLCONTA.NMPLCONTA '+
                  'FROM PLCONTARATEIO '+
                  'LEFT JOIN PLCONTA ON PLCONTA.CDEMPRESA=PLCONTARATEIO.CDEMPRESA AND PLCONTA.CDPLCONTA=PLCONTARATEIO.CDPLCONTA '+
                  'WHERE PLCONTARATEIO.CDEMPRESA='+empresa.cdempresa.tostring+' AND PLCONTARATEIO.CD'+parametro.tabela+'='+parametro.codigo.tostring;
  qry.Open;
end;

procedure Tfrmplcontarateio.ConsistirValor;
begin
  if parametro.valor <> qry.Aggregates[0].value then
  begin
    MessageDlg('Total do Rateio está diferente do valor de origem.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure Tfrmplcontarateio.DatasetStatus;
begin
  if (qry.State = dsEdit) or (qry.State = dsInsert) then
  begin
    qry.Post;
  end;
  ConsistirValor;
  qry.ApplyUpdates(0);
end;

procedure Tfrmplcontarateio.DefinirNatureza;
begin
  if parametro.cdnatureza <> '' then
  begin
    Exit;
  end;
  if parametro.tabela = _duplicata then
  begin
    parametro.cdnatureza := _c;
  end
  else if parametro.tabela = _autpagto then
  begin
    parametro.cdnatureza := _d;
  end
  else if parametro.tabela = _entrada then
  begin
    parametro.cdnatureza := _d;
  end;
end;

class function Tfrmplcontarateio.PlContaRateioValor(avalue: TplcontarateioParametro): boolean;
var
  form : Tfrmplcontarateio;
begin
  form := Tfrmplcontarateio.Create(nil);
  try
    form.parametro := avalue;
    form.ConfiguraSql;
    result := form.ShowModal = mrOk;
  finally
    FreeAndNil(form);
  end;
end;

procedure Tfrmplcontarateio.qryBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName(_vltotal).AsCurrency <= 0 then
  begin
    messagedlg('Valor não pode ser menor ou igual a zero.', mtInformation, [mbOK], 0);
    Abort;
  end;
  tregistro.setUpdate(dataset);
end;

procedure Tfrmplcontarateio.qryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName(_cdplcontarateio).asinteger     := qgerar.gerarcodigo(_plcontarateio);
  DataSet.FieldByName(_cd+parametro.tabela).AsInteger := parametro.codigo;
  DataSet.FieldByName(_dtemissao).AsDateTime          := parametro.dtemissao;
end;

procedure Tfrmplcontarateio.qryNUPLCONTAValidate(Sender: TField);
begin
  tplconta.validarnuplconta(sender.dataset, parametro.cdnatureza);
end;

procedure Tfrmplcontarateio.qryVLTOTALValidate(Sender: TField);
begin
  if Sender.AsCurrency <= 0 then
  begin
    messagedlg('Valor não pode ser menor ou igual a zero.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure Tfrmplcontarateio.tbvNUPLCONTAPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(qry, _plconta, _nuplconta, false);
end;

end.
