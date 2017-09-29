unit orm.ItGradeValor;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItGradeValor = class(TRegistroQuipos)
  private
    fcditgradevalor: integer;
    fvlgradevalor: currency;
    fnufaixafinal: double;
    fnufaixainicial: double;
    fcdproduto: integer;
    fcdtpgradevalor: integer;
  public
    [keyfield]
    property cditgradevalor : integer read fcditgradevalor write fcditgradevalor;
    [fk]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [fk]
    property cdtpgradevalor : integer read fcdtpgradevalor write fcdtpgradevalor;
    property nufaixainicial : double read fnufaixainicial write fnufaixainicial;
    property nufaixafinal : double read fnufaixafinal write fnufaixafinal;
    property vlgradevalor : currency read fvlgradevalor write fvlgradevalor;
  end;
  TItGradeValorList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItGradeValor;
    procedure SetItem(Index: Integer; const Value: TItGradeValor);
  public
    function New: TItGradeValor;
    property Items[Index: Integer]: TItGradeValor read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Valor(cdproduto: integer; qtitem:Double):Currency;
  end;

implementation

function TItGradeValorList.GetItem(Index: Integer): TItGradeValor;
begin
  Result := TItGradeValor(Inherited Items[Index]);
end;

function TItGradeValorList.Ler(DataSet: TDataset): boolean;
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

function TItGradeValorList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItGradeValor, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItGradeValorList.New: TItGradeValor;
begin
  Result := TItGradeValor.Create;
  Add(Result);
end;

procedure TItGradeValorList.SetItem(Index: Integer; const Value: TItGradeValor);
begin
  Put(Index, Value);
end;

function TItGradeValorList.Valor(cdproduto: integer; qtitem: Double): Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if (items[i].cdproduto = cdproduto) and (qtitem >= items[i].nufaixainicial) and (qtitem <= Items[i].nufaixafinal) then
    begin
      result := items[i].vlgradevalor;
      break;
    end;
  end;
end;

end.
