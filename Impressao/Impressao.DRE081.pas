unit Impressao.DRE081;

interface

uses
  Classes, SysUtils, DB, dialogs, forms, system.UITypes,
  uconstantes, rotina.registro, dialogo.progressbar,
  orm.movbancario, orm.plconta, orm.duplicata, orm.saida, orm.autpagto, orm.entrada,
  orm.baixa, orm.empresa, classe.Query, rotina.retornasql;


procedure Report081DRE(mtbl, mtbl2: TDataClient; sqlwhere:string);

implementation

type
  TReport = class
  private { private declarations }
    plconta : TPlContaList;
    mtbl: TDataClient;
    mtbl2: TDataClient;
    sqlwhere : string;
    baixa : TbaixaList;
    movbancario : TMovBancarioList;
    duplicata : TDuplicataList;
    autpagto : TautpagtoList;
    saida : TSaidaList;
    entrada : TEntradaList;
    procedure CriarFields;
    procedure CriarFields2;
    procedure ProcessarImpostoSaida;
    function  makesqlImposto(tbl, imposto:string):String;
    procedure InserirInformaçãoPlConta;
    procedure inserirRegistroObjetoDataset;
    procedure BaixaAutpagto(value: TBaixa);
    procedure BaixaDuplicata(value: TBaixa);
    procedure BaixaMovbancario(value: TBaixa);
    procedure processarbaixa;
    procedure processarmovbancario;
    procedure AdicionarVlSaldoPlanoConta(Pcdplconta: Integer;
      Pvltotal: Currency);
  public
    constructor create(mtbl21, mtbl22: TDataClient; sqlwhere2: string);
    destructor  destroy; override;
    procedure   gerar;
  end;

procedure Report081DRE(mtbl, mtbl2: TDataClient; sqlwhere:string);
var
  rpt : TReport;
begin
  rpt := TReport.create(mtbl, mtbl2, sqlwhere);
  try
    rpt.gerar;
  finally
    FreeAndNil(rpt);
  end;
end;

constructor TReport.create(mtbl21, mtbl22: TDataClient; sqlwhere2: string);
begin
  mtbl     := mtbl21;
  mtbl2    := mtbl22;
  sqlwhere := sqlwhere2;
  plconta  := TPlContaList.create;
  baixa       := TbaixaList.Create;
  duplicata   := TDuplicataList.Create;
  autpagto    := TAutPagtoList.Create;
  movbancario := tmovbancariolist.Create;
  saida       := TSaidaList.Create;
  entrada     := TEntradaList.Create;
end;

procedure TReport.CriarFields;
begin
  mtbl.m.FieldDefs.Clear;
  mtbl.m.FieldDefs.Add(_cdplconta        , ftinteger);
  mtbl.m.FieldDefs.Add(_nunivel+_1       , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta+_1     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_pr+_plconta+_1   , ftFloat);
  mtbl.m.FieldDefs.Add(_pr+_t+_plconta+_1, ftFloat);
  mtbl.m.FieldDefs.Add(_vl+_plconta+_1   , ftCurrency);

  mtbl.m.FieldDefs.Add(_nunivel+_2       , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta+_2     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_pr+_plconta+_2   , ftFloat);
  mtbl.m.FieldDefs.Add(_pr+_t+_plconta+_2, ftFloat);
  mtbl.m.FieldDefs.Add(_vl+_plconta+_2   , ftCurrency);

  mtbl.m.FieldDefs.Add(_nunivel+_3       , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta+_3     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_pr+_plconta+_3   , ftFloat);
  mtbl.m.FieldDefs.Add(_pr+_t+_plconta+_3, ftFloat);
  mtbl.m.FieldDefs.Add(_vl+_plconta+_3   , ftCurrency);

  mtbl.m.FieldDefs.Add(_nunivel+_4       , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta+_4     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_pr+_plconta+_4   , ftFloat);
  mtbl.m.FieldDefs.Add(_pr+_t+_plconta+_4, ftFloat);
  mtbl.m.FieldDefs.Add(_vl+_plconta+_4   , ftCurrency);

  mtbl.m.FieldDefs.Add(_nunivel+_5       , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta+_5     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_pr+_plconta+_5   , ftFloat);
  mtbl.m.FieldDefs.Add(_pr+_t+_plconta+_5, ftFloat);
  mtbl.m.FieldDefs.Add(_vl+_plconta+_5   , ftCurrency);

  mtbl.m.IndexDefs.Add(_nunivel, _nunivel+_1+';'+_nunivel+_2+';'+_nunivel+_3+';'+_nunivel+_4+';'+_nunivel+_5, []);
  mtbl.m.IndexName := _nunivel;
  mtbl.m.CreateDataSet;
end;

procedure TReport.CriarFields2;
begin
  mtbl2.m.FieldDefs.Clear;
  mtbl2.m.FieldDefs.Add(_vlicms+_entrada, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlipi+_entrada, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlpis+_entrada, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlcofins+_entrada, ftcurrency);

  mtbl2.m.FieldDefs.Add(_vlicms+_saida, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlipi+_saida, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlpis+_saida, ftcurrency);
  mtbl2.m.FieldDefs.Add(_vlcofins+_saida, ftcurrency);
  mtbl2.m.CreateDataSet;
end;

destructor TReport.destroy;
begin
  freeandnil(plconta);
  freeandnil(saida);
  freeandnil(entrada);
  FreeAndNil(baixa);
  FreeAndNil(duplicata);
  FreeAndNil(autpagto);
  FreeAndNil(movbancario);
end;

procedure TReport.gerar;
begin
  CriarFields;

  processarbaixa;
  processarmovbancario;

  InserirInformaçãoPlConta;
  plconta.GerarRegistrosAscendentes;
  inserirRegistroObjetoDataset;
  mtbl.m.IndexName := _nunivel;
  CriarFields2;
  ProcessarImpostoSaida;
end;

procedure TReport.InserirInformaçãoPlConta;
begin
  mtbl.m.First;
  while not mtbl.m.eof do
  begin
    mtbl.m.edit;
    mtbl.m.fieldbyname(_nunivel+_1).asstring   := qregistro.StringdoCodigo(_plconta, mtbl.m.fieldbyname(_cdplconta).asinteger, _nunivel);
    mtbl.m.fieldbyname(_nmplconta+_1).asstring := qregistro.NomedoCodigo(_plconta, mtbl.m.fieldbyname(_cdplconta).asinteger);
    mtbl.m.post;
    mtbl.m.next;
  end;
end;

procedure TReport.inserirRegistroObjetoDataset;
var
  i5, i4, i3, i2, i1: Integer;
  bo4, bo3, bo1, bo2 : boolean;
  procedure AdicionarNivel1;
  begin
    mtbl.m.Insert;
    mtbl.m.fieldbyname(_nunivel+_1).AsString       := plconta.items[i1].nunivel;
    mtbl.m.fieldbyname(_nmplconta+_1).AsString     := plconta.items[i1].nmplconta;
    mtbl.m.fieldbyname(_vl+_plconta+_1).AsCurrency := plconta.items[i1].vlsaldo;
  end;
  procedure AdicionarNivel2;
  begin
    mtbl.m.fieldbyname(_nunivel+_2).AsString          := plconta.items[i2].nunivel;
    mtbl.m.fieldbyname(_nmplconta+_2).AsString        := plconta.items[i2].nmplconta;
    mtbl.m.fieldbyname(_vl+_plconta+_2).AsCurrency    := plconta.items[i2].vlsaldo;
    mtbl.m.fieldbyname(_pr+_plconta+_2).AsCurrency    := plconta.items[i2].vlsaldo / plconta.items[i1].vlsaldo * 100;
    mtbl.m.fieldbyname(_pr+_t+_plconta+_2).AsCurrency := plconta.items[i2].vlsaldo / plconta.items[i1].vlsaldo * 100;
  end;
  procedure AdicionarNivel3;
  begin
    mtbl.m.fieldbyname(_nunivel+_3).AsString          := plconta.items[i3].nunivel;
    mtbl.m.fieldbyname(_nmplconta+_3).AsString        := plconta.items[i3].nmplconta;
    mtbl.m.fieldbyname(_vl+_plconta+_3).AsCurrency    := plconta.items[i3].vlsaldo;
    mtbl.m.fieldbyname(_pr+_plconta+_3).AsCurrency    := plconta.items[i3].vlsaldo / plconta.items[i2].vlsaldo * 100;
    mtbl.m.fieldbyname(_pr+_t+_plconta+_3).AsCurrency := plconta.items[i3].vlsaldo / plconta.items[i1].vlsaldo * 100;
  end;
  procedure AdicionarNivel4;
  begin
    mtbl.m.fieldbyname(_nunivel+_4).AsString          := plconta.items[i4].nunivel;
    mtbl.m.fieldbyname(_nmplconta+_4).AsString        := plconta.items[i4].nmplconta;
    mtbl.m.fieldbyname(_vl+_plconta+_4).AsCurrency    := plconta.items[i4].vlsaldo;
    mtbl.m.fieldbyname(_pr+_plconta+_4).AsCurrency    := plconta.items[i4].vlsaldo / plconta.items[i3].vlsaldo * 100;
    mtbl.m.fieldbyname(_pr+_t+_plconta+_4).AsCurrency := plconta.items[i4].vlsaldo / plconta.items[i1].vlsaldo * 100;
  end;
  procedure AdicionarNivel5;
  begin
    mtbl.m.fieldbyname(_nunivel+_5).AsString          := plconta.items[i5].nunivel;
    mtbl.m.fieldbyname(_nmplconta+_5).AsString        := plconta.items[i5].nmplconta;
    mtbl.m.fieldbyname(_vl+_plconta+_5).AsCurrency    := plconta.items[i5].vlsaldo;
    mtbl.m.fieldbyname(_pr+_plconta+_5).AsCurrency    := plconta.items[i5].vlsaldo / plconta.items[i4].vlsaldo * 100;
    mtbl.m.fieldbyname(_pr+_t+_plconta+_5).AsCurrency := plconta.items[i5].vlsaldo / plconta.items[i1].vlsaldo * 100;
  end;
begin
  for i1 := 0 to plconta.count - 1 do
  begin
    if plconta.items[i1].cdplcontapai <> 0 then
    begin
      continue;
    end;
    bo1 := true;

    for i2 := 0 to plconta.count -1 do
    begin
      if plconta.items[i2].cdplcontapai = plconta.items[i1].cdplconta then
      begin
        bo2 := true;

        for i3 := 0 to plconta.count - 1 do
        begin
          if plconta.items[i3].cdplcontapai = plconta.items[i2].cdplconta then
          begin
            bo3 := true;

            for i4 := 0 to plconta.count - 1 do
            begin
              if plconta.items[i4].cdplcontapai = plconta.items[i3].cdplconta then
              begin
                bo4 := true;
                for i5 := 0 to plconta.count - 1 do
                begin
                  if plconta.items[i5].cdplcontapai = plconta.items[i4].cdplconta then
                  begin
                    adicionarNivel1;
                    adicionarNivel2;
                    AdicionarNivel3;
                    AdicionarNivel4;
                    AdicionarNivel5;
                    mtbl.m.fieldbyname(_cdplconta).AsInteger := plconta.items[i5].cdplconta;
                    mtbl.m.post;
                    bo4 := false;
                  end;
                end;
                if bo4 then
                begin
                  adicionarNivel1;
                  adicionarNivel2;
                  AdicionarNivel3;
                  AdicionarNivel4;
                  mtbl.m.fieldbyname(_cdplconta).AsInteger := plconta.items[i4].cdplconta;
                  mtbl.m.post;
                end;
                bo3 := false;
              end;
            end;
            if bo3 then
            begin
              adicionarNivel1;
              adicionarNivel2;
              AdicionarNivel3;
              mtbl.m.fieldbyname(_cdplconta).AsInteger := plconta.items[i3].cdplconta;
              mtbl.m.post;
            end;
            bo2 := false;
          end;
        end;
        if bo2 then
        begin
          adicionarNivel1;
          adicionarNivel2;
          mtbl.m.fieldbyname(_cdplconta).AsInteger := plconta.items[i2].cdplconta;
          mtbl.m.post;
        end;
        bo1 := false;
      end;
    end;
    if bo1 then
    begin
      adicionarNivel1;
      mtbl.m.fieldbyname(_cdplconta).AsInteger := plconta.items[i1].cdplconta;
      mtbl.m.post;
    end;
  end;
end;

function TReport.makesqlImposto(tbl, imposto: string): String;
begin
  result := 'select sum(it'+tbl+'.vl'+imposto+') '+
            'from '+tbl+' nota '+
            'inner join it'+tbl+' on it'+tbl+'.cdempresa=nota.cdempresa and nota.cd'+tbl+'=it'+tbl+'.cd'+tbl+' '+
            'where nota.cdempresa='+empresa.cdempresa.ToString+' and borecupera'+imposto+'=''S'' and ';
  if tbl = _saida then
  begin
    result := result + _dtemissao
  end
  else
  begin
    result := result + _dtsaida;
  end;
  result := result + ' ' + sqlwhere;
end;

procedure TReport.ProcessarImpostoSaida;
var
  q : TClasseQuery;
begin
  mtbl2.m.insert;
  mtbl2.m.fieldbyname(_vlicms+_entrada).AsCurrency   := RetornaSQLCurrency(makesqlImposto(_entrada, _icms))   + RetornaSQLCurrency(makesqlImposto(_saida, _icms));
  mtbl2.m.fieldbyname(_vlipi+_entrada).AsCurrency    := RetornaSQLCurrency(makesqlImposto(_entrada, _ipi))    + RetornaSQLCurrency(makesqlImposto(_saida, _ipi));
  mtbl2.m.fieldbyname(_vlpis+_entrada).AsCurrency    := RetornaSQLCurrency(makesqlImposto(_entrada, _pis))    + RetornaSQLCurrency(makesqlImposto(_saida, _pis));
  mtbl2.m.fieldbyname(_vlcofins+_entrada).AsCurrency := RetornaSQLCurrency(makesqlImposto(_entrada, _cofins)) + RetornaSQLCurrency(makesqlImposto(_saida, _cofins));

  q := tclasseQuery.create('select sum(i.vlicms)'+
                                 ',sum(i.vlipi)'+
                                 ',sum(i.vlcofins)'+
                                 ',sum(i.vlpis) '+
                           'from saida '+
                           'inner join itsaida i on i.cdempresa=saida.cdempresa and i.cdsaida=saida.cdsaida '+
                           'where saida.cdempresa='+empresa.cdempresa.tostring+' and saida.dtemissao '+sqlwhere+' and saida.tpentsai=''S''');

  mtbl2.m.fieldbyname(_vlicms+_saida).AsCurrency   := q.q.fields[0].ascurrency + RetornaSQLCurrency('select sum(vlicms) from cte where cdempresa='+empresa.cdempresa.tostring+' and dtemissao '+sqlwhere);
  mtbl2.m.fieldbyname(_vlipi+_saida).AsCurrency    := q.q.fields[1].ascurrency;
  mtbl2.m.fieldbyname(_vlpis+_saida).AsCurrency    := q.q.fields[3].ascurrency;
  mtbl2.m.fieldbyname(_vlcofins+_saida).AsCurrency := q.q.fields[2].ascurrency;
  mtbl2.m.post;
end;

procedure TReport.processarbaixa;
var
  I: Integer;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.Show;
    frmprogressbar.pnl.Caption := 'Lendo registros de baixa';
    Application.ProcessMessages;
    baixa.Ler(_dtbaixa+sqlwhere);
    frmprogressbar.gau.MaxValue := baixa.count;
    for I := 0 to baixa.Count - 1 do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if baixa.Items[i].cdduplicata > 0 then
      begin
        if baixa.Items[i].cdadntcliente = 0 then
        begin
          baixaduplicata(baixa.Items[i]);
        end;
      end
      else if baixa.Items[i].cdautpagto > 0 then
      begin
        if baixa.Items[i].cdadntfornecedor = 0 then
        begin
          baixaautpagto(baixa.Items[i]);
        end;
      end
      else if (baixa.Items[i].cdadntcliente > 0) and (baixa.Items[i].cdduplicata = 0) then
      begin
        BaixaMovbancario(baixa.Items[i]);
      end
      else if (baixa.Items[i].cdadntfornecedor > 0) and (baixa.Items[i].cdautpagto = 0) then
      begin
        BaixaMovbancario(baixa.Items[i]);
      end;
    end;
  finally
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TReport.BaixaMovbancario(value : TBaixa);
var
  movbancario : TMovBancario;
begin
  movbancario := TMovBancario.create;
  try
    if not movbancario.Select(value.cdmovbancario) then
    begin
      Exit;
    end;
    if movbancario.cdplconta = 0 then
    begin
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(movbancario.cdplconta, movbancario.vllancamento);
  finally
    FreeAndNil(movbancario);
  end;
end;

procedure TReport.BaixaDuplicata(value : TBaixa);
var
  d, s : Integer;
  I: Integer;
  valor : Currency;
begin
  d := duplicata.Indice(value.cdduplicata);
  if d = -1 then
  begin
    duplicata.New;
    d := duplicata.Count - 1;
    duplicata.Items[d].Select(value.cdduplicata);
  end;
  if duplicata.Items[d].cdsaida <> 0 then
  begin
    s := saida.Indice(duplicata.Items[d].cdsaida);
    if s = -1 then
    begin
      saida.New;
      s := saida.Count-1;
      saida.Items[s].Select(duplicata.Items[d].cdsaida);
      saida.Items[s].itsaida.Ler(duplicata.Items[d].cdsaida);
    end;
    for I := 0 to saida.Items[s].itsaida.Count - 1 do
    begin
      if saida.Items[s].itsaida.Items[i].cdplconta = 0 then
      begin
        MessageDlg('Não foi identificado o plano de contas no '+#13+
                   'Produto '+saida.Items[s].itsaida.Items[i].produto.cdproduto.ToString+' - '+saida.Items[s].itsaida.Items[i].produto.nmproduto+#13+
                   'da nota do contas a receber '+duplicata.Items[d].nuduplicata+'.', mtInformation, [mbOK], 0);
        Exit;
      end;
      if saida.Items[s].itsaida.Items[i].produto.cdproduto = 0 then
      begin
        saida.Items[s].itsaida.Items[i].produto.Select(saida.Items[s].itsaida.Items[i].cdproduto);
      end;
      valor := (value.vlbaixa / saida.Items[s].vltotal) * saida.Items[s].itsaida.Items[i].VlTotalGeral;
      AdicionarVlSaldoPlanoConta(saida.Items[s].itsaida.Items[i].cdplconta, valor);
    end;
  end
  else
  begin
    if duplicata.Items[d].cdplconta = 0 then
    begin
      MessageDlg('Não foi identificado o plano de contas no contas a receber '+duplicata.Items[d].nuduplicata+'.', mtInformation, [mbOK], 0);
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(duplicata.Items[d].cdplconta, value.vlbaixa);
  end;
end;

procedure TReport.BaixaAutpagto(value : TBaixa);
var
  d, s : Integer;
  I: Integer;
  valor : Currency;
begin
  d := autpagto.Indice(value.cdautpagto);
  if d = -1 then
  begin
    autpagto.New;
    d := autpagto.Count - 1;
    autpagto.Items[d].Select(value.cdautpagto);
  end;
  if autpagto.Items[d].cdentrada <> 0 then
  begin
    s := entrada.Indice(autpagto.Items[d].cdentrada);
    if s = -1 then
    begin
      entrada.New;
      s := entrada.Count-1;
      entrada.Items[s].Select(autpagto.Items[d].cdentrada);
      entrada.Items[s].itentrada.Ler(autpagto.Items[d].cdentrada);
    end;
    for I := 0 to entrada.Items[s].itentrada.Count - 1 do
    begin
      if entrada.Items[s].itentrada.Items[i].cdplconta = 0 then
      begin
        MessageDlg('Não foi identificado o plano de contas no '+#13+
                   'Produto '+entrada.Items[s].itentrada.Items[i].produto.cdproduto.ToString+' - '+entrada.Items[s].itentrada.Items[i].produto.nmproduto+#13+
                   'da nota do contas a pagar '+autpagto.Items[d].cdautpagto.ToString+'.', mtInformation, [mbOK], 0);
        Exit;
      end;
      if entrada.Items[s].itentrada.Items[i].produto.cdproduto = 0 then
      begin
        entrada.Items[s].itentrada.Items[i].produto.Select(entrada.Items[s].itentrada.Items[i].cdproduto);
      end;
      valor := (value.vlbaixa / entrada.Items[s].vltotal) * entrada.Items[s].itentrada.Items[i].VlTotalGeral;
      AdicionarVlSaldoPlanoConta(entrada.Items[s].itentrada.Items[i].cdplconta, valor);
    end;
  end
  else
  begin
    if autpagto.Items[d].cdplconta = 0 then
    begin
      MessageDlg('Não foi identificado o plano de contas no contas a pagar '+autpagto.Items[d].cdautpagto.ToString+'.', mtInformation, [mbOK], 0);
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(autpagto.Items[d].cdplconta, value.vlbaixa);
  end;
end;

procedure TReport.processarmovbancario;
var
  item : TMovBancario;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.Show;
    frmprogressbar.pnl.Caption := 'Lendo registros de movimento bancário';
    Application.ProcessMessages;
    movbancario.Ler('select movbancario.* '+
                    'from movbancario '+
                    'left join baixa on baixa.cdmovbancario=movbancario.cdmovbancario and baixa.cdempresa=movbancario.cdempresa '+
                    'where movbancario.cdplconta is not null '+
                    'and movbancario.cdempresa='+empresa.cdempresa.tostring+' '+
                    'and movbancario.cdmovimentacao<>11 '+
                    'and movbancario.cdmovimentacao<>12 '+
                    'and baixa.cdmovbancario is null '+
                    'and movbancario.dtemissao'+sqlwhere, true);
    frmprogressbar.gau.MaxValue := movbancario.lista.Count;
    for item in movbancario.lista do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      AdicionarVlSaldoPlanoConta(item.cdplconta, item.vllancamento);
    end;
  finally
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TReport.AdicionarVlSaldoPlanoConta(Pcdplconta: Integer; Pvltotal: Currency);
begin
  if plconta.Existe(pcdplconta)  then
  begin
    plconta.items[plconta.IndicePlconta(pcdplconta)].vlsaldo := plconta.items[plconta.IndicePlconta(pcdplconta)].vlsaldo + pvltotal;
  end
  else
  begin
    plconta.New;
    plconta.Items[plconta.Count-1].Select(pcdplconta);
    plconta.Items[plconta.Count-1].vlsaldo := pvltotal;
  end;
end;

end.
