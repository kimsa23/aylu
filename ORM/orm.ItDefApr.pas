unit orm.ItDefApr;

interface

uses Classe.DAO;

type
  TItDefApr = class(TRegistroQuipos)
  private
    Fdsobservacao: string;
    Fcddefeito: integer;
    Fcditdefapr: integer;
    Fcdordserv: integer;
  public
    [keyfield]
    property cditdefapr : integer read Fcditdefapr write Fcditdefapr;
    [fk]
    property cdordserv : integer read Fcdordserv write Fcdordserv;
    [fk]
    property cddefeito : integer read Fcddefeito write Fcddefeito;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
  end;

implementation

end.
