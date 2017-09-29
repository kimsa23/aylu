unit orm.TpModulo;

interface

uses Classe.DAO;

type
  TTpModulo = class(TPersintentObject)
  private
    Fcdtpmodulo: integer;
    Fcdnatureza: string;
    Fnmtpmodulo: string;
  public
    [keyfield]
    property cdtpmodulo : integer read Fcdtpmodulo write fcdtpmodulo;
    [AObrigatorio]
    property nmtpmodulo : string read Fnmtpmodulo write fnmtpmodulo;
    [AObrigatorio]
    property cdnatureza : string read Fcdnatureza write fcdnatureza;
  end;

implementation

end.
