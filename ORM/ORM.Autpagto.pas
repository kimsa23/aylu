unit ORM.Autpagto;

interface

uses
  system.classes, sysutils, db, Contnrs, DateUtils,
  uconstantes, rotina.Registro, rotina.datahora,
  rotina.RetornaSql, orm.usuario, classe.aplicacao, orm.empresa, classe.gerar,
  orm.Itcondpagto,
  classe.query, classe.dao, orm.condpagto, orm.fornecedor, dialogo.AssinaturaDigital, orm.HAprovacaoAutpagto;

type
  TAutPagto = class(TRegistroQuipos)
  private
    Fprmulta: double;
    Fvlacrescimo: currency;
    Fvldesconto: currency;
    Fdsparcela: string;
    Fdshistorico: string;
    Fdsobservacao: string;
    Fcdusuarioaprovacao: integer;
    Fcdplconta: integer;
    Fcdfornecedor: largeint;
    Fcdautpagto: integer;
    Fboimpressa: string;
    Fcdconta: integer;
    Ftsaprovacao: TDateTime;
    Fvlbaixa: currency;
    Fdtentrada: TDate;
    Fvljuros: currency;
    Fvlmulta: currency;
    Fvlabatimento: currency;
    Fvldevolucao: currency;
    Fboenviado: string;
    Fvlprevisto: currency;
    Fcdtpcobranca: integer;
    Fnuplconta: string;
    Fvlrecebido: currency;
    Fvlautpagto: currency;
    Fnuautpagto: string;
    Fprmoradiaria: double;
    Fcdcomputadoraprovacao: integer;
    Fvlsaldo: currency;
    Fdtbaixa: TDate;
    Fdtvencimento: TDate;
    Fcdentrada: integer;
    Fvldeducao: currency;
    Fdtprorrogacao: TDate;
    Fcdcntcusto: integer;
    Fcdtppagamento: integer;
    Fdtemissao: TDate;
    Fcdusuariobaixa: integer;
    Fcdstautpagto: integer;
    Fnucntcusto: string;
    fborateiocntcusto: string;
    fborateioplconta: string;
    ffornecedor: TFornecedor;
    fcdparcelamentosaida: integer;
    fcdusuarioaprovacaofinanceiro: integer;
    fcdcomputadoraprovacaofinanceiro: integer;
    Ftsaprovacaofinanceiro: TDateTime;
    fcdrateiocntcusto: integer;
    fcdrateioplconta: Integer;
  public
    property fornecedor: TFornecedor read ffornecedor write ffornecedor;
    [keyfield]
    property cdautpagto : integer read Fcdautpagto write Fcdautpagto;
    [fk]
    property cdfornecedor : largeint read Fcdfornecedor write Fcdfornecedor;
    [fk]
    property cdstautpagto : integer read Fcdstautpagto write Fcdstautpagto;
    [fk]
    property cdtppagamento : integer read Fcdtppagamento write Fcdtppagamento;
    [fk]
    property cdentrada : integer read Fcdentrada write Fcdentrada;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write Fcdcntcusto;
    property nucntcusto : string read Fnucntcusto write Fnucntcusto;
    [fk]
    property cdtpcobranca : integer read Fcdtpcobranca write Fcdtpcobranca;
    [fk]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    [fk]
    property cdusuariobaixa : integer read Fcdusuariobaixa write Fcdusuariobaixa;
    [fk]
    property cdconta : integer read Fcdconta write Fcdconta;
    [fk]
    property cdparcelamentosaida: integer read fcdparcelamentosaida write fcdparcelamentosaida;
    [FK]
    property cdusuarioaprovacaofinanceiro: integer read fcdusuarioaprovacaofinanceiro write fcdusuarioaprovacaofinanceiro;
    [fk]
    property cdcomputadoraprovacaofinanceiro: integer read fcdcomputadoraprovacaofinanceiro write fcdcomputadoraprovacaofinanceiro;
    [FK]
    property cdrateiocntcusto: integer read fcdrateiocntcusto write fcdrateiocntcusto;
    [FK]
    property cdrateioplconta: Integer read fcdrateioplconta write fcdrateioplconta;
    property nuautpagto : string read Fnuautpagto write Fnuautpagto;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtvencimento : TDate read Fdtvencimento write Fdtvencimento;
    property dtprorrogacao : TDate read Fdtprorrogacao write Fdtprorrogacao;
    property vlautpagto : currency read Fvlautpagto write Fvlautpagto;
    property prmoradiaria : double read Fprmoradiaria write Fprmoradiaria;
    property dshistorico : string read Fdshistorico write Fdshistorico;
    property dtbaixa : TDate read Fdtbaixa write Fdtbaixa;
    property vlbaixa : currency read Fvlbaixa write Fvlbaixa;
    property vlprevisto : currency read Fvlprevisto write Fvlprevisto;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property prmulta : double read Fprmulta write Fprmulta;
    property vlmulta : currency read Fvlmulta write Fvlmulta;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property vldevolucao : currency read Fvldevolucao write Fvldevolucao;
    property vlabatimento : currency read Fvlabatimento write Fvlabatimento;
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
    property vldeducao : currency read Fvldeducao write Fvldeducao;
    property vlacrescimo : currency read Fvlacrescimo write Fvlacrescimo;
    property vljuros : currency read Fvljuros write Fvljuros;
    property vlrecebido : currency read Fvlrecebido write Fvlrecebido;
    property boenviado : string read Fboenviado write Fboenviado;
    property boimpressa : string read Fboimpressa write Fboimpressa;
    property nuplconta : string read Fnuplconta write Fnuplconta;
    property dsparcela : string read Fdsparcela write Fdsparcela;
    property dtentrada : TDate read Fdtentrada write Fdtentrada;
    property cdusuarioaprovacao : integer read Fcdusuarioaprovacao write Fcdusuarioaprovacao;
    property tsaprovacao : TDateTime read Ftsaprovacao write Ftsaprovacao;
    property tsaprovacaofinanceiro : TDateTime read Ftsaprovacaofinanceiro write Ftsaprovacaofinanceiro;
    property cdcomputadoraprovacao : integer read Fcdcomputadoraprovacao write Fcdcomputadoraprovacao;
    property borateiocntcusto : string read fborateiocntcusto write fborateiocntcusto;
    property borateioplconta : string read fborateioplconta write fborateioplconta;
    procedure RegistrarHistoricoAprovacao(cdtphaprovacaoautpagto:integer; cdtipo:string);
    function Insert(boscript:boolean=false): String;
    constructor Create;
    destructor destroy; override;
    function Aprovar:boolean;
    function AprovarFinanceiro:boolean;
    function Desaprovar:boolean;
    function DesaprovarFinanceiro:boolean;
  end;
  TautpagtoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tautpagto;
    procedure SetItem(Index: Integer; const Value: Tautpagto);
  public
    function New: Tautpagto;
    property Items[Index: Integer]: Tautpagto read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function getcdcondpagto: integer;
    function indice(value:Integer):Integer;
  end;

implementation

function TAutPagto.Aprovar: boolean;
var
  cdusuario: Integer;
  texto : string;
begin
  result := false;
  texto  := 'Aprovar o pagamento do Contas a Pagar '+nuautpagto+#13+
            'para o fornecedor '+CDFORNECEDOR.ToString+' - '+fornecedor.nmfornecedor+#13+
            'com o valor de '+formatfloat(__moeda, VLAUTPAGTO)+'.';
  if assinaturadigital(texto, cdusuario) then
  begin
    cdusuarioaprovacao    := cdusuario;
    cdcomputadoraprovacao := vgcdcomputador.tointeger;
    tsaprovacao           := tsBanco;
    update;
    RegistrarHistoricoAprovacao(1, _a);
    result := true;
  end
end;

function TAutPagto.AprovarFinanceiro: boolean;
var
  cdusuario: Integer;
  texto :string;
begin
  result := false;
  texto := 'Aprovar para o financeiro o pagamento do Contas a Pagar '+nuautpagto+#13+
           'para o fornecedor '+CDFORNECEDOR.ToString+' - '+fornecedor.nmfornecedor+#13+
           'com o valor de '+formatfloat(__moeda, VLAUTPAGTO)+'.';
  if assinaturadigital(texto, cdusuario) then
  begin
    cdusuarioaprovacaofinanceiro    := cdusuario;
    cdcomputadoraprovacaofinanceiro := vgcdcomputador.tointeger;
    tsaprovacaofinanceiro           := tsBanco;
    update;
    RegistrarHistoricoAprovacao(2, _a);
    result := true;
  end
end;

constructor TAutPagto.Create;
begin
  inherited;
  ffornecedor := TFornecedor.create;
end;

function TAutPagto.Desaprovar: boolean;
var
  cdusuario: Integer;
  texto :string;
begin
  result := false;
  texto := 'Desaprovar o pagamento do Contas a Pagar '+nuautpagto+#13+
           'para o fornecedor '+CDFORNECEDOR.ToString+' - '+fornecedor.NMFORNECEDOR+#13+
           'com o valor de '+formatfloat(__moeda, vlautpagto)+'.';
  if assinaturadigital(texto, cdusuario) then
  begin
    cdusuarioaprovacao    := 0;
    cdcomputadoraprovacao := 0;
    tsaprovacao           := 0;
    update;
    RegistrarHistoricoAprovacao(1, _d);
    result := true;
  end;
end;

function TAutPagto.DesaprovarFinanceiro: boolean;
var
  cdusuario: Integer;
  texto :string;
begin
  result := false;
  texto := 'Desaprovar para o financeiro o pagamento do Contas a Pagar '+nuautpagto+#13+
           'para o fornecedor '+CDFORNECEDOR.ToString+' - '+fornecedor.NMFORNECEDOR+#13+
           'com o valor de '+formatfloat(__moeda, vlautpagto)+'.';
  if assinaturadigital(texto, cdusuario) then
  begin
    cdusuarioaprovacaofinanceiro    := 0;
    cdcomputadoraprovacaofinanceiro := 0;
    tsaprovacaofinanceiro           := 0;
    update;
    RegistrarHistoricoAprovacao(2, _d);
    result := true;
  end;
end;

destructor TAutPagto.destroy;
begin
  FreeAndNil(ffornecedor);
  inherited;
end;

function TAutPagto.Insert(boscript: boolean): String;
begin
  if cdautpagto    = 0  then cdautpagto    := qgerar.GerarCodigo(_autpagto);
  if nuautpagto    = '' then nuautpagto    := inttostr(cdautpagto);
  if dtemissao     = 0  then dtemissao     := DtBanco;
  if dtentrada     = 0  then dtentrada     := dtemissao;
  if dtvencimento  = 0  then dtvencimento  := dtemissao;
  if dtprorrogacao = 0  then dtprorrogacao := dtvencimento;
  vlsaldo      := vlautpagto;
  vlbaixa      := 0;
  vlprevisto   := 0;
  vldesconto   := 0;
  vlmulta      := 0;
  vldevolucao  := 0;
  vlabatimento := 0;
  vldeducao    := 0;
  vlacrescimo  := 0;
  vljuros      := 0;
  vlrecebido   := 0;
  prmoradiaria := 0;
  prmulta      := 0;
  cdstautpagto := 1;
  result       := inherited insert(boscript);
end;

procedure TAutPagto.RegistrarHistoricoAprovacao(cdtphaprovacaoautpagto:integer; cdtipo: string);
var
  haprovacaoautpagto : thaprovacaoautpagto;
begin
  haprovacaoautpagto := thaprovacaoautpagto.create;
  try
    haprovacaoautpagto.cdempresa            := empresa.cdempresa;
    haprovacaoautpagto.cdhaprovacaoautpagto := qgerar.GerarCodigo(_haprovacaoautpagto);
    haprovacaoautpagto.cdautpagto           := cdautpagto;
    haprovacaoautpagto.cdtphaprovacaoautpagto := cdtphaprovacaoautpagto;
    haprovacaoautpagto.cdusuario            := usuario.cdusuario;
    haprovacaoautpagto.cdcomputador         := vgcdcomputador.tointeger;
    haprovacaoautpagto.tsaprovacao          := tsBanco;
    haprovacaoautpagto.cdtipo               := cdtipo;
    haprovacaoautpagto.insert;
  finally
    freeandnil(haprovacaoautpagto);
  end;
end;

function TautpagtoList.getcdcondpagto: integer;
var
  i : integer;
  itcondpagto : titcondpagtoList;
  sql : string;
  q : tclassequery;
  function makesql(nudias:string):string;
  begin
    result := 'select cdcondpagto from itcondpagto where cdempresa='+empresa.cdempresa.ToString+' and nudias in ('+nudias+') ';
    if q.q.active then
    begin
      while not q.q.eof do
      begin
        if q.q.recno = 1 then
        begin
          result := result + 'and cdcondpato in (';
        end
        else
        begin
          result := result + ',';
        end;
        result := result + q.q.fieldbyname(_cdcondpagto).asstring;
        q.q.next;
      end;
      if q.q.recordcount > 0 then
      begin
        result := result + ')';
      end;
    end;
    result := result + ' group by cdcondpagto having count(*)='+inttostr(count);
  end;
begin
  result := 0;
  itcondpagto := titcondpagtoList.create;
  q := TClasseQuery.create;
  try
    for I := 0 to count - 1 do
    begin
      with itcondpagto.New do
      begin
        nudias := DaysBetween(items[i].dtvencimento, items[i].dtemissao);
        sql := makesql(itcondpagto.getNudiasAcumulado);
        q.q.close;
        q.q.open(sql);
      end;
    end;
    if q.q.active then
    begin
      result := q.q.fieldbyname(_cdcondpagto).asinteger;
    end;
  finally
    freeandnil(itcondpagto);
  end;
end;

function TautpagtoList.GetItem(Index: Integer): Tautpagto;
begin
  Result := TAutpagto(Inherited Items[Index]);
end;

function TautpagtoList.indice(value: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to count - 1 do
  begin
    if value = Items[i].cdautpagto then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TautpagtoList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_autpagto, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TautpagtoList.Ler(DataSet: TDataset):boolean;
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

function TautpagtoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_autpagto, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TautpagtoList.New: Tautpagto;
begin
  Result := TAutPagto.Create;
  Add(Result);
end;

procedure TautpagtoList.SetItem(Index: Integer; const Value: Tautpagto);
begin
  Put(Index, Value);
end;

end.
