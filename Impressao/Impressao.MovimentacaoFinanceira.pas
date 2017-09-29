unit Impressao.MovimentacaoFinanceira;

interface

uses
  System.Actions, System.UITypes,
  Forms, Dialogs, SysUtils, Variants, Controls, Classes,
  DB,
  uRichEdit, rotina.montarsql, rotina.Rotinas, rotina.strings, dialogo.progressbar, uconstantes,
  rotina.Registro,
  classe.aplicacao, orm.empresa, classe.query;

function imp_movimentacao_financeira(cdempresa, cdconta, cdmovimentacao: TStrings; dti, dtf: TDate):boolean;

implementation

Type
  TContabil = record
    codigo : string;
    contaaux : string;
    contadebito : string;
    contacredito : string;
    dtlancamento : TDate;
    vllancamento : Currency;
    cdcntcusto : string;
    cdhistorico : string;
    dshistorico : string;
    nudocumento : string;
    procedure inverterconta;
  end;
  TReport = class
  private
    q : TClasseQuery;
    nmcliente : TStrings;
    nmconta : TStrings;
    nmfornecedor : TStrings;
    cdmovimentacao : TStrings;
    cdconta : TStrings;
    cdempresa : TStrings;
    erro : TStrings;
    arquivo : TStrings;
    dti, dtf : TDate;
    contabil : TContabil;
    function get_nmfile:string;
    procedure destruir_objetos;
    function Makesqlmontarlista(nmdata:string):string;
    procedure ExibirGauge;
    procedure ProcessarGauge;
    procedure InserirDeposito;
    procedure InserirPagamento;

    procedure InserirDuplicataBaixa;
    procedure AdicionarDuplicataDesconto;
    procedure AdicionarDuplicataMulta;
    procedure AdicionarDuplicataJuro;
    procedure AdicionarDuplicataValor;

    procedure InserirAutpagtoBaixa;
    procedure AdicionarAutpagtoValor;
    procedure AdicionarAutpagtoJuro;
    procedure AdicionarAutpagtoMulta;
    procedure AdicionarAutpagtoDesconto;

    procedure InserirBaixaAdntcliente;
    procedure InserirBaixaAdntfornecedor;
    procedure InserirTransferencia;
    procedure InserirRecebimento;
    procedure AdicionarArquivo;
    procedure AdicionarErro(tabela, nome: string; campo: string=_nucntcontabil);
    function  ConfigurarCampo(campo: string): string;
    procedure InserirAutpagtoBaixaAdiantamento;
    procedure InserirDuplicataBaixaAdiantamento;
  public
    constructor create(cdempresa_, cdconta_, cdmovimentacao_: TStrings; dti_, dtf_: TDate);
    function    gerar:boolean;
  end;

const
  _sql_transferencia = 'select movbancario.dtemissao'+
                             ',movbancario.vllancamento'+
                             ',conta.nmconta'+
                             ',conta.nucntcontabil'+
                             ',tpconta.nucntcontabil nucntcontabiltpconta'+
                             ',contadestino.nmconta nmcontadestino'+
                             ',contadestino.nucntcontabil nucntcontabildestino'+
                             ',tpcontadestino.nucntcontabil nucntcontabiltpcontadestino'+
                             ',movbancario.dshistorico '+
                       'from movbancario '+
                       'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                       'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                       'left join conta contadestino on contadestino.cdempresa=movbancario.cdempresa and contadestino.cdconta=movbancario.cdcontadestino '+
                       'left join tpconta tpcontadestino on tpcontadestino.cdempresa=movbancario.cdempresa and contadestino.cdtpconta=tpcontadestino.cdtpconta ';
  _sql_recebimento = 'select movbancario.dtemissao'+
                           ',movbancario.vllancamento'+
                           ',conta.nmconta'+
                           ',conta.nucntcontabil'+
                           ',tpconta.nucntcontabil nucntcontabiltpconta'+
                           ',movbancario.dshistorico '+
                     'from movbancario '+
                     'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                     'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                     'left join movbancario movbancarioorigem on movbancarioorigem.cdempresa=movbancario.cdempresa and movbancarioorigem.cdmovbancariodestino=movbancario.cdmovbancario ';
  _sql_deposito = 'select movbancario.dtemissao'+
                       ',movbancario.vllancamento'+
                       ',conta.nmconta'+
                       ',conta.nucntcontabil'+
                       ',tpconta.nucntcontabil nucntcontabiltpconta'+
                       ',movimentacao.nmmovimentacao'+
                       ',movimentacao.nucntcontabil nucntcontabilmovimentacao'+
                       ',movbancario.dshistorico '+
                 'from movbancario '+
                 'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                 'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                 'inner join movimentacao on movimentacao.cdempresa=movbancario.cdempresa and movimentacao.cdmovimentacao=movbancario.cdmovimentacao ';

function imp_movimentacao_financeira(cdempresa, cdconta, cdmovimentacao: TStrings; dti, dtf: TDate):boolean;
var
  rpt : TReport;
begin
  rpt := TReport.create(cdempresa, cdconta, cdmovimentacao, dti, dtf);
  try
    result := rpt.gerar;
  finally
    rpt.free;
  end;
end;

procedure TReport.AdicionarArquivo;
begin
  arquivo.Add('"'+contabil.codigo+'",'+
              '"'+contabil.contadebito+'",'+
              '"'+contabil.contacredito+'",'+
              '"'+FormatDateTime(_dd_mm_yyyy, contabil.dtlancamento)+'",'+
              '"'+floattostr(contabil.vllancamento)+'",'+
              '"'+contabil.cdcntcusto+'",'+
              '"'+contabil.cdhistorico+'",'+
              '"'+contabil.dshistorico+'",'+
              '"'+contabil.nudocumento+'"');
end;

function TReport.ConfigurarCampo(campo:string):string;
begin
  if campo = _nucntcontabil then
  begin
    result := 'conta contábil'
  end
  else if campo = _tppessoa then
  begin
    result := 'Tipo de Pessoa'
  end
  else if campo = _rzsocial then
  begin
    result := 'Razão Social';
  end;
end;

procedure TReport.AdicionarErro(tabela, nome: string; campo: string=_nucntcontabil);
begin
  if tabela = _cliente then
  begin
    if nmcliente.IndexOf(nome) > -1 then
    begin
      exit;
    end;
    nmcliente.Add(nome);
  end;

  if tabela = _fornecedor then
  begin
    if nmfornecedor.IndexOf(nome) > -1 then
    begin
      exit;
    end;
    nmfornecedor.Add(nome);
  end;

  if tabela = _conta then
  begin
    if nmconta.IndexOf(nome) > -1 then
    begin
      exit;
    end;
    nmconta.Add(nome);
  end;

  erro.add(qstring.Maiuscula(tabela) +' '+nome+' está sem '+ConfigurarCampo(campo)+'.');
end;

constructor TReport.create(cdempresa_, cdconta_, cdmovimentacao_: TStrings; dti_, dtf_: TDate);
begin
  nmcliente           := TStringList.Create;
  nmfornecedor        := TStringList.Create;
  nmconta             := TStringList.Create;
  erro                := TStringList.Create;
  arquivo             := TStringList.Create;
  cdempresa           := TStringlist.create;
  cdconta             := TStringList.Create;
  cdmovimentacao      := TStringList.Create;
  q                   := TClasseQuery.Create;
  cdempresa.text      := cdempresa_.text;
  cdconta.Text        := cdconta_.Text;
  cdmovimentacao.Text := cdmovimentacao_.Text;
  dti                 := dti_;
  dtf                 := dtf_;
  q.q.Connection      := aplicacao.confire;
end;

procedure TReport.destruir_objetos;
begin
  freeandnil(frmprogressbar);
  freeandnil(arquivo);
  freeandnil(cdempresa);
  freeandnil(cdconta);
  freeandnil(cdmovimentacao);
  freeandnil(nmcliente);
  freeandnil(nmfornecedor);
  freeandnil(nmconta);
  freeandnil(erro);
  freeandnil(q);
end;

procedure TReport.ExibirGauge;
begin
  frmprogressbar.Show;
  frmprogressbar.pnl.Caption := 'Lendo registros. Aguarde...';
  Application.ProcessMessages;
end;

function TReport.gerar:boolean;
var
  nmfile : string;
begin
  result := False;
  if not empresa.CamposExportacaoCadastroEmpresaPreenhidos then
  begin
    MessageDlg('Favor verificar a configuração de Exportação do Financeiro para o contábil no Cadastro=>Empresa.', mtInformation, [mbOK], 0);
    Abort;
  end;
  nmfile := QRotinas.getdiretorio;
  if nmfile = '' then
  begin
    exit;
  end;
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    ExibirGauge;
    InserirDuplicataBaixa;
    InserirAutpagtoBaixa;
    InserirAutpagtoBaixaAdiantamento;
    InserirDuplicataBaixaAdiantamento;
    InserirBaixaAdntcliente;
    InserirBaixaAdntfornecedor;
    InserirTransferencia;
    InserirRecebimento;
    InserirDeposito;
    InserirPagamento;
    if erro.Count > 0 then
    begin
      ExibirSaidaVideo(erro);
      Abort;
    end;
    arquivo.SaveToFile(nmfile+get_nmfile);
    result := True;
  finally
    destruir_objetos;
  end;
end;

function TReport.get_nmfile: string;
begin
  result := '\movimentacao financeira de '+FormatDateTime(_dd__mm__yyyy, dti)+' ate '+formatdatetime(_dd__mm__yyyy, dtf)+'.txt';
end;

procedure TReport.InserirBaixaAdntcliente;
begin
  q.q.Close;
  q.q.SQL.Text := 'select baixa.dtbaixa'+
                        ',baixa.vlbaixa'+
                        ',cliente.rzsocial'+
                        ',cliente.cdcliente'+
                        ',cliente.tppessoa'+
                        ',conta.nucntcontabil'+
                        ',conta.nmconta'+
                        ',tpconta.nucntcontabil nucntcontabiltpconta'+
                        ',movbancario.dshistorico '+
                  'from adntcliente '+
                  'inner join movbancario on movbancario.cdempresa=adntcliente.cdempresa and movbancario.cdmovbancario=adntcliente.cdmovbancario '+
                  'inner join baixa on baixa.cdempresa=adntcliente.cdempresa and baixa.cdadntcliente=adntcliente.cdadntcliente '+
                  'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                  'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                  'inner join cliente on cliente.cdempresa=adntcliente.cdempresa and cliente.cdcliente=adntcliente.cdcliente '+
                   Makesqlmontarlista(_baixa+'.'+_dtbaixa)+' and baixa.cdduplicata is not null';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_cdcliente).AsString, _rzsocial);
    end;
    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;
    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil).AsString
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;
    contabil.codigo       := '';
    contabil.contacredito := empresa.financeiro.contacontabil.cddebitoadntcliente;
    contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'RECEBIMENTO ADIANTAMENTO ('+q.q.fieldbyname(_dshistorico).AsString+') '+q.q.fieldbyname(_rzsocial).AsString;
    contabil.nudocumento  := '';
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.InserirBaixaAdntfornecedor;
begin
  q.q.Close;
  q.q.SQL.Text := 'select baixa.dtbaixa'+
                        ',baixa.vlbaixa'+
                        ',fornecedor.cdfornecedor'+
                        ',fornecedor.rzsocial'+
                        ',fornecedor.tppessoa'+
                        ',conta.nucntcontabil'+
                        ',conta.nmconta'+
                        ',tpconta.nucntcontabil nucntcontabiltpconta'+
                        ',movbancario.dshistorico '+
                  'from adntfornecedor '+
                  'inner join movbancario on movbancario.cdempresa=adntfornecedor.cdempresa and movbancario.cdmovbancario=adntfornecedor.cdmovbancario '+
                  'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                  'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                  'inner join baixa on baixa.cdempresa=adntfornecedor.cdempresa and baixa.cdadntfornecedor=adntfornecedor.cdadntfornecedor '+
                  'inner join fornecedor on fornecedor.cdempresa=adntfornecedor.cdempresa and fornecedor.cdfornecedor=adntfornecedor.cdfornecedor ' +
                  Makesqlmontarlista(_baixa+'.'+_dtbaixa)+' and baixa.cdautpagto is not null';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_cdfornecedor).AsString, _rzsocial);
    end;

    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;

    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;

    contabil.codigo       := '';
    contabil.contadebito  := empresa.financeiro.contacontabil.cddebitoadntfornecedor;
    contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'PAGAMENTO ADIANTAMENTO ('+q.q.fieldbyname(_dshistorico).AsString+') '+q.q.fieldbyname(_rzsocial).AsString;
    contabil.nudocumento  := '';
    AdicionarArquivo;

    q.q.Next;
  end;
end;

procedure TReport.AdicionarAutpagtoValor;
begin
  contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
  contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency -
                           q.q.FieldByName(_vldesconto).AsCurrency +
                           q.q.FieldByName(_vl+_juro).AsCurrency +
                           q.q.fieldbyname(_vlmulta).AsCurrency;
  contabil.cdcntcusto   := '';
  contabil.cdhistorico  := '';
  contabil.dshistorico  := 'PAGAMENTO DOC/NF/RECIBO '+q.q.fieldbyname(_nuautpagto).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  contabil.nudocumento  := q.q.fieldbyname(_nuautpagto).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarAutpagtoJuro;
begin
  if q.q.fieldbyname(_vljuro).AsCurrency = 0 then
  begin
    Exit;
  end;
  contabil.contadebito  := empresa.financeiro.contacontabil.cddebitoautpagtojuros;
  contabil.vllancamento := q.q.fieldbyname(_vljuro).AsCurrency;
  contabil.dshistorico  := 'PAGAMENTO JUROS DOC/NF/RECIBO '+q.q.fieldbyname(_nuautpagto).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarAutpagtoMulta;
begin
  if q.q.fieldbyname(_vlmulta).AsCurrency = 0 then
  begin
    Exit;
  end;
  contabil.contadebito  := empresa.financeiro.contacontabil.cddebitoautpagtomulta;
  contabil.vllancamento := q.q.fieldbyname(_vlmulta).AsCurrency;
  contabil.dshistorico  := 'PAGAMENTO MULTA DOC/NF/RECIBO '+q.q.fieldbyname(_nuautpagto).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarAutpagtoDesconto;
begin
  if q.q.fieldbyname(_vldesconto).AsCurrency = 0 then
  begin
    Exit;
  end;
  if q.q.FieldByName(_tppessoa).AsString = _F then
  begin
    contabil.contadebito := empresa.financeiro.contacontabil.cdcreditoautpagtofisica;
  end
  else if q.q.FieldByName(_tppessoa).AsString = '' then
  begin
    AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).asstring);
  end
  else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_f).AsString = '') then
  begin
    AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).asstring);
  end
  else
  begin
    contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_f).AsString;
  end;
  contabil.contacredito := empresa.financeiro.contacontabil.cddebitoautpagtodesconto;
  contabil.vllancamento := q.q.fieldbyname(_vldesconto).AsCurrency;
  contabil.dshistorico  := 'DESCONTO OBTIDO DOC/NF/RECIBO '+q.q.fieldbyname(_nuautpagto).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.InserirAutpagtoBaixa;
begin
  q.q.Close;
  q.q.SQL.Text := 'select autpagto.nuautpagto'+
                        ',baixa.vlbaixa'+
                        ',baixa.dtbaixa'+
                        ',baixa.vldesconto'+
                        ',baixa.vlabatimento'+
                        ',baixa.vljuro'+
                        ',baixa.vlmulta'+
                        ',baixa.vldevolucao'+
                        ',fornecedor.cdfornecedor'+
                        ',fornecedor.rzsocial'+
                        ',fornecedor.tppessoa'+
                        ',fornecedor.nucntcontabil nucntcontabilf'+
                        ',conta.nucntcontabil'+
                        ',conta.nmconta'+
                        ',tpconta.nucntcontabil nucntcontabiltpconta'+
                        ',movbancario.dshistorico '+
                  'from movbancario '+
                  'inner join baixa on baixa.cdempresa=movbancario.cdempresa and baixa.cdmovbancario=movbancario.cdmovbancario '+
                  'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                  'inner join tpconta on tpconta.cdempresa=movbancario.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                  'inner join autpagto on autpagto.cdempresa=baixa.cdempresa and autpagto.cdautpagto=baixa.cdautpagto '+
                  'inner join fornecedor on fornecedor.cdempresa=autpagto.cdempresa and fornecedor.cdfornecedor=autpagto.cdfornecedor '+
                  Makesqlmontarlista(_baixa+'.'+_dtbaixa);
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_cdfornecedor).AsString, _rzsocial);
    end;

    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;

    if q.q.FieldByName(_tppessoa).AsString = _F then
    begin
      contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoautpagtofisica;
    end
    else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_f).AsString = '') then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).asstring);
    end
    else
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_f).AsString;
    end;

    contabil.codigo       := '';
    contabil.contadebito  := q.q.fieldbyname(_nucntcontabil+_f).AsString;

    if q.q.FieldByName(_nucntcontabil).AsString  <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;

    AdicionarAutpagtoValor;

    contabil.inverterconta;
    contabil.contaaux     := contabil.contacredito;
    contabil.contacredito := contabil.contadebito;
    contabil.contadebito  := contabil.contaaux;

    AdicionarAutpagtoJuro;
    AdicionarAutpagtoMulta;
    AdicionarAutpagtoDesconto;
    q.q.Next;
  end;
end;

procedure TReport.InserirAutpagtoBaixaAdiantamento;
begin
  if cdmovimentacao.Count <> 0 then
  begin
    Exit;
  end;
  q.q.Close;
  q.q.SQL.Text := 'select autpagto.nuautpagto'+
                        ',baixa.vlbaixa'+
                        ',baixa.dtbaixa'+
                        ',baixa.vldesconto'+
                        ',baixa.vlabatimento'+
                        ',baixa.vljuro'+
                        ',baixa.vlmulta'+
                        ',baixa.vldevolucao'+
                        ',fornecedor.cdfornecedor'+
                        ',fornecedor.rzsocial'+
                        ',fornecedor.tppessoa'+
                        ',fornecedor.nucntcontabil nucntcontabilf'+
                        ',autpagto.dshistorico '+
                  'from autpagto '+
                  'inner join baixa on baixa.cdempresa=autpagto.cdempresa and baixa.cdautpagto=autpagto.cdautpagto and baixa.cdadntfornecedor is not null '+
                  'inner join fornecedor on fornecedor.cdempresa=autpagto.cdempresa and fornecedor.cdfornecedor=autpagto.cdfornecedor '+
                  Makesqlmontarlista(_baixa+'.'+_dtbaixa);
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_cdfornecedor).AsString, _rzsocial);
    end;
    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;
    if q.q.FieldByName(_tppessoa).AsString = _F then
    begin
      contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoautpagtofisica;
    end
    else if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).asstring);
    end
    else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_f).AsString = '') then
    begin
      AdicionarErro(_fornecedor, q.q.fieldbyname(_rzsocial).asstring);
    end
    else
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_f).AsString;
    end;
    contabil.codigo       := '';
    contabil.contadebito  := q.q.fieldbyname(_nucntcontabil+_f).AsString;
    contabil.contacredito := empresa.financeiro.contacontabil.cddebitoadntfornecedor;
    contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency ;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'PAGAMENTO DOC/NF/RECIBO '+q.q.fieldbyname(_nuautpagto).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
    contabil.nudocumento  := q.q.fieldbyname(_nuautpagto).AsString;
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.AdicionarDuplicataValor;
begin
  contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
  contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency - q.q.FieldByName(_vldesconto).AsCurrency;
  //contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency;
  contabil.cdcntcusto   := '';
  contabil.cdhistorico  := '';
  contabil.dshistorico  := 'RECEBIMENTO DOC/NF/RECIBO '+q.q.fieldbyname(_nuduplicata).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  contabil.nudocumento  := q.q.fieldbyname(_nuduplicata).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarDuplicataJuro;
begin
  if q.q.fieldbyname(_vljuro).AsCurrency = 0 then
  begin
    Exit;
  end;
  contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoduplicatajuros;
  contabil.vllancamento := q.q.fieldbyname(_vljuro).AsCurrency;
  contabil.dshistorico  := 'RECEBIMENTO JUROS DOC/NF/RECIBO '+q.q.fieldbyname(_nuduplicata).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarDuplicataMulta;
begin
  if q.q.fieldbyname(_vlmulta).AsCurrency = 0 then
  begin
    Exit;
  end;
  contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoduplicatamulta;
  contabil.vllancamento := q.q.fieldbyname(_vlmulta).AsCurrency;
  contabil.dshistorico  := 'RECEBIMENTO MULTA DOC/NF/RECIBO '+q.q.fieldbyname(_nuduplicata).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.AdicionarDuplicataDesconto;
begin
  if q.q.fieldbyname(_vldesconto).AsCurrency = 0 then
  begin
    Exit;
  end;
  if q.q.FieldByName(_tppessoa).AsString = _F then
  begin
    contabil.contadebito := empresa.financeiro.contacontabil.cdcreditoduplicatafisica;
  end
  else if q.q.FieldByName(_tppessoa).AsString = '' then
  begin
    AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).asstring);
  end
  else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_c).AsString = '') then
  begin
    AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).asstring);
  end
  else
  begin
    contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_c).AsString;
  end;
  contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoduplicatadesconto;
  contabil.vllancamento := q.q.fieldbyname(_vldesconto).AsCurrency;
  contabil.dshistorico  := 'DESCONTO CONCEDIDO DOC/NF/RECIBO '+q.q.fieldbyname(_nuduplicata).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
  AdicionarArquivo;
end;

procedure TReport.InserirDuplicataBaixa;
begin
  q.q.Close;
  q.q.SQL.Text := 'select baixa.vlbaixa'+
                         ',baixa.dtbaixa'+
                         ',baixa.vldesconto'+
                         ',baixa.vlabatimento'+ // verificar com a contabilidade
                         ',baixa.vljuro'+
                         ',baixa.vlmulta'+
                         ',baixa.vldevolucao'+  // verificar com a contabilidade
                         ',DUPLICATA.NUDUPLICATA'+
                         ',conta.nmconta'+
                         ',conta.nucntcontabil'+
                         ',tpconta.nucntcontabil nucntcontabiltpconta'+
                         ',cliente.cdcliente'+
                         ',CLIENTE.RZSOCIAL'+
                         ',cliente.tppessoa'+
                         ',cliente.nucntcontabil nucntcontabilc'+
                         ',movbancario.dshistorico '+
                   'from movbancario '+
                   'inner join conta on conta.cdempresa=movbancario.cdempresa and conta.cdconta=movbancario.cdconta '+
                   'inner join tpconta on tpconta.cdempresa=conta.cdempresa and conta.cdtpconta=tpconta.cdtpconta '+
                   'inner join baixa on baixa.cdempresa=movbancario.cdempresa and baixa.cdmovbancario=movbancario.cdmovbancario '+
                   'inner join duplicata on duplicata.cdempresa=baixa.cdempresa and duplicata.cdduplicata=baixa.cdduplicata '+
                   'inner join cliente on cliente.cdempresa=duplicata.cdempresa and cliente.cdcliente=duplicata.cdcliente '+
                   Makesqlmontarlista(_baixa+'.'+_dtbaixa);
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_cdcliente).AsString, _rzsocial);
    end;

    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;

    if q.q.FieldByName(_tppessoa).AsString = _F then
    begin
      contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoduplicatafisica
    end
    else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_c).AsString = '') then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).asstring);
    end
    else
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_c).AsString;
    end;

    contabil.codigo       := '';

    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;

    AdicionarDuplicataValor;

    contabil.inverterconta;
    AdicionarDuplicataJuro;
    AdicionarDuplicataMulta;
    AdicionarDuplicataDesconto;
    q.q.Next;
  end;
end;

procedure TReport.InserirDuplicataBaixaAdiantamento;
begin
  if cdmovimentacao.Count <> 0 then
  begin
    Exit;
  end;
  q.q.Close;
  q.q.SQL.Text := 'select baixa.vlbaixa'+
                         ',baixa.dtbaixa'+
                         ',DUPLICATA.NUDUPLICATA'+
                         ',cliente.cdcliente'+
                         ',CLIENTE.RZSOCIAL'+
                         ',cliente.tppessoa'+
                         ',cliente.nucntcontabil nucntcontabilc '+
                   'from duplicata '+
                   'inner join baixa on baixa.cdempresa=duplicata.cdempresa and baixa.cdduplicata=duplicata.cdduplicata and baixa.cdadntcliente is not null '+
                   'inner join cliente on cliente.cdempresa=duplicata.cdempresa and cliente.cdcliente=duplicata.cdcliente '+
                   Makesqlmontarlista(_baixa+'.'+_dtbaixa);
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_rzsocial).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_cdcliente).AsString, _rzsocial);
    end;
    if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).AsString, _tppessoa);
    end;
    if q.q.FieldByName(_tppessoa).AsString = _F then
    begin
      contabil.contacredito := empresa.financeiro.contacontabil.cdcreditoduplicatafisica
    end
    else if q.q.FieldByName(_tppessoa).AsString = '' then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).asstring)
    end
    else if (q.q.FieldByName(_tppessoa).AsString = _J) and (q.q.fieldbyname(_nucntcontabil+_c).AsString = '') then
    begin
      AdicionarErro(_cliente, q.q.fieldbyname(_rzsocial).asstring);
    end
    else
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_c).AsString;
    end;
    contabil.codigo       := '';
    contabil.contadebito  := empresa.financeiro.contacontabil.cddebitoadntcliente;
    contabil.dtlancamento := q.q.fieldbyname(_dtbaixa).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vlbaixa).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'RECEBIMENTO DOC/NF/RECIBO '+q.q.fieldbyname(_nuduplicata).AsString+' '+q.q.fieldbyname(_rzsocial).AsString;
    contabil.nudocumento  := q.q.fieldbyname(_nuduplicata).AsString;
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.InserirDeposito;
begin
  q.q.Close;
  q.q.SQL.Text := _sql_deposito+Makesqlmontarlista(_movbancario+'.'+_dtemissao)+ ' AND movimentacao.cdtpmodulo=6';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_nucntcontabil+_movimentacao).AsString <> '' then
    begin
      contabil.contacredito := q.q.FieldByName(_nucntcontabil+_movimentacao).AsString
    end
    else
    begin
      AdicionarErro(_movimentacao, q.q.fieldbyname(_nmmovimentacao).asstring);
    end;
    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
       AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;
    contabil.codigo       := '';
    contabil.dtlancamento := q.q.fieldbyname(_dtemissao).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vllancamento).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'RECEBIMENTO DE '+q.q.fieldbyname(_nmmovimentacao).asstring;
    contabil.nudocumento  := '';
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.InserirPagamento;
begin
  q.q.Close;
  q.q.SQL.Text := _sql_deposito+Makesqlmontarlista(_movbancario+'.'+_dtemissao)+ ' AND movimentacao.cdtpmodulo=5';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_nucntcontabil+_movimentacao).AsString <> '' then
    begin
      contabil.contadebito := q.q.FieldByName(_nucntcontabil+_movimentacao).AsString;
    end
    else
    begin
      AdicionarErro(_movimentacao, q.q.fieldbyname(_nmmovimentacao).asstring);
    end;
    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;
    contabil.codigo       := '';
    contabil.dtlancamento := q.q.fieldbyname(_dtemissao).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vllancamento).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'PAGAMENTO DE '+q.q.fieldbyname(_nmmovimentacao).asstring;
    contabil.nudocumento  := '';
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.InserirRecebimento;
begin
  q.q.Close;
  q.q.SQL.Text := _sql_recebimento+Makesqlmontarlista(_movbancario+'.'+_dtemissao)+ ' AND movbancarioorigem.cdmovbancario is null and movbancario.cdmovimentacao=12';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    contabil.contacredito := empresa.financeiro.contacontabil.cdcreditorecebimento;
    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;
    contabil.codigo       := '';
    contabil.dtlancamento := q.q.fieldbyname(_dtemissao).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vllancamento).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'RECEBIMENTO DE TRANSFERENCIA PARA A CONTA '+q.q.fieldbyname(_nmconta).AsString;
    contabil.nudocumento  := '';
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.InserirTransferencia;
begin
  q.q.Close;
  q.q.SQL.Text := _sql_transferencia+Makesqlmontarlista(_movbancario+'.'+_dtemissao)+ ' AND movbancario.cdmovimentacao=11';
  q.q.Open;
  frmprogressbar.gau.MaxValue := q.q.RecordCount;
  while not q.q.Eof do
  begin
    ProcessarGauge;
    if q.q.FieldByName(_nucntcontabil).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil).AsString;
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta).AsString <> '' then
    begin
      contabil.contacredito := q.q.fieldbyname(_nucntcontabil+_tpconta).AsString;
    end
    else
    begin
      AdicionarErro(_conta, q.q.fieldbyname(_nmconta).asstring);
    end;
    if q.q.FieldByName(_nucntcontabil+_destino).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_destino).AsString
    end
    else if q.q.FieldByName(_nucntcontabil+_tpconta+_destino).AsString <> '' then
    begin
      contabil.contadebito := q.q.fieldbyname(_nucntcontabil+_tpconta+_destino).AsString;
    end
    else
    begin
      contabil.contadebito := Empresa.financeiro.contacontabil.cddebitotransferencia;
    end;
    contabil.codigo       := '';
    contabil.dtlancamento := q.q.fieldbyname(_dtemissao).AsDateTime;
    contabil.vllancamento := q.q.fieldbyname(_vllancamento).AsCurrency;
    contabil.cdcntcusto   := '';
    contabil.cdhistorico  := '';
    contabil.dshistorico  := 'TRANSFERENCIA DA CONTA '+q.q.fieldbyname(_nmconta).AsString+' PARA '+q.q.fieldbyname(_nmconta+_destino).AsString;
    contabil.nudocumento  := '';
    AdicionarArquivo;
    q.q.Next;
  end;
end;

procedure TReport.ProcessarGauge;
begin
  frmprogressbar.pnl.Caption  := 'Processando...'+inttostr(q.q.RecNo)+' de '+inttostr(q.q.RecordCount);
  frmprogressbar.gau.Progress := q.q.RecNo;
  application.ProcessMessages;
end;

function TReport.Makesqlmontarlista(nmdata:string):string;
begin
  InsercaoDataSQl(dti, dtf, Result, nmdata);
  sqlmontarlista (cdempresa     , _movbancario, _cdempresa     , result);
  sqlmontarlista (cdconta       , _movbancario, _cdconta       , result);
  sqlmontarlista (cdmovimentacao, _movbancario, _cdmovimentacao, result);
end;

{ TContabil }

procedure TContabil.inverterconta;
begin
  contaaux := contacredito;
  contacredito := contadebito;
  contadebito := contaaux;
end;

end.
