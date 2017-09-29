unit orm.ItClienteEmail;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItClienteEmail = class(TRegistroQuipos)
  private
    Fcdcliente: LargeInt;
    Fcditclienteemail: integer;
    Femail: string;
    Fbonfe: string;
    Fboboleto: string;
  public
    [keyfield]
    property cditclienteemail : integer read Fcditclienteemail write Fcditclienteemail;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [Aobrigatorio]
    property email : string read Femail write Femail;
    property bonfe : string read Fbonfe write Fbonfe;
    property boboleto : string read Fboboleto write Fboboleto;
  end;
  TItClienteEmailList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItClienteEmail;
    procedure SetItem(Index: Integer; const Value: TItClienteEmail);
    function ListaEmail(Tipo:string):string;
  public
    function New: TItClienteEmail;
    property Items[Index: Integer]: TItClienteEmail read GetItem write SetItem;
    function Ler(codigo:LargeInt; cdfield:string=_cdcliente):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function ListaEmailNFE:string;
    function ListaEmailBoleto:string;
  end;

implementation

function TItClienteEmailList.GetItem(Index: Integer): TItClienteEmail;
begin
  Result := TItClienteEmail(Inherited Items[Index]);
end;

function TItClienteEmailList.Ler(codigo: LargeInt; cdfield: string=_cdcliente): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itclienteemail, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TItClienteEmailList.Ler(DataSet: TDataset): boolean;
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

function TItClienteEmailList.ListaEmail(Tipo: string): string;
var
  i : integer;
begin
  for I := 0 to count - 1 do
  begin
    if (tipo = _b) and (items[i].boboleto = _s) then
    begin
      result := result + items[i].email + #13;
    end;
    if (tipo = _n) and (items[i].bonfe = _s) then
    begin
      result := result + items[i].email + #13;
    end;
  end;
end;

function TItClienteEmailList.ListaEmailBoleto: string;
begin
  result := listaemail(_b);
end;

function TItClienteEmailList.ListaEmailNFE: string;
begin
  result := listaemail(_N);
end;

function TItClienteEmailList.New: TItClienteEmail;
begin
  Result := TItClienteEmail.Create;
  Add(Result);
end;

procedure TItClienteEmailList.SetItem(Index: Integer; const Value: TItClienteEmail);
begin
  Put(Index, Value);
end;

end.
