unit ORM.AdicaoImportacao;

interface

uses Classe.DAO, System.Classes, Contnrs, Data.DB, classe.query, rotina.retornasql, uConstantes, System.SysUtils;

type
  TAdicaoImportacao = class(TRegistroQuipos)
  private
    Fvldesconto: currency;
    Fnusequencia: integer;
    Fcditsaidaimportacao: integer;
    Fcdfabricante: string;
    Fnuadicao: integer;
    Fcdadicaoimportacao: integer;
  public
    [keyfield]
    property cdadicaoimportacao : integer read Fcdadicaoimportacao write fcdadicaoimportacao;
    [fk]
    property cditsaidaimportacao : integer read Fcditsaidaimportacao write fcditsaidaimportacao;
    property nuadicao : integer read Fnuadicao write fnuadicao;
    property nusequencia : integer read Fnusequencia write fnusequencia;
    property cdfabricante : string read Fcdfabricante write fcdfabricante;
    property vldesconto : currency read Fvldesconto write fvldesconto;
  end;
  TAdicaoImportacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TAdicaoImportacao;
    procedure SetItem(Index: Integer; const Value: TAdicaoImportacao);
  public
    function New: TAdicaoImportacao;
    property Items[Index: Integer]: TAdicaoImportacao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
  end;

implementation

function TAdicaoImportacaoList.GetItem(Index: Integer): TAdicaoImportacao;
begin
  Result := TAdicaoImportacao(Inherited Items[Index]);
end;

function TAdicaoImportacaoList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TAdicaoImportacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_adicaoimportacao, codigo, _cditsaidaimportacao));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q.fieldbyname(_cdadicaoimportacao).AsInteger);
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TAdicaoImportacaoList.New: TAdicaoImportacao;
begin
  Result := TAdicaoImportacao.Create;
  Add(Result);
end;

procedure TAdicaoImportacaoList.SetItem(Index: Integer; const Value: TAdicaoImportacao);
begin
  Put(Index, Value);
end;

end.
