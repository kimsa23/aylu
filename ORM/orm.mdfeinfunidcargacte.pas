unit orm.mdfeinfunidcargacte;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.mdfelacunidcargacte,
  Classe.DAO, classe.query;

type
  TMDFEInfunidcargacte = class(TRegistroQuipos)
  private
    fcdmdfe: integer;
    fcdmunicipio: integer;
    fcdinfunidcargacte: integer;
    fcdcte: integer;
    fcdtpunidcarga: integer;
    fidunidcarga: string;
    fmdfecdinfunidtranspcte: integer;
    fmdfelacunidcargacte: TmdfeLacUnidCargaCteList;
    fqtdRat: Double;
  public
    [KeyField]
    property cdinfunidcargacte : integer read fcdinfunidcargacte write fcdinfunidcargacte;
    [fk, aobrigatorio]
    property cdmdfe : integer read fcdmdfe write fcdmdfe;
    [fk, aobrigatorio]
    property cdcte : integer read fcdcte write fcdcte;
    [fk, aobrigatorio]
    property cdmunicipio : integer read fcdmunicipio write fcdmunicipio;
    [fk, aobrigatorio]
    property cdtpunidcarga : integer read fcdtpunidcarga write fcdtpunidcarga;
    property idunidcarga : string read fidunidcarga write fidunidcarga;
    [fk, aobrigatorio]
    property cdmdfeinfunidtranspcte: integer read fmdfecdinfunidtranspcte write fmdfecdinfunidtranspcte;
    property qtdRat: Double read fqtdRat write fqtdRat;
    property mdfelacunidcargacte: TmdfeLacUnidCargaCteList read fmdfelacunidcargacte write fmdfelacunidcargacte;
    constructor create;
    destructor destroy; override;
  end;
  TMDFEInfunidcargacteList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMDFEInfunidcargacte;
    procedure SetItem(Index: Integer; const Value: TMDFEInfunidcargacte);
  public
    function New: TMDFEInfunidcargacte;
    property Items[Index: Integer]: TMDFEInfunidcargacte read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
  end;

implementation

function TMDFEInfunidcargacteList.GetItem(Index: Integer): TMDFEInfunidcargacte;
begin
  Result := TMDFEInfunidcargacte(Inherited Items[Index]);
end;

function TMDFEInfunidcargacteList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_mdfeInfunidcargacte, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEInfunidcargacteList.Ler(Dataset: TDataset): boolean;
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

function TMDFEInfunidcargacteList.New: TMDFEInfunidcargacte;
begin
  Result := TMDFEInfunidcargacte.Create;
  Add(Result);
end;

procedure TMDFEInfunidcargacteList.SetItem(Index: Integer; const Value: TMDFEInfunidcargacte);
begin
  Put(Index, Value);
end;

constructor TMDFEInfunidcargacte.create;
begin
  fmdfelacunidcargacte := tmdfelacunidcargactelist.create;
end;

destructor TMDFEInfunidcargacte.destroy;
begin
  FreeAndNil(fmdfelacunidcargacte);
  inherited;
end;

end.
