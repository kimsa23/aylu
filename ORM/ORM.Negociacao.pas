unit ORM.Negociacao;

interface

uses classe.dao, classe.query, rotina.retornasql, orm.cliente, orm.movbancario,
  classe.gerar, orm.duplicata, orm.empresa, classe.executasql, orm.baixa,
  uconstantes, rotina.registro, rotina.strings,
  orm.NegociacaoSaida, orm.NegociacaoEntrada, orm.StNegociacao,
  System.Math, System.Generics.Collections, dialogs, system.classes, data.db, System.SysUtils, Contnrs, system.uitypes;

Type
  TNegociacao = class(TRegistroQuipos)
  private
    fcdcliente: largeint;
    fcdnegociacao: integer;
    fstnegociacao: TStNegociacao;
    fvlacrescimo: currency;
    fvldesconto: currency;
    fvlentrada: currency;
    fdsobservacao: string;
    fvljuros: currency;
    fvlcomissao: currency;
    fcdstnegociacao: integer;
    fcdrepresentante: integer;
    fvlsaida: currency;
    fdtemissao: TDate;
    fnegociacaoentrada: TNegociacaoEntradaList;
    fnegociacaoSaida: TNegociacaoSaidaList;
    fcliente: TCliente;
    procedure verificar_valor_saida;
    function GerarDuplicataSaida(texto:string):string;
    function processarInterno:boolean;
    function gerar_baixa_entrada(var texto : string):string;
    procedure verificar_status;
  public
    property cliente : TCliente read fcliente write fcliente;
    property negociacaoSaida : TNegociacaoSaidaList read fnegociacaoSaida write fnegociacaoSaida;
    property negociacaoentrada : TNegociacaoEntradaList read fnegociacaoentrada write fnegociacaoentrada;
    property stnegociacao : TStNegociacao read fstnegociacao write fstnegociacao;
    [keyfield, AObrigatorio]
    property cdnegociacao : integer read fcdnegociacao write fcdnegociacao;
    [fk, AObrigatorio]
    property cdcliente : largeint read fcdcliente write fcdcliente;
    [fk, AObrigatorio]
    property cdstnegociacao : integer read fcdstnegociacao write fcdstnegociacao;
    [fk]
    property cdrepresentante : integer read fcdrepresentante write fcdrepresentante;
    [AObrigatorio]
    property dtemissao : TDate read fdtemissao write fdtemissao;
    [AObrigatorio]
    property vlentrada : currency read fvlentrada write fvlentrada;
    [AObrigatorio]
    property vlsaida : currency read fvlsaida write fvlsaida;
    [AObrigatorio]
    property vldesconto : currency read fvldesconto write fvldesconto;
    [AObrigatorio]
    property vljuros : currency read fvljuros write fvljuros;
    [AObrigatorio]
    property vlacrescimo : currency read fvlacrescimo write fvlacrescimo;
    [AObrigatorio]
    property vlcomissao : currency read fvlcomissao write fvlcomissao;
    property dsobservacao : string read fdsobservacao write fdsobservacao;
    constructor create;
    destructor  destroy;override;
    function    Processar:boolean;
    function    Desfazer:boolean;
    function    RecalcularComissao:string;
    procedure   CalcularComissao;
  end;
  TNegociacaoList = class
  private
    FLista: TObjectList<TNegociacao>;
  public
    property    Lista: TObjectList<TNegociacao> read FLista write FLista;
    constructor create;
    destructor  destroy; override;
    function    Ler(sqlwhere:string):boolean;overload;
    function    Ler(Dataset: TDataset):boolean;overload;
    class function RecalcularComissao(dti, dtf: TDate):boolean;
  end;

implementation

procedure TNegociacao.CalcularComissao;
var
  vlinterna, vlatual : Currency;
  I: Integer;
begin
  vlinterna := negociacaoentrada.soma(_vlcomissao);
  for I := 0 to negociacaoSaida.count - 1 do
  begin
    vlatual                              := RoundTo(negociacaosaida.items[i].vlduplicata * 100 / negociacaosaida.Soma(_vlduplicata) * negociacaoentrada.Soma(_vlcomissao) / 100, -2);
    vlinterna                            := vlinterna - vlatual;
    negociacaosaida.items[i].vlcomissao  := vlatual;
    if (i = negociacaoSaida.count - 1) and (vlinterna <> 0) then
    begin
      negociacaosaida.items[i].vlcomissao := negociacaosaida.items[i].vlcomissao + vlinterna;
    end;
  end;
end;

constructor TNegociacao.create;
begin
  inherited;
  fcliente           := TCliente.create;
  fstnegociacao      := tstnegociacao.create;
  fnegociacaoentrada := tnegociacaoentradalist.create;
  fnegociacaoSaida   := tnegociacaoSaidalist.create;
end;

function TNegociacao.Desfazer: boolean;
var
  sql : TStrings;
  i: Integer;
  duplicata : TDuplicata;
  baixa : tbaixa;
begin
  sql := TStringList.Create;
  try
    for i := 0 to negociacaoSaida.Count - 1 do
    begin
      duplicata := tduplicata.create;
      try
        duplicata.select(negociacaoSaida.Items[i].cdduplicata);
        if RegistroExiste(_itcobranca, 'cdempresa='+empresa.cdempresa.tostring+' and cdduplicata='+duplicata.cdduplicata.ToString) then
        begin
          MessageDlg('Não é possível desfazer a negociação porque o contas a receber '+negociacaoSaida.Items[i].nuduplicata+' faz parte de uma cobrança bancária.', mtInformation, [mbOK], 0);
          abort;
        end;
        negociacaoSaida.Items[i].cdduplicata := 0;
        negociacaoSaida.Items[i].nuduplicata := '';
        sql.add(negociacaoSaida.Items[i].update(true));
        sql.add(duplicata.Delete(true));
      finally
        freeandnil(duplicata);
      end;
    end;
    for I := 0 to negociacaoentrada.count - 1 do
    begin
      baixa := tbaixa.create;
      try
        baixa.Select(_cdnegociacaoentrada+'='+negociacaoentrada.Items[i].cdnegociacaoentrada.ToString);
        sql.add(baixa.delete(true));
      finally
        freeandnil(baixa);
      end;
    end;
    cdstnegociacao := 1;
    sql.Add(update(true));
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

destructor TNegociacao.destroy;
begin
  freeandnil(fcliente);
  freeandnil(fstnegociacao);
  freeandnil(fnegociacaoentrada);
  freeandnil(fnegociacaoSaida);
  inherited;
end;

function TNegociacao.gerar_baixa_entrada(var texto : string):string;
var
  baixa : TBaixa;
  I: Integer;
begin
  result := '';
  texto := '';
  for I := 0 to negociacaoentrada.count - 1 do
  begin
    if texto <> '' then
    begin
      texto := texto + ',';
    end;
    texto := texto + negociacaoentrada.Items[i].nuduplicata;
    baixa := tbaixa.create;
    try
      baixa.cdbaixa             := qgerar.gerarcodigo(_baixa);
      //baixa.vlcomissao          := negociacaoentrada.Items[i].vlcomissao;
      baixa.cdnegociacaoentrada := negociacaoentrada.Items[i].cdnegociacaoentrada;
      baixa.cdduplicata         := negociacaoentrada.Items[i].cdduplicata;
      baixa.nubaixa             := negociacaoentrada.Items[i].nuduplicata;
      baixa.dtbaixa             := dtemissao;
      baixa.vlbaixa             := negociacaoentrada.Items[i].vlduplicata;
      baixa.vlliquido           := negociacaoentrada.Items[i].vlduplicata;
      result := result + baixa.insert(true)+#13;
    finally
      freeandnil(baixa);
    end;
  end;
end;

function TNegociacao.GerarDuplicataSaida(texto:string):string;
var
  duplicata : TDuplicata;
  I: Integer;
begin
  result := '';
  texto  := 'NEGOCIACAO DOS TITULOS: '+texto+'.';
  //CalcularComissao;
  for I := 0 to negociacaoSaida.count - 1 do
  begin
    duplicata := tduplicata.create;
    try
      duplicata.cdduplicata       := qgerar.GerarCodigo(_duplicata);
      duplicata.dshistorico       := copy(texto, 1, 100);
      duplicata.dsobservacao      := texto;
      duplicata.cdtpcobranca      := negociacaosaida.items[i].cdtpcobranca;
      duplicata.cdnegociacaosaida := negociacaosaida.items[i].cdnegociacaosaida;
      duplicata.cdrepresentante   := negociacaosaida.items[i].cdrepresentante;
      duplicata.cdcliente         := cdcliente;
      duplicata.nuduplicata       := 'NG'+cdnegociacao.tostring;
      if negociacaoSaida.count > 1 then
      begin
        duplicata.nuduplicata := duplicata.nuduplicata +'/'+char(i+1+64)
      end;
      duplicata.dtemissao                  := dtemissao;
      duplicata.dtvencimento               := negociacaosaida.items[i].dtvencimento;
      duplicata.vlduplicata                := negociacaosaida.items[i].vlduplicata;
      duplicata.vlcomissao                 := negociacaosaida.items[i].vlcomissao;
      duplicata.prmoradiaria               := negociacaosaida.items[i].prmoradiaria;
      duplicata.prmulta                    := empresa.financeiro.duplicata.prmulta;
      negociacaosaida.items[i].cdduplicata := duplicata.cdduplicata;
      negociacaosaida.items[i].nuduplicata := duplicata.nuduplicata;
      result                               := result + duplicata.insert(true)+#13 + negociacaosaida.items[i].update(true)+#13;
    finally
      freeandnil(duplicata);
    end;
  end;
end;

function TNegociacao.Processar:boolean;
begin
  verificar_status;
  negociacaoentrada.verificar_cliente_entrada(cdcliente);
  verificar_valor_saida;
  result := processarInterno;
end;

function TNegociacao.processarInterno: boolean;
var
  sql : TStrings;
  texto : string;
begin
  sql := TStringList.Create;
  try
    sql.text := gerar_baixa_entrada(texto);
    sql.text := sql.text + GerarDuplicataSaida(texto);
    cdstnegociacao := 2;
    sql.Add(Update(true));
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

function TNegociacao.RecalcularComissao: string;
var
  i: Integer;
begin
  result := '';
  if negociacaoentrada.Count = 0  then
  begin
    negociacaoentrada.Ler(cdnegociacao);
  end;
  if negociacaoSaida.Count = 0 then
  begin
    negociacaoSaida.ler(cdnegociacao);
  end;
  { TODO -oDinox -cNegociacao : Verificar quando a baixa for parcial - o correto seria guardar o valor do saldo para saber se o valor da comissão está proporcional }
  for i := 0 to negociacaoentrada.count - 1 do
  begin
    negociacaoentrada.items[i].vlcomissao := qregistro.valordocodigo(_duplicata, negociacaoentrada.items[i].cdduplicata, _vlcomissao);
    negociacaoentrada.items[i].Update;
  end;
  CalcularComissao;
  result := negociacaoSaida.update(true);
  result := result + #13 + negociacaosaida.RecalcularBaixaDuplicata;
end;

procedure TNegociacao.verificar_status;
begin
  if cdstnegociacao <> 1 then
  begin
    MessageDlg('Status da negociação não permite processar a negociação.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TNegociacao.verificar_valor_saida;
begin
  if (negociacaoentrada.Soma(_vltotal) + vlacrescimo - vldesconto) <> negociacaosaida.Soma(_vlduplicata) then
  begin
    MessageDlg('O valor da saída é diferente do valor da entrada.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

constructor TNegociacaoList.create;
begin
  FLista := TObjectList<TNegociacao>.Create;
  inherited;
end;

destructor TNegociacaoList.destroy;
begin
  freeandnil(flista);
  inherited;
end;

function TNegociacaoList.Ler(Dataset: TDataset): boolean;
begin
  lista.clear;
  result := false;
  dataset.first;
  while not Dataset.Eof do
  begin
    Lista.Add(TNegociacao.Create);
    Lista[Lista.Count -1].Select(dataset);
    Dataset.Next;
    result := true;
  end;
end;

function TNegociacaoList.Ler(sqlwhere: string): boolean;
var
  q : tclassequery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_negociacao, sqlwhere));
  try
    result := ler(q.q);
  finally
    freeandnil(q);
  end;
end;

class function TNegociacaoList.RecalcularComissao(dti, dtf: TDate): boolean;
var
  lista : TNegociacaoList;
  negociacao : tnegociacao;
  sql : tstrings;
begin
  result := false;
  lista  := TNegociacaoList.create;
  sql    := tstringlist.create;
  try
    lista.Ler(_dtemissao+' '+_between+' '+GetDtBanco(dti)+' '+_and+' '+getdtbanco(dtf));
    for negociacao in lista.Lista do
    begin
      {
      if SQL.text <> '' then
      begin
        sql.text := sql.text + #13;
      end;
      }
      sql.text := sql.text + negociacao.recalcularcomissao;
    end;
    if sql.text <> '' then
    begin
      result := ExecutaScript(sql);
    end;
  finally
    freeandnil(lista);
    freeandnil(sql);
  end;
end;

end.
