unit orm.ItContratoNegociacao;

interface

uses Contnrs, System.SysUtils, Math, forms, classes, Data.DB,
  uConstantes,
  orm.ItContratoParcela, orm.produto,
  Rotina.Retornasql, Rotina.Registro,
  Dialogo.Progressbar,
  classe.gerar, classe.query, Classe.DAO, classe.Executasql;

type
  TItContratoNegociacao = class(TRegistroQuipos)
  private
    FItContratoParcela: TItContratoParcelaList;
    Fvlparcela: Currency;
    Fvlsaldo: Currency;
    Fprjuro: Double;
    Fnudia: Integer;
    Fcdcontrato: Integer;
    Fcditcontratonegociacao: Integer;
    Fcdperiodicidade: Integer;
    Fcdtpcorrecao: Integer;
    Fnmitcontratonegociacao: string;
    Fdtemissao: TDate;
    Fnuparcelas: Integer;
    Fboativo: String;
    Fdttermino: TDate;
    function getdtvencimento(dtvencimento: TDate): TDate;
  public
    property ItContratoParcela : TItContratoParcelaList read FItContratoParcela write FItContratoParcela;
    [keyfield]
    property cditcontratonegociacao : Integer read Fcditcontratonegociacao write fcditcontratonegociacao;
    [fk]
    property cdcontrato : Integer read Fcdcontrato write fcdcontrato;
    [fk]
    property cdtpcorrecao : Integer read Fcdtpcorrecao write fcdtpcorrecao;
    [fk]
    property cdperiodicidade : Integer read Fcdperiodicidade write fcdperiodicidade;
    property vlsaldo : Currency read Fvlsaldo write fvlsaldo;
    property nudia : Integer read Fnudia write fnudia;
    property vlparcela : Currency read Fvlparcela write fvlparcela;
    property prjuro : Double read Fprjuro write fprjuro;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    property nmitcontratonegociacao : string read Fnmitcontratonegociacao write fnmitcontratonegociacao;
    property nuparcelas : Integer read Fnuparcelas write fnuparcelas;
    property dttermino : TDate read Fdttermino write Fdttermino;
    property boativo : String read Fboativo write Fboativo;
    constructor create;
    destructor destroy; override;
    procedure  gerar_parcelas;
    procedure  Gerar_duplicatas;
    function   Salvar:Boolean;
  end;
  TItContratoNegociacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItContratoNegociacao;
    procedure SetItem(Index: Integer; const Value: TItContratoNegociacao);
  public
    function  New: TItContratoNegociacao;
    property  Items[Index: Integer]: TItContratoNegociacao read GetItem write SetItem;
    function  Insert(cdcontrato:integer): TItContratoNegociacao;
    function  sql_insert:string;
    function  Ler(codigo:Integer):Boolean;overload;
    function  Ler(sqlwhere:string):Boolean;overload;
  end;

implementation

function TItContratoNegociacaoList.GetItem(Index: Integer): TItContratoNegociacao;
begin
  Result := TItContratoNegociacao(Inherited Items[Index]);
end;

function TItContratoNegociacaoList.Insert(cdcontrato: integer): TItContratoNegociacao;
begin
  result              := new;
  Result.cdcontrato   := cdcontrato;
  Result.cditcontratonegociacao := QGerar.GerarCodigo(_itcontratonegociacao);
end;

function TItContratoNegociacaoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itcontratoNegociacao, codigo, _cdcontrato));
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

function TItContratoNegociacaoList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itcontratoNegociacao, sqlwhere));
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

function TItContratoNegociacaoList.New: TItContratoNegociacao;
begin
  Result := TItContratoNegociacao.Create;
  Add(Result);
end;

procedure TItContratoNegociacaoList.SetItem(Index: Integer; const Value: TItContratoNegociacao);
begin
  Put(Index, Value);
end;

function TItContratoNegociacaoList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    result := result + Items[i].Insert(True)+#13;
  end;
end;

constructor TItContratoNegociacao.create;
begin
  inherited;
  fItContratoParcela := tItContratoParcelaList.create;
end;

destructor TItContratoNegociacao.destroy;
begin
  FreeAndNil(fItContratoParcela);
  inherited;
end;

{Metodologia do Financiamento com Prestações Fixas
Cálculo com juros compostos e capitalização mensal.
Fórmula q0=(((1-(1+j)^-n))/j)*p
Onde:
n = Nº de Meses
j = Taxa de Juros Mensal
p = Valor da Prestação
q0 = Valor Financiado
Obs.: O cálculo da taxa de juros (j) é feito por aproximação do Valor da Prestação (p) com margem de erro sobre p inferior a 0.000001.}
procedure TItContratoNegociacao.gerar_parcelas;
  function get_vlparcela:currency;
  var
    vparc : double;
    expo : Double;
  begin
    expo := Math.Power((1+(prjuro/100)), nuparcelas);
    vparc := prjuro*expo;
    expo   := expo-1;
    result := (100*vlsaldo*(vparc/expo))/10000;
  end;
var
  i : Integer;
  dtvencimento : TDate;
  valor : Currency;
  frmprogressbar : tfrmprogressbar;
begin
  vlparcela      := InterestPayment(0.1, 1, nuparcelas, vlsaldo, 0 , PtStartOfPeriod) * (-1);
  vlparcela      := get_vlparcela;
  valor          := vlsaldo;
  dtvencimento   := dtemissao;
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    frmprogressbar.gau.maxvalue := nuparcelas;
    frmprogressbar.show;
    for i := 1 to nuparcelas do
    begin
      frmprogressbar.pnl.caption  := 'Gerando parcelas... '+inttostr(i)+' de '+inttostr(nuparcelas);
      frmprogressbar.gau.progress := i;
      application.processmessages;
      dtvencimento := getdtvencimento(dtvencimento);
      ItContratoParcela.Insert(cditcontratonegociacao);
      ItContratoParcela.Items[i-1].vlparcela        := vlparcela;
      ItContratoParcela.Items[i-1].nuparcela        := i;
      ItContratoParcela.Items[i-1].dtparcela        := dtvencimento;
      ItContratoParcela.Items[i-1].vlsaldo          := valor;
      ItContratoParcela.Items[i-1].vljuros          := valor * prjuro / 100;
      ItContratoParcela.Items[i-1].vlsaldocorrigido := ItContratoParcela.Items[i-1].vlsaldo + ItContratoParcela.Items[i-1].vljuros;
      ItContratoParcela.Items[i-1].vljurosadicional := 0;
      ItContratoParcela.Items[i-1].vlamortizacao    := ItContratoParcela.Items[i-1].vlparcela;
      ItContratoParcela.Items[i-1].vlsaldodevedor   := ItContratoParcela.Items[i-1].vlsaldocorrigido - vlparcela;
      valor                                         := ItContratoParcela.Items[i-1].vlsaldodevedor;
    end;
    dttermino := ItContratoParcela.Items[ItContratoParcela.count-1].dtparcela;
  finally
    freeandnil(frmprogressbar);
  end;
end;

function TItContratoNegociacao.getdtvencimento(dtvencimento: TDate): TDate;
var
  ano, mes, dia : word;
  book : Boolean;
begin
  result := 0;
  DecodeDate(dtvencimento, ano, mes, dia);
  dia := nudia;
  Inc(mes);
  if mes > 12 then
  begin
    mes := 1;
    Inc(ano);
  end;
  book := False;
  repeat
    try
      result := EncodeDate(ano, mes, dia);
      book := True;
    except
      Dec(dia);
    end;
  until book;
end;

function TItContratoNegociacao.Salvar: Boolean;
var
  sql : TStrings;
begin
  sql := TStringList.Create;
  try
    sql.Add(Insert(true));
    sql.text := sql.text + ItContratoParcela.sql_insert;
    Gerar_duplicatas;
    sql.text := sql.Text + itcontratoparcela.sql_insert_duplicata;
    result := ExecutaScript(sql);
  finally
    FreeAndNil(sql);
  end;
end;

procedure TItContratoNegociacao.Gerar_duplicatas;
var
  cdproduto, i : integer;
  cdcliente : LargeInt;
  frmprogressbar : tfrmprogressbar;
  produto : tproduto;
begin
  cdproduto      := qregistro.InteirodoCodigo(_contrato, cdcontrato, _cdproduto);
  cdcliente      := qregistro.InteirodoCodigo(_contrato, cdcontrato, _cdcliente);
  frmprogressbar := tfrmprogressbar.create(nil);
  produto        := tproduto.create;
  try
    produto.Select(cdproduto);
    frmprogressbar.gau.maxvalue := ItContratoParcela.count;
    frmprogressbar.show;
    for i := 0 to ItContratoParcela.count - 1 do
    begin
      frmprogressbar.gau.progress := i + 1;
      application.processMessages;
      ItContratoParcela.Items[i].duplicata.cdduplicata         := QGerar.GerarCodigo(_duplicata);
      ItContratoParcela.Items[i].duplicata.cdcliente           := cdcliente;
      ItContratoParcela.Items[i].duplicata.cditcontratoparcela := ItContratoParcela.Items[i].cditcontratoparcela;
      ItContratoParcela.Items[i].duplicata.nuduplicata         := IntToStr(cdcontrato)+'-'+inttostr(ItContratoParcela.Items[i].nuparcela)+'/'+inttostr(nuparcelas)+'-'+produto.dsquadra+'/'+produto.dslote;
      ItContratoParcela.Items[i].duplicata.dtemissao           := dtemissao;
      ItContratoParcela.Items[i].duplicata.dtentrada           := dtemissao;
      ItContratoParcela.Items[i].duplicata.dtvencimento        := ItContratoParcela.Items[i].dtparcela;
      ItContratoParcela.Items[i].duplicata.dtprorrogacao       := ItContratoParcela.Items[i].dtparcela;
      ItContratoParcela.Items[i].duplicata.vlduplicata         := ItContratoParcela.Items[i].vlparcela;
      ItContratoParcela.Items[i].duplicata.dsparcela           := inttostr(ItContratoParcela.Items[i].nuparcela)+'/'+inttostr(nuparcelas);
    end;
  finally
    freeandnil(frmprogressbar);
    freeandnil(produto);
  end;
end;

end.
