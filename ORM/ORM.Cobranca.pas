unit ORM.Cobranca;

interface

uses
  controls, classes, sysutils, dialogs, Contnrs, db,
  rotina.Rotinas, dialogo.progressbar, rotina.system, rotina.strings, rotina.datahora, rotina.registro,
  uconstantes,
  rotina.retornasql, orm.empresa, orm.conta, classe.aplicacao, classe.registrainformacao,
  classe.executasql, classe.gerar, classe.query, classe.dao, orm.ItCobranca;

Type
  TCobranca = class(TRegistroQuipos)
  private
    Fnuremessa: integer;
    Fcdsetboleto: integer;
    Fdtemissao: TDate;
    Fcdcobranca: integer;
    Fitcobranca: titcobrancalist;
  public
    property itcobranca : titcobrancalist read Fitcobranca write fitcobranca;
    [keyfield]
    property cdcobranca : integer read Fcdcobranca write fcdcobranca;
    property nuremessa : integer read Fnuremessa write fnuremessa;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    [fk]
    property cdsetboleto : integer read Fcdsetboleto write fcdsetboleto;
    constructor create;
    destructor destroy; override;
    function gerar_Cobranca_Faturamento(cdfaturamento:string):boolean;
    function Insert(boscript:boolean=false): String;
  end;

implementation

constructor TCobranca.create;
begin
  inherited;
  fitcobranca := titcobrancalist.create;
end;

destructor TCobranca.destroy;
begin
  freeandnil(fitcobranca);
  inherited;
end;

function TCobranca.gerar_Cobranca_Faturamento(cdfaturamento: string): boolean;
var
  sql : tstringlist;
  q : TClasseQuery;
begin
  sql := tstringlist.create;
  q   := TClasseQuery.Create('select d.cdduplicata,d.nuduplicata '+
                             'from duplicata d '+
                             'inner join itfatsaida i on i.cdsaida=d.cdsaida and d.cdempresa=i.cdempresa '+
                             'where d.cdempresa='+empresa.cdempresa.ToString+' and d.nunossonumero is not null and i.cdfaturamento='+cdfaturamento);
  try
    cdsetboleto := qregistro.InteirodoCodigo(_faturamento, cdfaturamento, _cdsetboleto);
    sql.add(Insert(true));
    while not q.q.Eof do
    begin
      itcobranca.New;
      itcobranca.Items[itcobranca.Count-1].cdcobranca := cdcobranca;
      itcobranca.Items[itcobranca.Count-1].cdduplicata := q.q.fieldbyname(_cdduplicata).asinteger;
      itcobranca.Items[itcobranca.Count-1].nuduplicata := q.q.fieldbyname(_nuduplicata).asstring;
      sql.Add(itcobranca.Items[itcobranca.Count-1].Insert(true));
      q.q.next;
    end;
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
    freeandnil(q);
  end;
end;

function TCobranca.Insert(boscript: boolean): String;
begin
  if dtemissao = 0 then
  begin
    dtemissao := dtbanco;
  end;
  if cdcobranca = 0 then
  begin
    cdcobranca := QGerar.GerarCodigo(_cobranca);
  end;
  result := inherited insert(boscript);
end;

end.
