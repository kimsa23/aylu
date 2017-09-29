unit orm.ItAcessorio;

interface

uses Classe.DAO;

type
  TItAcessorio = class(TRegistroQuipos)
  private
    Fcditacessorio: integer;
    Fcdacessorio: integer;
    Fqtitem: integer;
    Fcdordserv: integer;
  public
    [keyfield]
    property cditacessorio : integer read Fcditacessorio write Fcditacessorio;
    [fk]
    property cdordserv : integer read Fcdordserv write Fcdordserv;
    [fk]
    property cdacessorio : integer read Fcdacessorio write Fcdacessorio;
    property qtitem : integer read Fqtitem write Fqtitem;
  end;

implementation

end.
