unit orm.itorcamentocusto;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  titorcamentocusto = class(TRegistroQuipos)
  private
    Fvltotal: Currency;
    Fvlfinal: Currency;
    Fvlunitario: Currency;
    Fqtitem: Double;
    Fnufator: Double;
    Fcdproduto: Integer;
    Fcdunidade: Integer;
    Fcditorcamento: Integer;
    Fcditorcamentocusto: Integer;
    Fcddigitado: string;
    Fdsobservacao: string;
  public
    [keyfield]
    property cditorcamentocusto : Integer read Fcditorcamentocusto write fcditorcamentocusto;
    [fk]
    property cditorcamento : Integer read Fcditorcamento write fcditorcamento;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    property vltotal : Currency read Fvltotal write fvltotal;
    property cddigitado : string read Fcddigitado write fcddigitado;
    property qtitem : Double read Fqtitem write fqtitem;
    property vlunitario : Currency read Fvlunitario write fvlunitario;
    property cdunidade : Integer read Fcdunidade write fcdunidade;
    property nufator : Double read Fnufator write fnufator;
    property vlfinal : Currency read Fvlfinal write fvlfinal;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
  end;
  TitorcamentocustoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titorcamentocusto;
    procedure SetItem(Index: Integer; const Value: Titorcamentocusto);
  public
    function New: Titorcamentocusto;
    property Items[Index: Integer]: Titorcamentocusto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TitorcamentocustoList.GetItem(Index: Integer): Titorcamentocusto;
begin
  Result := Titorcamentocusto(Inherited Items[Index]);
end;

function TitorcamentocustoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itorcamentocusto, codigo, _cditorcamento));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TitorcamentocustoList.Ler(DataSet: TDataset):boolean;
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

function TitorcamentocustoList.New: Titorcamentocusto;
begin
  Result := Titorcamentocusto.Create;
  Add(Result);
end;

procedure TitorcamentocustoList.SetItem(Index: Integer; const Value: Titorcamentocusto);
begin
  Put(Index, Value);
end;

end.
