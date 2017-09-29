unit orm.TpAbono;

interface

uses Classe.DAO;

type
  TTpAbono = class(TRegistroQuipos)
  private
    Fboncestabasica: string;
    Fnucor: integer;
    Fbocalculartrabalho: string;
    Fcdtpabono: integer;
    Fidgrupoabono: string;
    Fbocalcularabono: string;
    Fqtncestabasica: integer;
    Fbocalculardebito: string;
    Fnmabreviado: string;
    Fbocalcularjustificada: string;
    Fnmtpabono: string;
  public
    [keyfield]
    property cdtpabono : integer read Fcdtpabono write Fcdtpabono;
    property nmtpabono : string read Fnmtpabono write Fnmtpabono;
    property nmabreviado : string read Fnmabreviado write Fnmabreviado;
    property bocalculardebito : string read Fbocalculardebito write Fbocalculardebito;
    property bocalcularjustificada : string read Fbocalcularjustificada write Fbocalcularjustificada;
    property bocalcularabono : string read Fbocalcularabono write Fbocalcularabono;
    property bocalculartrabalho : string read Fbocalculartrabalho write Fbocalculartrabalho;
    property boncestabasica : string read Fboncestabasica write Fboncestabasica;
    property qtncestabasica : integer read Fqtncestabasica write Fqtncestabasica;
    property idgrupoabono : string read Fidgrupoabono write Fidgrupoabono;
    property nucor : integer read Fnucor write Fnucor;
  end;

implementation

end.
