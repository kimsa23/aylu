unit orm.TpTemporizador;

interface

uses Classe.DAO;

type
  TTpTemporizador = class(TPersintentObject)
  private
    Fnmtptemporizador: string;
    Fcdtptemporizador: integer;
  public
    property cdtptemporizador : integer read Fcdtptemporizador write Fcdtptemporizador;
    property nmtptemporizador : string read Fnmtptemporizador write Fnmtptemporizador;
  end;

implementation

end.
