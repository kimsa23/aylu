unit ORM.CartaCorrecao;

interface

uses Classe.DAO, System.Classes, Contnrs, Data.DB, classe.query, rotina.retornasql, uConstantes, System.SysUtils;

type
  TCartaCorrecao = class(TRegistroQuipos)
  private
    Fdsxml: string;
    Fcdcartacorrecao: integer;
    Ftsemissao: TDateTime;
    Fnuprotocolo: string;
    Fcdsaida: integer;
    Fdscartacorrecao: string;
    Fnseqevento: integer;
  public
    [keyfield]
    property cdcartacorrecao : integer read Fcdcartacorrecao write Fcdcartacorrecao;
    [fk]
    property cdsaida : integer read Fcdsaida write Fcdsaida;
    property dscartacorrecao : string read Fdscartacorrecao write Fdscartacorrecao;
    property dsxml : string read Fdsxml write Fdsxml;
    property tsemissao : TDateTime read Ftsemissao write Ftsemissao;
    property nuprotocolo : string read Fnuprotocolo write Fnuprotocolo;
    property nseqevento : integer read Fnseqevento write Fnseqevento;
  end;
  TCartaCorrecaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCartaCorrecao;
    procedure SetItem(Index: Integer; const Value: TCartaCorrecao);
  public
    function New: TCartaCorrecao;
    property Items[Index: Integer]: TCartaCorrecao read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
  end;

implementation

function TCartaCorrecaoList.GetItem(Index: Integer): TCartaCorrecao;
begin
  Result := TCartaCorrecao(Inherited Items[Index]);
end;

function TCartaCorrecaoList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.first;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TCartaCorrecaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_cartacorrecao, codigo, _cdsaida));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    freeandnil(q);
  end;
end;

function TCartaCorrecaoList.New: TCartaCorrecao;
begin
  Result := TCartaCorrecao.Create;
  Add(Result);
end;

procedure TCartaCorrecaoList.SetItem(Index: Integer; const Value: TCartaCorrecao);
begin
  Put(Index, Value);
end;

end.
