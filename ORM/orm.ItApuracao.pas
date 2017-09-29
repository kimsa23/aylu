unit orm.ItApuracao;

interface

uses contnrs, System.Classes,
  Classe.DAO;

type
  TItApuracao = class(TRegistroQuipos)
  private
    Fvlcontabil: currency;
    Fcdcfop: integer;
    Fvloutroscreditos: currency;
    Ftpsaient: string;
    Fcdtpimposto: integer;
    Fvlisentas: currency;
    Fcditapuracao: integer;
    Fvloutrosdebitos: currency;
    Fvlbase: currency;
    Fcdlp1a: integer;
    Fvloutras: currency;
    Fvlimposto: currency;
  public
    [keyfield]
    property cditapuracao : integer read Fcditapuracao write Fcditapuracao;
    [fk, aobrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk, aobrigatorio]
    property cdtpimposto : integer read Fcdtpimposto write Fcdtpimposto;
    [fk]
    property cdcfop : integer read Fcdcfop write Fcdcfop;
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
    property vloutroscreditos : currency read Fvloutroscreditos write Fvloutroscreditos;
    property vloutrosdebitos : currency read Fvloutrosdebitos write Fvloutrosdebitos;
  end;
  TItApuracaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItApuracao;
    procedure SetItem(Index: Integer; const Value: TItApuracao);
  public
    function New: TItApuracao;
    property Items[Index: Integer]: TItApuracao read GetItem write SetItem;
  end;

implementation

function TItApuracaoList.GetItem(Index: Integer): TItApuracao;
begin
  Result := TItApuracao(Inherited Items[Index]);
end;

function TItApuracaoList.New: TItApuracao;
begin
  Result := TItApuracao.Create;
  Add(Result);
end;

procedure TItApuracaoList.SetItem(Index: Integer; const Value: TItApuracao);
begin
  Put(Index, Value);
end;

end.
