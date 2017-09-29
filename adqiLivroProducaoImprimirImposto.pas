unit adqiLivroProducaoImprimirImposto;

interface

uses
  Forms, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  ExtCtrls, ComCtrls, Dialogs,
  DB, sqlexpr, dbclient, provider,
  FireDAC.Comp.Client,
  uconstantes, ustrings, uregistro, uprogressbar,
  classeaplicacao, classeexecutasql, classeempresa, classeretornasql, //classeconfigurasql,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppModule, daDataModule, ppDBBDE, ppViewr, ppParameter,
  ppDesignLayer;

type
  TfrmLivroProducaoImprimirImposto = class(TForm)
    dts: TDataSource;
    pip: TppBDEPipeline;
    rpt: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand5: TppSummaryBand;
    rptmes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppShape3: TppShape;
    lblnmempresaMes: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppvlipientradaproducao: TppDBText;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppShape4: TppShape;
    ppLabel8: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape5: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc2: TppDBCalc;
    pipmes: TppBDEPipeline;
    dtsmes: TDataSource;
    daDataModule1: TdaDataModule;
    ppvlipisaidaproducao: TppDBText;
    ppvlipientradafiscal: TppDBText;
    ppvlipisaidafiscal: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    lblmesperiodo: TppLabel;
    ppShape1: TppShape;
    ppShape6: TppShape;
    lblnmempresaNota: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    lblmesperiodoNota: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape7: TppShape;
    ppLabel22: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppShape8: TppShape;
    ppLabel23: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    procedure ppDBText6GetText(Sender: TObject; var Text: String);
  private { Private declarations }
  public { Public declarations }
  end;

var
  frmLivroProducaoImprimirImposto: TfrmLivroProducaoImprimirImposto;

function imprimirlivroproducaoimposto   (dti, dtf:string): boolean;
function imprimirlivroproducaoimpostomes(dti, dtf:string): boolean;

implementation

{$R *.dfm}

function imprimirlivroproducaoimpostomes(dti, dtf:string): boolean;
  function makesql:string;
  begin
    result := 'select l.dtinicio'+
                   ',(select sum(vlipisaida) '+
                     'from itlivro '+
                     'inner join livro on livro.cdlivro=itlivro.cdlivro and livro.cdempresa=itlivro.cdempresa '+
                     'where livro.cdempresa=l.cdempresa and livro.dtinicio=lp1a.dtinicio) vlipisaidaproducao'+
                   ',(select sum(vlipientrada) '+
                     'from itlivro '+
                     'inner join livro on livro.cdlivro=itlivro.cdlivro and livro.cdempresa=itlivro.cdempresa '+
                     'where livro.cdempresa=l.cdempresa and livro.dtinicio=lp1a.dtinicio) vlipientradaproducao'+
                   ',(select sum(vlimposto) '+
                     'from itlp1a '+
                     'inner join lp1a on lp1a.cdlp1a=itlp1a.cdlp1a and itlp1a.cdempresa=lp1a.cdempresa '+
                     'inner join tpimposto on tpimposto.cdtpimposto=itlp1a.cdtpimposto '+
                     'where lp1a.cdempresa=l.cdempresa and lp1a.dtinicio=l.dtinicio and nmtpimposto=''IPI'' and tpsaient=''S'') vlipisaidafiscal'+
                   ',(select sum(vlimposto) '+
                     'from itlp1a '+
                     'inner join lp1a on lp1a.cdlp1a=itlp1a.cdlp1a and itlp1a.cdempresa=lp1a.cdempresa '+
                     'inner join tpimposto on tpimposto.cdtpimposto=itlp1a.cdtpimposto '+
                     'where l.cdempresa=lp1a.cdempresa and lp1a.dtinicio=l.dtinicio and nmtpimposto=''IPI'' and tpsaient=''E'') vlipientradafiscal '+
              'from livro l '+
              'inner join lp1a on lp1a.dtinicio=l.dtinicio and l.cdempresa=lp1a.cdempresa '+
              'where l.cdempresa='+empresa.cdempresa.tostring+' and l.dtinicio between '+quotedstr(dti)+' and '+quotedstr(dtf)+' '+
              'order by l.dtinicio';
  end;
var
  c : Tfdquery;
begin
  c := Tfdquery.Create  (nil);
  frmLivroProducaoImprimirImposto := tfrmLivroProducaoImprimirImposto.Create(application);
  try
    c.Connection := aplicacao.confire;
    c.sql.text   := makesql;
    c.Open;
    with frmLivroProducaoImprimirImposto do
    begin
      lblnmempresaMes.Caption := Empresa.nmempresa;
      lblmesperiodo.Caption  := 'Mes ou Periodo/Ano : '+dti+' a '+dtf;
      dtsmes.DataSet := c;
      rptmes.Print;
      result := true;
    end;
  finally
    freeandnil(c);
    freeandnil(frmLivroProducaoImprimirImposto);
  end;
end;

function imprimirlivroproducaoimposto(dti, dtf:string): boolean;
  function makesql:string;
  begin
    result := 'select cdentrada'+
                    ',cdsaida'+
                    ',nudocumento'+
                    ',vlimposto'+
                    ',tpsaient'+
                    ',cdcfop '+
              'from itlp1a '+
              'inner join lp1a on lp1a.cdlp1a=itlp1a.cdlp1a and itlp1a.cdempresa=lp1a.cdempresa '+
              'inner join tpimposto on tpimposto.cdtpimposto=itlp1a.cdtpimposto '+
              'where lp1a.cdempresa='+empresa.cdempresa.tostring+' and nmtpimposto=''IPI'' and dtinicio between '+quotedstr(dti)+' and '+quotedstr(dtf)+' '+
              'order by nudocumento,tpsaient';
  end;
  function makesql2:string;
  begin
    result := 'select cdentrada'+
                    ',cdsaida'+
                    ',cdmovto'+
                    ',nudocumento'+
                    ',tpentsai'+
                    ',sum(vlipientrada) vlipientrada'+
                    ',sum(vlipisaida) vlipisaida '+
              'from itlivro '+
              'inner join livro on livro.cdlivro=itlivro.cdlivro and livro.cdempresa=itlivro.cdempresa '+
              'where itlivro.cdempresa='+empresa.cdempresa.tostring+' and dtinicio='+quotedstr(dti)+' and dttermino='+quotedstr(dtf)+' '+
              'group by cdentrada'+
                      ',cdsaida'+
                      ',cdmovto'+
                      ',nudocumento'+
                      ',tpentsai '+
              'order by nudocumento';
  end;
  function RetornaIPISubProduto(cdmovto, tabela:string):currency;
  begin
    result := RetornaSQLCurrency('select it'+tabela+'.vlipi '+
                                       'from it'+tabela+' '+
                                       'inner join movto on it'+tabela+'.cd'+tabela+'=movto.cd'+tabela+' and it'+tabela+'.nuit'+tabela+'=movto.nuit'+tabela+' and movto.cdempresa=it'+tabela+'.cdempresa '+
                                       'where movto.cdempresa='+empresa.cdempresa.tostring+' and cdmovto='+cdmovto);
  end;
  function selecionaMovtoSubProdutoSaida(cdmovto:string):string;
  begin
    result := RetornaSQLString('select saida.nusaida '+
                                     'from movto '+
                                     'inner join saida on saida.cdsaida=movto.cdsaida and saida.cdempresa=movto.cdempresa '+
                                     'where movto.cdempresa='+empresa.cdempresa.tostring+' and movto.cdsaida is not null and tpentsai=''S'' and cdmovto='+cdmovto)
  end;
  function selecionaMovtoSubProdutoEntrada(cdmovto:string):string;
  begin
    result := RetornaSQLString('select saida.nusaida '+
                                     'from movto '+
                                     'inner join saida on saida.cdsaida=movto.cdsaida and movto.cdempresa=saida.cdempresa '+
                                     'where movto.cdempresa='+empresa.cdempresa.tostring+' and movto.cdsaida is not null and tpentsai=''E'' and cdmovto='+cdmovto+
                                     'union '+
                                     'select entrada.nuentrada '+
                                     'from movto '+
                                     'inner join entrada on entrada.cdentrada=movto.cdentrada and movto.cdempresa=entrada.cdempresa '+
                                     'where movto.cdempresa='+empresa.cdempresa.tostring+' and movto.cdentrada is not null and cdmovto='+cdmovto)
  end;
var
  c : Tfdquery;
  qt : TClientdataset;
  nudocumento, tpsaient, entrada, saida : string;
  vlipi : currency;
  procedure atualizaVlipiProducao(tipo:string; vlipi: currency);
  begin
    qt.Edit;
    if tipo <> _devolucao then
    begin
     qt.Fieldbyname(_vlipi+tipo+_producao).AsCurrency     := vlipi
    end
    else
    begin
      qt.fieldbyname(_vlipi+_entrada+_producao).AsCurrency := vlipi;
    end;
    qt.Post;
  end;
  procedure set_temp_table;
  begin
    qt.FieldDefs.Add(_CDENTRADA, ftinteger);
    qt.FieldDefs.Add(_CDSAIDA, ftinteger);
    qt.FieldDefs.Add(_NUDOCUMENTO, ftstring, 10);
    qt.FieldDefs.Add(_VLIPI+_ENTRADA+_PRODUCAO, ftcurrency);
    qt.FieldDefs.Add(_VLIPI+_SAIDA+_PRODUCAO, ftcurrency);
    qt.FieldDefs.Add(_VLIPI+_ENTRADA+_FISCAL, ftcurrency);
    qt.FieldDefs.Add(_VLIPI+_SAIDA+_FISCAL, ftcurrency);
    qt.CreateDataSet;
  end;
  procedure inserirTabelaTemporaria(tipo:string; vlipi:currency; cd:string='');
  begin
    c.Prior;
    qt.Append;
    qt.fieldbyname(_VLIPI+_ENTRADA+_PRODUCAO).Clear;
    qt.fieldbyname(_VLIPI+_SAIDA+_PRODUCAO).Clear;
    qt.fieldbyname(_VLIPI+_ENTRADA+_FISCAL).Clear;
    qt.fieldbyname(_VLIPI+_SAIDA+_FISCAL).Clear;
    qt.fieldbyname(_CDENTRADA).AsInteger  := c.fieldbyname(_CDENTRADA).AsInteger;
    qt.fieldbyname(_CDSAIDA).AsInteger    := c.fieldbyname(_CDSAIDA).AsInteger;
    qt.fieldbyname(_NUDOCUMENTO).AsString := c.fieldbyname(_NUDOCUMENTO).AsString;
    if (tipo = _fiscal) and (vlipi <> 0) then
    begin
      if c.fieldbyname(_TPSAIENT).AsString = _E then qt.fieldbyname(_VLIPI+_ENTRADA+_FISCAL).AsCurrency := vlipi
                                                else qt.fieldbyname(_VLIPI+_SAIDA+_FISCAL).AsCurrency   := vlipi;
    end;
    if ((tipo = _producao+_entrada) or  (tipo = _producao+_movto+_entrada)) and (vlipi <> 0) then
    begin
      qt.fieldbyname(_VLIPI+_ENTRADA+_PRODUCAO).AsCurrency := vlipi;
    end;
    if ((tipo = _producao+_saida) or (tipo = _producao+_movto+_saida)) and (vlipi <> 0) then
    begin
      qt.fieldbyname(_VLIPI+_SAIDA+_PRODUCAO).AsCurrency := vlipi;
    end;
    if tipo = _producao+_movto+_entrada then
    begin
      qt.fieldbyname(_CDENTRADA).AsString := cd;
    end;
    if tipo = _producao+_movto+_saida then
    begin
      qt.fieldbyname(_CDSAIDA).AsString := cd;
    end;
    qt.Post;
    c.Next;
  end;
begin
  c  := Tfdquery.Create  (nil);
  qt := TClientdataset.Create  (nil);
  frmLivroProducaoImprimirImposto := tfrmLivroProducaoImprimirImposto.Create(application);
  frmprogressbar := tfrmprogressbar.Create(nil);
  try
    set_temp_table;
    c.Connection := aplicacao.confire;
    c.sql.text   := makesql;
    c.Open;
    nudocumento := c.fieldbyname(_NUDOCUMENTO).Asstring;
    tpsaient    := c.fieldbyname(_TPSAIENT).Asstring;
    vlipi       := c.fieldbyname(_vlimposto).AsCurrency;
    frmprogressbar.gau.MaxValue := c.recordcount - 1;
    frmprogressbar.show;
    while not c.Eof do
    begin
      frmprogressbar.gau.Progress := c.Recno;
      Application.ProcessMessages;
      if (c.fieldbyname(_NUDOCUMENTO).Asstring <> nudocumento) or (c.fieldbyname(_TPSAIENT).Asstring    <> tpsaient) then
      begin
        inserirTabelaTemporaria(_fiscal, vlipi);
        nudocumento := c.fieldbyname(_NUDOCUMENTO).Asstring;
        tpsaient    := c.fieldbyname(_TPSAIENT).Asstring;
        vlipi       := 0;
      end;
      vlipi := vlipi + c.fieldbyname(_vlimposto).AsCurrency;
      c.next;
    end;
    c.Close;
    c.sql.text   := makesql2;
    c.Open;
    frmprogressbar.gau.MaxValue := c.recordcount - 1;
    while not c.Eof do
    begin
      frmprogressbar.gau.Progress := c.Recno;
      Application.ProcessMessages;
      if not (c.Fieldbyname(_cdentrada).AsString = '') then
      begin
        if qt.Locate(_cdentrada, c.Fieldbyname(_cdentrada).AsString, []) then
        begin
          atualizaVlipiProducao(_entrada, c.Fieldbyname(_vlipi+_entrada).AsCurrency)
        end
        else
        begin
          inserirTabelaTemporaria(_producao+_entrada, c.fieldbyname(_vlipi+_entrada).AsCurrency);
        end;
      end;
      if not (c.Fieldbyname(_cdsaida).AsString = '') then
      begin
        if qt.Locate(_cdsaida, c.Fieldbyname(_cdsaida).AsString, []) then
        begin
          if c.Fieldbyname(_tpentsai).AsString = _S then
          begin
            atualizaVlipiProducao(_saida    , c.Fieldbyname(_vlipi+_saida).Ascurrency)
          end
          else
          begin
            atualizaVlipiProducao(_devolucao, c.Fieldbyname(_vlipi+_entrada).Ascurrency);
          end;
        end
        else
        begin
          if c.Fieldbyname(_tpentsai).AsString = _S then
          begin
            inserirTabelaTemporaria(_producao+_saida  , c.fieldbyname(_vlipi+_saida).AsCurrency)
          end
          else
          begin
            inserirTabelaTemporaria(_producao+_entrada, c.fieldbyname(_vlipi+_saida).AsCurrency);
          end;
        end;
      end;
      if not (c.Fieldbyname(_cd+_movto).AsString = '') then
      begin
        saida   := selecionaMovtoSubProdutoSaida  (c.fieldbyname(_CD+_MOVTO).Asstring);
        entrada := selecionaMovtoSubProdutoentrada(c.fieldbyname(_CD+_MOVTO).Asstring);
        if saida <> '' then
        begin
          vlipi := RetornaIPISubProduto(c.fieldbyname(_CD+_MOVTO).Asstring, _saida);
          if vlipi > 0 then
          begin
            if qt.Locate(_cdsaida, saida, []) then
            begin
              atualizaVlipiProducao  (_saida, vlipi)
            end
            else
            begin
              inserirTabelaTemporaria(_producao+_movto+_saida, vlipi, saida);
            end;
          end;
        end
        else if entrada <> '' then
        begin
          vlipi := RetornaIPISubProduto(c.fieldbyname(_CD+_MOVTO).Asstring, _entrada);
          if vlipi > 0 then
          begin
            if qt.Locate(_cdentrada, entrada, []) then
            begin
              atualizaVlipiProducao  (_entrada, vlipi)
            end
            else
            begin
              inserirTabelaTemporaria(_producao+_movto+_saida, vlipi, entrada);
            end;
          end;
        end;
      end;
      c.Next;
    end;
    //
    with frmLivroProducaoImprimirImposto do
    begin
      lblnmempresaNota.Caption  := Empresa.nmempresa;
      lblmesperiodoNota.Caption := 'Mes ou Periodo/Ano : '+dti+' a '+dtf;
      qt.Filter                 := '((vlipientradaproducao is not null) or (vlipientradafiscal is not null)) or ((vlipisaidaproducao is not null) or (vlipisaidafiscal is not null))';
      qt.Filtered               := true;
      dts.DataSet               := qt;
      rpt.Print;
    end;
    result := true;
  finally
    freeandnil(c);
    freeandnil(qt);
    freeandnil(frmLivroProducaoImprimirImposto);
    freeandnil(frmprogressbar);
  end ;
end;

procedure TfrmLivroProducaoImprimirImposto.ppDBText6GetText(Sender: TObject; var Text: String);
begin
  if (ppvlipientradaproducao.FieldValue <> ppvlipientradafiscal.FieldValue) or (ppvlipisaidafiscal.FieldValue <> ppvlipisaidaproducao.FieldValue) then
  begin
    ppDBText6.Font.Color  := clRed;
    ppDBText7.Font.Color  := clRed;
    ppDBText8.Font.Color  := clRed;
    ppDBText9.Font.Color  := clRed;
    ppDBText10.Font.Color := clRed;
  end
  else
  begin
    ppDBText6.Font.Color  := clBlack;
    ppDBText7.Font.Color  := clBlack;
    ppDBText8.Font.Color  := clBlack;
    ppDBText9.Font.Color  := clBlack;
    ppDBText10.Font.Color := clBlack;
  end;
end;

end.
