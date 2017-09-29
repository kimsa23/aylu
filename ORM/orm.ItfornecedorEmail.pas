unit orm.ItfornecedorEmail;

interface

uses Data.DB, contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItfornecedorEmail = class(TRegistroQuipos)
  private
    Fcdfornecedor: LargeInt;
    Fcditfornecedoremail: integer;
    Femail: string;
    //Fbonfe: string;
    //Fboboleto: string;
  public
    [keyfield]
    property cditfornecedoremail : integer read Fcditfornecedoremail write Fcditfornecedoremail;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [Aobrigatorio]
    property email : string read Femail write Femail;
  end;
  TItfornecedorEmailList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItfornecedorEmail;
    procedure SetItem(Index: Integer; const Value: TItfornecedorEmail);
  public
    function New: TItfornecedorEmail;
    property Items[Index: Integer]: TItfornecedorEmail read GetItem write SetItem;
    function Ler(codigo:LargeInt; cdfield:string=_cdfornecedor):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TItfornecedorEmailList.GetItem(Index: Integer): TItfornecedorEmail;
begin
  Result := TItfornecedorEmail(Inherited Items[Index]);
end;

function TItfornecedorEmailList.Ler(DataSet: TDataset): boolean;
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

function TItfornecedorEmailList.Ler(codigo: LargeInt; cdfield: string=_cdfornecedor): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itfornecedoremail, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItfornecedorEmailList.New: TItfornecedorEmail;
begin
  Result := TItfornecedorEmail.Create;
  Add(Result);
end;

procedure TItfornecedorEmailList.SetItem(Index: Integer;
  const Value: TItfornecedorEmail);
begin
  Put(Index, Value);
end;

end.
