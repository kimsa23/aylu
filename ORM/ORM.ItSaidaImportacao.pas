unit ORM.ItSaidaImportacao;

interface

uses Classe.DAO, System.Classes, Contnrs, Data.DB, classe.query, rotina.retornasql, uConstantes, orm.AdicaoImportacao, System.SysUtils;

type
  TItSaidaImportacao = class(TRegistroQuipos)
  private
    Fvlii: Currency;
    Fcdmunicipio: Integer;
    Fcditsaidaimportacao: Integer;
    Fdtdesembaraco: TDate;
    Fvldespesaaduaneira: Currency;
    Fcditsaida: Integer;
    Fvliof: Currency;
    Fnudocimportacao: string;
    Fcdexportador: string;
    Fvlbaseii: Currency;
    Fdtdocimportacao: TDate;
    Fcduf: Integer;
    fAdicaoImportacao: TAdicaoImportacaoList;
  public
    property AdicaoImportacao : TAdicaoImportacaoList read fAdicaoImportacao write fAdicaoImportacao;
    [keyfield]
    property cditsaidaimportacao : Integer read Fcditsaidaimportacao write fcditsaidaimportacao;
    [fk]
    property cditsaida : Integer read Fcditsaida write fcditsaida;
    [fk]
    property cduf : Integer read Fcduf write fcduf;
    [fk]
    property cdmunicipio : Integer read Fcdmunicipio write fcdmunicipio;
    property vlbaseii : Currency read Fvlbaseii write fvlbaseii;
    property vlii : Currency read Fvlii write fvlii;
    property vliof : Currency read Fvliof write fvliof;
    property vldespesaaduaneira : Currency read Fvldespesaaduaneira write fvldespesaaduaneira;
    property nudocimportacao : string read Fnudocimportacao write fnudocimportacao;
    property dtdocimportacao : TDate read Fdtdocimportacao write fdtdocimportacao;
    property dtdesembaraco : TDate read Fdtdesembaraco write fdtdesembaraco;
    property cdexportador : string read Fcdexportador write fcdexportador;
    constructor Create;
    destructor destroy; override;
  end;
  TItSaidaImportacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItSaidaImportacao;
    procedure SetItem(Index: Integer; const Value: TItSaidaImportacao);
  public
    function New: TItSaidaImportacao;
    property Items[Index: Integer]: TItSaidaImportacao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
  end;

implementation

constructor TItSaidaImportacao.Create;
begin
  inherited;
  fadicaoimportacao := tadicaoimportacaolist.Create;
end;

destructor TItSaidaImportacao.destroy;
begin
  freeandnil(fAdicaoImportacao);
  inherited;
end;

function TItSaidaImportacaoList.GetItem(Index: Integer): TItSaidaImportacao;
begin
  Result := TItSaidaImportacao(Inherited Items[Index]);
end;

function TItSaidaImportacaoList.Ler(Dataset: TDataset): Boolean;
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

function TItSaidaImportacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItSaidaImportacao, codigo, _cditsaida));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    freeandnil(q);
  end;
end;

function TItSaidaImportacaoList.New: TItSaidaImportacao;
begin
  Result := TItSaidaImportacao.Create;
  Add(Result);
end;

procedure TItSaidaImportacaoList.SetItem(Index: Integer; const Value: TItSaidaImportacao);
begin
  Put(Index, Value);
end;

end.
