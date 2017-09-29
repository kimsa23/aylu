unit orm.TpEmbarque;

interface

uses Classe.DAO;

type
  TTpEmbarque = class(TRegistroQuipos)
  private
    fcdtpembarque : integer;
    fcdctetptomador : integer;
    fcdproduto : integer;
    fcdcondpagto : Integer;
    fcdctetpprevisaoentrega : integer;
    fcdctetpprevisaoentregah : integer;
    fnmtpembarque : string;
  public
    [keyfield]
    property cdtpembarque : integer read fcdtpembarque write fcdtpembarque;
    [fk]
    property cdctetptomador : integer read fcdctetptomador write fcdctetptomador;
    [fk]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [fk]
    property cdcondpagto : Integer read fcdcondpagto write fcdcondpagto;
    [fk]
    property cdctetpprevisaoentrega : integer read fcdctetpprevisaoentrega write fcdctetpprevisaoentrega;
    [fk]
    property cdctetpprevisaoentregah : integer read fcdctetpprevisaoentregah write fcdctetpprevisaoentregah;
    property nmtpembarque : string read fnmtpembarque write fnmtpembarque;
  end;

implementation

end.
