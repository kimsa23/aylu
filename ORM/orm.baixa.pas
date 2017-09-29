unit orm.baixa;

interface

uses Contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Registro, Rotina.Retornasql,
  Classe.DAO, classe.gerar, classe.query,
  ORM.duplicata;

type
  TBaixa = class(TRegistroQuipos)
  private
    Fcdadntfornecedor: integer;
    Fprcomissao: Double;
    Fvldesconto: currency;
    Fcdbaixa: integer;
    Fcdnegociacaoentrada: integer;
    Fvljurosnrecebido: currency;
    Fcdautpagto: integer;
    Fvlbaixa: currency;
    Fnubaixa: string;
    Fvlmulta: currency;
    Fcdadntclientedestino: integer;
    Fvlcomissao: currency;
    Fvlliquido: currency;
    Fvlabatimento: currency;
    Fcdcheque: integer;
    Fvldevolucao: currency;
    Fcdadntcliente: integer;
    Fvljuro: currency;
    Fdtbaixa: TDate;
    Fcdduplicata: integer;
    Fcdtpbaixa: integer;
    Fcdmovbancario: integer;
    Fduplicata: TDuplicata;
    fcdparcelamentoentrada: integer;
  public
    property duplicata : TDuplicata read Fduplicata write Fduplicata;
    [keyfield]
    property cdbaixa : integer read Fcdbaixa write Fcdbaixa;
    [fk]
    property cdmovbancario : integer read Fcdmovbancario write Fcdmovbancario;
    [fk]
    property cdtpbaixa : integer read Fcdtpbaixa write Fcdtpbaixa;
    [fk]
    property cdadntcliente : integer read Fcdadntcliente write Fcdadntcliente;
    [fk]
    property cdautpagto : integer read Fcdautpagto write Fcdautpagto;
    [fk]
    property cdduplicata : integer read Fcdduplicata write Fcdduplicata;
    [fk]
    property cdadntfornecedor : integer read Fcdadntfornecedor write Fcdadntfornecedor;
    [fk]
    property cdcheque : integer read Fcdcheque write Fcdcheque;
    [fk]
    property cdnegociacaoentrada : integer read Fcdnegociacaoentrada write Fcdnegociacaoentrada;
    [fk]
    property cdadntclientedestino : integer read Fcdadntclientedestino write Fcdadntclientedestino;
    [fk]
    property cdparcelamentoentrada: integer read fcdparcelamentoentrada write fcdparcelamentoentrada;
    property nubaixa : string read Fnubaixa write Fnubaixa;
    property dtbaixa : TDate read Fdtbaixa write Fdtbaixa;
    property vlmulta : currency read Fvlmulta write Fvlmulta;
    property vljuro : currency read Fvljuro write Fvljuro;
    property vlbaixa : currency read Fvlbaixa write Fvlbaixa;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vlabatimento : currency read Fvlabatimento write Fvlabatimento;
    property vldevolucao : currency read Fvldevolucao write Fvldevolucao;
    property vlliquido : currency read Fvlliquido write Fvlliquido;
    property vljurosnrecebido : currency read Fvljurosnrecebido write Fvljurosnrecebido;
    property vlcomissao : currency read Fvlcomissao write Fvlcomissao;
    property prcomissao : Double read Fprcomissao write Fprcomissao;
    constructor create;
    destructor destroy;override;
    function Insert(boscript:boolean=false): String;
    function ObterVlComissao:currency;
  end;
  TbaixaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tbaixa;
    procedure SetItem(Index: Integer; const Value: Tbaixa);
  public
    function New: Tbaixa;
    property Items[Index: Integer]: Tbaixa read GetItem write SetItem;
    function sqlInsert:string;
    function sqlDelete:string;
    function Ler(codigo:Integer; cdfield:string=_cdmovbancario):Boolean;overload;
    function Ler(sqlwhere:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Sum(nmfield:string):currency;
    procedure ajustaDataBaixa;
  end;

implementation

constructor TBaixa.create;
begin
  inherited;
  fduplicata := tduplicata.create;
end;

destructor TBaixa.destroy;
begin
  freeandnil(fduplicata);
  inherited;
end;

function TBaixa.Insert(boscript: boolean=false): String;
begin
  if cdbaixa = 0 then
  begin
    cdbaixa := qgerar.GerarCodigo(_baixa);
  end;
  if cdtpbaixa = 0 then
  begin
    cdtpbaixa := 1;
  end;
  result := inherited insert(boscript);
end;

function TBaixa.ObterVlComissao: currency;
begin
  result := 0;
  if (cdadntcliente <> 0) and (qregistro.inteirodocodigo(_adntcliente, cdadntcliente, _cdrepresentante) <> 0) then
  begin
    exit;
  end;
  if (cdduplicata <> 0) then
  begin
    if (duplicata.cdduplicata <> cdduplicata) and (not duplicata.select(cdduplicata)) then
    begin
      exit;
    end;
    if duplicata.vlcomissao > 0 then
    begin
      result := (vlbaixa - vldesconto - vlabatimento - vldevolucao) * 100 / duplicata.vlduplicata * duplicata.vlcomissao / 100;
    end;
  end;
end;

procedure TbaixaList.ajustaDataBaixa;
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    if (items[i].dtbaixa = strtodate(_30_12_1899)) and (items[i].cdmovbancario <> 0) then
    begin
      items[i].dtbaixa := qregistro.DatadoCodigo(_movbancario, items[i].cdmovbancario, _dtemissao);
      items[i].Update;
    end;
  end;
end;

function TbaixaList.GetItem(Index: Integer): Tbaixa;
begin
  Result := Tbaixa(Inherited Items[Index]);
end;

function TbaixaList.Ler(DataSet: TDataset): boolean;
begin
  Clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    New;
    items[Count-1].Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TbaixaList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_baixa, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TbaixaList.Ler(codigo: Integer; cdfield:string=_cdmovbancario): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_baixa, codigo, cdfield));
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

function TbaixaList.New: Tbaixa;
begin
  Result := Tbaixa.Create;
  Add(Result);
end;

procedure TbaixaList.SetItem(Index: Integer; const Value: Tbaixa);
begin
  Put(Index, Value);
end;

function TbaixaList.sqlDelete: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Delete(true)+#13;
  end;
end;

function TbaixaList.sqlInsert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Insert(true)+#13;
  end;
end;

function TbaixaList.Sum(nmfield: string): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if nmfield = _vlbaixa then
    begin
      result := result + items[i].vlbaixa;
    end
    else if nmfield = _vlliquido then
    begin
      result := result + items[i].vlliquido;
    end;
  end;
end;

end.
