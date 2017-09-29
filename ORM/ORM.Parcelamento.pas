unit ORM.Parcelamento;

interface

uses Data.DB, System.Contnrs, dialogs, classes, System.Math, system.uitypes, System.SysUtils, dateutils,
  uconstantes, rotina.registro, rotina.datahora,
  classe.dao, classe.query, rotina.retornasql, orm.fornecedor, classe.executasql,
  orm.StParcelamento, orm.ParcelamentoSaida, orm.ParcelamentoEntrada, orm.movbancario,
  orm.baixa, classe.gerar, orm.autpagto, orm.empresa;

type
  TParcelamento = class(TRegistroQuipos)
  private
    fcdfornecedor2: largeint;
    fcdstparcelamento: integer;
    fvlacrescimo: currency;
    fvldesconto: currency;
    fvlentrada: currency;
    fdsobservacao: string;
    fcdfornecedor: largeint;
    fcdparcelamento: integer;
    fvljuros: currency;
    fvlsaida: currency;
    fdtemissao: tdate;
    fstparcelamento: tstparcelamento;
    fparcelamentosaida: tparcelamentosaidalist;
    fparcelamentoentrada: tparcelamentoentradalist;
    ffornecedor: tfornecedor;
    ffornecedor2: tfornecedor;
    fcdtpcobranca: integer;
    fcdcntcusto: integer;
    fcdplconta: integer;
    fnucntcusto: string;
    fnuplconta: string;
    fnudiavencimento: integer;
    fnuparcela: integer;
    fvltotal: currency;
    procedure verificar_status;
    procedure verificar_valor_saida;
    function processarInterno: boolean;
    function gerar_baixa_entrada(var texto : string):string;
    function gerar_autpagto_saida(texto:string):string;
  public
    property fornecedor: tfornecedor read ffornecedor write ffornecedor;
    property fornecedor2: tfornecedor read ffornecedor2 write ffornecedor2;
    property parcelamentosaida: tparcelamentosaidalist read fparcelamentosaida write fparcelamentosaida;
    property parcelamentoentrada: tparcelamentoentradalist read fparcelamentoentrada write fparcelamentoentrada;
    property stparcelamento: tstparcelamento read fstparcelamento write fstparcelamento;
    [keyfield]
    property cdparcelamento: integer read fcdparcelamento write fcdparcelamento;
    [fk, AObrigatorio]
    property cdfornecedor: largeint read fcdfornecedor write fcdfornecedor;
    [fk, AObrigatorio]
    property cdstparcelamento: integer read fcdstparcelamento write fcdstparcelamento;
    [fk]
    property cdfornecedor2: largeint read fcdfornecedor2 write fcdfornecedor2;
    [fk]
    property cdtpcobranca: integer read fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdcntcusto: integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdplconta: integer read fcdplconta write fcdplconta;
    [AObrigatorio]
    property dtemissao: tdate read fdtemissao write fdtemissao;
    [AObrigatorio]
    property vlentrada: currency read fvlentrada write fvlentrada;
    [AObrigatorio]
    property vlsaida: currency read fvlsaida write fvlsaida;
    [AObrigatorio]
    property vldesconto: currency read fvldesconto write fvldesconto;
    [AObrigatorio]
    property vljuros: currency read fvljuros write fvljuros;
    [AObrigatorio]
    property vlacrescimo: currency read fvlacrescimo write fvlacrescimo;
    [AObrigatorio]
    property vltotal: currency read fvltotal write fvltotal;
    property dsobservacao: string read fdsobservacao write fdsobservacao;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    property nuplconta: string read fnuplconta write fnuplconta;
    property nudiavencimento: integer read fnudiavencimento write fnudiavencimento;
    property nuparcela: integer read fnuparcela write fnuparcela;
    function Desfazer:boolean;
    function Processar:boolean;
    procedure Gerar;
    procedure GravarTotais;
    constructor create;
    destructor destroy; override;
  end;

implementation

constructor TParcelamento.create;
begin
  inherited;
  ffornecedor := tfornecedor.create;
  ffornecedor2 := tfornecedor.create;
  fstparcelamento := tstparcelamento.create;
  fparcelamentoentrada := tparcelamentoentradalist.create;
  fparcelamentosaida   := tparcelamentosaidalist.create;
end;

function TParcelamento.Desfazer: boolean;
var
  sql : TStrings;
  i: Integer;
  autpagto : Tautpagto;
  baixa : tbaixa;
begin
  sql := TStringList.Create;
  try
    for i := 0 to parcelamentoSaida.Count - 1 do
    begin
      autpagto := tautpagto.create;
      try
        autpagto.select(parcelamentoSaida.Items[i].cdautpagto);
        parcelamentoSaida.Items[i].cdautpagto := 0;
        parcelamentoSaida.Items[i].nuautpagto := '';
        sql.add(parcelamentoSaida.Items[i].update(true));
        sql.add(autpagto.Delete(true));
      finally
        freeandnil(autpagto);
      end;
    end;
    for I := 0 to parcelamentoentrada.count - 1 do
    begin
      baixa := tbaixa.create;
      try
        baixa.Select(_cdparcelamentoentrada+'='+parcelamentoentrada.Items[i].cdparcelamentoentrada.ToString);
        sql.add(baixa.delete(true));
      finally
        freeandnil(baixa);
      end;
    end;
    cdstparcelamento := 1;
    sql.Add(update(true));
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

destructor TParcelamento.destroy;
begin
  freeandnil(ffornecedor);
  freeandnil(ffornecedor2);
  freeandnil(fstparcelamento);
  freeandnil(fparcelamentoentrada);
  freeandnil(fparcelamentosaida);
  inherited;
end;

procedure TParcelamento.Gerar;
var
  i : integer;
  mes : integer;
  ano : integer;
  dia_i, dia : integer;
  vlacumulado, vlparcela : currency;
begin
  if empresa.financeiro.boplconta and (nuplconta = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Plano_de_contas]), mtinformation, [mbok], 0);
    Abort;
  end;
  if cdfornecedor = 0 then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Fornecedor]), mtinformation, [mbok], 0);
    Abort;
  end;
  if empresa.financeiro.bocntcusto and (nucntcusto = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Centro_de_Custo]), mtinformation, [mbok], 0);
    Abort;
  end;
  if nuparcela < 1 then
  begin
    messagedlg('Nº parcela deve ser maior que zero.', mtinformation, [mbok], 0);
    Abort;
  end;
  if nudiavencimento < 1 then
  begin
    messagedlg('Nº dia de vencimento deve ser maior que zero.', mtinformation, [mbok], 0);
    Abort;
  end;
  if nudiavencimento > 31 then
  begin
    messagedlg('Nº dia de vencimento deve ser menor que 32.', mtinformation, [mbok], 0);
    Abort;
  end;
  vlacumulado := 0;
  vlparcela := RoundTo(vltotal / nuparcela, -2);

  mes   := MonthOf(dtemissao);
  ano   := YearOf(dtemissao);
  dia   := DayOf(dtemissao);

  dia_i := nudiavencimento;
  // determinar o mes e ano inicial
  if dia >= nudiavencimento then
  begin
    QDataHora.acrescentar_mes(mes, ano)
  end
  else if dia > strtoint(formatdatetime(_dd, Ultimo_Dia_Mes(dtemissao))) then
  begin
    dia_i := 1;
    QDataHora.acrescentar_mes(mes, ano);
  end;
  // gerar registro no client dataset
  for i := 1 to nuparcela do
  begin
    if dia_i > strtoint(formatdatetime(_dd, Ultimo_Dia_Mes(strtodate(_0+_1+'/'+inttostr(mes)+'/'+inttostr(ano))))) then
    begin
      dia_i := dia_i - 1;
    end;
    if dia_i > strtoint(formatdatetime(_dd, Ultimo_Dia_Mes(strtodate(_0+_1+'/'+inttostr(mes)+'/'+inttostr(ano))))) then
    begin
      dia_i := dia_i - 1;
    end;
    if dia_i > strtoint(formatdatetime(_dd, Ultimo_Dia_Mes(strtodate(_0+_1+'/'+inttostr(mes)+'/'+inttostr(ano))))) then
    begin
      dia_i := dia_i - 1;
    end;
    if dia_i > strtoint(formatdatetime(_dd, Ultimo_Dia_Mes(strtodate(_0+_1+'/'+inttostr(mes)+'/'+inttostr(ano))))) then
    begin
      dia_i := dia_i - 1;
    end;
    if i < nuparcela then
    else
    begin
      if vlacumulado < vltotal then
      begin
        vlparcela := vltotal - vlacumulado;
      end;
    end;
    parcelamentosaida.new;
    parcelamentosaida.items[parcelamentosaida.count-1].dtvencimento := strtodate(inttostr(dia_i)+'/'+inttostr(mes)+'/'+inttostr(ano));
    parcelamentosaida.items[parcelamentosaida.count-1].vlautpagto   := vlparcela;
    if cdcntcusto <> 0 then
    begin
      parcelamentosaida.items[parcelamentosaida.count-1].cdcntcusto := cdcntcusto;
      parcelamentosaida.items[parcelamentosaida.count-1].nucntcusto := nucntcusto;
    end;
    if cdplconta <> 0 then
    begin
      parcelamentosaida.items[parcelamentosaida.count-1].cdplconta := cdplconta;
      parcelamentosaida.items[parcelamentosaida.count-1].nuplconta := nuplconta;
    end;
    parcelamentosaida.items[parcelamentosaida.count-1].cdtpcobranca        := cdtpcobranca;
    parcelamentosaida.items[parcelamentosaida.count-1].cdparcelamento      := cdparcelamento;
    parcelamentosaida.items[parcelamentosaida.count-1].cdparcelamentosaida := qgerar.gerarcodigo(_parcelamentosaida);

    QDataHora.acrescentar_mes(mes, ano);
    dia_i       := nudiavencimento;
    vlacumulado := vlacumulado + vlparcela;
  end;
end;

function TParcelamento.gerar_autpagto_saida(texto: string): string;
var
  autpagto : Tautpagto;
  I: Integer;
begin
  result := '';
  texto := 'PARCELAMENTO DOS TITULOS: '+texto+'.';
  for I := 0 to parcelamentoSaida.count - 1 do
  begin
    autpagto := tautpagto.create;
    try
      autpagto.cdautpagto          := qgerar.GerarCodigo(_autpagto);
      autpagto.dshistorico         := copy(texto, 1, 100);
      autpagto.dsobservacao        := texto;
      autpagto.cdtpcobranca        := parcelamentosaida.items[i].cdtpcobranca;
      autpagto.cdparcelamentosaida := parcelamentosaida.items[i].cdparcelamentosaida;
      autpagto.cdfornecedor        := cdfornecedor;
      if cdfornecedor2 <> 0 then
      begin
        autpagto.cdfornecedor := cdfornecedor2;
      end;
      autpagto.nuautpagto          := 'PA'+cdparcelamento.tostring;
      if parcelamentoSaida.count > 1 then
      begin
        autpagto.nuautpagto := autpagto.nuautpagto +'/'+char(i+1+64)
      end;
      autpagto.dtemissao    := dtemissao;
      autpagto.dtvencimento := parcelamentosaida.items[i].dtvencimento;
      autpagto.vlautpagto   := parcelamentosaida.items[i].vlautpagto;
      autpagto.prmulta      := 0;
      if parcelamentosaida.items[i].cdcntcusto <> 0 then
      begin
        autpagto.cdcntcusto := parcelamentosaida.items[i].cdcntcusto;
        autpagto.nucntcusto := parcelamentosaida.items[i].nucntcusto;
      end;
      if parcelamentosaida.items[i].cdplconta <> 0 then
      begin
        autpagto.cdplconta := parcelamentosaida.items[i].cdplconta;
        autpagto.nuplconta := parcelamentosaida.items[i].nuplconta;
      end;
      result                := result + autpagto.insert(true)+#13;
      parcelamentosaida.items[i].cdautpagto := autpagto.cdautpagto;
      parcelamentosaida.items[i].nuautpagto := autpagto.nuautpagto;
      result := result + parcelamentosaida.items[i].update(true)+#13;
    finally
      freeandnil(autpagto);
    end;
  end;
end;

function TParcelamento.gerar_baixa_entrada(var texto: string): string;
var
  baixa : TBaixa;
  I: Integer;
begin
  result := '';
  texto := '';
  for I := 0 to parcelamentoentrada.count - 1 do
  begin
    if texto <> '' then
    begin
      texto := texto + ',';
    end;
    texto := texto + parcelamentoentrada.Items[i].nuautpagto;
    baixa := tbaixa.create;
    try
      baixa.cdbaixa               := qgerar.gerarcodigo(_baixa);
      baixa.cdparcelamentoentrada := parcelamentoentrada.Items[i].cdparcelamentoentrada;
      baixa.cdautpagto            := parcelamentoentrada.Items[i].cdautpagto;
      baixa.nubaixa               := parcelamentoentrada.Items[i].nuautpagto;
      baixa.dtbaixa               := dtemissao;
      baixa.vlbaixa               := parcelamentoentrada.Items[i].vlautpagto;
      baixa.vlliquido             := parcelamentoentrada.Items[i].vlautpagto;
      result                      := result + baixa.insert(true)+#13;
    finally
      freeandnil(baixa);
    end;
  end;
end;

procedure TParcelamento.GravarTotais;
begin
  vlentrada := parcelamentoentrada.vltotal;
  vltotal   := vlentrada + vljuros + vlacrescimo - vldesconto;
  vlsaida   := parcelamentosaida.Vlautpagto;
end;

function TParcelamento.Processar: boolean;
begin
  verificar_status;
  parcelamentoentrada.verificar_fornecedor_entrada(cdfornecedor);
  verificar_valor_saida;
  result := processarInterno;
end;

function TParcelamento.processarInterno: boolean;
var
  sql : TStrings;
  texto : string;
begin
  sql := TStringList.Create;
  try
    sql.text := gerar_baixa_entrada(texto);
    sql.text := sql.text + gerar_autpagto_saida(texto);
    cdstparcelamento := 2;
    sql.Add(Update(true));
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

procedure TParcelamento.verificar_status;
begin
  if cdstparcelamento <> 1 then
  begin
    MessageDlg('Status do parcelamento não permite processar o parcelamento.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TParcelamento.verificar_valor_saida;
begin
  if (parcelamentoentrada.vltotal + vlacrescimo - vldesconto) <> parcelamentosaida.vlautpagto then
  begin
    MessageDlg('O valor da saída é diferente do valor da entrada.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

end.
