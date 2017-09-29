unit orm.ItUfp1a;

interface

uses contnrs, System.Classes,
  Classe.DAO;

type
  TItUfp1a = class(TRegistroQuipos)
  private
    Fvlcontabil: currency;
    Ftpsaient: string;
    Fvlisentas: currency;
    Fvlbase: currency;
    Fcdlp1a: integer;
    Fvloutras: currency;
    Fcditufp1a: integer;
    Fvlimposto: currency;
    Fcduf: integer;
  public
    [keyfield]
    property cditufp1a : integer read Fcditufp1a write Fcditufp1a;
    [fk, aobrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk, aobrigatorio]
    property cduf : integer read Fcduf write Fcduf;
    property tpsaient : string read Ftpsaient write Ftpsaient;
    [aobrigatorio]
    property vlcontabil : currency read Fvlcontabil write Fvlcontabil;
    [aobrigatorio]
    property vlbase : currency read Fvlbase write Fvlbase;
    [aobrigatorio]
    property vloutras : currency read Fvloutras write Fvloutras;
    [aobrigatorio]
    property vlimposto : currency read Fvlimposto write Fvlimposto;
    [aobrigatorio]
    property vlisentas : currency read Fvlisentas write Fvlisentas;
  end;
  TItUfp1aList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItUfp1a;
    procedure SetItem(Index: Integer; const Value: TItUfp1a);
  public
    function New: TItUfp1a;
    property Items[Index: Integer]: TItUfp1a read GetItem write SetItem;
    function ObterIndice(cduf: integer; tpsaient: string):integer;
  end;

implementation

function TItUfp1aList.GetItem(Index: Integer): TItUfp1a;
begin
  Result := TItUfp1a(Inherited Items[Index]);
end;

function TItUfp1aList.New: TItUfp1a;
begin
  Result := TItUfp1a.Create;
  Add(Result);
end;

function TItUfp1aList.ObterIndice(cduf: integer; tpsaient: string): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if (items[i].cduf = cduf) and (items[i].tpsaient = tpsaient) then
    begin
      result := i;
    end;
  end;
end;

procedure TItUfp1aList.SetItem(Index: Integer; const Value: TItUfp1a);
begin
  Put(Index, Value);
end;

end.
