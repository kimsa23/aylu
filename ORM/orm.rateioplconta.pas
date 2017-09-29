unit orm.rateioplconta;

interface

uses
  Classe.DAO;

type
  TRateioPlconta = class(TRegistroQuipos)
  private
    fcdstrateioplconta: integer;
    fnmrateioplconta: string;
    fcdrateioplconta: integer;
  public
    [KeyField]
    property cdrateioplconta: integer read fcdrateioplconta write fcdrateioplconta;
    [FK, AObrigatorio]
    property cdstrateioplconta: integer read fcdstrateioplconta write fcdstrateioplconta;
    [AObrigatorio]
    property nmrateioplconta: string read fnmrateioplconta write fnmrateioplconta;
  end;

implementation

end.
