unit orm.ItRegApuracao;

interface

uses contnrs, System.Classes,
  Classe.DAO;

type
  TItRegApuracao = class(TRegistroQuipos)
  private
    Fvlsaldodevedor: currency;
    Fvldressarcimento: currency;
    Fvldebito: currency;
    Fdsobservacao: string;
    Fcdtpimposto: integer;
    Fvlsaldocredor: currency;
    Fvlcestorno: currency;
    Fvlcsubtotal: currency;
    Fvldestorno: currency;
    Fvlctotal: currency;
    Fvlcsaldocredor: currency;
    Fcdlp1a: integer;
    Fvldeducoes: currency;
    Fvlcoutros: currency;
    Fvldtotal: currency;
    Fvlcredito: currency;
    Fcditregapuracao: integer;
    Fvlimposto: currency;
    Fvldoutros: currency;
  public
    [keyfield]
    property cditregapuracao : integer read Fcditregapuracao write Fcditregapuracao;
    [fk, AObrigatorio]
    property cdlp1a : integer read Fcdlp1a write Fcdlp1a;
    [fk, AObrigatorio]
    property cdtpimposto : integer read Fcdtpimposto write Fcdtpimposto;
    [AObrigatorio]
    property vldebito : currency read Fvldebito write Fvldebito;
    [AObrigatorio]
    property vldoutros : currency read Fvldoutros write Fvldoutros;
    [AObrigatorio]
    property vldestorno : currency read Fvldestorno write Fvldestorno;
    [AObrigatorio]
    property vldtotal : currency read Fvldtotal write Fvldtotal;
    [AObrigatorio]
    property vlcredito : currency read Fvlcredito write Fvlcredito;
    [AObrigatorio]
    property vlcoutros : currency read Fvlcoutros write Fvlcoutros;
    [AObrigatorio]
    property vlcestorno : currency read Fvlcestorno write Fvlcestorno;
    [AObrigatorio]
    property vlcsubtotal : currency read Fvlcsubtotal write Fvlcsubtotal;
    [AObrigatorio]
    property vlcsaldocredor : currency read Fvlcsaldocredor write Fvlcsaldocredor;
    [AObrigatorio]
    property vlctotal : currency read Fvlctotal write Fvlctotal;
    [AObrigatorio]
    property vlsaldodevedor : currency read Fvlsaldodevedor write Fvlsaldodevedor;
    [AObrigatorio]
    property vldeducoes : currency read Fvldeducoes write Fvldeducoes;
    [AObrigatorio]
    property vlimposto : currency read Fvlimposto write Fvlimposto;
    [AObrigatorio]
    property vlsaldocredor : currency read Fvlsaldocredor write Fvlsaldocredor;
    property vldressarcimento : currency read Fvldressarcimento write Fvldressarcimento;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
  end;
  TItRegApuracaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRegApuracao;
    procedure SetItem(Index: Integer; const Value: TItRegApuracao);
  public
    function New: TItRegApuracao;
    property Items[Index: Integer]: TItRegApuracao read GetItem write SetItem;
  end;

implementation

function TItRegApuracaoList.GetItem(Index: Integer): TItRegApuracao;
begin
  Result := TItRegApuracao(Inherited Items[Index]);
end;

function TItRegApuracaoList.New: TItRegApuracao;
begin
  Result := TItRegApuracao.Create;
  Add(Result);
end;

procedure TItRegApuracaoList.SetItem(Index: Integer; const Value: TItRegApuracao);
begin
  Put(Index, Value);
end;

end.
