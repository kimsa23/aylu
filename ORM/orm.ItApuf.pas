unit orm.ItApuf;

interface

uses contnrs, System.Classes,
  Classe.DAO;

type
  TItApuf = class(TRegistroQuipos)
  private
    Fcditapuf: integer;
    Fvlcontabil: currency;
    Ftpsaient: string;
    Fcdtpimposto: integer;
    Fvlisentas: currency;
    Fvlbase: currency;
    Fcdlp1a: integer;
    Fvloutras: currency;
    Fvlimposto: currency;
  public
   [keyfield]
    property cditapuf : integer read Fcditapuf write Fcditapuf;
    [fk]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk, aobrigatorio]
    property cdtpimposto : integer read Fcdtpimposto write Fcdtpimposto;
    property tpsaient : string read Ftpsaient write Ftpsaient;
    [aobrigatorio]
    property vlcontabil : currency read Fvlcontabil write Fvlcontabil;
    [aobrigatorio]
    property vlbase : currency read Fvlbase write Fvlbase;
    [aobrigatorio]
    property vlimposto : currency read Fvlimposto write Fvlimposto;
    [aobrigatorio]
    property vlisentas : currency read Fvlisentas write Fvlisentas;
    [aobrigatorio]
    property vloutras : currency read Fvloutras write Fvloutras;
  end;
  TItApufList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItApuf;
    procedure SetItem(Index: Integer; const Value: TItApuf);
  public
    function New: TItApuf;
    property Items[Index: Integer]: TItApuf read GetItem write SetItem;
  end;

implementation

function TItApufList.GetItem(Index: Integer): TItApuf;
begin
  Result := TItApuf(Inherited Items[Index]);
end;

function TItApufList.New: TItApuf;
begin
  Result := TItApuf.Create;
  Add(Result);
end;

procedure TItApufList.SetItem(Index: Integer; const Value: TItApuf);
begin
  Put(Index, Value);
end;

end.
