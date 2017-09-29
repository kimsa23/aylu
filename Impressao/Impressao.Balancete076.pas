unit Impressao.Balancete076;

interface

uses
  System.Generics.Collections, Classes, SysUtils, DB,
  uconstantes,
  orm.plconta, classe.Query, orm.empresa;

procedure Report076Balancete(mtbl: TDataClient; sqlwhere:string);

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
    function  MakesqlNota(tbl:string):string;
    function  MakesqlDebito: string;
    function  MakesqlCredito: string;
    function  MakesqlAutpagto: string;
    function  MakesqlDuplicata: string;
    procedure AdicionarNivelAscendente;
    procedure AdicionarNivelSuperior(cdplcontapai:integer);
    function  ExisteNivelPai(cdplcontapai:integer):boolean;
    procedure TransferirListaParaMemTable;
  public
    constructor create(mtbl21: TDataClient; sqlwhere2: string);
    destructor destroy; override;
    procedure  gerar;
  end;

procedure Report076Balancete(mtbl: TDataClient; sqlwhere:string);
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

function TReport.MakesqlNota(tbl: string): string;
begin
  result := 'SELECT item.cdplconta'+
                  ',item.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',item.VLTOTAL+coalesce(item.vlicmssubtrib,0)+coalesce(item.vlipi,0)+coalesce(item.vlfrete,0)-coalesce(item.vldesconto,0) vltotal '+
             'FROM '+tbl+' nota  '+
             'inner JOIN it'+tbl+' item on item.cdempresa=nota.cdempresa and item.cd'+tbl+'=nota.cd'+tbl+' '+
             'inner join plconta on plconta.cdempresa=item.cdempresa and plconta.cdplconta=item.cdplconta '+
             sqlwhere;
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
            sqlwhere+' and nota.cdnatureza=''D''';
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
            sqlwhere+' and nota.cdnatureza=''C''';
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
            sqlwhere+' and nota.cdentrada is null';
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
            sqlwhere+' and nota.cdsaida is null';
end;

procedure TReport.gerar;
begin
  CriarFields;

  ProcessarItem(MakesqlNota(_entrada));
  processarItem(MakesqlNota(_saida));
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

end.