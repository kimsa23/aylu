unit orm.TpAprovacaoUsuarios;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TTpAprovacaoUsuarios = class(TRegistroQuipos)
  private
    Fcdtpaprovacao: integer;
    Fcdusuario: integer;
  public
    [keyfield]
    property cdtpaprovacao : integer read Fcdtpaprovacao write Fcdtpaprovacao;
    [keyfield]
    property cdusuario : integer read Fcdusuario write Fcdusuario;
  end;
  TTpAprovacaoUsuariosList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TTpAprovacaoUsuarios;
    procedure SetItem(Index: Integer; const Value: TTpAprovacaoUsuarios);
  public
    function New: TTpAprovacaoUsuarios;
    property Items[Index: Integer]: TTpAprovacaoUsuarios read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function UsuarioNaLista(cdusuario: integer):boolean;
  end;

implementation

function TTpAprovacaoUsuariosList.GetItem(Index: Integer): TTpAprovacaoUsuarios;
begin
  Result := TTpAprovacaoUsuarios(Inherited Items[Index]);
end;

function TTpAprovacaoUsuariosList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_tpaprovacaoUsuarios, codigo, _cdtpaprovacao));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TTpAprovacaoUsuariosList.New: TTpAprovacaoUsuarios;
begin
  Result := TTpAprovacaoUsuarios.Create;
  Add(Result);
end;

procedure TTpAprovacaoUsuariosList.SetItem(Index: Integer; const Value: TTpAprovacaoUsuarios);
begin
  Put(Index, Value);
end;

function TTpAprovacaoUsuariosList.UsuarioNaLista(cdusuario: integer): boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to count - 1 do
  begin
    result :=cdusuario = items[i].cdusuario;
    if result then
    begin
      break;
    end;
  end;
end;

end.
