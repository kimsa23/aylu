unit orm.MDFEDescarregamento;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.MDFECTE, orm.MDFENFE,
  Classe.DAO, classe.query;

type
  TMDFEDescarregamento = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmunicipio : Integer;
    fqtcte : Integer;
    fqtnfe : Integer;
    fvlcarga : Currency;
    fqtcarga : Double;
    Fmdfenfe: tmdfenfelist;
    Fmdfecte: tmdfectelist;
    procedure Setmdfecte(const Value: tmdfectelist);
    procedure Setmdfenfe(const Value: tmdfenfelist);
  public
    [keyfield]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
    property qtcte : Integer read fqtcte write fqtcte;
    [AObrigatorio]
    property qtnfe : Integer read fqtnfe write fqtnfe;
    property vlcarga : Currency read fvlcarga write fvlcarga;
    property qtcarga : Double read fqtcarga write fqtcarga;
    property mdfecte : tmdfectelist read Fmdfecte write Setmdfecte;
    property mdfenfe : tmdfenfelist read Fmdfenfe write Setmdfenfe;
    constructor create; overload;
    destructor destroy; override;
  end;
  TMDFEDescarregamentoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFEDescarregamento;
    procedure SetItem(Index: Integer; const Value: TMDFEDescarregamento);
  public
    function New: TMDFEDescarregamento;
    property Items[Index: Integer]: TMDFEDescarregamento read GetItem write SetItem;
    function Ler(codigo: integer):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
    function Ler(Dataset, dscte, dsnfe: TDataset):boolean; overload;
    function Cancelar(boscript:boolean=false):string;
  end;

implementation

constructor TMDFEDescarregamento.create;
begin
  inherited create;
  fmdfenfe := tmdfenfelist.Create;
  fmdfecte := tmdfectelist.Create;
end;

destructor TMDFEDescarregamento.destroy;
begin
  freeandnil(fmdfenfe);
  freeandnil(fmdfecte);
  inherited;
end;

procedure TMDFEDescarregamento.Setmdfecte(const Value: tmdfectelist);
begin
  Fmdfecte := Value;
end;

procedure TMDFEDescarregamento.Setmdfenfe(const Value: tmdfenfelist);
begin
  Fmdfenfe := Value;
end;

function TMDFEDescarregamentoList.Cancelar(boscript:boolean=false): string;
var
  I: Integer;
  texto : string;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    texto := items[i].mdfecte.cancelar(boscript);
    if texto <> '' then
    begin
      result := result + texto+#13;
    end;
    texto := items[i].mdfenfe.Cancelar(boscript);
    if texto <> '' then
    begin
      result := result + texto;
    end;
  end;
end;

function TMDFEDescarregamentoList.GetItem(Index: Integer): TMDFEDescarregamento;
begin
  Result := TMDFEDescarregamento(Inherited Items[Index]);
end;

function TMDFEDescarregamentoList.Ler(Dataset, dscte, dsnfe: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    items[count-1].mdfecte.ler(dscte);
    items[count-1].mdfenfe.ler(dsnfe);
    dataset.Next;
    result := true;
  end;
end;

function TMDFEDescarregamentoList.Ler(Dataset: TDataset): boolean;
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

function TMDFEDescarregamentoList.Ler(codigo: integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_MDFEDescarregamento, codigo, _cdmdfe));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEDescarregamentoList.New: TMDFEDescarregamento;
begin
  Result := TMDFEDescarregamento.Create;
  Add(Result);
end;

procedure TMDFEDescarregamentoList.SetItem(Index: Integer; const Value: TMDFEDescarregamento);
begin
  Put(Index, Value);
end;

end.
