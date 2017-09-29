unit orm.Turno;

interface

uses System.SysUtils,
  orm.ItTurno,
  Classe.DAO;

type
  TTurno = class(TRegistroQuipos)
  private
    Fnmturno: string;
    Fbopreencherhorariomeio: string;
    Fcdturno: integer;
    fitturno: TItTurnoList;
  public
    [keyfield]
    property cdturno : integer read Fcdturno write Fcdturno;
    property nmturno : string read Fnmturno write Fnmturno;
    property bopreencherhorariomeio : string read Fbopreencherhorariomeio write Fbopreencherhorariomeio;
    property itturno : TItTurnoList read fitturno write fitturno;
    constructor create;
    destructor destroy;
  end;

implementation

constructor TTurno.create;
begin
  inherited;
  fitturno := titturnolist.Create;
end;

destructor TTurno.destroy;
begin
  freeandnil(fitturno);
  inherited;
end;

end.
