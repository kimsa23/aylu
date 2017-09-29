unit ORM.TpFrete;

interface

uses sysutils,
  classe.dao,
  uconstantes;

Type
  Ttpfrete = class(TPersintentObject)
  private
    Fnmtpfrete: string;
    Fcdtpfrete: integer;
  public
    [keyfield]
    property cdtpfrete : integer read Fcdtpfrete write fcdtpfrete;
    property nmtpfrete : string read Fnmtpfrete write fnmtpfrete;
  end;

implementation

end.
