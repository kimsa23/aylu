unit orm.ItClienteCampanha;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItClienteCampanha = class(TRegistroQuipos)
  private
    fcdcliente: LargeInt;
    fvlunitario: currency;
    fcditclientecampanha: integer;
    fqtitem: Double;
    fcddigitado: string;
    fcdproduto: integer;
    fdttermino: TDate;
    fdtinicio: TDate;
  public
    [keyfield]
    property cditclientecampanha : integer read fcditclientecampanha write fcditclientecampanha;
    [fk, AObrigatorio]
    property cdcliente : LargeInt read fcdcliente write fcdcliente;
    [fk, AObrigatorio]
    property cdproduto : integer read fcdproduto write fcdproduto;
    [AObrigatorio]
    property cddigitado : string read fcddigitado write fcddigitado;
    [AObrigatorio]
    property dtinicio : TDate read fdtinicio write fdtinicio;
    [AObrigatorio]
    property dttermino : TDate read fdttermino write fdttermino;
    [AObrigatorio]
    property vlunitario : currency read fvlunitario write fvlunitario;
    [AObrigatorio]
    property qtitem : Double read fqtitem write fqtitem;
  end;
  TItClienteCampanhaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItClienteCampanha;
    procedure SetItem(Index: Integer; const Value: TItClienteCampanha);
  public
    function New: TItClienteCampanha;
    property Items[Index: Integer]: TItClienteCampanha read GetItem write SetItem;
    function Ler(codigo:Largeint; cdfield:string=_cdcliente):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
  end;

implementation

function TItClienteCampanhaList.GetItem(Index: Integer): TItClienteCampanha;
begin
  Result := TItClienteCampanha(Inherited Items[Index]);
end;

function TItClienteCampanhaList.Ler(DataSet: TDataset): boolean;
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

function TItClienteCampanhaList.Ler(codigo:Largeint; cdfield:string=_cdcliente):Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itclienteCampanha, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItClienteCampanhaList.New: TItClienteCampanha;
begin
  Result := TItClienteCampanha.Create;
  Add(Result);
end;

procedure TItClienteCampanhaList.SetItem(Index: Integer; const Value: TItClienteCampanha);
begin
  Put(Index, Value);
end;

function TItClienteCampanhaList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itclientecampanha, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
