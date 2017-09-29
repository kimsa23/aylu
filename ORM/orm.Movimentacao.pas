unit orm.Movimentacao;

interface

uses System.SysUtils,
  orm.TpModulo,
  Classe.DAO;

type
  TMovimentacao = class(TRegistroQuipos)
  private
    Fnmmovimentacao: string;
    Fcdplconta: integer;
    Fcdtpmodulo: integer;
    Fbohistorico: string;
    Fnucntcontabil: string;
    Fboobservacao: String;
    Fcdmovimentacao: integer;
    Fboduplicatanossonumero: String;
    Fcdcntcusto: integer;
    ftpmodulo: ttpmodulo;
    fnucntcusto: string;
    fnuplconta: string;
  public
    property tpmodulo : ttpmodulo read ftpmodulo write ftpmodulo;
    [keyfield]
    property cdmovimentacao : integer read Fcdmovimentacao write fcdmovimentacao;
    [fk, AObrigatorio]
    property cdtpmodulo : integer read Fcdtpmodulo write fcdtpmodulo;
    [fk]
    property cdplconta : integer read Fcdplconta write fcdplconta;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write fcdcntcusto;
    [AObrigatorio]
    property nmmovimentacao : string read Fnmmovimentacao write fnmmovimentacao;
    property bohistorico : String read Fbohistorico write fbohistorico;
    property boobservacao : String read Fboobservacao write fboobservacao;
    property boduplicatanossonumero : String read Fboduplicatanossonumero write fboduplicatanossonumero;
    property nucntcontabil : string read Fnucntcontabil write fnucntcontabil;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    property nuplconta: string read fnuplconta write fnuplconta;
    constructor create;
    destructor destroy; override;
  end;

implementation

constructor TMovimentacao.create;
begin
  inherited;
  ftpmodulo := ttpmodulo.create;
end;

destructor TMovimentacao.destroy;
begin
  freeandnil(ftpmodulo);
  inherited;
end;

end.
