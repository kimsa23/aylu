unit orm.rateiocntcusto;

interface

uses
  Classe.DAO;

type
  TRateioCntCusto = class(TRegistroQuipos)
  private
    fcdstrateioCntcusto: integer;
    fnmrateioCntcusto: string;
    fcdrateioCntcusto: integer;
  public
    [KeyField]
    property cdrateioCntCusto: integer read fcdrateioCntcusto write fcdrateioCntcusto;
    [FK, AObrigatorio]
    property cdstrateioCntCusto: integer read fcdstrateioCntcusto write fcdstrateioCntcusto;
    [AObrigatorio]
    property nmrateioCntCusto: string read fnmrateioCntcusto write fnmrateioCntcusto;
  end;

implementation

end.
