unit orm.TpMDFE;

interface

uses Classe.DAO;

type
  TTpMDFE = class(TRegistroQuipos)
  private
    fcdtpmdfe : integer;
    fcdserie : integer;
    fcdveiculo : integer;
    fcduf : Integer;
    fcdmdfetpemitente : integer;
    fcdmdfemodalidade : integer;
    fcdmdfeformaemissao : Integer;
    fcdunidade : Integer;
    fnmtpmdfe : string;
  public
    [keyfield]
    property cdtpmdfe : integer read fcdtpmdfe write fcdtpmdfe;
    [fk]
    property cdveiculo : integer read fcdveiculo write fcdveiculo;
    [fk]
    property cduf : Integer read fcduf write fcduf;
    [fk]
    property cdserie : integer read Fcdserie write Fcdserie;
    [fk]
    property cdmdfetpemitente : integer read fcdmdfetpemitente write fcdmdfetpemitente;
    [fk]
    property cdmdfemodalidade : integer read fcdmdfemodalidade write fcdmdfemodalidade;
    [fk]
    property cdmdfeformaemissao : integer read fcdmdfeformaemissao write fcdmdfeformaemissao;
    [fk]
    property cdunidade : Integer read fcdunidade write fcdunidade;
    property nmtpmdfe : string read fnmtpmdfe write fnmtpmdfe;
  end;

implementation

end.
