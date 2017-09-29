unit orm.Parcela;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Math, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query, classe.gerar;

type
 TParcela = class
 private
    fvalor: currency;
    fdtvencimento: TDate;
    fvlcomissao: Currency;
 public
   property dtvencimento : TDate read fdtvencimento write fdtvencimento;
   property valor: currency read fvalor write fvalor;
   property vlcomissao: Currency read fvlcomissao write fvlcomissao;
 end;
  TParcelaList = class(TObjectList)
  private
    fvalor: Currency;
    fnuparcela: Integer;
    fvlcomissao: Currency;
    function  GetItem(Index: Integer): TParcela;
    procedure SetItem(Index: Integer; const Value: TParcela);
  public
    function New: TParcela;
    property Items[Index: Integer]: TParcela read GetItem write SetItem;
    property valor: Currency read fvalor write fvalor;
    property vlcomissao: Currency read fvlcomissao write fvlcomissao;
    property nuparcela: Integer read fnuparcela write fnuparcela;
    procedure calculaValorParcelas;
    procedure ColocarParcelaICMSSubTribPrimeiro;
 end;

implementation

procedure TParcelaList.calculaValorParcelas;
var
  j : Integer;
  vlparcela, vloriginal, vltotal : currency;
  vlparcelacomissao, vloriginalcomissao, vltotalcomissao : Currency;
begin
  vltotal            := valor;
  vloriginal         := vltotal;
  vlparcela          := RoundTo(vltotal / nuparcela, -2);
  vltotalcomissao    := vlcomissao;
  vloriginalcomissao := vlcomissao;
  vlparcelacomissao  := RoundTo(vltotalcomissao / nuparcela, -2);
  for j := 0 to nuparcela - 1 do
  begin
    new;
    if j = nuparcela - 1 then
    begin
      Items[j].valor      := vloriginal;
      Items[j].vlcomissao := vloriginalcomissao;
      Exit;
    end;
    Items[j].valor      := vlparcela;
    Items[j].vlcomissao := vlparcelacomissao;
    vloriginal          := vloriginal - Items[j].valor;
    vloriginalcomissao  := vloriginalcomissao - Items[j].vlcomissao;
  end;
end;

procedure TParcelaList.ColocarParcelaICMSSubTribPrimeiro;
var
  parcela : TParcela;
  I: Integer;
begin
  parcela := TParcela.Create;
  try
    for I := count-1 downto 0 do
    begin
      if i = 0 then
      begin
        Break;
      end;
      parcela.dtvencimento := Items[i-1].dtvencimento;
      parcela.valor        := Items[i-1].valor;
      parcela.vlcomissao   := Items[i-1].vlcomissao;

      Items[i-1].dtvencimento := Items[i].dtvencimento;
      Items[i-1].valor        := Items[i].valor;
      Items[i-1].vlcomissao   := Items[i].vlcomissao;

      Items[i].dtvencimento := parcela.dtvencimento;
      Items[i].valor        := parcela.valor;
      Items[i].vlcomissao   := parcela.vlcomissao;
    end;
  finally
    FreeAndNil(parcela);
  end;
end;

function TParcelaList.GetItem(Index: Integer): TParcela;
begin
  Result := TParcela(Inherited Items[Index]);
end;

function TParcelaList.New: TParcela;
begin
  Result := TParcela.Create;
  Add(Result);
end;

procedure TParcelaList.SetItem(Index: Integer; const Value: TParcela);
begin
  Put(Index, Value);
end;

end.
