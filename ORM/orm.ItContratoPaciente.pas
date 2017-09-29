unit orm.ItContratoPaciente;

interface

uses Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.gerar, classe.query;

type
  TItContratoPaciente = class(TRegistroQuipos)
  private
    Fvltotal: Currency;
    Fvlunitario: Currency;
    Fnupaciente: Integer;
    Fcdcontrato: Integer;
    Fcditcontratopaciente: Integer;
    Fdtemissao: TDateTime;
  public
    [keyfield]
    property cditcontratopaciente : Integer read Fcditcontratopaciente write fcditcontratopaciente;
    [fk]
    property cdcontrato : Integer read Fcdcontrato write fcdcontrato;
    property nupaciente : Integer read Fnupaciente write fnupaciente;
    property dtemissao : TDateTime read Fdtemissao write fdtemissao;
    property vlunitario : Currency read Fvlunitario write fvlunitario;
    property vltotal : Currency read Fvltotal write fvltotal;
  end;
  TItContratoPacienteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItContratoPaciente;
    procedure SetItem(Index: Integer; const Value: TItContratoPaciente);
  public
    function  New: TItContratoPaciente;
    property  Items[Index: Integer]: TItContratoPaciente read GetItem write SetItem;
    function  Insert(cdcontrato:integer): TItContratoPaciente;
    function  sql_insert:string;
    function  Ler(codigo:Integer):Boolean;
  end;

implementation

function TItContratoPacienteList.GetItem(Index: Integer): TItContratoPaciente;
begin
  Result := TitcontratoPaciente(Inherited Items[Index]);
end;

function TItContratoPacienteList.Insert(cdcontrato: integer): TItContratoPaciente;
begin
  result              := new;
  Result.cdcontrato   := cdcontrato;
  Result.cditcontratopaciente := QGerar.GerarCodigo(_itcontratoPaciente);
end;

function TItContratoPacienteList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcontratopaciente, codigo, _cdcontrato));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItContratoPacienteList.New: TItContratoPaciente;
begin
  Result := TItContratoPaciente.Create;
  Add(Result);
end;

procedure TItContratoPacienteList.SetItem(Index: Integer; const Value: TItContratoPaciente);
begin
  Put(Index, Value);
end;

function TItContratoPacienteList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].insert(true)+#13;
  end;
end;

end.
