unit orm.Lp1aAtivoPisCofins;

interface

uses contnrs, System.Classes,
  Classe.DAO;

type
  TLp1aAtivoPisCofins = class(TRegistroQuipos)
  private
    Fnuparcela: integer;
    Fcdativopiscofins: integer;
    Fcdlp1aativopiscofins: integer;
    Fvlbasepis: currency;
    Fvlbasecofins: currency;
    Fvlpis: currency;
    Fvlcofins: currency;
    Fcdlp1a: integer;
    Fvlsaldo: currency;
    Fvldeducao: currency;
  public
    [keyfield]
    property cdlp1aativopiscofins : integer read Fcdlp1aativopiscofins write Fcdlp1aativopiscofins;
    [fk, AObrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk, AObrigatorio]
    property cdativopiscofins : integer read Fcdativopiscofins write Fcdativopiscofins;
    [AObrigatorio]
    property nuparcela : integer read Fnuparcela write Fnuparcela;
    property vlbasepis : currency read Fvlbasepis write Fvlbasepis;
    property vlpis : currency read Fvlpis write Fvlpis;
    property vlbasecofins : currency read Fvlbasecofins write Fvlbasecofins;
    property vlcofins : currency read Fvlcofins write Fvlcofins;
    property vldeducao : currency read Fvldeducao write Fvldeducao;
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
  end;
  TLp1aAtivoPisCofinsList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TLp1aAtivoPisCofins;
    procedure SetItem(Index: Integer; const Value: TLp1aAtivoPisCofins);
  public
    function New: TLp1aAtivoPisCofins;
    property Items[Index: Integer]: TLp1aAtivoPisCofins read GetItem write SetItem;
  end;

implementation

function TLp1aAtivoPisCofinsList.GetItem(Index: Integer): TLp1aAtivoPisCofins;
begin
  Result := TLp1aAtivoPisCofins(Inherited Items[Index]);
end;

function TLp1aAtivoPisCofinsList.New: TLp1aAtivoPisCofins;
begin
  Result := TLp1aAtivoPisCofins.Create;
  Add(Result);
end;

procedure TLp1aAtivoPisCofinsList.SetItem(Index: Integer; const Value: TLp1aAtivoPisCofins);
begin
  Put(Index, Value);
end;

end.
