unit Dialogo.GerarOrdCompra;

interface

uses orm.TpOrdCompra,
  Forms, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, Buttons, StdCtrls, ExtCtrls,
  DBClient, sqlexpr, Data.DB,
  ulocalizar, uConstantes,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmGerarOrdCompra = class(TForm)
    btnOk: TButton;
    btnCancelar: TButton;
    lblCliente: TLabel;
    lblcondpagto: TLabel;
    cbxcdtpordcompra: TcxLookupComboBox;
    cbxcdcondpagto: TcxLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private { Private declarations }
    c : TClientDataSet;
  public { Public declarations }
    procedure preencherParametros(cds : TClientDataSet);
  end;

var
  frmGerarOrdCompra: TfrmGerarOrdCompra;

function GerarOrdCompra(cdpedidomaterial:Integer; cdfornecedor: largeint):boolean;

implementation

uses uDtmMain, uMain, orm.ordcompra;

{$R *.dfm}

function GerarOrdCompra(cdpedidomaterial:Integer; cdfornecedor: largeint):boolean;
begin
  result            := false;
  frmGerarOrdCompra := TfrmGerarOrdCompra.Create(application);
  try
    frmGerarOrdCompra.lblcondpagto.Visible   := False;
    frmGerarOrdCompra.cbxcdcondpagto.Visible := False;
    with frmGerarOrdCompra do
    begin
      cbxcdtpordcompra.EditValue := ttpordcompra.PrimeiroCodigo;
      if ttpordcompra.count = 1 then
      begin
        ModalResult := mrOk;
      end
      else
      begin
        showmodal;
      end;
      if ModalResult <> mrok then
      begin
        exit;
      end;
      frmmain.NovoOrdCompra(cdpedidomaterial, cdfornecedor, cbxcdtpordcompra.EditValue);
      result := true;
    end;
  finally
    freeandnil(frmGerarOrdCompra);
  end;
end;

procedure TfrmGerarOrdCompra.preencherParametros(cds : TClientDataSet);
begin
  c := cds;
end;

procedure TfrmGerarOrdCompra.btnOkClick(Sender: TObject);
begin
  if cbxcdcondpagto.Visible then
  begin
    c.FieldByName(_cdtpordcompra).AsString := cbxcdtpordcompra.EditValue;
    c.FieldByName(_cdcondpagto).AsString   := cbxcdcondpagto.EditValue;
    close;
  end;
  ModalResult := mrOk;
end;

procedure TfrmGerarOrdCompra.FormCreate(Sender: TObject);
begin
  cbxcdtpordcompra.Properties.ListSource := abrir_tabela(_tpordcompra);
  cbxcdcondpagto.Properties.ListSource   := abrir_tabela(_condpagto+_e);
end;

end.
