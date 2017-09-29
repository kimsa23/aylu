unit orm.Norma;

interface

uses Classe.DAO;

type
  TNorma = class(TRegistroQuipos)
  private
    fcdnorma : integer;
    fnmnorma : string;
  public
    [keyfield]
    property cdnorma : integer read fcdnorma write fcdnorma;
    property nmnorma : string read fnmnorma write fnmnorma;
  end;

implementation

end.
