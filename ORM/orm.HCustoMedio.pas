unit orm.HCustoMedio;

interface

uses Data.DB,
  Classe.DAO;

type
  THCustoMedio = class(TPersintentObject)
  private
    fqtestoque: Double;
    fvlcustomedio: Currency;
    fcdempresa: Largeint;
    fdthistorico: TDate;
    fcdproduto: Integer;
    fvlsaldovalor: Currency;
  public
    [KeyField]
    property cdempresa : Largeint read fcdempresa write fcdempresa;
    [keyfield]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    [AObrigatorio]
    property dthistorico : TDate read fdthistorico write fdthistorico;
    property vlcustomedio : Currency read fvlcustomedio write fvlcustomedio;
    property qtestoque : Double read fqtestoque write fqtestoque;
    property vlsaldovalor : Currency read fvlsaldovalor write fvlsaldovalor;
  end;

implementation

end.
