unit orm.ItorcamentoRecurso;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TItorcamentoRecurso = class(TRegistroQuipos)
  private
    Fvltotal: Currency;
    Fvltotalpreparacao: Currency;
    Fvlpreparacao: Currency;
    Fvltotaloperacao: Currency;
    Fvloperacao: Currency;
    Fqtpreparacao: Double;
    Fqtoperacao: Double;
    Fcdtpduracao: integer;
    Fcdtpequipamento: Integer;
    Fcditorcamentorecurso: integer;
    Fcditorcamento: Integer;
    Fnusequencia: Integer;
    Fdsobservacao: string;
  public
    [keyfield]
    property cditorcamentorecurso : integer read Fcditorcamentorecurso write fcditorcamentorecurso;
    property cditorcamento : Integer read Fcditorcamento write fcditorcamento;
    property cdtpequipamento : Integer read Fcdtpequipamento write fcdtpequipamento;
    property cdtpduracao : integer read Fcdtpduracao write fcdtpduracao;
    property qtpreparacao : Double read Fqtpreparacao write fqtpreparacao;
    property qtoperacao : Double read Fqtoperacao write fqtoperacao;
    property vlpreparacao : Currency read Fvlpreparacao write fvlpreparacao;
    property vloperacao : Currency read Fvloperacao write fvloperacao;
    property vltotaloperacao : Currency read Fvltotaloperacao write fvltotaloperacao;
    property vltotalpreparacao : Currency read Fvltotalpreparacao write fvltotalpreparacao;
    property vltotal : Currency read Fvltotal write fvltotal;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property nusequencia : Integer read Fnusequencia write fnusequencia;
  end;
  TitorcamentorecursoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Titorcamentorecurso;
    procedure SetItem(Index: Integer; const Value: Titorcamentorecurso);
  public
    function New: Titorcamentorecurso;
    property Items[Index: Integer]: Titorcamentorecurso read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

function TitorcamentorecursoList.GetItem(Index: Integer): Titorcamentorecurso;
begin
  Result := Titorcamentorecurso(Inherited Items[Index]);
end;

function TitorcamentorecursoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itorcamentorecurso, codigo, _cditorcamento));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TitorcamentorecursoList.Ler(DataSet: TDataset):boolean;
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

function TitorcamentorecursoList.New: Titorcamentorecurso;
begin
  Result := Titorcamentorecurso.Create;
  Add(Result);
end;

procedure TitorcamentorecursoList.SetItem(Index: Integer; const Value: Titorcamentorecurso);
begin
  Put(Index, Value);
end;

end.
