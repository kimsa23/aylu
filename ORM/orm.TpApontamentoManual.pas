unit orm.TpApontamentoManual;

interface

uses Classe.DAO;

type
  TTpApontamentoManual = class(TRegistroQuipos)
  private
    fcdtpapontamentomanual : Integer;
    fnmtpapontamentomanual : string;
    ftpview: string;
    Fbodsobservacao: String;
    Fboestanqueidade: String;
    Fbotpestado: String;
    Fborosca: String;
    Fboinicio: String;
    Fbotermino: String;
    Fbofuncionario: String;
    Fbohrretrabalho: String;
    Fbonucurva: String;
    Fbohrinicio: String;
    Fbohrfim: String;
    fbonuestruturalantigo: string;
    fboresponsavel: string;
  public
    [keyfield]
    property cdtpapontamentomanual : Integer read fcdtpapontamentomanual write fcdtpapontamentomanual;
    property nmtpapontamentomanual : string read fnmtpapontamentomanual write fnmtpapontamentomanual;
    property tpview : string read ftpview write ftpview;
    property boestanqueidade : String read Fboestanqueidade write fboestanqueidade;
    property botpestado : String read Fbotpestado write fbotpestado;
    property borosca : String read Fborosca write fborosca;
    property bodsobservacao : String read Fbodsobservacao write fbodsobservacao;
    property boinicio : String read Fboinicio write fboinicio;
    property botermino : String read Fbotermino write fbotermino;
    property bofuncionario : String read Fbofuncionario write fbofuncionario;
    property bohrretrabalho : String read Fbohrretrabalho write fbohrretrabalho;
    property bonucurva : String read Fbonucurva write Fbonucurva;
    property bohrinicio : String read Fbohrinicio write Fbohrinicio;
    property bohrfim : String read Fbohrfim write Fbohrfim;
    property bonuestruturalantigo : string read fbonuestruturalantigo write fbonuestruturalantigo;
    property boresponsavel : string read fboresponsavel write fboresponsavel;
  end;

implementation

end.
