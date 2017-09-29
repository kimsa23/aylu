unit orm.TpCliente;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TTpCliente = class(TRegistroQuipos)
  private
    fvltpcliente: currency;
    fborisco: string;
    fnmtpcliente: string;
    fbofilial: string;
    fbogerarmensalidade: string;
    fprvenda: double;
    fbocampanha: string;
    fcdtpcliente: integer;
  public
    [keyfield]
    property cdtpcliente : integer read fcdtpcliente write fcdtpcliente;
    [AObrigatorio]
    property nmtpcliente : string read fnmtpcliente write fnmtpcliente;
    property vltpcliente : currency read fvltpcliente write fvltpcliente;
    property bogerarmensalidade : string read fbogerarmensalidade write fbogerarmensalidade;
    property prvenda : double read fprvenda write fprvenda;
    property bocampanha : string read fbocampanha write fbocampanha;
    property bofilial : string read fbofilial write fbofilial;
    property borisco : string read fborisco write fborisco;
  end;
  TTpClienteList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTpCliente;
    procedure SetItem(Index: Integer; const Value: TTpCliente);
  public
    function New: TTpCliente;
    property Items[Index: Integer]: TTpCliente read GetItem write SetItem;
    function Ler(sqlwhere: string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function CodigoIn:string;
  end;

implementation

function TTpClienteList.CodigoIn: string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count -1 do
  begin
    if result <> '' then
    begin
      result := result + ',';
    end;
    result := result + items[i].cdtpcliente.ToString;
  end;
end;

function TTpClienteList.GetItem(Index: Integer): TTpCliente;
begin
  Result := TTpCliente(Inherited Items[Index]);
end;

function TTpClienteList.Ler(DataSet: TDataset): boolean;
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

function TTpClienteList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_TpCliente, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TTpClienteList.New: TTpCliente;
begin
  Result := TTpCliente.Create;
  Add(Result);
end;

procedure TTpClienteList.SetItem(Index: Integer; const Value: TTpCliente);
begin
  Put(Index, Value);
end;

end.
