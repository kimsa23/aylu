unit orm.ItTurno;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItTurno = class(TRegistroQuipos)
  private
    Fhrtermino2: TTime;
    Fhrtermino1: TTime;
    Fhrinicio2: TTime;
    Fhrinicio1: TTime;
    Fcditturno: integer;
    Fcddia: integer;
    Fcdturno: integer;
  public
    [keyfield]
    property cditturno : integer read Fcditturno write Fcditturno;
    [fk]
    property cdturno : integer read Fcdturno write Fcdturno;
    [fk]
    property cddia : integer read Fcddia write Fcddia;
    property hrinicio1 : TTime read Fhrinicio1 write Fhrinicio1;
    property hrtermino1 : TTime read Fhrtermino1 write Fhrtermino1;
    property hrinicio2 : TTime read Fhrinicio2 write Fhrinicio2;
    property hrtermino2 : TTime read Fhrtermino2 write Fhrtermino2;
  end;
  TItTurnoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItTurno;
    procedure SetItem(Index: Integer; const Value: TItTurno);
  public
    function New: TItTurno;
    property Items[Index: Integer]: TItTurno read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Idia(dia:integer):integer;
  end;

implementation

function TItTurnoList.GetItem(Index: Integer): TItTurno;
begin
  Result := TItTurno(Inherited Items[Index]);
end;

function TItTurnoList.Idia(dia: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if items[i].cddia = dia then
    begin
      result := i;
      break;
    end;
  end;
end;

function TItTurnoList.Ler(DataSet: TDataset): boolean;
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

function TItTurnoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItTurno, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItTurnoList.New: TItTurno;
begin
  Result := TItTurno.Create;
  Add(Result);
end;

procedure TItTurnoList.SetItem(Index: Integer; const Value: TItTurno);
begin
  Put(Index, Value);
end;

end.
