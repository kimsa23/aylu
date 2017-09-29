unit orm.TpFaturamento;

interface

uses System.SysUtils,
  uConstantes,
  ORM.TpSaida,
  Classe.DAO;

type
  TTpFaturamento = class(TRegistroQuipos)
  private
    ftpsaida : ttpsaida;
    Fbocampanha: String;
    Fboproduto: String;
    Fbopedido: String;
    Fbocliente: String;
    Fbodtvencimentofixa: String;
    Fboperiodo: String;
    Fvlacrescimo: currency;
    Fvlminimo: currency;
    Fcdeventoemail: integer;
    Fcdrota: integer;
    Fcdprodutomensalidade: integer;
    Fcdtpsaida: integer;
    Fcdtppedidomensalidade: integer;
    Fcdtppedidoarquivo: integer;
    Fcdcondpagto: integer;
    Fcdtppedidocampanha: integer;
    Fnudiascarenciamensalidade: integer;
    Fnudia: integer;
    Fcdtpcobranca: integer;
    Fcdtpfaturamento: integer;
    Fnmtpfaturamento: string;
  public
    property tpsaida : ttpsaida read ftpsaida write ftpsaida;
    [keyfield]
    property cdtpfaturamento : integer read Fcdtpfaturamento write fcdtpfaturamento;
    [fk]
    property cdtppedidoarquivo : integer read Fcdtppedidoarquivo write fcdtppedidoarquivo;
    [fk]
    property cdtppedidomensalidade : integer read Fcdtppedidomensalidade write fcdtppedidomensalidade;
    [fk]
    property cdprodutomensalidade : integer read Fcdprodutomensalidade write fcdprodutomensalidade;
    [fk]
    property cdcondpagto : integer read Fcdcondpagto write fcdcondpagto;
    [fk]
    property cdtpcobranca : integer read Fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdtpsaida : integer read Fcdtpsaida write fcdtpsaida;
    [fk]
    property cdrota : integer read Fcdrota write fcdrota;
    [fk]
    property cdtppedidocampanha : integer read Fcdtppedidocampanha write fcdtppedidocampanha;
    [fk]
    property cdeventoemail : integer read Fcdeventoemail write fcdeventoemail;
    property nmtpfaturamento : string read Fnmtpfaturamento write fnmtpfaturamento;
    property bopedido : String read Fbopedido write fbopedido;
    property boproduto : String read Fboproduto write fboproduto;
    property bocliente : String read Fbocliente write fbocliente;
    property nudiascarenciamensalidade : integer read Fnudiascarenciamensalidade write fnudiascarenciamensalidade;
    property boperiodo : String read Fboperiodo write fboperiodo;
    property vlminimo : currency read Fvlminimo write fvlminimo;
    property vlacrescimo : currency read Fvlacrescimo write fvlacrescimo;
    property bodtvencimentofixa : String read Fbodtvencimentofixa write fbodtvencimentofixa;
    property nudia : integer read Fnudia write fnudia;
    property bocampanha : String read Fbocampanha write fbocampanha;
    constructor create;
    destructor  destroy; override;
    function IsMensalidade:boolean;
  end;

implementation

constructor TTpFaturamento.create;
begin
  inherited create;;
  ftpsaida := ttpsaida.create;
end;

destructor TTpFaturamento.destroy;
begin
  freeandnil(ftpsaida);
  inherited;
end;

function TTpFaturamento.IsMensalidade: boolean;
begin
  result := (boproduto = _s) and (bocliente <> _s);
end;

end.
