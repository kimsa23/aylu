unit ORM.Condpagto;

interface

uses
  system.Classes, db,
  SysUtils, Contnrs,
  SqlExpr,
  rotina.Registro, uConstantes, rotina.datahora,
  orm.empresa, orm.Itcondpagto, orm.Stcondpagto, orm.Parcela, classe.aplicacao, rotina.retornasql, classe.query, classe.dao;

type
  TCondpagto = class(TRegistroQuipos)
  private
    Fcdcondpagto: Integer;
    Fstcondpagto: TStCondpagto;
    Fnucor: Integer;
    Fbosaida: string;
    Fitcondpagto: TItcondpagtoList;
    Fboentrada: string;
    Fnudias: Integer;
    Fpracrescimo: Double;
    Fnmcondpagto: string;
    Fcdstcondpagto: Integer;
    Fbocte: string;
    fparcela: TParcelaList;
    fnuparcela: integer;
  public
    property parcela: TParcelaList read fparcela write fparcela;
    property itcondpagto : TItcondpagtoList read Fitcondpagto write Fitcondpagto;
    property stcondpagto : TStCondpagto read Fstcondpagto write Fstcondpagto;
    [keyfield]
    property cdcondpagto : Integer read Fcdcondpagto write Fcdcondpagto;
    property nmcondpagto : string read Fnmcondpagto write Fnmcondpagto;
    property cdstcondpagto : Integer read Fcdstcondpagto write Fcdstcondpagto;
    property pracrescimo : Double read Fpracrescimo write Fpracrescimo;
    property nudias : Integer read Fnudias write Fnudias;
    property nuparcela: integer read fnuparcela write fnuparcela;
    property boentrada : string read Fboentrada write Fboentrada;
    property bosaida : string read Fbosaida write Fbosaida;
    property bocte : string read Fbocte write Fbocte;
    property nucor : Integer read Fnucor write Fnucor;
    constructor create;
    destructor destroy; override;
    function isaprazo:boolean;
    function Insert(boscript:boolean=false): String;
    procedure GerarParcela(dtemissao: TDate; valor:Currency; vlcomissao: Currency=0; vlicmssubtrib:Currency=0);
  end;

implementation

constructor TCondpagto.create;
begin
  inherited;
  fstcondpagto := tstcondpagto.create;
  Fitcondpagto := TItcondpagtoList.Create;
  fparcela     := TParcelaList.Create;
end;

destructor TCondpagto.destroy;
begin
  freeandnil(fstcondpagto);
  FreeAndNil(fitcondpagto);
  FreeAndNil(fparcela);
  inherited;
end;

procedure TCondpagto.GerarParcela(dtemissao: TDate; valor: Currency; vlcomissao: Currency=0; vlicmssubtrib:Currency=0);
var
  I: Integer;
begin
  parcela.Clear;
  if nuparcela > 0 then
  begin
    parcela.nuparcela  := nuparcela;
  end
  else
  begin
    parcela.nuparcela  := itcondpagto.Count;
  end;
  parcela.valor      := valor;
  parcela.vlcomissao := vlcomissao;
  parcela.calculaValorParcelas;
  if nudias > 0 then
  begin
    for I := 0 to parcela.Count - 1 do
    begin
      dtemissao := Primeiro_dia_mes_proximo(dtemissao) + nudias - 1;
      parcela.Items[i].dtvencimento := dtemissao;
    end;
  end
  else
  begin
    for I := 0 to parcela.Count - 1 do
    begin
      parcela.Items[i].dtvencimento := dtemissao + itcondpagto.Items[i].nudias;
    end;
  end;
  //dtemissao := dtemissao + nudias;
  if vlicmssubtrib > 0 then
  begin
    parcela.New;
    parcela.Items[parcela.Count-1].dtvencimento := parcela.Items[0].dtvencimento;
    parcela.Items[parcela.Count-1].valor        := vlicmssubtrib;
    parcela.ColocarParcelaICMSSubTribPrimeiro;
  end;
end;

function TCondpagto.Insert(boscript: boolean): String;
begin
  if cdstcondpagto = 0 then
  begin
    cdstcondpagto := 1;
  end;
  if boentrada = '' then
  begin
    boentrada := _s;
  end;
  if bosaida = '' then
  begin
    bosaida := _s;
  end;
  if bocte = '' then
  begin
    bocte := _s;
  end;
  if nucor = 0 then
  begin
    nucor := 1;
  end;
  result := inherited insert(boscript);
end;

function TCondpagto.isaprazo: boolean;
begin
  result := itcondpagto.Count>1;
  if not result then
  begin
    result := itcondpagto.Items[0].nudias > 0;
  end;
end;

end.
