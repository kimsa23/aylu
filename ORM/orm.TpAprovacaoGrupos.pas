unit orm.TpAprovacaoGrupos;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  ORM.Grupos,
  Classe.DAO, classe.query;

type
  TTpAprovacaoGrupos = class(TRegistroQuipos)
  private
    Fcdtpaprovacao: integer;
    Fcdgrupos: integer;
  public
    [keyfield]
    property cdtpaprovacao : integer read Fcdtpaprovacao write Fcdtpaprovacao;
    [keyfield]
    property cdgrupos : integer read Fcdgrupos write Fcdgrupos;
  end;
  TTpAprovacaoGruposList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TTpAprovacaoGrupos;
    procedure SetItem(Index: Integer; const Value: TTpAprovacaoGrupos);
  public
    function New: TTpAprovacaoGrupos;
    property Items[Index: Integer]: TTpAprovacaoGrupos read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function GruposNaLista(Grupos: TGruposList):boolean;
  end;

implementation

function TTpAprovacaoGruposList.GetItem(Index: Integer): TTpAprovacaoGrupos;
begin
  Result := TTpAprovacaoGrupos(Inherited Items[Index]);
end;

function TTpAprovacaoGruposList.GruposNaLista(Grupos: TGruposList): boolean;
var
  x, i : integer;
begin
  result := false;
  for i := 0 to count - 1 do
  begin
    for x := 0 to grupos.Count - 1 do
    begin
      result := grupos.items[x].cdgrupos = items[i].cdgrupos;
      if result then
      begin
        break;
      end;
    end;
    if result then
    begin
      break;
    end;
  end;
end;

function TTpAprovacaoGruposList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_tpaprovacaogrupos, codigo, _cdtpaprovacao));
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

function TTpAprovacaoGruposList.New: TTpAprovacaoGrupos;
begin
  Result := TTpAprovacaoGrupos.Create;
  Add(Result);
end;

procedure TTpAprovacaoGruposList.SetItem(Index: Integer; const Value: TTpAprovacaoGrupos);
begin
  Put(Index, Value);
end;

end.
