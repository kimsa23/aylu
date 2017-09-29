unit orm.ItRegraST;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.itregrastmva, ORM.Empresa,
  classe.query, Classe.DAO;

type
  TItRegraST = class(TRegistroQuipos)
  private
    Falpis: double;
    Falcofins: double;
    Fcdcfop: integer;
    Fborecuperaicms: string;
    Fnustpis: string;
    Fnustcofins: string;
    Falipi: double;
    Fborecuperapis: string;
    Fborecuperacofins: string;
    Fnustipi: string;
    Falicms: double;
    Fborecuperaipi: string;
    Fcditregrast: integer;
    Fcdregrast: integer;
    Ftpregime: string;
    Fnusticms: string;
    Fitregrastmva: titregrastmvalist;
    Falicmsred: double;
  public
    property itregrastmva : titregrastmvalist read Fitregrastmva write fitregrastmva;
    [keyfield]
    property cditregrast : integer read Fcditregrast write fcditregrast;
    [fk]
    property cdregrast : integer read Fcdregrast write fcdregrast;
    [fk]
    property cdcfop : integer read Fcdcfop write fcdcfop;
    [fk]
    property nusticms : string read Fnusticms write fnusticms;
    [fk]
    property nustipi : string read Fnustipi write fnustipi;
    [fk]
    property nustpis : string read Fnustpis write fnustpis;
    [fk]
    property nustcofins : string read Fnustcofins write fnustcofins;
    property alicms : double read Falicms write falicms;
    property alicmsred : double read Falicmsred write Falicmsred;
    property alipi : double read Falipi write falipi;
    property alpis : double read Falpis write falpis;
    property alcofins : double read Falcofins write falcofins;
    property borecuperaicms : string read Fborecuperaicms write fborecuperaicms;
    property borecuperaipi : string read Fborecuperaipi write fborecuperaipi;
    property borecuperapis : string read Fborecuperapis write fborecuperapis;
    property borecuperacofins : string read Fborecuperacofins write fborecuperacofins;
    [fk]
    property tpregime : string read Ftpregime write ftpregime;
    constructor create;
    destructor destroy; override;
    function CFOPdeSaida:boolean;
    function CFOPDentroUf:boolean;
    function CFOPForaUF:boolean;
    function check_uf_dentro_ou_fora(cduf:integer):Boolean;
  end;
  TItRegraSTList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRegraST;
    procedure SetItem(Index: Integer; const Value: TItRegraST);
  public
    function New: TItRegraST;
    property Items[Index: Integer]: TItRegraST read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TItRegraST.CFOPDentroUf: boolean;
begin
  result := ((cdcfop >= 5000) and (cdcfop <= 5999)) or ((cdcfop >= 1000) and (cdcfop <= 1999));
end;

function TItRegraST.CFOPdeSaida: boolean;
begin
  result := ((cdcfop >= 5000) and (cdcfop <= 5999)) or ((cdcfop >=6000) and (cdcfop <=6999));
end;

function TItRegraST.CFOPForaUF: boolean;
begin
  result := ((cdcfop >= 6000) and (cdcfop <= 6999)) or ((cdcfop >= 2000) and (cdcfop <= 2999));
end;

function TItRegraST.check_uf_dentro_ou_fora(cduf: integer): Boolean;
begin
  result := ((cduf =  empresa.endereco.cduf) and CFOPForaUF)  or ((cduf <> empresa.endereco.cduf) and CFOPDentroUf);
end;

constructor TItRegraST.create;
begin
  inherited;
  fitregrastmva := titregrastmvalist.Create;
end;

destructor TItRegraST.destroy;
begin
  freeandnil(fitregrastmva);
  inherited;
end;

function TItRegraSTList.GetItem(Index: Integer): TItRegraST;
begin
  Result := TItRegraST(Inherited Items[Index]);
end;

function TItRegraSTList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItRegraST, codigo, _cdregrast, 'tpregime desc,cdcfop desc'));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItRegraSTList.New: TItRegraST;
begin
  Result := TItRegraST.Create;
  Add(Result);
end;

procedure TItRegraSTList.SetItem(Index: Integer; const Value: TItRegraST);
begin
  Put(Index, Value);
end;

end.
