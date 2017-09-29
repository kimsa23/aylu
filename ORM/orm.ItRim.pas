unit orm.ItRim;

interface

uses contnrs, Data.DB, System.SysUtils, Vcl.Dialogs, System.UITypes, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.ItOrdProducaoMaterial, ORM.Produto,
  Classe.DAO, classe.gerar, classe.query;

type
  TItRim = class(TRegistroQuipos)
  private
    fcditrim : Integer;
    fcdrim : integer;
    fcdproduto : Integer;
    fcdordproducao : integer;
    fcditordproducaomaterial : Integer;
    fqtitem : Double;
    fcddigitado : string;
    fqtatendida : Double;
    fdtprevista : TDateTime;
    fqtitem2 : Double;
    Fitordproducaomaterial: TItOrdProducaoMaterial;
    fproduto: TProduto;
  public
    property itordproducaomaterial : TItOrdProducaoMaterial read Fitordproducaomaterial write Fitordproducaomaterial;
    property produto : TProduto read fproduto write fproduto;
    [keyfield]
    property cditrim : Integer read fcditrim write fcditrim;
    [fk]
    property cdrim : integer read fcdrim write fcdrim;
    [fk]
    property cdproduto : Integer read fcdproduto write fcdproduto;
    [fk]
    property cdordproducao : integer read fcdordproducao write fcdordproducao;
    [fk]
    property cditordproducaomaterial : Integer read fcditordproducaomaterial write fcditordproducaomaterial;
    [aobrigatorio]
    property qtitem : Double read fqtitem write fqtitem;
    property cddigitado : string read fcddigitado write fcddigitado;
    [aobrigatorio]
    property qtatendida : Double read fqtatendida write fqtatendida;
    property dtprevista : TDateTime read fdtprevista write fdtprevista;
    property qtitem2 : Double read fqtitem2 write fqtitem2;
    constructor create;
    destructor  destroy; override;
  end;
  TItRimList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItRim;
    procedure SetItem(Index: Integer; const Value: TItRim);
  public
    function  New: TItRim;
    property Items[Index: Integer]: TItRim read GetItem write SetItem;
    function Insert(cdrim:integer): TItrim;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function sql_insert:string;
    function pode_baixar(boconsiste:Boolean=True):Boolean;
    function get_indice(codigo:Integer):Integer;
  end;

implementation

constructor TItRim.create;
begin
  inherited;
  Fitordproducaomaterial := TItOrdProducaoMaterial.create;
  fproduto := tproduto.create;
end;

destructor TItRim.destroy;
begin
  FreeAndNil(fitordproducaomaterial);
  FreeAndNil(fproduto);
  inherited;
end;

function TItRimList.GetItem(Index: Integer): TItRim;
begin
  Result := TItRim(Inherited Items[Index]);
end;

function TItRimList.get_indice(codigo: Integer): Integer;
var
  i : Integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    if Items[i].cdrim = codigo then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TItRimList.Insert(cdrim: integer): TItrim;
begin
  result         := new;
  result.state   := dsInsert;
  Result.cdrim   := cdrim;
  Result.cditrim := QGerar.GerarCodigo(_itrim);
end;

function TItRimList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itrim, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItRimList.Ler(DataSet: TDataset): boolean;
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

function TItRimList.New: TItRim;
begin
  Result := TItRim.Create;
  Add(Result);
end;

function TItRimList.pode_baixar(boconsiste:Boolean=True): Boolean;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].produto.Select(Items[i].cdproduto);
    if boconsiste then
    begin
      if Items[i].produto.cdtpitem = '' then
      begin
        MessageDlg('O produto '+items[i].cddigitado+' - '+items[i].produto.nmproduto+' não está preenchido o Tipo de Ítem.', mtInformation, [mbOK], 0);
        Abort;
      end;
      if Items[i].produto.boativar <> _s then
      begin
        MessageDlg('O produto '+items[i].cddigitado+' - '+items[i].produto.nmproduto+' está desativado.', mtInformation, [mbOK], 0);
        Abort;
      end;
      if Items[i].produto.qtestoque - Items[i].qtitem < 0 then
      begin
        messagedlg('Produto '+Items[i].produto.nmproduto+' possui estoque de '+floattostr(Items[i].produto.qtestoque)+' insuficiente para realizar a baixa.', mtinformation,[mbok], 0);
        Abort;
      end;
      if (Items[i].produto.qtestmin > 0) and (Items[i].produto.qtestoque - Items[i].qtitem <= Items[i].produto.qtestmin) then
      begin
        MessageDlg('Produto '+Items[i].produto.nmproduto+' atingiu o estoque mínimo.', mtInformation, [mbOK], 0);
      end;
      if (Items[i].produto.qtestprev > 0) and (Items[i].produto.qtestoque - Items[i].qtitem <= Items[i].produto.qtestprev) then
      begin
        MessageDlg('Produto '+Items[i].produto.nmproduto+' atingiu o estoque de gatilho.', mtInformation, [mbOK], 0);
      end;
    end;
  end;
  result := True;
end;

procedure TItRimList.SetItem(Index: Integer; const Value: TItRim);
begin
  Put(Index, Value);
end;

function TItRimList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + Items[i].insert(True)+#13;
    end;
  end;
end;

end.
