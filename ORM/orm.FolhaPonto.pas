unit orm.FolhaPonto;

interface

uses System.SysUtils,
  orm.CartaoPonto,
  Classe.DAO;

type
  TFolhaPonto = class(TRegistroQuipos)
  private
    Fhrextra100: TTime;
    Fhrjustificada: TTime;
    Fnufalta: integer;
    Fhrsaldoacumulado: TTime;
    Fhrcreditoacumulado: TTime;
    Fhrsaldoanual: TTime;
    Fnuddsr: integer;
    Fhrextra50: TTime;
    Fhrtrabalhada: TTime;
    Fhrcreditoanual: TTime;
    Fhrsaldo: TTime;
    Fhrdebitoacumulado: TTime;
    Fhrabonada: TTime;
    Fnutrabalhado: integer;
    Fhrcredito: TTime;
    Fhrextra: TTime;
    Fcdfolhaponto: integer;
    Fhrdebitoanual: TTime;
    Fhrnoturno: TTime;
    Fdttermino: TDate;
    Fhrsaldoanterior: TTime;
    Fhratraso: TTime;
    Fnufolta: integer;
    Fhrdebito: TTime;
    Fnudsr: integer;
    Fdtinicio: TDate;
    fcartaoponto: TCartaoPontoList;
  public
    [keyfield]
    property cdfolhaponto : integer read Fcdfolhaponto write Fcdfolhaponto;
    property dtinicio : TDate read Fdtinicio write Fdtinicio;
    property dttermino : TDate read Fdttermino write Fdttermino;
    property nufolta : integer read Fnufolta write Fnufolta;
    property nufalta : integer read Fnufalta write Fnufalta;
    property nudsr : integer read Fnudsr write Fnudsr;
    property nuddsr : integer read Fnuddsr write Fnuddsr;
    property nutrabalhado : integer read Fnutrabalhado write Fnutrabalhado;
    property hrtrabalhada : TTime read Fhrtrabalhada write Fhrtrabalhada;
    property hrnoturno : TTime read Fhrnoturno write Fhrnoturno;
    property hrabonada : TTime read Fhrabonada write Fhrabonada;
    property hratraso : TTime read Fhratraso write Fhratraso;
    property hrdebito : TTime read Fhrdebito write Fhrdebito;
    property hrextra : TTime read Fhrextra write Fhrextra;
    property hrextra50 : TTime read Fhrextra50 write Fhrextra50;
    property hrextra100 : TTime read Fhrextra100 write Fhrextra100;
    property hrcredito : TTime read Fhrcredito write Fhrcredito;
    property hrjustificada : TTime read Fhrjustificada write Fhrjustificada;
    property hrsaldo : TTime read Fhrsaldo write Fhrsaldo;
    property hrsaldoanterior : TTime read Fhrsaldoanterior write Fhrsaldoanterior;
    property hrcreditoacumulado : TTime read Fhrcreditoacumulado write Fhrcreditoacumulado;
    property hrcreditoanual : TTime read Fhrcreditoanual write Fhrcreditoanual;
    property hrdebitoacumulado : TTime read Fhrdebitoacumulado write Fhrdebitoacumulado;
    property hrdebitoanual : TTime read Fhrdebitoanual write Fhrdebitoanual;
    property hrsaldoacumulado : TTime read Fhrsaldoacumulado write Fhrsaldoacumulado;
    property hrsaldoanual : TTime read Fhrsaldoanual write Fhrsaldoanual;
    property cartaoponto : TCartaoPontoList read fcartaoponto write fcartaoponto;
    constructor create;
    destructor destroy;
  end;

implementation

constructor TFolhaPonto.create;
begin
  inherited;
  fcartaoponto := tcartaopontolist.Create;
end;

destructor TFolhaPonto.destroy;
begin
  freeandnil(fcartaoponto);
  inherited;
end;

end.
