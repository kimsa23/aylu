unit orm.plconta;

interface

uses Contnrs, Data.DB, System.SysUtils, vcl.dialogs, classes, System.UITypes,
  uConstantes, ulocalizar,
  ORM.Empresa,
  classe.dao, classe.query, Classe.Interna, classe.gerar, classe.Executasql,
  Rotina.Retornasql, Rotina.Registro, Rotina.Strings;

type
  TPlContaList = class;
  TPlConta = class(TRegistroQuipos)
  private
    Fcdplconta: integer;
    Fcdplcontapai: integer;
    Fnunivel: string;
    Fvlsaldo: currency;
    Fdsplconta: string;
    Fnmplconta: string;
    fboautpagto: string;
    fboduplicata: string;
    fbovisible: string;
    fbobloqueio: string;
    flista: tplcontalist;
    function aplicarDuplicataAutpagto:boolean;
  public
    [keyfield]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    [fk]
    property cdplcontapai : integer read Fcdplcontapai write Fcdplcontapai;
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
    [AObrigatorio]
    property nunivel : string read Fnunivel write Fnunivel;
    [AObrigatorio]
    property nmplconta : string read Fnmplconta write Fnmplconta;
    property dsplconta : string read Fdsplconta write Fdsplconta;
    property boduplicata : string read fboduplicata write fboduplicata;
    property boautpagto : string read fboautpagto write fboautpagto;
    property bovisible : string read fbovisible  write fbovisible;
    property bobloqueio : string read fbobloqueio write fbobloqueio;
    property lista: tplcontalist read flista write flista;
    constructor create;
    destructor destroy; override;
    function Delete(boscript:boolean=false): String;
    function ExisteRegistronaTabela(tabela:string; adicional:string=''):boolean;
    function ExisteRegistroRelacionado:boolean;
    procedure VerificarBloqueio;
    function PodeAdicionarSubItem:boolean;
    procedure AdicionarSubItem(plorigem: Tplconta);
    function TransferirDados(plorigem: Tplconta):boolean;
    class procedure DesativarBloqueio(codigo:integer);
    class procedure ValidarNuplconta(dataset:TDataset; cdnatureza : string; nmfield:string='');
    class procedure edtnuplcontaPropertiesButtonClick(cds: TDataset);
    class function Inserir(nome:string; cdpai: integer):integer;
    class function ObterNuNivel(plcontapai:TPlConta):string;
    class function Recortar(cdorigem, cddestino: integer):boolean;
    class function Transferir(cdorigem, cddestino: integer):boolean;
    class function AplicarSubitemDuplicataAutpagto(codigo:integer):boolean;
  end;
  TPlContaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPlConta;
    procedure SetItem(Index: Integer; const Value: TPlConta);
  public
    function New: TPlConta;
    property Items[Index: Integer]: TPlConta read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdplcontapai):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string; sqlorderby:string=''):Boolean;overload;
    function Existe(cdplconta:integer):boolean;
    function IndicePlconta(cdplconta:integer): integer;
    function ProximoNivelDisponivel(nunivel:string):string;
    function ExisteRegistroRelacionado:boolean;
    function vlsaldo:currency;
    procedure ReduzirSaldoPelaPorcentagem(porcentagem:double);
    procedure AdicionarContaPai(Pcdplcontapai: integer; Pvlsaldo: currency);
    procedure GerarRegistrosAscendentes;
  end;

implementation

procedure TPlContaList.AdicionarContaPai(Pcdplcontapai: integer; Pvlsaldo: currency);
begin
  if Pcdplcontapai <> 0 then
  begin
    if Existe(Pcdplcontapai) then
    begin
      items[IndicePlconta(Pcdplcontapai)].vlsaldo := items[IndicePlconta(Pcdplcontapai)].vlsaldo + Pvlsaldo;
      AdicionarContaPai(items[IndicePlconta(Pcdplcontapai)].cdplcontapai, Pvlsaldo);
    end
    else
    begin
      New;
      Items[count-1].Select(Pcdplcontapai);
      Items[count-1].vlsaldo := Pvlsaldo;
      AdicionarContaPai(Items[count-1].cdplcontapai, Items[count-1].vlsaldo);
    end;
  end;
end;

function TPlContaList.Existe(cdplconta: integer): boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    if items[i].cdplconta = cdplconta then
    begin
      result := true;
      break;
    end;
  end;
end;

function TPlContaList.ExisteRegistroRelacionado: boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    result := items[i].ExisteRegistroRelacionado;
    if result then
    begin
      break;
    end;
  end;
end;

procedure TPlContaList.GerarRegistrosAscendentes;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    AdicionarContaPai(Items[i].cdplcontapai, Items[i].vlsaldo);
  end;
end;

function TPlContaList.GetItem(Index: Integer): TPlConta;
begin
  Result := TPlConta(Inherited Items[Index]);
end;

function TPlContaList.IndicePlconta(cdplconta:integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if cdplconta = items[i].cdplconta then
    begin
      result := i;
      break;
    end;
  end;
end;

function TPlContaList.Ler(sqlwhere: string; sqlorderby:string=''): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_plconta, sqlwhere, sqlorderby));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPlContaList.Ler(DataSet: TDataset): boolean;
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

function TPlContaList.Ler(codigo: Integer; cdfield: string=_cdplcontapai): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_plconta, codigo, cdfield, _nunivel));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPlContaList.New: TPlConta;
begin
  Result := TPlConta.Create;
  Add(Result);
end;

function TPlContaList.ProximoNivelDisponivel(nunivel: string): string;
var
  nu, I: Integer;
begin
  nu := 0;
  result := '';
  for I := 0 to count - 1 do
  begin
    inc(nu);
    if nu < TListaMascaraNIvel.ObterItemdoNivel(items[i].nunivel) then
    begin
      break;
    end;
  end;
  inc(nu);
  result := empresa.financeiro.maskplconta.FormatarNunivel(nunivel, nu);
end;

procedure TPlContaList.ReduzirSaldoPelaPorcentagem(porcentagem: double);
var
  I: Integer;
begin
  for I := 0 to count - 1 do
  begin
    items[i].vlsaldo := items[i].vlsaldo * porcentagem;
  end;
end;

procedure TPlContaList.SetItem(Index: Integer; const Value: TPlConta);
begin
  Put(Index, Value);
end;

function TPlContaList.vlsaldo: currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    result := result + items[i].vlsaldo;
  end;
end;

procedure TPlConta.AdicionarSubItem(plorigem: Tplconta);
var
  codigo : integer;
  I: Integer;
begin
  codigo := tplconta.Inserir(plorigem.nmplconta, cdplconta);
  lista.new;
  lista.items[lista.count - 1].select(codigo);
  lista.items[lista.count - 1].TransferirDados(plorigem);
  if plorigem.lista.ler(plorigem.cdplconta) then
  begin
    for I := 0 to plorigem.lista.count - 1 do
    begin
      lista.items[lista.count - 1].AdicionarSubItem(plorigem.lista.items[i]);
    end;
  end;
  plorigem.delete;
end;

function TPlConta.aplicarDuplicataAutpagto:boolean;
var
  I: Integer;
begin
  result := lista.Ler(cdplconta);
  if result then
  begin
    exit;
  end;
  for I := 0 to lista.Count - 1 do
  begin
    lista.Items[i].boduplicata := boduplicata;
    lista.Items[i].boautpagto  := boautpagto;
    if lista.Items[i].aplicarDuplicataAutpagto then
    begin
      bobloqueio := _N;
    end
    else
    begin
      bobloqueio := _S;
    end;
    lista.Items[i].Update;
  end;
end;

class function TPlConta.AplicarSubitemDuplicataAutpagto(codigo: integer): boolean;
var
  plconta : tplconta;
begin
  plconta := tplconta.create;
  try
    result := plconta.Select(codigo);
    if not result then
    begin
      exit;
    end;
    if plconta.cdplcontapai <> 0 then
    begin
      exit;
    end;
    plconta.aplicarDuplicataAutpagto;
  finally
    freeandnil(plconta);
  end;
end;

constructor TPlConta.create;
begin
  inherited;
  flista := tplcontalist.create;
end;

function TPlConta.Delete(boscript:boolean=false): String;
begin
  result := '';
  if ExisteRegistroRelacionado then
  begin
    exit;
  end;
  result := inherited Delete(boscript);
end;

class procedure TPlConta.DesativarBloqueio(codigo: integer);
var
  plconta : tplconta;
begin
  if codigo = 0 then
  begin
    exit;
  end;
  if not registroexiste(_plconta, _cdplconta+_pai+'='+codigo.tostring) then
  begin
    plconta := tplconta.create;
    try
      plconta.select(codigo);
      plconta.bobloqueio := _n;
      plconta.update;
    finally
      freeandnil(plconta);
    end;
  end;
end;

destructor TPlConta.destroy;
begin
  freeandnil(flista);
  inherited;
end;

class procedure TPlConta.edtnuplcontaPropertiesButtonClick(cds: TDataset);
var
  cd : string;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := ulocalizar.Localizar( _plconta, _nunivel, _nmplconta, 'Plano Conta', 'o', _nunivel);
  if cd = '' then
  begin
    exit;
  end;
  cds.fieldbyname(_NUPLCONTA).AsString := cd;
end;

function TPlConta.ExisteRegistronaTabela(tabela: string; adicional:string=''): boolean;
begin
  result := RegistroExiste(tabela, _cdplconta+adicional+'='+cdplconta.tostring);
end;

function TPlConta.ExisteRegistroRelacionado: boolean;
begin
  result := ExisteRegistronaTabela(_entrada);
  if not result then result := ExisteRegistroNaTabela(_itentrada);
  if not result then result := ExisteRegistroNaTabela(_autpagto);
  if not result then result := ExisteRegistroNaTabela(_duplicata);
  if not result then result := ExisteRegistroNaTabela(_saida);
  if not result then result := ExisteRegistroNaTabela(_itsaida);
  if not result then result := ExisteRegistroNaTabela(_itordcompra);
  if not result then result := ExisteRegistroNaTabela(_produto);
  if not result then result := ExisteRegistroNaTabela(_movbancario);
  if not result then result := ExisteRegistroNaTabela(_parcelamentosaida);
  if not result then result := ExisteRegistroNaTabela(_cliente);
  if not result then result := ExisteRegistroNaTabela(_cte);
  if not result then result := ExisteRegistroNaTabela(_linkextrato);
  if not result then result := ExisteRegistroNaTabela(_movimentacao);
  if not result then result := ExisteRegistroNaTabela(_parcelamento);
  if not result then result := ExisteRegistroNaTabela(_plcontarateio);
  if not result then result := ExisteRegistroNaTabela(_empresa, _cte+_rpa);
  if not result then result := ExisteRegistroNaTabela(_empresa, _rpa);
  if not result then
  begin
    if lista.Count = 0 then
    begin
      lista.ler(cdplconta);
    end;
    result := lista.ExisteRegistroRelacionado;
  end;
end;

class function TPlConta.Inserir(nome: string; cdpai: integer): integer;
var
  plcontapai : tplconta;
  plconta    : tplconta;
begin
  plcontapai := tplconta.create;
  plconta    := tplconta.create;
  try
    plconta.cdplconta  := qgerar.gerarcodigo(_plconta);
    plconta.nmplconta  := nome;
    plconta.bobloqueio := _N;
    if plcontapai.select(cdpai) then
    begin
      plconta.cdplcontapai  := cdpai;
      plconta.boduplicata   := plcontapai.boduplicata;
      plconta.boautpagto    := plcontapai.boautpagto;
      plcontapai.bobloqueio := _s;
      plcontapai.update;
    end;
    plconta.nunivel := tplconta.ObterNuNivel(plcontapai);
    plconta.insert;
    result := plconta.cdplconta;
  finally
    freeandnil(plcontapai);
    freeandnil(plconta);
  end;
end;

class function TPlConta.ObterNuNivel(plcontapai:TPlConta): string;
  function makesqlwhere : string;
  begin
    result := _cdplcontapai;
    if plcontapai.cdplconta <> 0 then
    begin
      result := result + '='+plcontapai.cdplconta.tostring;
    end
    else
    begin
      result := result + ' is null';
    end;
  end;
var
  ilista, iItem, I: Integer;
begin
  iItem      := 0;
  ilista     := 0;
  if plcontapai.cdplconta <> 0 then
  begin
    ilista := TListaMascaraNIvel.IndicedoNivel(plcontapai.nunivel)+1;
  end;
  plcontapai.lista.ler(makesqlwhere, _nunivel);
  for I := 0 to plcontapai.lista.count - 1 do
  begin
    iItem := i + 1;
    if empresa.financeiro.maskplconta.Lista[ilista].nufaixa = i + 1 then
    begin
      messagedlg('Limite atingido.', mtinformation, [mbok], 0);
      abort;
    end;
    if TListaMascaraNIvel.ObterItemdoNivel(plcontapai.lista.items[i].nunivel) <> iItem then
    begin
      Dec(iItem);
      break;
    end;
  end;
  inc(iItem);
  result := empresa.financeiro.maskplconta.FormatarNunivel(plcontapai.nunivel, iItem);
end;

function TPlConta.PodeAdicionarSubItem: boolean;
begin
  result := TListaMascaraNIvel.IndicedoNivel(nunivel) < TListaMascaraNIvel.IndicedoNivel(empresa.financeiro.dsmaskplconta);
  if not result then
  begin
    exit;
  end;
end;

class function TPlConta.Recortar(cdorigem, cddestino: integer): boolean;
var
  plorigem : tplconta;
  pldestino : tplconta;
begin
  plorigem := tplconta.create;
  pldestino := tplconta.create;
  try
    result := plorigem.select(cdorigem);
    if not result then
    begin
      exit;
    end;
    result := pldestino.select(cddestino);
    if not result then
    begin
      exit;
    end;
    result := pldestino.PodeAdicionarSubItem;
    if not result then
    begin
      messagedlg('Não é possível adicionar subnível para '+pldestino.nunivel+' - '+pldestino.nmplconta+'.', mtinformation, [mbok], 0);
      exit;
    end;
    result := TListaMascaraNIvel.IndicedoNivel(pldestino.nunivel) = TListaMascaraNIvel.IndicedoNivel(plorigem.nunivel) - 1;
    if not result then
    begin
      messagedlg('Só pode adicionar para um nível superior.', mtinformation, [mbok], 0);
      exit;
    end;
    pldestino.AdicionarSubItem(plorigem);
  finally
    freeandnil(plorigem);
    freeandnil(pldestino);
  end;
end;

class function TPlConta.Transferir(cdorigem, cddestino: integer): boolean;
var
  plorigem, plconta : tplconta;
begin
  plconta  := tplconta.create;
  plorigem := tplconta.create;
  try
    result := plconta.Select(cddestino);
    if not result then
    begin
      exit;
    end;
    if plconta.bobloqueio = _s  then
    begin
      messagedlg('Plano de contas de destino '+plconta.nunivel+' - '+plconta.nmplconta+#13'possui itens.', mtinformation, [mbok], 0);
      abort;
    end;
    result := plorigem.Select(cdorigem);
    if not result then
    begin
      exit;
    end;
    if (plconta.boduplicata <> plorigem.boduplicata) or (plconta.boautpagto <> plorigem.boautpagto) then
    begin
      messagedlg('As configurações de receita e despesa estão diferentes entre a origem e o destino.', mtinformation, [mbok], 0);
      result := false;
      abort;
    end;
    plconta.TransferirDados(plorigem);
  finally
    freeandnil(plconta);
    freeandnil(plorigem);
  end;
end;

function TPlConta.TransferirDados(plorigem: Tplconta):boolean;
  function makesqlupdate(tabela:string; adicional:string=''):string;
  begin
    result := 'update '+tabela+' '+
              'set cdplconta'+adicional+'='+cdplconta.tostring+',nuplconta'+adicional+'='+nunivel.QuotedString+' '+
              'where cdempresa='+cdempresa.tostring+' and cdplconta'+adicional+'='+plorigem.cdplconta.tostring+';';
  end;
var
  sql : tstrings;
begin
  sql := tstringlist.create;
  try
    sql.add(makesqlupdate(_entrada));
    sql.add(makesqlupdate(_itentrada));
    sql.add(makesqlupdate(_autpagto));
    sql.add(makesqlupdate(_duplicata));
    sql.add(makesqlupdate(_saida));
    sql.add(makesqlupdate(_itsaida));
    sql.add(makesqlupdate(_itordcompra));
    sql.add(makesqlupdate(_produto));
    sql.add(makesqlupdate(_movbancario));
    sql.add(makesqlupdate(_parcelamentosaida));
    sql.add(makesqlupdate(_cliente));
    sql.add(makesqlupdate(_cte));
    sql.add(makesqlupdate(_empresa, _cte+_rpa));
    sql.add(makesqlupdate(_empresa, _rpa));
    sql.add(makesqlupdate(_linkextrato));
    sql.add(makesqlupdate(_movimentacao));
    sql.add(makesqlupdate(_parcelamento));
    sql.add(makesqlupdate(_plcontarateio));
    result := ExecutaScript(sql);
  finally
    freeandnil(sql);
  end;
end;

class procedure TPlConta.ValidarNuplconta(dataset:TDataset; cdnatureza : string; nmfield:string='');
var
  plconta : tplconta;
begin
  if dataset.fieldbyname(_nuplconta+nmfield).asstring = '' then
  begin
    dataset.fieldbyname(_cdplconta+nmfield).clear;
    dataset.fieldbyname(_nmplconta+nmfield).clear;
    Exit;
  end;
  plconta := tplconta.create;
  try
    if not plconta.select(_cdempresa+'='+empresa.cdempresa.tostring+' and '+_nunivel+'='+dataset.fieldbyname(_nuplconta+nmfield).asstring.QuotedString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [dataset.fieldbyname(_nuplconta+nmfield).asstring, qstring.maiuscula(_Plano+' '+_Contas)]), mterror, [mbok], 0);
      dataset.fieldbyname(_cdplconta+nmfield).clear;
      dataset.fieldbyname(_nmplconta+nmfield).clear;
      dataset.fieldbyname(_nuplconta+nmfield).FocusControl;
      abort;
    end;
    plconta.VerificarBloqueio;
    if cdnatureza <> '' then
    begin
      if (cdnatureza = _d) and (plconta.boduplicata = _s) then
      begin
        messagedlg('Este lançamento não pode ser na conta passivo.', mtinformation, [mbok], 0);
        abort;
      end;
      if (cdnatureza = _c) and (plconta.boautpagto = _s) then
      begin
        messagedlg('Este lançamento não pode ser na conta ativo.', mtinformation, [mbok], 0);
        abort;
      end;
    end;
    dataset.fieldbyname(_cdplconta+nmfield).AsInteger := plconta.cdplconta;
    dataset.fieldbyname(_nmplconta+nmfield).asstring  := plconta.nmplconta;
  finally
    freeandnil(plconta);
  end;
end;

procedure TPlConta.VerificarBloqueio;
begin
  if bobloqueio = _s then
  begin
    messagedlg('Não é possível usar o plano de conta '+nunivel+' - '+nmplconta+'.'#13+
               'É uma conta sintética porque possui subitens.', mtinformation, [mbok], 0);
    abort;
  end;
end;

end.
