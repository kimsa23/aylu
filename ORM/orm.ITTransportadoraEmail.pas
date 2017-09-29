unit orm.ITTransportadoraEmail;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TITTransportadoraEmail = class(TRegistroQuipos)
  private
    Fcdtransportadora: largeint;
    Fcdittransportadoraemail: Integer;
    Femail: string;
  public
    [keyfield]
    property cdittransportadoraemail : Integer read Fcdittransportadoraemail write fcdittransportadoraemail;
    [fk]
    property cdtransportadora : largeint read Fcdtransportadora write fcdtransportadora;
    property email : string read Femail write femail;
  end;
  TittransportadoraemailList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tittransportadoraemail;
    procedure SetItem(Index: Integer; const Value: Tittransportadoraemail);
  public
    function Listaemail:string;
    function New: Tittransportadoraemail;
    property Items[Index: Integer]: Tittransportadoraemail read GetItem write SetItem;
    function Ler(codigo:Largeint):Boolean;
  end;

implementation

function TittransportadoraemailList.GetItem(Index: Integer): Tittransportadoraemail;
begin
  Result := Tittransportadoraemail(Inherited Items[Index]);
end;

function TittransportadoraemailList.Ler(codigo: LargeInt): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ittransportadoraemail, codigo.ToString, _cdtransportadora));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TittransportadoraemailList.Listaemail:string;
var
  i : Integer;
begin
  result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].email+#13;
  end;
end;

function TittransportadoraemailList.New: Tittransportadoraemail;
begin
  Result := Tittransportadoraemail.Create;
  Add(Result);
end;

procedure TittransportadoraemailList.SetItem(Index: Integer; const Value: Tittransportadoraemail);
begin
  Put(Index, Value);
end;

end.
