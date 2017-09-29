unit orm.ClienteEntrega;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TClienteEntrega = class(TRegistroQuipos)
  private
    fnmcontato: string;
    fcdcliente: largeint;
    fnufone: string;
    fdsendereco: string;
    fnufax: string;
    fcdmunicipio: integer;
    fcdclienteentrega: integer;
    fnmbairro: string;
    fnucep: string;
    fdsnumero: string;
    fnucxpostal: string;
    fdscomplemento: string;
    fcduf: integer;
    fnucnpj: string;
    fnuinscest: string;
  public
    [keyfield]
    property cdclienteentrega : integer read fcdclienteentrega write fcdclienteentrega;
    [fk]
    property cdcliente : largeint read fcdcliente write fcdcliente;
    [fk]
    property cduf : integer read fcduf write fcduf;
    [fk]
    property cdmunicipio : integer read fcdmunicipio write fcdmunicipio;
    property nmcontato : string read fnmcontato write fnmcontato;
    property nufone : string read fnufone write fnufone;
    property nufax : string read fnufax write fnufax;
    property nucep : string read fnucep write fnucep;
    property dsendereco : string read fdsendereco write fdsendereco;
    property dsnumero : string read fdsnumero write fdsnumero;
    property dscomplemento : string read fdscomplemento write fdscomplemento;
    property nucxpostal : string read fnucxpostal write fnucxpostal;
    property nmbairro : string read fnmbairro write fnmbairro;
    property nucnpj : string read fnucnpj write fnucnpj;
    property nuinscest : string read fnuinscest write fnuinscest;
  end;
  TClienteEntregaList = class(TObjectList)
  private
    function GetItem(Index: Integer): TClienteEntrega;
    procedure SetItem(Index: Integer; const Value: TClienteEntrega);
  public
    function New: TClienteEntrega;
    property Items[Index: Integer]: TClienteEntrega read GetItem write SetItem;
    function Ler(sqlwhere: string):Boolean;overload;
    function Ler(codigo:Largeint; cdfield:string=_cdcliente):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TClienteEntregaList.GetItem(Index: Integer): TClienteEntrega;
begin
  Result := TClienteEntrega(Inherited Items[Index]);
end;

function TClienteEntregaList.Ler(DataSet: TDataset): boolean;
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

function TClienteEntregaList.Ler(codigo:Largeint; cdfield:string=_cdcliente):Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_clienteentrega, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TClienteEntregaList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_clienteentrega, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TClienteEntregaList.New: TClienteEntrega;
begin
  Result := TClienteEntrega.Create;
  Add(Result);
end;

procedure TClienteEntregaList.SetItem(Index: Integer; const Value: TClienteEntrega);
begin
  Put(Index, Value);
end;

end.
