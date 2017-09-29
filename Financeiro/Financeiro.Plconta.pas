unit Financeiro.Plconta;

interface

uses
  Firedac.Stan.Param,
  Forms, Windows, SysUtils, Classes, Graphics, Controls, StdCtrls, Buttons,
  ExtCtrls, dialogs, Mask,
  uConstantes, orm.empresa, orm.plconta,
  classe.aplicacao, classe.gerar, classe.query,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxButtons, cxCheckBox, FMTBcd,
  DB, cxMemo;

type
  Tfrmplconta = class(TForm)
    Label1: TLabel;
    btnok: TcxButton;
    btncancelar: TcxButton;
    edtnmplconta: TcxDBTextEdit;
    dts: TDataSource;
    ckbboduplicata: TcxDBCheckBox;
    ckbboautpagto: TcxDBCheckBox;
    memdsplconta: TcxDBMemo;
    Label2: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private    { Private declarations }
    qry : TClasseQuery;
    procedure ConfigurarFormulario(cdplconta:integer);
    procedure AplicarSubItemDuplicataAutpagto;
  public    { Public declarations }
  end;

var
  frmplconta: Tfrmplconta;

function dlgPlconta(cdplconta:integer):Boolean;

implementation

{$R *.DFM}

function dlgPlconta(cdplconta:integer):Boolean;
begin
  frmplconta := Tfrmplconta.create(nil);
  try
    frmplconta.ConfigurarFormulario(cdplconta);
    frmplconta.ShowModal;
    if frmplconta.ModalResult = mrok then
    begin
      if frmplconta.qry.q.State = dsedit then
      begin
        frmplconta.qry.q.post;
        frmplconta.qry.q.ApplyUpdates(0);
        frmplconta.AplicarSubItemDuplicataAutpagto;
      end;
    end
    else if frmplconta.qry.q.State = dsedit then
    begin
      frmplconta.qry.q.Cancel;
    end;
    result := frmplconta.ModalResult = mrok;
  finally
    freeandnil(frmplconta);
  end;
end;

procedure Tfrmplconta.AplicarSubItemDuplicataAutpagto;
begin
  if qry.q.fieldbyname(_cdplcontapai).AsInteger <> 0 then
  begin
    exit;
  end;
  tplconta.AplicarSubitemDuplicataAutpagto(qry.q.fieldbyname(_cdplconta).AsInteger);
end;

procedure Tfrmplconta.btnOkClick(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure Tfrmplconta.ConfigurarFormulario(cdplconta: integer);
begin
  qry                    := tclassequery.create('SELECT * FROM PLCONTA WHERE CDEMPRESA='+empresa.cdempresa.ToString+' AND CDPLCONTA='+cdplconta.tostring, true);
  dts.dataset            := qry.q;
  qry.q.fieldbyname(_boduplicata).ReadOnly := qry.q.fieldbyname(_cdplcontapai).AsInteger <> 0;
  qry.q.fieldbyname(_boautpagto).ReadOnly  := qry.q.fieldbyname(_cdplcontapai).AsInteger <> 0;
  caption                := 'Propriedades de ' + qry.q.fieldbyname(_nunivel).Asstring + ' - ' + qry.q.fieldbyname(_nmplconta).Asstring;
end;

procedure Tfrmplconta.FormDestroy(Sender: TObject);
begin
  freeandnil(qry);
end;

end.
