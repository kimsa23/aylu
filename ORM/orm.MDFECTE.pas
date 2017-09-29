unit orm.MDFECTE;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.mdfeinfunidtranspcte,
  Classe.DAO, classe.query;

type
  TMDFECTE = class(TRegistroQuipos)
  private
    fcdmdfe : Integer;
    fcdmunicipio : Integer;
    fcdcte : Integer;
    fvlcarga : Currency;
    fqtcarga : Double;
    findreentrega: string;
    fmdfeinfunidtranspcte: TmdfeinfunidtranspcteList;
  public
    [keyfield]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [keyfield]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
    [keyfield]
    property cdcte : Integer read fcdcte write fcdcte;
    property vlcarga : Currency read fvlcarga write fvlcarga;
    property qtcarga : Double read fqtcarga write fqtcarga;
    property indreentrega: string read findreentrega write findreentrega;
    property mdfeinfunidtranspcte: TmdfeinfunidtranspcteList read fmdfeinfunidtranspcte write fmdfeinfunidtranspcte;
    constructor create;
    destructor destroy; override;
  end;
  TMDFECTEList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TMDFECTE;
    procedure SetItem(Index: Integer; const Value: TMDFECTE);
  public
    function New: TMDFECTE;
    property Items[Index: Integer]: TMDFECTE read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean;overload;
    function Ler(Dataset:TDataset):boolean;overload;
    function Cancelar(boscript:boolean=false):string;
  end;

implementation

function TMDFECTEList.Cancelar(boscript: boolean): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TMDFECTEList.GetItem(Index: Integer): TMDFECTE;
begin
  Result := TMDFECTE(Inherited Items[Index]);
end;

function TMDFECTEList.Ler(Dataset: TDataset): boolean;
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

function TMDFECTEList.Ler(sqlwhere:string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_MDFECTE, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFECTEList.New: TMDFECTE;
begin
  Result := TMDFECTE.Create;
  Add(Result);
end;

procedure TMDFECTEList.SetItem(Index: Integer; const Value: TMDFECTE);
begin
  Put(Index, Value);
end;

constructor TMDFECTE.create;
begin
  fmdfeinfunidtranspcte := TmdfeinfunidtranspcteList.Create;
end;

destructor TMDFECTE.destroy;
begin
  FreeAndNil(fmdfeinfunidtranspcte);
  inherited;
end;

end.
