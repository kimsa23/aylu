unit orm.mdfeinfunidtranspcte;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  orm.mdfeinfunidcargacte, orm.mdfelacunidtranspcte,
  classe.dao, classe.query;

type
  TMDFEInfunidtranspcte = class(TRegistroQuipos)
  private
    fcdmdfe: Integer;
    fcdmunicipio: Integer;
    fcdcte: Integer;
    fcdtpunidtransp: Integer;
    fidunidtransp: String;
    fmdfecdinfunidtranspcte: Integer;
    fmdfeInfunidcargacte: TMDFEInfunidcargacteList;
    fmdfeLacunidTranspcte: TmdfeLacunidTranspcteList;
  public
    [KeyField]
    property cdmdfeinfunidtranspcte : Integer read fmdfecdinfunidtranspcte write fmdfecdinfunidtranspcte;
    [fk, AObrigatorio]
    property cdtpunidtransp : Integer read fcdtpunidtransp write fcdtpunidtransp;
    [fk, AObrigatorio]
    property cdmunicipio : Integer read fcdmunicipio write fcdmunicipio;
    [fk, AObrigatorio]
    property cdmdfe : Integer read fcdmdfe write fcdmdfe;
    [fk, AObrigatorio]
    property cdcte : Integer read fcdcte write fcdcte;
    [AObrigatorio]
    property idunidtransp : String read fidunidtransp write fidunidtransp;
    property mdfeinfunidcargacte: tmdfeinfunidcargactelist read fmdfeinfunidcargacte write fmdfeinfunidcargacte;
    property mdfeLacunidTranspcte: TmdfeLacunidTranspcteList read fmdfeLacunidTranspcte write fmdfeLacunidTranspcte;
    constructor Create;
    destructor destroy; override;
  end;
  TMDFEinfunidtranspcteList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMDFEInfunidtranspcte;
    procedure SetItem(Index: Integer; const Value: TMDFEInfunidtranspcte);
  public
    function New: TMDFEInfunidtranspcte;
    property Items[Index: Integer]: TMDFEInfunidtranspcte read GetItem write SetItem;
    function Ler(sqlwhere:string):Boolean; overload;
    function Ler(Dataset: TDataset):boolean; overload;
  end;

implementation

function TMDFEinfunidtranspcteList.GetItem(Index: Integer): TMDFEInfunidtranspcte;
begin
  Result := TMDFEInfunidtranspcte(Inherited Items[Index]);
end;

function TMDFEinfunidtranspcteList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_mdfeinfunidtranspcte, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMDFEinfunidtranspcteList.Ler(Dataset: TDataset): boolean;
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

function TMDFEinfunidtranspcteList.New: TMDFEInfunidtranspcte;
begin
  Result := TMDFEInfunidtranspcte.Create;
  Add(Result);
end;

procedure TMDFEinfunidtranspcteList.SetItem(Index: Integer; const Value: TMDFEInfunidtranspcte);
begin
  Put(Index, Value);
end;

constructor TMDFEInfunidtranspcte.Create;
begin
  fmdfeinfunidcargacte := TmdfeInfunidcargacteList.Create;
  fmdfeLacunidTranspcte := TmdfeLacunidTranspcteList.Create;
end;

destructor TMDFEInfunidtranspcte.destroy;
begin
  FreeAndNil(fmdfeinfunidcargacte);
  FreeAndNil(fmdfeLacunidTranspcte);
  inherited;
end;

end.
