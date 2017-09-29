unit Impressao.DRE077;

interface

uses
  Classes, SysUtils, DB, dialogs,
  uconstantes, rotina.registro,
  orm.itentrada, orm.plconta, orm.duplicata, orm.saida, orm.autpagto, orm.entrada,
  orm.empresa, classe.Query, rotina.retornasql, orm.ITSaida;

procedure Report077DRE(mtbl, mtbl2: TDataClient; sqlwhere:string);

implementation

type
  TReport = class
  private { private declarations }
    plconta : TPlContaList;
    mtbl: TDataClient;
    mtbl2: TDataClient;
    sqlwhere : string;
    procedure CriarFields;
    procedure CriarFields2;
    procedure ProcessarImpostoSaida;
    function  makesqlImposto(tbl, imposto:string):String;
    procedure ProcessarItem(makesql: string);
    procedure AdicionarAoPlanoContasRelatorio(plano:TPlcontaList);
    procedure ProcessarItsaida;
    procedure ProcessarItEntrada;
    procedure InserirInformaçãoPlConta;
    procedure inserirRegistroObjetoDataset;
  public
    constructor create(mtbl21, mtbl22: TDataClient; sqlwhere2: string);
    destructor  destroy; override;
    procedure   gerar;
  end;

procedure Report077DRE(mtbl, mtbl2: TDataClient; sqlwhere:string);
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
end;

procedure TReport.gerar;
begin
  CriarFields;

  ProcessarItsaida;
  ProcessarItEntrada;

  processarItem('select cdplconta,sum(vllancamento) vltotal from movbancario where cdempresa='+empresa.cdempresa.ToString+' and dtemissao '+sqlwhere+' and cdplconta is not null and cdnatureza=''D'' group by cdplconta');
  processarItem('select cdplconta,sum(vllancamento) vltotal from movbancario where cdempresa='+empresa.cdempresa.ToString+' and dtemissao '+sqlwhere+' and cdplconta is not null and cdnatureza=''C'' group by cdplconta');
  processarItem('select cdplconta,sum(vlautpagto) vltotal from autpagto nota where cdempresa='+empresa.cdempresa.ToString+' and dtprorrogacao '+sqlwhere+' and cdentrada is null and cdplconta is not null group by cdplconta');
  processarItem('select cdplconta,sum(vlduplicata) vltotal from duplicata where cdempresa='+empresa.cdempresa.ToString+' and dtprorrogacao '+sqlwhere+' and cdsaida is null and cdplconta is not null group by cdplconta');

  InserirInformaçãoPlConta;
  plconta.GerarRegistrosAscendentes;
  inserirRegistroObjetoDataset;
  mtbl.m.IndexName := _nunivel;
  CriarFields2;
  ProcessarImpostoSaida;
end;

procedure TReport.AdicionarAoPlanoContasRelatorio(plano: TPlcontaList);
var
  I: Integer;
begin
  for I := 0 to plano.Count - 1 do
  begin
    if plconta.Existe(plano.Items[i].cdplconta)  then
    begin
      plconta.items[plconta.IndicePlconta(plano.Items[i].cdplconta)].vlsaldo := plconta.items[plconta.IndicePlconta(plano.Items[i].cdplconta)].vlsaldo + plano.Items[i].vlsaldo;
    end
    else
    begin
      with plconta.New do
      begin
        Select(plano.Items[i].cdplconta);
        vlsaldo := plano.Items[i].vlsaldo;
      end;
    end;
  end;
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

procedure TReport.ProcessarItem(makesql:string);
var
  q : TClasseQuery;
begin
  q := tclassequery.create(makesql);
  try
    while not q.q.eof do
    begin
      if plconta.Existe(q.q.fieldbyname(_cdplconta).asinteger)  then
      begin
        plconta.items[plconta.IndicePlconta(q.q.fieldbyname(_cdplconta).asinteger)].vlsaldo := plconta.items[plconta.IndicePlconta(q.q.fieldbyname(_cdplconta).asinteger)].vlsaldo + q.q.fieldbyname(_vltotal).ascurrency;
      end
      else
      begin
        with plconta.New do
        begin
          Select(q.q.fieldbyname(_cdplconta).asinteger);
          vlsaldo := q.q.fieldbyname(_vltotal).ascurrency;
        end;
      end;
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

procedure TReport.ProcessarItEntrada;
var
  autpagto : tautpagtolist;
  itentrada : titentradalist;
  plconta : TPlContaList;
  y, x, I: Integer;
  porcentagem : double;
begin
  autpagto := tautpagtolist.Create;
  try
    if not autpagto.Ler('cdentrada is not null and dtprorrogacao '+sqlwhere) then
    begin
      exit;
    end;
    for I := 0 to autpagto.Count - 1 do
    begin
      itentrada := titentradalist.Create;
      plconta   := tplcontalist.Create;
      try
        if not itentrada.Ler(autpagto.Items[i].cdentrada) then
        begin
          continue;
        end;
        for y := 0 to itentrada.Count - 1 do
        begin
          if itentrada.Items[y].cdplconta = 0 then
          begin
            showmessage('Contas a pagar '+autpagto.Items[i].cdautpagto.ToString+' foi possível processar.'#13+
                        'Porque não está identificado o plano de contas no produto'#13+
                        itentrada.Items[y].cddigitado+' - '+qregistro.NomedoCodigo(_produto, itentrada.Items[y].cdproduto));
            //break;
          end;
          if not plconta.Existe(itentrada.Items[y].cdplconta) then
          begin
            if RegistroExiste(_plconta, _cdplcontapai+'='+itentrada.Items[y].cdplconta.ToString) then
            begin
              showmessage('No Contas a pagar '+autpagto.Items[i].cdautpagto.ToString+' foi usado o plano de contas '+itentrada.Items[y].nuplconta+#13+
                          'que possui subnívelno produto'#13+
                          itentrada.Items[y].cddigitado+' - '+qregistro.NomedoCodigo(_produto, itentrada.Items[y].cdproduto));
              //break;
            end;
            plconta.New;
            plconta.Items[plconta.Count-1].cdplconta := itentrada.Items[y].cdplconta;
          end;
          x                        := plconta.IndicePlconta(itentrada.Items[y].cdplconta);
          plconta.Items[x].vlsaldo := plconta.Items[x].vlsaldo + itentrada.Items[y].VlTotalGeral;
        end;
        porcentagem := autpagto.items[i].vlautpagto / plconta.vlsaldo;
        plconta.ReduzirSaldoPelaPorcentagem(porcentagem);
        AdicionarAoPlanoContasRelatorio(plconta);
      finally
        freeandnil(itentrada);
        freeandnil(plconta);
      end;
    end;
  finally
    freeandnil(autpagto);
  end;
end;

procedure TReport.ProcessarItsaida;
var
  duplicata : tduplicatalist;
  itsaida   : titsaidalist;
  plconta   : TPlContaList;
  y, x, I: Integer;
  porcentagem : double;
begin
  duplicata := tduplicatalist.Create;
  try
    if not duplicata.Ler('cdsaida is not null and dtprorrogacao '+sqlwhere) then
    begin
      exit;
    end;
    for I := 0 to duplicata.Count - 1 do
    begin
      itsaida := titsaidalist.Create;
      plconta := tplcontalist.Create;
      try
        if not itsaida.Ler(duplicata.Items[i].cdsaida) then
        begin
          continue;
        end;
        for y := 0 to itsaida.Count - 1 do
        begin
          if itsaida.Items[y].cdplconta = 0 then
          begin
            showmessage('Contas a receber '+duplicata.Items[i].nuduplicata+' foi possível processar.'#13+
                        'Porque não está identificado o plano de contas no produto'#13+
                        itsaida.Items[y].cddigitado+' - '+qregistro.NomedoCodigo(_produto, itsaida.Items[y].cdproduto));
            //break;
          end;
          if not plconta.Existe(itsaida.Items[y].cdplconta) then
          begin
            if RegistroExiste(_plconta, _cdplcontapai+'='+itsaida.Items[y].cdplconta.ToString) then
            begin
              showmessage('No Contas a receber '+duplicata.Items[i].nuduplicata+' foi usado o plano de contas '+itsaida.Items[y].nuplconta+#13+
                          'que possui subnívelno produto'#13+
                          itsaida.Items[y].cddigitado+' - '+qregistro.NomedoCodigo(_produto, itsaida.Items[y].cdproduto));
              //break;
            end;
            plconta.New;
            plconta.Items[plconta.Count-1].cdplconta := itsaida.Items[y].cdplconta;
          end;
          x                        := plconta.IndicePlconta(itsaida.Items[y].cdplconta);
          plconta.Items[x].vlsaldo := plconta.Items[x].vlsaldo + itsaida.Items[y].VlTotalGeral;
        end;
        porcentagem := duplicata.items[i].vlduplicata / plconta.vlsaldo;
        plconta.ReduzirSaldoPelaPorcentagem(porcentagem);
        AdicionarAoPlanoContasRelatorio(plconta);
      finally
        freeandnil(itsaida);
        freeandnil(plconta);
      end;
    end;
  finally
    freeandnil(duplicata);
  end;
end;

end.
