unit orm.CartaoPonto;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  ORM.PontoTrabalho,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TCartaoPonto = class(TRegistroQuipos)
  private
    Fhrextra100: TTime;
    Fhrjustificada: TTime;
    Fnufalta: integer;
    Fhrsaldoacumulado: TTime;
    Fhrcreditoacumulado: TTime;
    Fhrsaldoanual: TTime;
    Fnuddsr: integer;
    Fcdcartaoponto: integer;
    Fnufolga: integer;
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
    Fcdfuncionario: integer;
    Fhrsaldoanterior: TTime;
    Fhratraso: TTime;
    Fhrdebito: TTime;
    Fnudsr: integer;
    fpontotrabalho: TPontoTrabalhoLIst;
  public
    [keyfield]
    property cdcartaoponto : integer read Fcdcartaoponto write Fcdcartaoponto;
    [aobrigatorio]
    [fk]
    property cdfolhaponto : integer read Fcdfolhaponto write Fcdfolhaponto;
    [aobrigatorio]
    [fk]
    property cdfuncionario : integer read Fcdfuncionario write Fcdfuncionario;
    property nufolga : integer read Fnufolga write Fnufolga;
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
    property pontotrabalho : TPontoTrabalhoLIst read fpontotrabalho write fpontotrabalho;
    constructor create;
    destructor destroy;
  end;
  TCartaoPontoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCartaoPonto;
    procedure SetItem(Index: Integer; const Value: TCartaoPonto);
  public
    function New: TCartaoPonto;
    property Items[Index: Integer]: TCartaoPonto read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TCartaoPontoList.GetItem(Index: Integer): TCartaoPonto;
begin
  Result := TCartaoPonto(Inherited Items[Index]);
end;

function TCartaoPontoList.Ler(DataSet: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TCartaoPontoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_CartaoPonto, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TCartaoPontoList.New: TCartaoPonto;
begin
  Result := TCartaoPonto.Create;
  Add(Result);
end;

procedure TCartaoPontoList.SetItem(Index: Integer; const Value: TCartaoPonto);
begin
  Put(Index, Value);
end;

constructor TCartaoPonto.create;
begin
  inherited;
  fpontotrabalho := tpontotrabalholist.create;
end;

destructor TCartaoPonto.destroy;
begin
  freeandnil(fpontotrabalho);
  inherited;
end;

end.
