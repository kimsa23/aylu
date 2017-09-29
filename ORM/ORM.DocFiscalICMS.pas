unit ORM.DocFiscalICMS;

interface

uses System.Contnrs, Data.DB, sysutils, system.classes,
  classe.dao, classe.query, rotina.retornasql,
  uconstantes;

type
  TDocfiscalicms = class(TPersintentObject)
  private
    fnmdocfiscalicms: string;
    fboativar: string;
    fdsmodelo: string;
    fnudocfiscalicms: string;
  public
    property nudocfiscalicms: string read fnudocfiscalicms write fnudocfiscalicms;
    property nmdocfiscalicms: string read fnmdocfiscalicms write fnmdocfiscalicms ;
    property dsmodelo: string read fdsmodelo write fdsmodelo;
    property boativar: string read fboativar write fboativar;
  end;
  TDocfiscalicmsList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TDocfiscalicms;
    procedure SetItem(Index: Integer; const Value: TDocfiscalicms);
  public
    function New: TDocfiscalicms;
    property Items[Index: Integer]: TDocfiscalicms read GetItem write SetItem;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
    function Existe(nudocfiscalicms:string):boolean;
  end;

implementation

function TDocfiscalicmsList.Existe(nudocfiscalicms: string): boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count-1 do
  begin
    if items[i].nudocfiscalicms = nudocfiscalicms then
    begin
      result := true;
      break;
    end;
  end;
end;

function TDocfiscalicmsList.GetItem(Index: Integer): TDocfiscalicms;
begin
  Result := TDocfiscalicms(Inherited Items[Index]);
end;

function TDocfiscalicmsList.Ler(DataSet: TDataset): boolean;
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

function TDocfiscalicmsList.New: TDocfiscalicms;
begin
  Result := TDocfiscalicms.Create;
  Add(Result);
end;

procedure TDocfiscalicmsList.SetItem(Index: Integer; const Value: TDocfiscalicms);
begin
  Put(Index, Value);
end;

function TDocfiscalicmsList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_docfiscalicms, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
