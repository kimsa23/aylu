unit Impressao.Balancete080;

interface

uses
  System.Generics.Collections, Classes, SysUtils, DB, dialogs, forms, system.UITypes,
  uconstantes,
  orm.baixa, orm.duplicata, orm.autpagto, orm.saida, orm.entrada, orm.movbancario, orm.plconta,
  classe.Query, orm.empresa, dialogo.progressbar;

procedure Report080Balancete(mtbl: TDataClient; sqlwhere:string);

implementation

type
  TLista = class
  private
    fcdplconta: integer;
    fcdplcontapai: integer;
    fnunivel: string;
    fnmplconta: string;
    fvltotal: currency;
    fvlsaldo: currency;
  public
    property cdplconta: integer read fcdplconta write fcdplconta;
    property cdplcontapai: integer read fcdplcontapai write fcdplcontapai;
    property nunivel: string read fnunivel write fnunivel;
    property nmplconta: string read fnmplconta write fnmplconta;
    property vltotal: currency read fvltotal write fvltotal;
    property vlsaldo: currency read fvlsaldo write fvlsaldo;
  end;
  TReport = class
  private { private declarations }
    mtbl: TDataClient;
    sqlwhere : string;
    lista : tobjectlist<tlista>;
    plconta : TPlContaList;
    baixa : TbaixaList;
    movbancario : TMovBancarioList;
    duplicata : TDuplicataList;
    autpagto : TautpagtoList;
    saida : TSaidaList;
    entrada : TEntradaList;
    procedure CriarFields;
    procedure AdicionarNivelAscendente;
    procedure AdicionarNivelSuperior(cdplcontapai:integer);
    function  ExisteNivelPai(cdplcontapai:integer):boolean;
    procedure TransferirListaParaMemTable;
    procedure processarbaixa;
    procedure BaixaMovbancario(value: TBaixa);
    procedure BaixaAutpagto(value: TBaixa);
    procedure BaixaDuplicata(value: TBaixa);
    procedure AdicionarVlSaldoPlanoConta(Pcdplconta: Integer; Pvltotal: Currency);
    procedure processarMovBancario;
  public
    constructor create(mtbl21: TDataClient; sqlwhere2: string);
    destructor destroy; override;
    procedure  gerar;
  end;

procedure Report080Balancete(mtbl: TDataClient; sqlwhere:string);
var
  rpt : TReport;
begin
  rpt := TReport.create(mtbl, sqlwhere);
  try
    rpt.gerar;
  finally
    FreeAndNil(rpt);
  end;
end;

procedure TReport.AdicionarNivelAscendente;
var
  item: tlista;
  I: Integer;
  boexiste : boolean;
begin
  for I := 0 to plconta.count - 1 do
  begin
    boexiste := false;
    for item in Lista do
    begin
      if item.cdplconta = plconta.items[i].cdplconta then
      begin
        item.vlsaldo := plconta.items[i].vlsaldo;
        boexiste := true;
      end;
    end;
    if not boexiste then
    begin
      Lista.Add(TLista.Create);
      Lista[Lista.Count -1].cdplconta    := plconta.items[i].cdplconta;
      Lista[Lista.Count -1].cdplcontapai := plconta.items[i].cdplcontapai;
      Lista[Lista.Count -1].nunivel      := plconta.items[i].nunivel;
      Lista[Lista.Count -1].nmplconta    := plconta.items[i].nmplconta;
      Lista[Lista.Count -1].vlsaldo      := plconta.items[i].vlsaldo;
    end;
  end;
end;

procedure TReport.AdicionarNivelSuperior(cdplcontapai: integer);
var
  plconta : tplconta;
begin
  plconta := tplconta.create;
  try
    plconta.select(cdplcontapai);
    Lista.Add(TLista.Create);
    Lista[Lista.Count -1].cdplconta    := plconta.cdplconta;
    Lista[Lista.Count -1].cdplcontapai := plconta.cdplcontapai;
    Lista[Lista.Count -1].nunivel      := plconta.nunivel;
    Lista[Lista.Count -1].nmplconta    := plconta.nmplconta;
    if plconta.cdplcontapai <> 0 then
    begin
      if not ExisteNivelPai(plconta.cdplcontapai) then
      begin
        AdicionarNivelSuperior(plconta.cdplcontapai);
      end;
    end;
  finally
    freeandnil(plconta);
  end;
end;

constructor TReport.create(mtbl21: TDataClient; sqlwhere2: string);
begin
  mtbl        := mtbl21;
  sqlwhere    := sqlwhere2;
  Lista       := TObjectList<Tlista>.Create;
  plconta     := TPlContaList.create;
  baixa       := TbaixaList.Create;
  duplicata   := TDuplicataList.Create;
  autpagto    := TAutPagtoList.Create;
  movbancario := tmovbancariolist.Create;
  saida       := TSaidaList.Create;
  entrada     := TEntradaList.Create;
end;

procedure TReport.CriarFields;
begin
  mtbl.m.FieldDefs.Clear;
  mtbl.m.FieldDefs.Add(_cdempresa   , ftLargeint);
  mtbl.m.FieldDefs.Add(_cdplconta   , ftinteger);
  mtbl.m.FieldDefs.Add(_cdplcontapai, ftinteger);
  mtbl.m.FieldDefs.Add(_nunivel     , ftstring, 100);
  mtbl.m.FieldDefs.Add(_nmplconta   , ftstring, 100);
  mtbl.m.FieldDefs.Add(_vltotal     , ftCurrency);
  mtbl.m.FieldDefs.Add(_vlsaldo     , ftCurrency);
  mtbl.m.IndexDefs.Add(_nunivel, _nunivel, []);
  mtbl.m.IndexName := _nunivel;
  mtbl.m.CreateDataSet;
end;

destructor TReport.destroy;
begin
  freeandnil(lista);
  freeandnil(plconta);
  freeandnil(saida);
  freeandnil(entrada);
  FreeAndNil(baixa);
  FreeAndNil(duplicata);
  FreeAndNil(autpagto);
  FreeAndNil(movbancario);
  inherited;
end;

function TReport.ExisteNivelPai(cdplcontapai: integer): boolean;
var
  item: tlista;
begin
  result := false;
  for item in Lista do
  begin
    if item.cdplconta = cdplcontapai then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TReport.processarbaixa;
var
  I: Integer;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.Show;
    frmprogressbar.pnl.Caption := 'Lendo registros de baixa';
    Application.ProcessMessages;
    baixa.Ler(_dtbaixa+sqlwhere);
    frmprogressbar.gau.MaxValue := baixa.count;
    for I := 0 to baixa.Count - 1 do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if baixa.Items[i].cdduplicata > 0 then
      begin
        if baixa.Items[i].cdadntcliente = 0 then
        begin
          baixaduplicata(baixa.Items[i]);
        end;
      end
      else if baixa.Items[i].cdautpagto > 0 then
      begin
        if baixa.Items[i].cdadntfornecedor = 0 then
        begin
          baixaautpagto(baixa.Items[i]);
        end;
      end
      else if (baixa.Items[i].cdadntcliente > 0) and (baixa.Items[i].cdduplicata = 0) then
      begin
        BaixaMovbancario(baixa.Items[i]);
      end
      else if (baixa.Items[i].cdadntfornecedor > 0) and (baixa.Items[i].cdautpagto = 0) then
      begin
        BaixaMovbancario(baixa.Items[i]);
      end;
    end;
  finally
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TReport.processarMovBancario;
var
  item : TMovBancario;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    frmprogressbar.Show;
    frmprogressbar.pnl.Caption := 'Lendo registros de movimento bancário';
    Application.ProcessMessages;
    movbancario.Ler('select movbancario.* '+
                    'from movbancario '+
                    'left join baixa on baixa.cdmovbancario=movbancario.cdmovbancario and baixa.cdempresa=movbancario.cdempresa '+
                    'where movbancario.cdplconta is not null '+
                    'and movbancario.cdempresa='+empresa.cdempresa.tostring+' '+
                    'and movbancario.cdmovimentacao<>11 '+
                    'and movbancario.cdmovimentacao<>12 '+
                    'and baixa.cdmovbancario is null '+
                    'and movbancario.dtemissao'+sqlwhere, true);
    frmprogressbar.gau.MaxValue := movbancario.lista.Count;
    for item in movbancario.lista do
    begin
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      AdicionarVlSaldoPlanoConta(item.cdplconta, item.vllancamento);
    end;
  finally
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TReport.BaixaDuplicata(value : TBaixa);
var
  d, s : Integer;
  I: Integer;
  valor : Currency;
begin
  d := duplicata.Indice(value.cdduplicata);
  if d = -1 then
  begin
    duplicata.New;
    d := duplicata.Count - 1;
    duplicata.Items[d].Select(value.cdduplicata);
  end;
  if duplicata.Items[d].cdsaida <> 0 then
  begin
    s := saida.Indice(duplicata.Items[d].cdsaida);
    if s = -1 then
    begin
      saida.New;
      s := saida.Count-1;
      saida.Items[s].Select(duplicata.Items[d].cdsaida);
      saida.Items[s].itsaida.Ler(duplicata.Items[d].cdsaida);
    end;
    for I := 0 to saida.Items[s].itsaida.Count - 1 do
    begin
      if saida.Items[s].itsaida.Items[i].cdplconta = 0 then
      begin
        if saida.Items[s].itsaida.Items[i].produto.cdproduto = 0 then
        begin
          saida.Items[s].itsaida.Items[i].produto.Select(saida.Items[s].itsaida.Items[i].cdproduto);
        end;
        MessageDlg('Não foi identificado o plano de contas no '+#13+
                   'Produto '+saida.Items[s].itsaida.Items[i].produto.cdproduto.ToString+' - '+saida.Items[s].itsaida.Items[i].produto.nmproduto+#13+
                   'da nota do contas a receber '+duplicata.Items[d].nuduplicata+'.', mtInformation, [mbOK], 0);
        Exit;
      end;
      valor := (value.vlbaixa / saida.Items[s].vltotal) * saida.Items[s].itsaida.Items[i].VlTotalGeral;
      AdicionarVlSaldoPlanoConta(saida.Items[s].itsaida.Items[i].cdplconta, valor);
    end;
  end
  else
  begin
    if duplicata.Items[d].cdplconta = 0 then
    begin
      MessageDlg('Não foi identificado o plano de contas no contas a receber '+duplicata.Items[d].nuduplicata+'.', mtInformation, [mbOK], 0);
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(duplicata.Items[d].cdplconta, value.vlbaixa);
  end;
end;

procedure TReport.BaixaAutpagto(value : TBaixa);
var
  d, s : Integer;
  I: Integer;
  valor : Currency;
begin
  d := autpagto.Indice(value.cdautpagto);
  if d = -1 then
  begin
    autpagto.New;
    d := autpagto.Count - 1;
    autpagto.Items[d].Select(value.cdautpagto);
  end;
  if autpagto.Items[d].cdentrada <> 0 then
  begin
    s := entrada.Indice(autpagto.Items[d].cdentrada);
    if s = -1 then
    begin
      entrada.New;
      s := entrada.Count-1;
      entrada.Items[s].Select(autpagto.Items[d].cdentrada);
      entrada.Items[s].itentrada.Ler(autpagto.Items[d].cdentrada);
    end;
    for I := 0 to entrada.Items[s].itentrada.Count - 1 do
    begin
      if entrada.Items[s].itentrada.Items[i].cdplconta = 0 then
      begin
        if entrada.Items[s].itentrada.Items[i].produto.cdproduto = 0 then
        begin
          entrada.Items[s].itentrada.Items[i].produto.Select(entrada.Items[s].itentrada.Items[i].cdproduto);
        end;
        MessageDlg('Não foi identificado o plano de contas no '+#13+
                   'Produto '+entrada.Items[s].itentrada.Items[i].produto.cdproduto.ToString+' - '+entrada.Items[s].itentrada.Items[i].produto.nmproduto+#13+
                   'da nota do contas a pagar '+autpagto.Items[d].cdautpagto.ToString+'.', mtInformation, [mbOK], 0);
        Exit;
      end;
      valor := (value.vlbaixa / entrada.Items[s].vltotal) * entrada.Items[s].itentrada.Items[i].VlTotalGeral;
      AdicionarVlSaldoPlanoConta(entrada.Items[s].itentrada.Items[i].cdplconta, valor);
    end;
  end
  else
  begin
    if autpagto.Items[d].cdplconta = 0 then
    begin
      MessageDlg('Não foi identificado o plano de contas no contas a pagar '+autpagto.Items[d].cdautpagto.ToString+'.', mtInformation, [mbOK], 0);
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(autpagto.Items[d].cdplconta, value.vlbaixa);
  end;
end;

procedure TReport.BaixaMovbancario(value : TBaixa);
var
  movbancario : TMovBancario;
begin
  movbancario := TMovBancario.create;
  try
    if not movbancario.Select(value.cdmovbancario) then
    begin
      Exit;
    end;
    if movbancario.cdplconta = 0 then
    begin
      Exit;
    end;
    AdicionarVlSaldoPlanoConta(movbancario.cdplconta, movbancario.vllancamento);
  finally
    FreeAndNil(movbancario);
  end;
end;

procedure TReport.gerar;
begin
  CriarFields;
  processarbaixa;
  processarmovbancario;
  plconta.GerarRegistrosAscendentes;
  AdicionarNivelAscendente;
  TransferirListaParaMemTable;
end;

procedure TReport.AdicionarVlSaldoPlanoConta(Pcdplconta: Integer; Pvltotal: Currency);
begin
  if plconta.Existe(pcdplconta)  then
  begin
    plconta.items[plconta.IndicePlconta(pcdplconta)].vlsaldo := plconta.items[plconta.IndicePlconta(pcdplconta)].vlsaldo + pvltotal;
  end
  else
  begin
    plconta.New;
    plconta.Items[plconta.Count-1].Select(pcdplconta);
    plconta.Items[plconta.Count-1].vlsaldo := pvltotal;
  end;
end;

procedure TReport.TransferirListaParaMemTable;
var
  item: tlista;
begin
  for item in Lista do
  begin
    mtbl.m.insert;
    mtbl.m.FieldByName(_cdempresa).AsLargeInt   := empresa.cdempresa;
    mtbl.m.FieldByName(_cdplconta).AsInteger    := item.cdplconta;
    mtbl.m.FieldByName(_cdplcontapai).AsInteger := item.cdplcontapai;
    mtbl.m.FieldByName(_nunivel).AsString       := item.nunivel;
    mtbl.m.FieldByName(_nmplconta).AsString     := item.nmplconta;
    mtbl.m.FieldByName(_vltotal).AsCurrency     := item.vltotal;
    mtbl.m.FieldByName(_vlsaldo).AsCurrency     := item.vlsaldo;
    mtbl.m.post;
  end;
end;

end.
