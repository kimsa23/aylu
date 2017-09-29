unit orm.TpGradeValor;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  orm.ItGradeValor,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TTpGradeValor = class(TRegistroQuipos)
  private
    fnmtpgradevalor: string;
    fcdtpgradevalor: integer;
    fitgradevalor: TItGradeValorList;
  public
    property itgradevalor : TItGradeValorList read fitgradevalor write fitgradevalor;
    [keyfield]
    property cdtpgradevalor : integer read fcdtpgradevalor write fcdtpgradevalor;
    property nmtpgradevalor : string read fnmtpgradevalor write fnmtpgradevalor;
    constructor create;
    destructor destroy; override;
  end;
  TTpGradeValorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TTpGradeValor;
    procedure SetItem(Index: Integer; const Value: TTpGradeValor);
  public
    function New: TTpGradeValor;
    property Items[Index: Integer]: TTpGradeValor read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Indice(cdtpgradevalor:integer):integer;
  end;

implementation

constructor TTpGradeValor.create;
begin
  inherited;
  fitgradevalor := titgradevalorlist.create;
end;

destructor TTpGradeValor.destroy;
begin
  freeandnil(fitgradevalor);
  inherited;
end;

function TTpGradeValorList.GetItem(Index: Integer): TTpGradeValor;
begin
  Result := TTpGradeValor(Inherited Items[Index]);
end;

function TTpGradeValorList.Indice(cdtpgradevalor: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if cdtpgradevalor = items[i].cdtpgradevalor then
    begin
      result := i;
      break;
    end;
  end;
end;

function TTpGradeValorList.Ler(DataSet: TDataset): boolean;
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

function TTpGradeValorList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_TpGradeValor, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TTpGradeValorList.New: TTpGradeValor;
begin
  Result := TTpGradeValor.Create;
  Add(Result);
end;

procedure TTpGradeValorList.SetItem(Index: Integer; const Value: TTpGradeValor);
begin
  Put(Index, Value);
end;

end.
