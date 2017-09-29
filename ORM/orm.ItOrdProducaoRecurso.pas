unit orm.ItOrdProducaoRecurso;

interface

uses contnrs, System.SysUtils, System.Classes,
  uConstantes,
  ORM.Apontamento, ORM.Empresa,
  Rotina.Retornasql, Rotina.DataHora,
  classe.query, Classe.DAO;

type
  TItOrdProducaoRecurso = class(TRegistroQuipos)
  private
    fcditordproducaorecurso : Integer;
    fcdordproducao : Integer;
    fcdtpequipamento : Integer;
    fcdtpduracao : Integer;
    fcdstitordproducaorecurso : Integer;
    fcdformulacao : Integer;
    fcdtpduracaoliberacao : Integer;
    fqtpreparacao : Double;
    fqtoperacao : Double;
    fvlpreparacao : Currency;
    fvloperacao : Currency;
    fvltotaloperacao : Currency;
    fvltotalpreparacao : Currency;
    fvltotal : Currency;
    fdsobservacao : string;
    fnusequencia : Integer;
    fhrinicioprevista : TTime;
    fhrterminoprevista : TTime;
    fdtinicioprevista : TDate;
    fdtterminoprevista : TDate;
    fdttermino : TDate;
    fhrtermino : TTime;
    fdtinicio : TDate;
    fhrinicio : TTime;
    fqtitem : Double;
    fnuquociente : Integer;
    fqtquociente : integer;
    fqtliberacao : Double;
    Fapontamento: tapontamentolist;
  public
    [keyfield]
    property cditordproducaorecurso : Integer read fcditordproducaorecurso write fcditordproducaorecurso;
    [fk]
    property cdordproducao : Integer read fcdordproducao write fcdordproducao;
    [fk]
    property cdtpequipamento : Integer read fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdtpduracao : Integer read fcdtpduracao write fcdtpduracao;
    [fk]
    property cdstitordproducaorecurso : Integer read fcdstitordproducaorecurso write fcdstitordproducaorecurso;
    [fk]
    property cdformulacao : Integer read fcdformulacao write fcdformulacao;
    [fk]
    property cdtpduracaoliberacao : Integer read fcdtpduracaoliberacao write fcdtpduracaoliberacao;
    property qtpreparacao : Double read fqtpreparacao write fqtpreparacao;
    property qtoperacao : Double read fqtoperacao write fqtoperacao;
    property vlpreparacao : Currency read fvlpreparacao write fvlpreparacao;
    property vloperacao : Currency read fvloperacao write fvloperacao;
    property vltotaloperacao : Currency read fvltotaloperacao write fvltotaloperacao;
    property vltotalpreparacao : Currency read fvltotalpreparacao write fvltotalpreparacao;
    property vltotal : Currency read fvltotal write fvltotal;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    property nusequencia : Integer read fnusequencia write fnusequencia;
    property hrinicioprevista : TTime read fhrinicioprevista write fhrinicioprevista;
    property hrterminoprevista : TTime read fhrterminoprevista write fhrterminoprevista;
    property dtinicioprevista : TDate read fdtinicioprevista write fdtinicioprevista;
    property dtterminoprevista : TDate read fdtterminoprevista write fdtterminoprevista;
    property dttermino : TDate read fdttermino write fdttermino;
    property hrtermino : TTime read fhrtermino write fhrtermino;
    property dtinicio : TDate read fdtinicio write fdtinicio;
    property hrinicio : TTime read fhrinicio write fhrinicio;
    property qtitem : Double read fqtitem write fqtitem;
    property nuquociente : Integer read fnuquociente write fnuquociente;
    property qtquociente : integer read fqtquociente write fqtquociente;
    property qtliberacao : Double read fqtliberacao write fqtliberacao;
    property apontamento : tapontamentolist read Fapontamento write Fapontamento;
    function Update(boscript:boolean=false; data:TDate=0): String;
    constructor create;
    destructor destroy; override;
    procedure Encerrar_etapa;
    procedure IniciarExecucao;
    function getCditordproducaorecursoAnterior:string;
    function getCdequipamentoAnterior(boequipamentoanterior:Boolean):integer;
    class function getCditordproducaorecurso(cdordproducao, cdtpequipamento:integer):Integer;
  end;
  TItOrdproducaoRecursoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItOrdproducaoRecurso;
    procedure SetItem(Index: Integer; const Value: TItOrdproducaoRecurso);
  public
    function New: TItOrdproducaoRecurso;
    property Items[Index: Integer]: TItOrdproducaoRecurso read GetItem write SetItem;
    function Ler(nmcdfield: string; codigo:Integer):Boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
    function Excluir(boscript:boolean=false):string;
    function getQthoraorcada:Double;
    function getNusequencia(codigo:integer):Integer;
    function TodosRecursosConcluido:boolean;
    class function ConcluirOPSeTodosRecursoConcluido(cdordproducao: integer; data: TDate):boolean;
  end;

implementation

uses ORM.Ordproducao;

class function TItOrdproducaoRecursoList.ConcluirOPSeTodosRecursoConcluido(cdordproducao: integer; data: TDate): boolean;
var
  ordproducao : tordproducao;
begin
  ordproducao := tordproducao.create;
  try
    ordproducao.itordproducaorecurso.ler(_cdordproducao, cdordproducao);
    if ordproducao.itordproducaorecurso.TodosRecursosConcluido then
    begin
      ordproducao.select(cdordproducao);
      ordproducao.cdstordproducao := 7;
      ordproducao.update;
      if data = 0 then
      begin
        data := DtBanco;
      end;
      ordproducao.GerarEntradaEstoqueProdutoOP(Data);
    end;
    result := true;
  finally
    freeandnil(ordproducao);
  end;
end;

function TItOrdproducaoRecursoList.Excluir(boscript: boolean=false): string;
var
  i : Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Delete(boscript);
  end;
end;

function TItOrdproducaoRecursoList.GetItem(Index: Integer): TItOrdproducaoRecurso;
begin
  Result := TItOrdproducaoRecurso(Inherited Items[Index]);
end;

function TItOrdproducaoRecursoList.Ler(nmcdfield: string; codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_ItOrdproducaoRecurso, codigo, nmcdfield));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItOrdproducaoRecursoList.getQthoraorcada: Double;
var
  i : Integer;
begin
  result := 0;
  for i := 0 to count-1 do
  begin
    result := result + Items[i].qtpreparacao + Items[i].qtoperacao;
  end;
end;

function TItOrdproducaoRecursoList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_ItOrdproducaoRecurso, sqlwhere));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItOrdproducaoRecursoList.New: TItOrdproducaoRecurso;
begin
  Result := TItOrdproducaoRecurso.Create;
  Add(Result);
end;

procedure TItOrdproducaoRecursoList.SetItem(Index: Integer; const Value: TItOrdproducaoRecurso);
begin
  Put(Index, Value);
end;

function TItOrdproducaoRecursoList.TodosRecursosConcluido: boolean;
var
  i : integer;
begin
  result := true;
  for I := 0 to count - 1 do
  begin
    if items[i].cdstitordproducaorecurso <> 4 then
    begin
      result := false;
      break;
    end;
  end;
end;

constructor TItOrdProducaoRecurso.create;
begin
  inherited;
  fapontamento := tapontamentolist.create;
end;

destructor TItOrdProducaoRecurso.destroy;
begin
  freeandnil(fapontamento);
  inherited;
end;

procedure TItOrdProducaoRecurso.Encerrar_etapa;
begin
  cdstitordproducaorecurso := 4;
  dttermino := DtBanco;
  hrtermino := HrBanco;
end;

function TItOrdProducaoRecurso.getCdequipamentoAnterior(boequipamentoanterior:Boolean):integer;
begin
  if not boequipamentoanterior then
  begin
    result := 0;
    exit;
  end;
  result := retornasqlInteger('select first 1 cdequipamento '+
                              'from apontamento '+
                              'where cdempresa='+cdempresa.tostring+' and cditordproducaorecurso='+getCditordproducaorecursoAnterior+' '+
                              'order by cdapontamento desc');
end;

function TItOrdProducaoRecurso.getCditordproducaorecursoAnterior: string;
begin
  result := retornasqlstring('select first 1 cditordproducaorecurso '+
                             'from itordproducaorecurso '+
                             'where cdempresa='+cdempresa.tostring+' and cdordproducao='+inttostr(cdordproducao)+' and nusequencia<'+inttostr(nusequencia)+' '+
                             'order by nusequencia');
end;

procedure TItOrdProducaoRecurso.IniciarExecucao;
begin
  cdstitordproducaorecurso := 3;
  if not (dtinicio > strtodate(_31_12_1899)) then
  begin
    dtinicio := dtbanco;
    hrinicio := hrbanco;
  end;
end;

function TItOrdProducaoRecurso.Update(boscript: boolean=false; data:TDate=0): String;
begin
  result := inherited update(boscript);
  if not boscript then
  begin
    titordproducaorecursoList.ConcluirOPSeTodosRecursoConcluido(cdordproducao, data);
  end;
end;

function TItOrdproducaoRecursoList.getNusequencia(codigo: integer): Integer;
var
  i : Integer;
begin
  result := - 1;
  for i := 0 to Count - 1 do
  begin
    if codigo = Items[i].cditordproducaorecurso then
    begin
      result := Items[i].nusequencia;
      Break;
    end;
  end;
end;

class function TItordproducaorecurso.getCditordproducaorecurso(cdordproducao, cdtpequipamento:integer):Integer;
begin
  result := RetornaSQLInteger('select cditordproducaorecurso '+
                              'from itordproducaorecurso '+
                              'where cdempresa='+empresa.cdempresa.tostring+' '+
                              'and cdordproducao='+inttostr(cdordproducao)+' '+
                              'and cdtpequipamento='+inttostr(cdtpequipamento));
end;

end.
