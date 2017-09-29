unit Impressao.Fatura643;

interface

uses
  Forms, Dialogs, SysUtils, Variants, Controls, Classes,
  DB, ACBrBoleto,
  dialogo.progressbar, uconstantes,
  classe.query, acbr.Boleto;

procedure ImprimirFatura(mtbl: TDataClient; qry: TClasseQuery);

implementation

uses
  orm.duplicata;

Type TReport = class
  private
    mtbl: TDataClient;
  public
    constructor create(mtbl2: TDataClient; qry2: TClasseQuery);
    procedure   gerar;
  end;

procedure ImprimirFatura(mtbl: TDataClient; qry: TClasseQuery);
var
  rpt : TReport;
begin
  rpt := TReport.create(mtbl, qry);
  try
    rpt.gerar;
  finally
    FreeAndNil(rpt);
  end;
end;

constructor TReport.create(mtbl2: TDataClient; qry2: TClasseQuery);
begin
  mtbl := mtbl2;
  mtbl.CopyDataSet(qry2);
end;

procedure TReport.gerar;
var
  boletoacbr : TBoletoAcbr;
  Titulo : TACBrTitulo;
begin
  boletoacbr     := tboletoacbr.create;
  titulo         := TACBrTitulo.Create(boletoacbr.ACBrBoleto);
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    boletoacbr.setboleto.Select(mtbl.m.fieldbyname(_cdsetboleto).AsInteger);
    boletoacbr.conta.Select(boletoacbr.setboleto.cdconta);
    boletoacbr.ConfigurarCedente;
    boletoacbr.Configurarbanco;
    mtbl.m.First;
    frmprogressbar.gau.maxvalue := mtbl.m.recordcount;
    frmprogressbar.show;
    while not mtbl.m.Eof do
    begin
      frmprogressbar.pnl.caption := 'Processando registro '+mtbl.m.recno.tostring+' de '+frmprogressbar.gau.maxvalue.tostring;
      frmprogressbar.gau.progress := mtbl.m.recno;
      application.ProcessMessages;
      titulo.Vencimento     := mtbl.m.FieldByName(_dtvencimento).AsDateTime;
      titulo.NossoNumero    := tduplicata.ObterNossoNumeroSemDigitoVerificador(mtbl.m.FieldByName(_nunossonumero).AsString);
      titulo.ValorDocumento := mtbl.m.FieldByName(_vlsaldo).AsCurrency;
      Titulo.Carteira       := boletoacbr.setboleto.nucarteira;
      mtbl.m.Edit;
      mtbl.m.FieldByName(_nunossonumero).AsString := boletoacbr.ACBrBoleto.Banco.MontarCampoNossoNumero(Titulo);
      mtbl.m.FieldByName(_NUCODIGOBARRA).AsString := boletoacbr.ACBrBoleto.Banco.MontarCodigoBarras(Titulo);
      mtbl.m.FieldByName(_dslinhadigitavel).AsString := boletoacbr.ACBrBoleto.Banco.MontarLinhaDigitavel(mtbl.m.FieldByName(_NUCODIGOBARRA).AsString, Titulo);
      //codcedente     := boletoacbr.ACBrBoleto.Banco.MontarCampoCodigoCedente(Titulo);
      //codbarras      := boletoacbr.ACBrBoleto.Banco.MontarCodigoBarras(Titulo);
      mtbl.m.Post;
      mtbl.m.Next;
    end;
  finally
    freeandnil(boletoacbr);
    freeandnil(titulo);
    freeandnil(frmprogressbar);
  end;
end;

end.
