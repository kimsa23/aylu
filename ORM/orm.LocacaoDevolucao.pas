unit orm.LocacaoDevolucao;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  ORM.Empresa,
  Rotina.Retornasql,
  Classe.DAO, classe.gerar, classe.query;

type
  TLocacaoDevolucao = class(TRegistroQuipos)
  private
    Fnfdevolucao: integer;
    Fhrentrega: TTime;
    Fcdlocacao: integer;
    Fvlunitario: currency;
    Fdsobservacao: string;
    Fqtitem: integer;
    Fvltotal: currency;
    Fnudias: integer;
    Fdtentrega: TDate;
    Fcdlocacaodevolucao: integer;
  public
    [keyfield]
    property cdlocacaodevolucao : integer read Fcdlocacaodevolucao write fcdlocacaodevolucao;
    [fk]
    property cdlocacao : integer read Fcdlocacao write fcdlocacao;
    property qtitem : integer read Fqtitem write fqtitem;
    property vlunitario : currency read Fvlunitario write fvlunitario;
    property vltotal : currency read Fvltotal write fvltotal;
    property nudias : integer read Fnudias write fnudias;
    property dtentrega : TDate read Fdtentrega write fdtentrega;
    property hrentrega : TTime read Fhrentrega write fhrentrega;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property nfdevolucao : integer read Fnfdevolucao write fnfdevolucao;
    function Insert(boscript:boolean=false): String;
  end;
  TLocacaoDevolucaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TLocacaoDevolucao;
    procedure SetItem(Index: Integer; const Value: TLocacaoDevolucao);
  public
    function New: TLocacaoDevolucao;
    property Items[Index: Integer]: TLocacaoDevolucao read GetItem write SetItem;
    function Ler(codigo:Integer; boaberta:boolean=false):Boolean;overload;
    function Ler(dataset:TDataset):boolean;overload;
  end;

implementation

function TLocacaoDevolucaoList.GetItem(Index: Integer): TLocacaoDevolucao;
begin
  Result := TLocacaoDevolucao(Inherited Items[Index]);
end;

function TLocacaoDevolucaoList.Ler(codigo: Integer; boaberta:boolean=false): Boolean;
var
  q : TClasseQuery;
begin
  if boaberta then
  begin
    q := tclassequery.create('select l.* '+
                             'from locacaodevolucao l '+
                             'left join itsaida i on i.cdempresa=l.cdempresa and i.cdlocacaodevolucao=l.cdlocacaodevolucao '+
                             'where i.cdlocacaodevolucao is null and l.cdempresa='+empresa.cdempresa.ToString+' and l.cdlocacao='+inttostr(codigo));
  end
  else
  begin
    q := TClasseQuery.create(QRetornaSQL.get_select_from(_LocacaoDevolucao, codigo, _cdlocacao));
  end;
  try
    result := ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TLocacaoDevolucaoList.Ler(dataset: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TLocacaoDevolucaoList.New: TLocacaoDevolucao;
begin
  Result := TLocacaoDevolucao.Create;
  Add(Result);
end;

procedure TLocacaoDevolucaoList.SetItem(Index: Integer; const Value: TLocacaoDevolucao);
begin
  Put(Index, Value);
end;

function TLocacaoDevolucao.Insert(boscript: boolean): String;
begin
  if cdlocacaodevolucao = 0 then
  begin
    cdlocacaodevolucao := qgerar.GerarCodigo(_locacaodevolucao);
  end;
  result := inherited insert(boscript);
end;

end.
