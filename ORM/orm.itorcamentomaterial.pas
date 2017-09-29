unit orm.itorcamentomaterial;

interface

uses contnrs, data.db, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  titorcamentomaterial = class(TRegistroQuipos)
  private
    Fborecuperapis: String;
    Fborecuperaicms: String;
    Fborecuperaipi: String;
    Fborecuperacofins: String;
    Fvlfrete: Currency;
    Fvlfinal: Currency;
    Fvlcofins: Currency;
    Fvlipi: Currency;
    Fvlunitario: Currency;
    Fvlicms: Currency;
    Fvltotal: Currency;
    Fvlpis: Currency;
    Fqtitem: Double;
    Fnufator: Double;
    Falicms: Double;
    Fqtpesounitario: Double;
    Falipi: Double;
    Falcofins: Double;
    Fqtpeca: Double;
    Falpis: Double;
    Fcdmaterial: Integer;
    Fcditorcamentomaterial: integer;
    Fcdforma: Integer;
    Fcdproduto: Integer;
    Fcditorcamento: integer;
    Fdsobservacao: string;
    Fdsposicao: string;
    Fcddigitado: string;
    Fdsformula: string;
  public
    [keyfield]
    property cditorcamentomaterial : integer read Fcditorcamentomaterial write fcditorcamentomaterial;
    [fk]
    property cditorcamento : integer read Fcditorcamento write fcditorcamento;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [fk]
    property cdmaterial : Integer read Fcdmaterial write fcdmaterial;
    property qtitem : Double read Fqtitem write fqtitem;
    property qtpesounitario : Double read Fqtpesounitario write fqtpesounitario;
    property qtpeca : Double read Fqtpeca write fqtpeca;
    property vlunitario : Currency read Fvlunitario write fvlunitario;
    property vltotal : Currency read Fvltotal write fvltotal;
    property cddigitado : string read Fcddigitado write fcddigitado;
    property dsposicao : string read Fdsposicao write fdsposicao;
    property alicms : Double read Falicms write falicms;
    property alipi : Double read Falipi write falipi;
    property borecuperaicms : String read Fborecuperaicms write fborecuperaicms;
    property borecuperaipi : String read Fborecuperaipi write fborecuperaipi;
    property vlicms : Currency read Fvlicms write fvlicms;
    property vlipi : Currency read Fvlipi write fvlipi;
    property vlfrete : Currency read Fvlfrete write fvlfrete;
    property vlfinal : Currency read Fvlfinal write fvlfinal;
    property alpis : Double read Falpis write falpis;
    property alcofins : Double read Falcofins write falcofins;
    property vlpis : Currency read Fvlpis write fvlpis;
    property vlcofins : Currency read Fvlcofins write fvlcofins;
    property borecuperapis : String read Fborecuperapis write fborecuperapis;
    property borecuperacofins : String read Fborecuperacofins write fborecuperacofins;
    property dsformula : string read Fdsformula write fdsformula;
    property nufator : Double read Fnufator write fnufator;
    [fk]
    property cdforma : Integer read Fcdforma write fcdforma;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
  end;
  TitorcamentomaterialList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titorcamentomaterial;
    procedure SetItem(Index: Integer; const Value: Titorcamentomaterial);
  public
    function New: Titorcamentomaterial;
    property Items[Index: Integer]: Titorcamentomaterial read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TitorcamentomaterialList.GetItem(Index: Integer): Titorcamentomaterial;
begin
  Result := Titorcamentomaterial(Inherited Items[Index]);
end;

function TitorcamentomaterialList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itorcamentomaterial, codigo, _cditorcamento));
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

function TitorcamentomaterialList.Ler(DataSet: TDataset):boolean;
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

function TitorcamentomaterialList.New: Titorcamentomaterial;
begin
  Result := Titorcamentomaterial.Create;
  Add(Result);
end;

procedure TitorcamentomaterialList.SetItem(Index: Integer; const Value: Titorcamentomaterial);
begin
  Put(Index, Value);
end;

end.
