unit Impressao.DREAnalitico078;

interface

uses
  System.Generics.Collections, Classes, SysUtils, DB, dialogs,
  uconstantes, rotina.registro,
  orm.duplicata, orm.autpagto, orm.saida, orm.entrada, orm.plconta,
  classe.Query, orm.empresa, rotina.strings;

procedure Report078DREAnalitico(mtbl: TDataClient; sqlwhere:string);

implementation

type
  TLista = class
  private
    fcdplconta: integer;
    fcdplcontapai: integer;
    fnunivel: string;
    fnmplconta: string;
    fvltotal: currency;
    fdtemissao: TDate;
    fnudocumento: string;
    fdshistorico: string;
    fvlsaldo: currency;
  public
    property cdplconta: integer read fcdplconta write fcdplconta;
    property cdplcontapai: integer read fcdplcontapai write fcdplcontapai;
    property nunivel: string read fnunivel write fnunivel;
    property nmplconta: string read fnmplconta write fnmplconta;
    property vltotal: currency read fvltotal write fvltotal;
    property vlsaldo: currency read fvlsaldo write fvlsaldo;
    property dtemissao: TDate read fdtemissao write fdtemissao;
    property nudocumento: string read fnudocumento write fnudocumento;
    property dshistorico: string read fdshistorico write fdshistorico;
  end;
  TReport = class
  private { private declarations }
    mtbl: TDataClient;
    sqlwhere : string;
    lista : tobjectlist<tlista>;
    plconta : TPlContaList;
    procedure CriarFields;
    procedure ProcessarItem(makesql: string; tbl:string='');
    function  MakesqlDebito: string;
    function  MakesqlCredito: string;
    function  MakesqlAutpagto: string;
    function  MakesqlDuplicata: string;
    procedure AdicionarNivelAscendente;
    procedure AdicionarNivelSuperior(cdplcontapai:integer);
    function  ExisteNivelPai(cdplcontapai:integer):boolean;
    procedure TransferirListaParaMemTable;
    function ObterHistorico(tbl:string; q: TClasseQuery):string;
    procedure ProcessarItsaida;
    procedure ProcessarItEntrada;
    procedure AdicionarAoPlanoContasRelatorio(plano: TPlcontaList);
  public
    constructor create(mtbl21: TDataClient; sqlwhere2: string);
    destructor destroy; override;
    procedure  gerar;
  end;

procedure Report078DREAnalitico(mtbl: TDataClient; sqlwhere:string);
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
  mtbl     := mtbl21;
  sqlwhere := sqlwhere2;
  Lista := TObjectList<Tlista>.Create;
  plconta  := TPlContaList.create;
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
  mtbl.m.FieldDefs.Add(_dtemissao   , ftDate);
  mtbl.m.FieldDefs.Add(_nudocumento , ftstring, 20);
  mtbl.m.FieldDefs.Add(_dshistorico , ftstring, 200);
  mtbl.m.IndexDefs.Add(_nunivel, _nunivel+';'+_dtemissao+';'+_nudocumento, []);
  mtbl.m.IndexName := _nunivel;
  mtbl.m.CreateDataSet;
end;

destructor TReport.destroy;
begin
  freeandnil(lista);
  freeandnil(plconta);
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

function TReport.ObterHistorico(tbl:string; q: TClasseQuery): string;
begin
  if tbl = _duplicata then
  begin
    result := 'Cliente '+ q.q.fieldbyname(_nmcliente).asstring;
  end
  else if tbl = _autpagto then
  begin
    result := 'Fornecedor '+ q.q.fieldbyname(_nmfornecedor).asstring;
  end
  else
  begin
    if tbl = _movbancario then
    begin
      result := q.q.fieldbyname(_nmmovimentacao).asstring;
    end;
    if q.q.fieldbyname(_nmcliente).asstring <> '' then
    begin
      if result <> '' then
      begin
        result := result + ' - ';
      end;
      result := 'Cliente '+ q.q.fieldbyname(_nmcliente).asstring;
    end
    else if q.q.fieldbyname(_nmfornecedor).asstring <> '' then
    begin
      if result <> '' then
      begin
        result := result + ' - ';
      end;
      result := 'Fornecedor '+ q.q.fieldbyname(_nmfornecedor).asstring;
    end
  end;
  if (q.q.fieldbyname(_dshistorico).asstring <> '') AND  (Lista[Lista.Count -1].dshistorico <> '') then
  begin
    result := result + ' - ';
  end;
  result := result + q.q.fieldbyname(_dshistorico).asstring;
end;

function TReport.MakesqlDebito:string;
begin
  result := 'select nota.cdmovbancario nudocumento'+
                  ',nota.dtemissao'+
                  ',nota.dshistorico'+
                  ',nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',CLIENTE.nmcliente'+
                  ',FORNECEDOR.nmfornecedor'+
                  ',MOVIMENTACAO.NMMOVIMENTACAO'+
                  ',nota.vllancamento vltotal '+
            'from movbancario nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'INNER JOIN MOVIMENTACAO ON MOVIMENTACAO.CDEMPRESA=NOTA.CDEMPRESA AND MOVIMENTACAO.CDMOVIMENTACAO=NOTA.CDMOVIMENTACAO '+
            'LEFT JOIN CLIENTE ON CLIENTE.CDEMPRESA=NOTA.CDEMPRESA AND CLIENTE.CDCLIENTE=NOTA.CDCLIENTE '+
            'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDEMPRESA=NOTA.CDEMPRESA AND FORNECEDOR.CDFORNECEDOR=NOTA.CDFORNECEDOR '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtemissao'+sqlwhere+' and nota.cdnatureza=''D''';
end;

function TReport.MakesqlCredito:string;
begin
  result := 'select nota.cdmovbancario nudocumento'+
                  ',nota.dtemissao'+
                  ',nota.dshistorico'+
                  ',nota.cdplconta'+
                  ',nota.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',CLIENTE.nmcliente'+
                  ',FORNECEDOR.nmfornecedor'+
                  ',MOVIMENTACAO.NMMOVIMENTACAO'+
                  ',nota.vllancamento vltotal '+
            'from movbancario nota '+
            'inner join plconta on plconta.cdempresa=nota.cdempresa and plconta.cdplconta=nota.cdplconta '+
            'INNER JOIN MOVIMENTACAO ON MOVIMENTACAO.CDEMPRESA=NOTA.CDEMPRESA AND MOVIMENTACAO.CDMOVIMENTACAO=NOTA.CDMOVIMENTACAO '+
            'LEFT JOIN CLIENTE ON CLIENTE.CDEMPRESA=NOTA.CDEMPRESA AND CLIENTE.CDCLIENTE=NOTA.CDCLIENTE '+
            'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDEMPRESA=NOTA.CDEMPRESA AND FORNECEDOR.CDFORNECEDOR=NOTA.CDFORNECEDOR '+
            'WHERE NOTA.CDEMPRESA='+empresa.cdempresa.tostring+' and nota.dtemissao'+sqlwhere+' and nota.cdnatureza=''C''';
end;

function TReport.MakesqlAutpagto:string;
begin
  result := 'select autpagto.nuautpagto nudocumento'+
                  ',autpagto.dtemissao'+
                  ',autpagto.dshistorico'+
                  ',autpagto.cdplconta'+
                  ',autpagto.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',FORNECEDOR.nmfornecedor'+
                  ',autpagto.vlautpagto vltotal '+
            'from autpagto '+
            'inner join plconta on plconta.cdempresa=autpagto.cdempresa and plconta.cdplconta=autpagto.cdplconta '+
            'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDEMPRESA=autpagto.CDEMPRESA AND FORNECEDOR.CDFORNECEDOR=autpagto.CDFORNECEDOR '+
            'WHERE autpagto.cdentrada is null and autpagto.cdempresa='+empresa.cdempresa.tostring+' and autpagto.dtprorrogacao'+sqlwhere;
end;

function TReport.MakesqlDuplicata:string;
begin
  result := 'select duplicata.nuduplicata nudocumento'+
                  ',duplicata.dtemissao'+
                  ',duplicata.dshistorico'+
                  ',duplicata.cdplconta'+
                  ',duplicata.nuplconta'+
                  ',plconta.nmplconta'+
                  ',plconta.cdplcontapai'+
                  ',CLIENTE.nmcliente'+
                  ',duplicata.vlduplicata vltotal '+
            'from duplicata '+
            'inner join plconta on plconta.cdempresa=duplicata.cdempresa and plconta.cdplconta=duplicata.cdplconta '+
            'LEFT JOIN CLIENTE ON CLIENTE.CDEMPRESA=duplicata.CDEMPRESA AND CLIENTE.CDCLIENTE=duplicata.CDCLIENTE '+
            'where duplicata.cdsaida is null and duplicata.cdempresa='+empresa.cdempresa.tostring+' and duplicata.dtprorrogacao'+sqlwhere;
end;

procedure TReport.gerar;
begin
  CriarFields;

  ProcessarItsaida;
  ProcessarItentrada;

  processarItem(makesqldebito, _movbancario);
  processarItem(makesqlcredito, _movbancario);
  processarItem(makesqlautpagto, _autpagto);
  processarItem(makesqlduplicata, _duplicata);

  plconta.GerarRegistrosAscendentes;

  AdicionarNivelAscendente;

  TransferirListaParaMemTable;
end;

procedure TReport.ProcessarItem(makesql:string; tbl:string='');
var
  q : TClasseQuery;
begin
  q := tclassequery.create(makesql);
  try
    while not q.q.eof do
    begin
      if plconta.Existe(q.q.fieldbyname(_cdplconta).asinteger)  then
      begin
        plconta.items[plconta.IndicePlconta(q.q.fieldbyname(_cdplconta).asinteger)].vlsaldo := plconta.items[plconta.IndicePlconta(q.q.fieldbyname(_cdplconta).asinteger)].vlsaldo + q.q.fieldbyname(_vltotal).ascurrency;
      end
      else
      begin
        with plconta.New do
        begin
          Select(q.q.fieldbyname(_cdplconta).asinteger);
          vlsaldo := q.q.fieldbyname(_vltotal).ascurrency;
        end;
      end;
      Lista.Add(TLista.Create);
      Lista[Lista.Count -1].cdplconta    := q.q.fieldbyname(_cdplconta).asinteger;
      Lista[Lista.Count -1].cdplcontapai := q.q.fieldbyname(_cdplcontapai).asinteger;
      Lista[Lista.Count -1].dtemissao    := q.q.fieldbyname(_dtemissao).asdatetime;
      Lista[Lista.Count -1].nunivel      := q.q.fieldbyname(_nuplconta).asstring;
      Lista[Lista.Count -1].nmplconta    := q.q.fieldbyname(_nmplconta).asstring;
      Lista[Lista.Count -1].vltotal      := q.q.fieldbyname(_vltotal).ascurrency;
      Lista[Lista.Count -1].nudocumento  := q.q.fieldbyname(_nudocumento).asstring;
      Lista[Lista.Count -1].dshistorico  := ObterHistorico(tbl, q);
      q.q.next;
    end;
  finally
    freeandnil(q);
  end;
end;

procedure TReport.ProcessarItEntrada;
var
  autpagto : tautpagtolist;
  entrada : tentrada;
  plconta : TPlContaList;
  y, x, I: Integer;
  porcentagem : double;
begin
  autpagto := tautpagtolist.Create;
  try
    if not autpagto.Ler('cdentrada is not null and dtprorrogacao '+sqlwhere) then
    begin
      exit;
    end;
    for I := 0 to autpagto.Count - 1 do
    begin
      entrada := tentrada.Create;
      plconta := tplcontalist.Create;
      try
        if not entrada.select(autpagto.Items[i].cdentrada) then
        begin
          continue;
        end;
        entrada.itentrada.ler(entrada.cdentrada);
        for y := 0 to entrada.itentrada.Count - 1 do
        begin
          if entrada.itentrada.Items[y].cdplconta = 0 then
          begin
            showmessage('Contas a pagar '+autpagto.Items[i].nuautpagto+' foi possível processar.');
            break;
          end;
          if not plconta.Existe(entrada.itentrada.Items[y].cdplconta) then
          begin
            plconta.New;
            plconta.Items[plconta.Count-1].Select(entrada.itentrada.Items[y].cdplconta);
          end;
          x                        := plconta.IndicePlconta(entrada.itentrada.Items[y].cdplconta);
          plconta.Items[x].vlsaldo := plconta.Items[x].vlsaldo + entrada.itentrada.Items[y].VlTotalGeral;

          Lista.Add(TLista.Create);
          Lista[Lista.Count -1].cdplconta    := entrada.itentrada.items[y].cdplconta;
          Lista[Lista.Count -1].cdplcontapai := plconta.items[x].cdplcontapai;
          Lista[Lista.Count -1].dtemissao    := entrada.dtemissao;
          Lista[Lista.Count -1].nunivel      := entrada.itentrada.items[y].nuplconta;
          Lista[Lista.Count -1].nmplconta    := plconta.items[x].nmplconta;
          Lista[Lista.Count -1].vltotal      := entrada.itentrada.Items[y].VlTotalGeral * (autpagto.items[i].vlautpagto / entrada.vltotal);
          Lista[Lista.Count -1].nudocumento  := entrada.nuentrada.tostring;
          Lista[Lista.Count -1].dshistorico  := 'Contas a Pagar '+autpagto.items[i].nuautpagto + ' '+
                                                'Vencimento '+GetDtAbrev(autpagto.items[i].dtprorrogacao)+' '+
                                                'Fornecedor '+ qregistro.nomedocodigo(_fornecedor, entrada.cdfornecedor)+' - '+
                                                'Produto '+qregistro.nomedocodigo(_produto, entrada.itentrada.items[y].cdproduto);
        end;
        porcentagem := autpagto.items[i].vlautpagto / plconta.vlsaldo;
        plconta.ReduzirSaldoPelaPorcentagem(porcentagem);
        AdicionarAoPlanoContasRelatorio(plconta);
      finally
        freeandnil(entrada);
        freeandnil(plconta);
      end;
    end;
  finally
    freeandnil(autpagto);
  end;
end;

procedure TReport.ProcessarItsaida;
var
  duplicata : tduplicatalist;
  saida : tsaida;
  plconta : TPlContaList;
  y, x, I: Integer;
  porcentagem : double;
begin
  duplicata := tduplicatalist.Create;
  try
    if not duplicata.Ler('cdsaida is not null and dtprorrogacao '+sqlwhere) then
    begin
      exit;
    end;
    for I := 0 to duplicata.Count - 1 do
    begin
      saida := tsaida.Create;
      plconta := tplcontalist.Create;
      try
        if not saida.select(duplicata.Items[i].cdsaida) then
        begin
          continue;
        end;
        saida.itsaida.ler(saida.cdsaida);
        for y := 0 to saida.itsaida.Count - 1 do
        begin
          if saida.itsaida.Items[y].cdplconta = 0 then
          begin
            showmessage('Contas a receber '+duplicata.Items[i].nuduplicata+' foi possível processar.');
            break;
          end;
          if not plconta.Existe(saida.itsaida.Items[y].cdplconta) then
          begin
            plconta.New;
            plconta.Items[plconta.Count-1].Select(saida.itsaida.Items[y].cdplconta);
          end;
          x                        := plconta.IndicePlconta(saida.itsaida.Items[y].cdplconta);
          plconta.Items[x].vlsaldo := plconta.Items[x].vlsaldo + saida.itsaida.Items[y].VlTotalGeral;

          Lista.Add(TLista.Create);
          Lista[Lista.Count -1].cdplconta    := saida.itsaida.items[y].cdplconta;
          Lista[Lista.Count -1].cdplcontapai := plconta.items[x].cdplcontapai;
          Lista[Lista.Count -1].dtemissao    := saida.dtemissao;
          Lista[Lista.Count -1].nunivel      := saida.itsaida.items[y].nuplconta;
          Lista[Lista.Count -1].nmplconta    := plconta.items[x].nmplconta;
          Lista[Lista.Count -1].vltotal      := saida.itsaida.Items[y].VlTotalGeral * (duplicata.items[i].vlduplicata / saida.vltotal);
          Lista[Lista.Count -1].nudocumento  := saida.nusaida.tostring;
          Lista[Lista.Count -1].dshistorico  := 'Contas a Receber '+duplicata.items[i].nuduplicata + ' '+
                                                'Vencimento '+GetDtAbrev(duplicata.items[i].dtprorrogacao)+' '+
                                                'Cliente '+ qregistro.nomedocodigo(_cliente, saida.cdcliente)+' - '+
                                                'Produto '+qregistro.nomedocodigo(_produto, saida.itsaida.items[y].cdproduto);
        end;
        porcentagem := duplicata.items[i].vlduplicata / plconta.vlsaldo;
        plconta.ReduzirSaldoPelaPorcentagem(porcentagem);
        AdicionarAoPlanoContasRelatorio(plconta);
      finally
        freeandnil(saida);
        freeandnil(plconta);
      end;
    end;
  finally
    freeandnil(duplicata);
  end;
end;

procedure TReport.AdicionarAoPlanoContasRelatorio(plano: TPlcontaList);
var
  I: Integer;
begin
  for I := 0 to plano.Count - 1 do
  begin
    if plconta.Existe(plano.Items[i].cdplconta)  then
    begin
      plconta.items[plconta.IndicePlconta(plano.Items[i].cdplconta)].vlsaldo := plconta.items[plconta.IndicePlconta(plano.Items[i].cdplconta)].vlsaldo + plano.Items[i].vlsaldo;
    end
    else
    begin
      with plconta.New do
      begin
        Select(plano.Items[i].cdplconta);
        vlsaldo := plano.Items[i].vlsaldo;
      end;
    end;
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
    mtbl.m.FieldByName(_dtemissao).AsDateTime   := item.dtemissao;
    mtbl.m.FieldByName(_nudocumento).AsString   := item.nudocumento;
    mtbl.m.FieldByName(_dshistorico).AsString   := item.dshistorico;
    mtbl.m.post;
  end;
end;

end.
