unit orm.Modbcicms;

interface

uses Classe.DAO;

type
  TModbcicms = class(TPersintentObject)
  protected
    Fnumodbcicms: Integer;
    Fnmmodbcicms: string;
    Fcdmodbcicms: Integer;
  public
    [keyfield]
    property cdmodbcicms : Integer read Fcdmodbcicms write fcdmodbcicms;
    property nmmodbcicms : string read Fnmmodbcicms write fnmmodbcicms;
    property numodbcicms : Integer read Fnumodbcicms write fnumodbcicms;
  end;

implementation

end.
