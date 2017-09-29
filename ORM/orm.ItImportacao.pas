unit orm.ItImportacao;

interface

uses contnrs, System.Generics.Collections, Data.DB, System.SysUtils,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TItImportacao = class(TRegistroQuipos)
  strict private
    fnmtabela2: string;
    fcditimportacao: Integer;
    fcdimportacao: Integer;
    fnmcelula: string;
    fnmcampo2: string;
    fvlpadrao: string;
    fnmcampo: string;
  public
    [KeyField]
    property cditimportacao: Integer read fcditimportacao write fcditimportacao;
    [FK, AObrigatorio]
    property cdimportacao: Integer read fcdimportacao write fcdimportacao;
    [AObrigatorio]
    property nmcampo: string read fnmcampo write fnmcampo;
    property nmcelula: string read fnmcelula write fnmcelula;
    property vlpadrao: string read fvlpadrao write fvlpadrao;
    property nmtabela2: string read fnmtabela2 write fnmtabela2;
    property nmcampo2: string read fnmcampo2 write fnmcampo2;
  end;
  TItImportacaoList = class
  strict private
    flista: tobjectlist<TItImportacao>;
  public
    property lista : tobjectlist<TItImportacao> read flista write flista;
    constructor Create;
    destructor destroy; override;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string; boselect:boolean=false):boolean;overload;
    procedure Atribuir(Dataset:TDataSet);
  end;

implementation

function TItImportacaoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itimportacao, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItImportacaoList.Ler(DataSet: TDataset): boolean;
begin
  lista.clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    Lista.Add(TItImportacao.Create);
    lista[lista.Count-1].Select(dataset);
    dataset.Next;
    result := true;
  end;
  dataset.first;
end;

procedure TItImportacaoList.Atribuir(Dataset: TDataSet);
var
  i : Integer;
begin
  for I := 0 to lista.count - 1 do
  begin
    if Dataset.RecordCount - 1 < i then
    begin
      Dataset.insert;
    end
    else
    begin
      Dataset.RecNo := i + 1;
      Dataset.Edit;
    end;
    lista.items[i].Atribuir(dataset);
    Dataset.post;
  end;
end;

constructor TItImportacaoList.Create;
begin
  FLista := TObjectList<TItImportacao>.Create;
end;

destructor TItImportacaoList.destroy;
begin
  FreeAndNil(flista);
  inherited;
end;

function TItImportacaoList.Ler(sqlwhere: string; boselect:boolean=false): boolean;
var
  q : TClasseQuery;
begin
  if boselect then
  begin
    q := TClasseQuery.create(sqlwhere);
  end
  else
  begin
    q := TClasseQuery.create(QRetornaSQL.get_select_where(_itimportacao, sqlwhere));
  end;
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
