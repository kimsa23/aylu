unit ORM.Movbancario;

interface

uses
  System.Generics.Collections, system.UITypes,
  Contnrs,
  StdCtrls, Classes, dialogs, controls, forms, sysutils, comobj, Variants,
  db,
  rotina.XLConst, rotina.registro, uconstantes, rotina.strings, rotina.datahora,
  dialogo.ProgressBar, uDtmMain, orm.baixa,
  classe.aplicacao, rotina.retornasql, classe.executasql, classe.query, classe.interna,
  classe.gerar, orm.empresa, classe.dao, orm.conta, orm.duplicata, orm.TpModulo, orm.Movimentacao;

type
  TMovBancario = class(TRegistroQuipos)
  private
    Fcdcliente: Largeint;
    Fcdcontadestino: integer;
    Fboconciliado: String;
    Fdsnominal: string;
    Fdshistorico: string;
    Fdsobservacao: string;
    Fnumovbancario: string;
    Fcdplconta: integer;
    Fcdfornecedor: LargeInt;
    Fcdconta: integer;
    Fcdmovimentacao: integer;
    Fvlpagamento: currency;
    Fvldeposito: currency;
    Fcdextrato: integer;
    Fnuplconta: string;
    Fcdmovbancariodestino: integer;
    Fvlsaldo: currency;
    Fcdnatureza: string;
    Fmovimentacao: TMovimentacao;
    Fvllancamento: currency;
    Fcdcntcusto: integer;
    Fcdmovbancario: integer;
    Farquivoretorno: string;
    Fdtemissao: TDate;
    Fbaixa: TBaixaList;
    Fnucntcusto: string;
    Fconta: TConta;
    function get_tpadiantamento: string;
    function adiantamento_utilizado: Boolean;
  public
    property movimentacao : TMovimentacao read Fmovimentacao write fmovimentacao;
    property baixa : TBaixaList read Fbaixa write Fbaixa;
    property conta : TConta read Fconta write Fconta;
    [keyfield]
    property cdmovbancario : integer read Fcdmovbancario write fcdmovbancario;
    [fk]
    property cdextrato : integer read Fcdextrato write fcdextrato;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write fcdfornecedor;
    [fk, AObrigatorio]
    property cdconta : integer read Fcdconta write fcdconta;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    [fk, AObrigatorio]
    property cdmovimentacao : integer read Fcdmovimentacao write fcdmovimentacao;
    [fk]
    property cdplconta : integer read Fcdplconta write fcdplconta;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write fcdcntcusto;
    property nucntcusto : string read Fnucntcusto write Fnucntcusto;
    [fk]
    property cdmovbancariodestino : integer read Fcdmovbancariodestino write fcdmovbancariodestino;
    [fk]
    property cdcontadestino : integer read Fcdcontadestino write fcdcontadestino;
    property numovbancario : string read Fnumovbancario write fnumovbancario;
    [AObrigatorio]
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    [AObrigatorio]
    property vllancamento : currency read Fvllancamento write fvllancamento;
    [AObrigatorio]
    property cdnatureza : string read Fcdnatureza write fcdnatureza;
    property dshistorico : string read Fdshistorico write fdshistorico;
    property dsnominal : string read Fdsnominal write fdsnominal;
    property boconciliado : String read Fboconciliado write fboconciliado;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property vldeposito : currency read Fvldeposito write fvldeposito;
    property vlsaldo : currency read Fvlsaldo write fvlsaldo;
    property vlpagamento : currency read Fvlpagamento write fvlpagamento;
    property nuplconta : string read Fnuplconta write fnuplconta;
    property arquivoretorno : string read Farquivoretorno write farquivoretorno;
    function Delete(boscript:boolean=false):string;
    constructor create;
    destructor destroy;override;
    procedure AtualizarDataBaixa(cdmovbancario:string; dtemissao: TDate);
    function dtemissaoabaixodatasaldoinicialconta(cdconta, dtemissaos, olddtemissaos:string; dtemissao: TDate):boolean;
    Class function JuroDocumento(dtemissao, dtprorrogacao : TDate; prmoradiaria, vlbaixa:currency):currency;
    function NumeroChequeDuplicado(cdconta, nucheque, cdmovbancario : string):boolean;
    class function vencimentoferiadopagamentoproximodiautil(dtprorrogacao, dtbaixa: TDate): boolean;
    class function ValorSaldoJuros(tipo: string; cddocumento :integer; cdbaixa:string=''): currency;
    function LiberarPlanoContas:Boolean;
    class function CaixaAberto(cdconta: string; dtemissao: TDate):Boolean;
  end;
  TMovbancarioList = class
  private
    Flista: tobjectlist<TMovbancario>;
  public
    property lista : tobjectlist<TMovbancario> read Flista write Flista;
    constructor Create;
    destructor Destroy; override;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string; boselect:boolean=false):boolean;overload;
    function indice(value:Integer):Integer;
  end;

implementation

uses
  ulocalizar;

destructor TMovBancario.destroy;
begin
  freeandnil(fbaixa);
  freeandnil(fconta);
  freeandnil(fmovimentacao);
  inherited;
end;

function TMovBancario.dtemissaoabaixodatasaldoinicialconta(cdconta, dtemissaos, olddtemissaos:string; dtemissao: TDate):boolean;
var
  dtsaldo : TDate;
begin
  result  := false;
  dtsaldo := RetornaSQLData('select dtsaldo from conta where cdempresa='+empresa.cdempresa.ToString+' and cdconta='+cdconta);
  if (dtemissao < dtsaldo) and (dtemissaos <> olddtemissaos) and (formatdatetime(_dd_mm_yyyy, dtsaldo) <> _30_12_1899) then
  begin
    messagedlg('Data de Emissão abaixo da data do saldo inicial da conta ('+formatdatetime(_dd_mm_yyyy, dtsaldo)+')'#13+
               'Digite uma data igual ou maior do que a data do saldo para continuar.', mtinformation, [mbok], 0);
    result := true;
  end;
end;

function TMovBancario.NumeroChequeDuplicado(cdconta, nucheque, cdmovbancario : string):boolean;
begin
  result := (RetornaSQLInteger('select count(*) '+
                               'from movbancario '+
                               'where cdempresa='+empresa.cdempresa.ToString+' and cdconta='+cdconta+' and numovbancario='+quotedstr(nucheque)+' and cdmovbancario<>'+cdmovbancario) >0);
end;

Class function TMovBancario.vencimentoferiadopagamentoproximodiautil(dtprorrogacao, dtbaixa: TDate): boolean;
  function vencimento_sabado_ou_domingo_e_baixa_segunda:Boolean;
  begin
    result := (DayOfWeek(dtprorrogacao) in [1, 7]) and (DayOfWeek(dtbaixa) = 2) and (dtbaixa - dtprorrogacao < 3);
  end;
  function vencimento_sabado_e_baixa_domingo:Boolean;
  begin
    result := (DayOfWeek(dtprorrogacao) = 7) and (DayOfWeek(dtbaixa) = 1) and (dtbaixa - dtprorrogacao < 2);
  end;
begin
  result := false;
  if DateToStr(dtprorrogacao) = _00_00_0000 then
  begin
    Exit;
  end;
  try
    if vencimento_sabado_ou_domingo_e_baixa_segunda or vencimento_sabado_e_baixa_domingo then
    begin
      result := True;
      Exit;
    end
    else if dtmmain.qryferiado.q.Locate(_dtferiado, dtprorrogacao, []) then
    begin
      if dtprorrogacao + 1 = dtbaixa then
      begin
        result := true;
        exit;
      end;
      if (DayOfWeek(dtprorrogacao) = 6) and (dtprorrogacao + 3 = dtbaixa) then
      begin
        result := true;
        exit;
      end;
      if (DayOfWeek(dtprorrogacao) = 2 )and dtmmain.qryferiado.q.Locate(_dtferiado+';'+_nmtpferiado, varArrayof([dtprorrogacao, uppercase(_carnaval)]), []) and (dtprorrogacao + 2 = dtbaixa) then
      begin
        result := true;
      end;
    end
    else if (DayOfWeek(dtprorrogacao) in [1,7]) and (DayOfWeek(dtbaixa) = 4) then
    begin
      if (((dayofweek(dtprorrogacao) = 7) and (dtprorrogacao + 4 = dtbaixa)) or ((dayofweek(dtprorrogacao) = 1) and (dtprorrogacao + 3 = dtbaixa))) and dtmmain.qryferiado.q.Locate(_dtferiado+';'+_nmtpferiado, varArrayof([dtprorrogacao, uppercase(_carnaval)]), []) then
      begin
        result := true;
      end;
    end;
  except
    ShowMessage('Data de Prorrogação Inválida: '+DateToStr(dtprorrogacao));
  end;
end;

Class function TMovBancario.JuroDocumento(dtemissao, dtprorrogacao : TDate; prmoradiaria, vlbaixa:currency):currency;
var
  nudia : Integer;
begin
  result := 0;
  dtemissao := Trunc(dtemissao);
  if dtemissao <= dtprorrogacao then
  begin
    exit;
  end;
  if vencimentoferiadopagamentoproximodiautil(dtprorrogacao, dtemissao) then
  begin
    exit;
  end;
  if vencimentosabadodomingopagamentosegunda(dtprorrogacao, dtemissao) then
  begin
    if dtprorrogacao + 3 > dtemissao then
    begin
      exit;
    end;
  end;
  nudia  := Round(dtemissao - dtprorrogacao); // calcula o valor de juros a ser cobrado por dia
  result := vlbaixa * prmoradiaria / 100 / 30 * nudia;
end;

class function TMovBancario.ValorSaldoJuros(tipo: string; cddocumento:integer; cdbaixa:string=''): currency;
var
  q : TClasseQuery;
  dtprorrogacao, dtbaixa : TDate;
  vlbaixa, prmoradiaria, vljurodevido, vljuropago, vlsaldojuros : currency;
  function makesql:string;
  begin
    result := QRetornaSQL.get_select_from(_baixa, cddocumento, _cd+tipo);
    if cdbaixa <> '' then
    begin
      result := result + ' and cdbaixa<>'+cdbaixa;
    end;
  end;
begin
  vlsaldojuros := 0;
  q := TClasseQuery.create;
  try
    dtprorrogacao   := qregistro.datadocodigo (tipo, cddocumento, _dtprorrogacao);
    prmoradiaria    := qregistro.valordocodigo(tipo, cddocumento, _prmoradiaria);
    q.q.Open(makesql);
    while not q.q.eof do
    begin
      vlbaixa      := q.q.fieldbyname(_vlbaixa).AsCurrency;
      vljuropago   := q.q.fieldbyname(_vljuro).AsCurrency;
      dtbaixa      := q.q.fieldbyname(_dtbaixa).AsDatetime;
      vljurodevido := JuroDocumento(dtbaixa, dtprorrogacao, prmoradiaria, vlbaixa);
      vlsaldojuros := vlsaldojuros + (vljurodevido - vljuropago);
      q.q.Next;
    end;
    result := vlsaldojuros;
  finally
    freeandnil(q);
  end;
end;

procedure TMovBancario.AtualizarDataBaixa(cdmovbancario:string; dtemissao: TDate);
begin
  ExecutaSQL('update baixa set dtbaixa='+getdtbanco(dtemissao)+' where cdempresa='+empresa.cdempresa.ToString+' and cdmovbancario='+cdmovbancario)
end;

constructor TMovBancario.create;
begin
  inherited;
  fbaixa := tbaixaList.create;
  fmovimentacao := tmovimentacao.create;
  fconta := tconta.create;
end;

function TMovBancario.Delete(boscript: boolean): string;
var
  sql : TStrings;
begin
  sql   := TStringList.Create;
  try
    if (cdmovimentacao = 13) or (cdmovimentacao = 14) then
    begin
      if adiantamento_utilizado then
      begin
        messagedlg('Saldo adiantamento usado.', mtInformation, [mbOK],0);
        Exit;
      end;
      sql.Add('update baixa set cd'+get_tpadiantamento+'=NULL where cdempresa='+cdempresa.ToString+' and cdmovbancario='+inttostr(cdmovbancario));
      sql.Add('delete from '+get_tpadiantamento+' where cdempresa='+cdempresa.ToString+' and cdmovbancario='+inttostr(cdmovbancario));
    end;
    sql.Add(inherited delete(true));
    result := sql.Text;
    if not boscript then
    begin
      ExecutaScript(sql);
    end;
  finally
    FreeAndNil(sql);
  end;
end;

function TMovBancario.LiberarPlanoContas: Boolean;
begin
  result := empresa.financeiro.boplconta and
           ((movimentacao.cdtpmodulo = 8) or
            (movimentacao.cdtpmodulo = 7) or
            (movimentacao.cdtpmodulo = 5) or
            (movimentacao.cdtpmodulo = 6));
end;

Class function TMovBancario.CaixaAberto(cdconta: string; dtemissao: TDate): Boolean;
begin
  result    := True;
  if (cdconta = '') or (dtemissao = 0) then
  begin
    Exit;
  end;
  result := RetornaSQLInteger('select count(*) from contafechada where cdempresa='+empresa.cdempresa.ToString+' and cdconta='+cdconta+' and dtemissao='+getdtbanco(dtemissao)) = 0;
end;

function Tmovbancario.get_tpadiantamento:string;
begin
  if cdmovimentacao = 13 then
  begin
    result := _adntcliente;
  end
  else if cdmovimentacao = 14 then
  begin
    result := _adntfornecedor;
  end;
end;

function TMovbancario.adiantamento_utilizado:Boolean;
begin
  result := RetornaSQLInteger('select count(*) from '+get_tpadiantamento+' where cdempresa='+cdempresa.ToString+' and cdmovbancario='+inttostr(cdmovbancario)+' and vlutilizado>0') >0;
end;

constructor TMovbancarioList.Create;
begin
  FLista := TObjectList<TMovBancario>.Create;
end;

destructor TMovbancarioList.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TMovbancarioList.indice(value: Integer): Integer;
var
  Movbancario : TMovbancario;
  i : Integer;
begin
  i := -1;
  result := i;
  for Movbancario in lista do
  begin
    Inc(i);
    if value = Movbancario.cdMovbancario then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TMovbancarioList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_Movbancario, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TMovbancarioList.Ler(DataSet: TDataset): boolean;
begin
  lista.Clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    Lista.Add(TMovbancario.Create);
    lista[lista.Count-1].Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TMovbancarioList.Ler(sqlwhere: string; boselect:boolean=false): boolean;
var
  q : TClasseQuery;
begin
  if boselect then
  begin
    q := TClasseQuery.create(sqlwhere);
  end
  else
  begin
    q := TClasseQuery.create(QRetornaSQL.get_select_where(_Movbancario, sqlwhere));
  end;
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
