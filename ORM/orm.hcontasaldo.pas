unit orm.hcontasaldo;

interface

uses Classe.DAO;

type
  THContaSaldo = class(TRegistroQuipos)
  private
    fcdconta: Integer;
    fdthcontasaldo: TDate;
    fvlsaldo: Currency;
    fvlentrada: Currency;
    fvlsaida: Currency;
    fcdsthcontasaldo: Integer;
  public
    [KeyField]
    property cdconta: Integer read fcdconta write fcdconta;
    [KeyField]
    property dthcontasaldo: TDate read fdthcontasaldo write fdthcontasaldo;
    property vlsaldo: Currency read fvlsaldo write fvlsaldo;
    property vlentrada: Currency read fvlentrada write fvlentrada;
    property vlsaida: Currency read fvlsaida write fvlsaida;
    [AObrigatorio]
    property cdsthcontasaldo: Integer read fcdsthcontasaldo write fcdsthcontasaldo;
  end;

implementation

end.
