unit orm.Modbcsticms;

interface

uses Classe.DAO;

type
  TModbcsticms = class(TPersintentObject)
  protected
    Fnumodbcsticms: Integer;
    Fnmmodbcsticms: string;
    Fcdmodbcsticms: Integer;
  public
    [keyfield]
    property cdmodbcsticms : Integer read Fcdmodbcsticms write fcdmodbcsticms;
    property nmmodbcsticms : string read Fnmmodbcsticms write fnmmodbcsticms;
    property numodbcsticms : Integer read Fnumodbcsticms write fnumodbcsticms;
  end;

implementation

end.
