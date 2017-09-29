unit orm.ItRegCobranca;

interface

uses Classe.DAO;

type
  TItRegCobranca = class(TRegistroQuipos)
  private
    fdtagendamento: TDate;
    fdtcontato: TDate;
    fcdstregcobranca: Integer;
    fcditregcobranca: Integer;
    fcdregcobranca: Integer;
    fcdusuario: Integer;
    fvlsaldo: Currency;
    fdscontato: string;
  public
    [KeyField]
    property cditregcobranca : Integer read fcditregcobranca write fcditregcobranca;
    [fk, AObrigatorio]
    property cdregcobranca : Integer read fcdregcobranca write fcdregcobranca;
    [fk]
    property cdusuario : Integer read fcdusuario write fcdusuario;
    [fk]
    property cdstregcobranca : Integer read fcdstregcobranca write fcdstregcobranca;
    property dtcontato : TDate read fdtcontato write fdtcontato;
    property dtagendamento : TDate read fdtagendamento write fdtagendamento;
    property vlsaldo : Currency read fvlsaldo write fvlsaldo;
    property dscontato : string read fdscontato write fdscontato;
  end;

implementation

end.
