unit Rotina.GerarProdutoMensalidade;

interface

uses
  forms, sysutils, classes, Controls,
  rotina.montarsql, dialogo.progressbar, uconstantes, rotina.registro, rotina.strings, rotina.datahora,
  ORM.Pedido, orm.ItFatPedido, orm.itPedido,
  classe.aplicacao, orm.empresa, rotina.retornasql, classe.registrainformacao, classe.executasql,
  classe.gerar, classe.query;

function GerarProdutoMensalidade(cdfaturamento:integer; cdproduto, cdtpcliente, cdtpclientemensalidade, cdcontrato:TStrings; cdclientei, cdclientef, dtcadastrosocio:string):boolean;

implementation

function GerarProdutoMensalidade(cdfaturamento:integer; cdproduto, cdtpcliente, cdtpclientemensalidade, cdcontrato:TStrings; cdclientei, cdclientef, dtcadastrosocio:string):boolean;
  function get_cdtpclientemensalidade:string;
  var
    i : Integer;
  begin
    if cdtpclientemensalidade.Count = 0 then
    begin
      Exit;
    end;
    result := 'and cdtpclientemensalidade in (';
    for i := 0 to cdtpclientemensalidade.count - 1 do
    begin
      if i > 0 then
      begin
        result := result + ',';
      end;
      result := Result + cdtpclientemensalidade[i];
    end;
    result := result + ')';
  end;
  function get_cdcontrato(result_atual:string):string;
  var
    i : Integer;
  begin
    result := result_atual;
    if cdcontrato.Count = 0 then
    begin
      Exit;
    end;
    result := result + ' and cdcontrato in (';
    for i := 0 to cdcontrato.count - 1 do
    begin
      if i > 0 then
      begin
        result := result + ',';
      end;
      result := Result + cdcontrato[i];
    end;
    result := result + ')';
  end;
  function get_cdtpcliente(result_atual:string):string;
  var
    i : Integer;
  begin
    result := result_atual;
    if cdtpcliente.Count = 0 then
    begin
      Exit;
    end;
    result := result + ' and cdtpcliente in (';
    for i := 0 to cdtpcliente.count - 1 do
    begin
      if i > 0 then
      begin
        result := result + ',';
      end;
      result := Result + cdtpcliente[i];
    end;
    result := result + ')';
  end;
  function makesql:string;
    function sqlwhere:string;
    begin
      result := '';
      if (cdtpclientemensalidade.Count > 0) or (cdcontrato.count > 0) or (cdtpcliente.count > 0) then
      begin
        Result := get_cdtpclientemensalidade;
        result := get_cdcontrato(Result);
        result := get_cdtpcliente(Result);
      end;
      if cdclientei      <> _0          then
      begin
        Result := Result + ' and cdcliente between '+cdclientei+' and '+cdclientef+' ';
      end;
      if dtcadastrosocio <> _00_00_0000 then
      begin
        Result := Result + ' and dtcadastrosocio<='+quotedstr(dtcadastrosocio);
      end;
    end;
  begin
    result := 'select cdcliente from cliente where cdempresa='+empresa.cdempresa.tostring+' '+sqlwhere;
  end;
var
  c : TClasseQuery;
  dtemissao : TDate;
  cdstpedido, cdstitpedido, cditpedido : integer;
  sqlregistra_: string;
  cdtppedido, cdpedido : integer;
  i : integer;
  sql, vlunitario: TStrings;
  vlproduto, valor, vltotal : currency;
  itfatpedido : titfatpedido;
  procedure inserir_pedido;
  var
    pedido : TPedido;
  begin
    cdpedido := qgerar.GerarCodigo(_pedido);
    pedido := tpedido.create;
    try
      pedido.cdpedido   := cdpedido;
      pedido.nupedido   := cdpedido.ToString;
      pedido.cdtppedido := cdtppedido;
      pedido.cdstpedido := cdstpedido;
      pedido.prcomissao := 0;
      pedido.cdcliente  := c.q.fieldbyname(_cdcliente).AsLargeInt;
      pedido.vltotal    := vlproduto;
      pedido.vlproduto  := vlproduto;
      pedido.psbruto    := cdproduto.count;
      pedido.dtemissao  := dtemissao;
     sql.Add(pedido.Insert(true));
    finally
      FreeAndNil(pedido);
    end;
  end;
  procedure inserir_itpedido;
  var
    i : Integer;
    itpedido : TitPedido;
  begin
    for i := 0 to cdproduto.count - 1 do
    begin
      cditpedido := QGerar.GerarCodigo(_itpedido);
      itpedido   := TITPedido.create;
      try
        itpedido.cdpedido := cdpedido;
        itpedido.cditpedido := cditpedido;
        itpedido.cdstitpedido := cdstitpedido;
        itpedido.cdproduto    := cdproduto[i].ToInteger;
        itpedido.cddigitado   := cdproduto[i];
        itpedido.qtitem       := 1;
        itpedido.qtatendida   := 0;
        itpedido.vlunitario   := StrToCurr(vlunitario[i]);
        itpedido.vltotal      := StrToCurr(vlunitario[i]);
        sql.Add(itpedido.Insert(true));
      finally
        FreeAndNil(itpedido);
      end;
    end;
  end;
begin
  sqlregistra_   := sqlregistra;
  dtemissao      := qregistro.DatadoCodigo(_faturamento, cdfaturamento, _DTFATURAMENTO);
  c              := TClasseQuery.Create;
  vlunitario     := TStringlist.create;
  sql            := TStringList.Create;
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    cdstpedido   := qregistro.Codigo_status_novo(_pedido);
    cdstitpedido := qregistro.Codigo_status_novo(_itpedido);
    // carregar valor unitário de produto
    vltotal := 0;
    for i := 0 to cdproduto.count - 1 do
    begin
      valor   := ValordoCodigo(_produto, cdproduto[i], _vlvenda);
      vltotal := vltotal + valor;
      vlunitario.add(getcurrencys(valor));
    end;
    vlproduto  := vltotal;
    cdtppedido := RetornaSQLInteger('select cdtppedidoarquivo '+
                                    'from tpfaturamento t '+
                                    'left join faturamento f on f.cdtpfaturamento=t.cdtpfaturamento and t.cdempresa=f.cdempresa '+
                                    'where t.cdempresa='+empresa.cdempresa.tostring+' and cdfaturamento='+cdfaturamento.ToString);
    c.q.sql.Text   := makesql;
    c.q.open;
    frmprogressbar.gau.maxvalue := c.q.recordcount;
    frmprogressbar.Show;
    while not c.q.eof do
    begin
      frmprogressbar.pnl.Caption  := 'Processando registro '+inttostr(c.q.recno)+' de '+inttostr(frmprogressbar.gau.maxvalue)+' - Cliente '+c.q.fieldbyname(_cdcliente).asstring;
      frmprogressbar.gau.progress := c.q.recno;
      application.ProcessMessages;

      inserir_pedido;
      inserir_itpedido;
      // insere item do pedido no faturamento
      itfatpedido := TItFatPedido.create;
      try
        itfatpedido.cdfaturamento := cdfaturamento;
        itfatpedido.cdpedido      := cdpedido;
        itfatpedido.nupedido      := cdpedido.ToString;
        sql.Add(itfatpedido.Insert(true));
      finally
        FreeAndNil(itfatpedido);
      end;
      c.q.next;
    end;
    result := ExecutaScript(sql);
  finally
    freeandnil(c);
    freeandnil(sql);
    freeandnil(vlunitario);
    freeandnil(frmprogressbar);
  end;
end;

end.
