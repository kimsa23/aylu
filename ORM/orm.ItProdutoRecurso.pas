unit orm.ItProdutoRecurso;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TItProdutoRecurso = class(TRegistroQuipos)
  private
    Fboativado: String;
    Fqtpreparacao: Double;
    Fqtoperacao: Double;
    Fqtliberacao: Double;
    Fnusequencia: Integer;
    Fcdproduto: Integer;
    Fcdtpduracaoliberacao: Integer;
    Fcdformulacao: Integer;
    Fcdtpequipamento: Integer;
    Fcdtpduracao: Integer;
    Fcditprodutorecurso: Integer;
    Fdsobservacao: string;
  public
    [keyfield]
    property cditprodutorecurso : Integer read Fcditprodutorecurso write Fcditprodutorecurso;
    [fk]
    property cdproduto : Integer read Fcdproduto write Fcdproduto;
    [fk]
    property cdtpequipamento : Integer read Fcdtpequipamento write Fcdtpequipamento;
    [fk]
    property cdtpduracao : Integer read Fcdtpduracao write Fcdtpduracao;
    [fk]
    property cdtpduracaoliberacao : Integer read Fcdtpduracaoliberacao write Fcdtpduracaoliberacao;
    [fk]
    property cdformulacao : Integer read Fcdformulacao write Fcdformulacao;
    property qtpreparacao : Double read Fqtpreparacao write Fqtpreparacao;
    property qtoperacao : Double read Fqtoperacao write Fqtoperacao;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property nusequencia : Integer read Fnusequencia write Fnusequencia;
    property boativado : String read Fboativado write Fboativado;
    property qtliberacao : Double read Fqtliberacao write Fqtliberacao;
  end;
  TitprodutorecursoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titprodutorecurso;
    procedure SetItem(Index: Integer; const Value: Titprodutorecurso);
  public
    function New: Titprodutorecurso;
    property Items[Index: Integer]: Titprodutorecurso read GetItem write SetItem;
    function Ler(codigo:Integer):boolean;
  end;

implementation

function TitprodutorecursoList.GetItem(Index: Integer): Titprodutorecurso;
begin
  Result := Titprodutorecurso(Inherited Items[Index]);
end;

function TitprodutorecursoList.Ler(codigo: Integer): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itprodutorecurso, codigo, _cdproduto));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TitprodutorecursoList.New: Titprodutorecurso;
begin
  Result := Titprodutorecurso.Create;
  Add(Result);
end;

procedure TitprodutorecursoList.SetItem(Index: Integer; const Value: Titprodutorecurso);
begin
  Put(Index, Value);
end;

end.
