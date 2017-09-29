unit orm.ItProdutoMaterial;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItProdutoMaterial = class(TREgistroQuipos)
  private
    Fboconsumoautomatico: String;
    Fborecuperaicms: String;
    Fborecuperapis: String;
    Fborecuperaipi: String;
    Fborecuperacofins: String;
    Fqtfaixaf: Double;
    Fqtpeca: Double;
    Falipi: Double;
    Falpis: Double;
    Falcofins: Double;
    Falicms: Double;
    Fqtitem: Double;
    Fqtfaixai: Double;
    Fqtitem2: Double;
    Fqtpesounitario: Double;
    Fcdformulacao: Integer;
    Fcdtpequipamento: Integer;
    Fcdprodutomaterial: Integer;
    Fcdforma: Integer;
    Fcdproduto: integer;
    Fcditprodutomaterial: Integer;
    Fcdmaterial: Integer;
    Fdsposicao: string;
    Fcddigitado: string;
    Fdsobservacao: string;
    Fdsformula: string;
    procedure Setqtitem2(const Value: double);
  public
    [keyfield]
    property cditprodutomaterial : Integer read Fcditprodutomaterial write Fcditprodutomaterial;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cdmaterial : Integer read Fcdmaterial write Fcdmaterial;
    [fk]
    property cdprodutomaterial : Integer read Fcdprodutomaterial write Fcdprodutomaterial;
    [fk]
    property cdtpequipamento : Integer read Fcdtpequipamento write Fcdtpequipamento;
    [fk]
    property cdforma : Integer read Fcdforma write Fcdforma;
    [fk]
    property cdformulacao : Integer read Fcdformulacao write Fcdformulacao;
    property qtitem : Double read Fqtitem write Fqtitem;
    property qtpesounitario : Double read Fqtpesounitario write Fqtpesounitario;
    property qtpeca : Double read Fqtpeca write Fqtpeca;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property dsposicao : string read Fdsposicao write Fdsposicao;
    property alicms : Double read Falicms write Falicms;
    property alipi : Double read Falipi write Falipi;
    property alpis : Double read Falpis write Falpis;
    property alcofins : Double read Falcofins write Falcofins;
    property borecuperaicms : String read Fborecuperaicms write Fborecuperaicms;
    property borecuperaipi : String read Fborecuperaipi write Fborecuperaipi;
    property borecuperapis : String read Fborecuperapis write Fborecuperapis;
    property borecuperacofins : String read Fborecuperacofins write Fborecuperacofins;
    property dsformula : string read Fdsformula write Fdsformula;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property qtfaixai : Double read Fqtfaixai write Fqtfaixai;
    property qtfaixaf : Double read Fqtfaixaf write Fqtfaixaf;
    property boconsumoautomatico : String read Fboconsumoautomatico write Fboconsumoautomatico;
    property qtitem2 : double read Fqtitem2 write Setqtitem2;
  end;
  TitprodutomaterialList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titprodutomaterial;
    procedure SetItem(Index: Integer; const Value: Titprodutomaterial);
  public
    function New: Titprodutomaterial;
    property Items[Index: Integer]: Titprodutomaterial read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdproduto):boolean;
  end;

implementation

function TitprodutomaterialList.GetItem(Index: Integer): Titprodutomaterial;
begin
  Result := Titprodutomaterial(Inherited Items[Index]);
end;

function TitprodutomaterialList.Ler(codigo: Integer; cdfield:string=_cdproduto): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itprodutomaterial, codigo, cdfield));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TitprodutomaterialList.New: Titprodutomaterial;
begin
  Result := Titprodutomaterial.Create;
  Add(Result);
end;

procedure TitprodutomaterialList.SetItem(Index: Integer; const Value: Titprodutomaterial);
begin
  Put(Index, Value);
end;

procedure TItProdutoMaterial.Setqtitem2(const Value: double);
begin
  Fqtitem2 := Value;
end;

end.
