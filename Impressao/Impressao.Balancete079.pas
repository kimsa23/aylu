unit Impressao.Balancete079;

interface

uses
  System.Generics.Collections, Classes, SysUtils, DB, dialogs,
  uconstantes,
  orm.duplicata, orm.autpagto, orm.saida, orm.entrada, orm.movbancario, orm.plconta,
  orm.itentrada,
  classe.Query, orm.empresa, orm.ITSaida;

procedure Report079Balancete(mtbl: TDataClient; sqlwhere:string);

implementation

type
  TLista = class
  private
    fcdplconta: integer;
    fcdplcontapai: integer;
    fnunivel: string;
    fnmplconta: string;
    fvltotal: currency;
    fvlsaldo: currency;
  public
    property cdplconta: integer read fcdplconta write fcdplconta;
    property cdplcontapai: integer read fcdplcontapai write fcdplcontapai;
    property nunivel: string read fnunivel write fnunivel;
    property nmplconta: string read fnmplconta write fnmplconta;
    property vltotal: currency read fvltotal write fvltotal;
    property vlsaldo: currency read fvlsaldo write fvlsaldo;
  end;
  TReport = class
  private { private declarations }
    mtbl: TDataClient;
    sqlwhere : string;
    lista : tobjectlist<tlista>;
    plconta : TPlContaList;
    procedure CriarFields;
    procedure ProcessarItem(makesql: string; tbl:string='');
    function  MakesqlDebito: string;
    function  MakesqlCredito: string;
    function  MakesqlAutpagto: string;
    function  MakesqlDuplicata: string;
    procedure AdicionarNivelAscendente;
    procedure AdicionarNivelSuperior(cdplcontapai:integer);
    function  ExisteNivelPai(cdplcontapai:integer):boolean;
    procedure TransferirListaParaMemTable;
    procedure ProcessarItEntrada;
    procedure ProcessarItsaida;
    procedure AdicionarAoPlanoContasRelatorio(plano: TPlcontaList);
  public
    constructor create(mtbl21: TDataClient; sqlwhere2: string);
    destructor destroy; override;
    procedure  gerar;
  end;

procedure Report079Balancete(mtbl: TDataClient; sqlwhere:string);
var
  rpt : TReport;
begin
  rpt := TReport.create(mtbl, sqlwhere);
  try
    rpt.gerar;
  finally
    FreeAndNil(rpt);
  end;
end;

procedure TReport.AdicionarNivelAscendente;
var
  item: tlista;
  I: Integer;
  boexiste : boolean;
begin
  for I := 0 to plconta.count - 1 do
  begin
    boexiste := false;
    for item in Lista do
    begin
      if item.cdplconta = plconta.items[i].cdplconta then
      begin
        item.vlsaldo := plconta.items[i].vlsaldo;
        boexiste := true;
      end;
    end;
    if not boexiste then
    begin
      Lista.Add(TLista.Create);
      Lista[Lista.Count -1].cdplconta    := plconta.items[i].cdplconta;
      Lista[Lista.Count -1].cdplcontapai := plconta.items[i].cdplcontapai;
      Lista[Lista.Count -1].nunivel      := plconta.items[i].nunivel;
      Lista[Lista.Count -1].nmplconta    := plconta.items[i].nmplconta;
      Lista[Lista.Count -1].vlsaldo      := plconta.items[i].vlsaldo;
    end;
  end;
end;

procedure TReport.AdicionarNivelSuperior(cdplcontapai: integer);
var
  plconta : tplconta;
begin
  plconta := tplconta.create;
  try
    plconta.select(cdplcontapai);
    Lista.Add(TLista.Create);
    Lista[Lista.Count -1].cdplconta    := plconta.cdplconta;
    Lista[Lista.Count -1].cdplcontapai := plconta.cdplcontapai;
    Lista[Lista.Count -1].nunivel      := plconta.nunivel;
    Lista[Lista.Count -1].nmplconta    := plconta.nmplconta;
    if plconta.cdplcontapai <> 0 then
    begin
      if not ExisteNivelPai(plconta.cdplcontapai) then
      begin
        AdicionarNivelSuperior(plconta.cdplcontapai);
      end;
    end;
  finally
    freeandnil(plconta);
  end;
end;

constructor TReport.create(mtbl21: TDataClient; sqlwhere2: string);
begin
  mtbl     := mtbl21;
  sqlwhere := sqlwhere2;
  Lista    := TObjectList<Tlista>.Create;
  plconta  := TPlContaList.create;
end;

procedure TReport.CriarFields;
begin
  mtbl.m.FieldDefs.Clear;
  mtbl.m.FieldDefs.Add(_cdempresa   , ftLargeint);
  mtbl.m.FieldDefs.Add(_cdplconta   , ftinteger);
  mtbl.m.FieldDefs.Add(_cdplcontapai, ftinteger);
  mtbl.m.FieldDefs.Add(_nunivel     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta   , ftstring, 100);
  mtbl.m.FieldDefs.Add(_vltotal     , ftCurrency);
  mtbl.m.FieldDefs.Add(_vlsaldo     , ftCurrency);
  mtbl.m.IndexDefs.Add(_nunivel, _nunivel, []);
  mtbl.m.IndexName := _nunivel;
  mtbl.m.CreateDataSet;
end;

destructor TReport.destroy;
begin
  freeandnil(lista);
  freeandnil(plconta);
  inherited;
end;

function TReport.ExisteNivelPai(cdplcontapai: integer): boolean;
var
  item: tlista;
begin
  result := false;
  for item in Lista do
  begin
    if item.cdplconta = cdplcontapai then
    begin
      result := true;
      break;
    end;
  end;
end;

function TReport.MakesqlDebito:string;
begin
  result := 'select nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',nota.vllancamento vltotal '+
            'from movbancario nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtemissao'+sqlwhere+' and nota.cdnatureza=''D''';
end;

function TReport.MakesqlCredito:string;
begin
  result := 'select nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',nota.vllancamento vltotal '+
            'from movbancario nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtemissao'+sqlwhere+' and nota.cdnatureza=''C''';
end;

function TReport.MakesqlAutpagto:string;
begin
  result := 'select nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',nota.vlautpagto vltotal '+
            'from autpagto nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtprorrogacao'+sqlwhere+' and nota.cdentrada is null';
end;

function TReport.MakesqlDuplicata:string;
begin
  result := 'select nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',nota.vlduplicata vltotal '+
            'from duplicata nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtprorrogacao'+sqlwhere+' and nota.cdsaida is null';
end;

procedure TReport.gerar;
begin
  CriarFields;

  ProcessarItsaida;
  ProcessarItEntrada;

  processarItem(makesqldebito, _movbancario);
  processarItem(makesqlcredito, _movbancario);
  processarItem(makesqlautpagto, _autpagto);
  processarItem(makesqlduplicata, _duplicata);

  plconta.GerarRegistrosAscendentes;

  AdicionarNivelAscendente;

  TransferirListaParaMemTable;
end;

procedure TReport.ProcessarItem(makesql:string; tbl:string='');
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

procedure TReport.TransferirListaParaMemTable;
var
  item: tlista;
begin
  for item in Lista do
  begin
    mtbl.m.insert;
    mtbl.m.FieldByName(_cdempresa).AsLargeInt   := empresa.cdempresa;
    mtbl.m.FieldByName(_cdplconta).AsInteger    := item.cdplconta;
    mtbl.m.FieldByName(_cdplcontapai).AsInteger := item.cdplcontapai;
    mtbl.m.FieldByName(_nunivel).AsString       := item.nunivel;
    mtbl.m.FieldByName(_nmplconta).AsString     := item.nmplconta;
    mtbl.m.FieldByName(_vltotal).AsCurrency     := item.vltotal;
    mtbl.m.FieldByName(_vlsaldo).AsCurrency     := item.vlsaldo;
    mtbl.m.post;
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
            showmessage('Contas a receber '+duplicata.Items[i].nuduplicata+' foi possível processar.');
            break;
          end;
          if not plconta.Existe(itsaida.Items[y].cdplconta) then
          begin
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
          if not plconta.Existe(itentrada.Items[y].cdplconta) then
          begin
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

end.
