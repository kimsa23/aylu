unit orm.Itcondpagto;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Math, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
 TItcondpagto = class(TRegistroQuipos)
  private
    fcditcondpagto : Integer;
    fcdcondpagto : Integer;
    fnudias : Integer;
  public
    [keyfield]
    property cditcondpagto : Integer read fcditcondpagto write fcditcondpagto;
    property cdcondpagto : Integer read fcdcondpagto write fcdcondpagto;
    [AObrigatorio]
    property nudias : Integer read fnudias write fnudias;
  end;
  TItcondpagtoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItcondpagto;
    procedure SetItem(Index: Integer; const Value: TItcondpagto);
  public
    function New: TItcondpagto;
    property Items[Index: Integer]: TItcondpagto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
    function getNudiasAcumulado:string;
  end;

implementation

function TItcondpagtoList.GetItem(Index: Integer): TItcondpagto;
begin
  Result := TItcondpagto(Inherited Items[Index]);
end;

function TItcondpagtoList.getNudiasAcumulado: string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + ',';
    end;
    result := result + inttostr(items[i].nudias);
  end;
end;

function TItcondpagtoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcondpagto, codigo, _cdcondpagto));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItcondpagtoList.New: TItcondpagto;
begin
  Result := TItcondpagto.Create;
  Add(Result);
end;

procedure TItcondpagtoList.SetItem(Index: Integer; const Value: TItcondpagto);
begin
  Put(Index, Value);
end;

end.
