unit orm.Forma;

interface

uses Classe.DAO;

type
  TForma = class(TPersintentObject)
  private
    fcdforma : integer;
    fnmforma : string;
  public
    [keyfield]
    property cdforma : integer read fcdforma write fcdforma;
    property nmforma : string read fnmforma write fnmforma;
  end;

implementation

end.
