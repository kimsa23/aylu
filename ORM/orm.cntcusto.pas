unit orm.cntcusto;

interface

uses Data.DB, Contnrs, System.SysUtils, Vcl.Dialogs, System.UITypes, System.Classes,
  uConstantes, ulocalizar,
  ORM.Empresa,
  Rotina.Retornasql, Rotina.Registro, Rotina.Strings,
  classe.query, Classe.Interna, Classe.DAO, classe.gerar;

type
  TCntcusto = class(TRegistroQuipos)
  private
    fnufone: string;
    fcdcntcustopai: integer;
    fdsendereco: string;
    fnucnpj: string;
    fnufax: string;
    fcdmunicipio: integer;
    fnuinscest: string;
    fdscntcusto: string;
    fnmbairro: string;
    fnucep: string;
    fnmcntcusto: string;
    fnunivel: string;
    fdsnumero: string;
    fnucxpostal: string;
    fcduf: integer;
    fcdcntcusto: integer;
    fboautpagto: string;
    fboduplicata: string;
    fbovisible: string;
    fbobloqueio: string;
  public
    [keyfield]
    property cdcntcusto : integer read fcdcntcusto write fcdcntcusto;
    [fk]
    property cdcntcustopai : integer read fcdcntcustopai write fcdcntcustopai;
    [fk]
    property cdmunicipio : integer read fcdmunicipio write fcdmunicipio;
    [fk]
    property cduf : integer read fcduf write fcduf;
    [AObrigatorio]
    property nmcntcusto : string read fnmcntcusto write fnmcntcusto;
    [AObrigatorio]
    property nunivel : string read fnunivel write fnunivel;
    property nucnpj : string read fnucnpj write fnucnpj;
    property dsendereco : string read fdsendereco write fdsendereco;
    property dsnumero : string read fdsnumero write fdsnumero;
    property nmbairro : string read fnmbairro write fnmbairro;
    property nucxpostal : string read fnucxpostal write fnucxpostal;
    property nucep : string read fnucep write fnucep;
    property nufone : string read fnufone write fnufone;
    property nufax : string read fnufax write fnufax;
    property nuinscest : string read fnuinscest write fnuinscest;
    property dscntcusto : string read fdscntcusto write fdscntcusto;
    property boduplicata : string read fboduplicata write fboduplicata;
    property boautpagto : string read fboautpagto write fboautpagto;
    property bovisible : string read fbovisible  write fbovisible;
    property bobloqueio: string read fbobloqueio write fbobloqueio;
    function Delete(boscript:boolean=false): String;
    function ExisteRegistronaTabela(tabela:string):boolean;
    function ExisteRegistroRelacionado:boolean;
    procedure VerificarBloqueio;
    class procedure DesativarBloqueio(codigo:integer);
    class procedure edtnucntcustoPropertiesButtonClick(cds:TDataset);
    class function Inserir(nome: string; cdpai: integer): integer;
    class function ObterNuNivel(cdpai:integer):string;
    class procedure ValidarNucntcusto(dataset:TDataset; nmfield:string=''; bloqueio:boolean=true);
  end;
  TCntcustoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TCntcusto;
    procedure SetItem(Index: Integer; const Value: TCntcusto);
  public
    function New: TCntcusto;
    property Items[Index: Integer]: TCntcusto read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
  end;

implementation

function TCntcusto.Delete(boscript: boolean): String;
begin
  result := '';
  if ExisteRegistroRelacionado then
  begin
    exit;
  end;
  result := inherited Delete(boscript);
end;

class procedure TCntcusto.DesativarBloqueio(codigo:integer);
var
  cntcusto : tcntcusto;
begin
  if codigo = 0 then
  begin
    exit;
  end;
  if not registroexiste(_cntcusto, _cdcntcusto+_pai+'='+codigo.tostring) then
  begin
    cntcusto := tcntcusto.create;
    try
      cntcusto.select(codigo);
      cntcusto.bobloqueio := _n;
      cntcusto.update;
    finally
      freeandnil(cntcusto);
    end;
  end;
end;

class procedure TCntcusto.edtnucntcustoPropertiesButtonClick(cds: TDataset);
var
  cd : string;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := ulocalizar.Localizar( _cntcusto, _nunivel, _nmcntcusto, 'Centro Custo', 'o', _nunivel);
  if cd = '' then
  begin
    exit;
  end;
  cds.fieldbyname(_nucntcusto).AsString := cd;
end;

function TCntcusto.ExisteRegistronaTabela(tabela: string): boolean;
begin
  result := RegistroExiste(tabela, _cntcusto+'='+cdcntcusto.tostring);
end;

function TCntcusto.ExisteRegistroRelacionado: boolean;
begin
  result := ExisteRegistronaTabela(_entrada);
  if not result then result := ExisteRegistroNaTabela(_itentrada);
  if not result then result := ExisteRegistroNaTabela(_autpagto);
  if not result then result := ExisteRegistroNaTabela(_produto);
  if not result then result := ExisteRegistroNaTabela(_itordcompra);
  if not result then result := ExisteRegistroNaTabela(_duplicata);
  if not result then result := ExisteRegistroNaTabela(_itsaida);
  if not result then result := ExisteRegistroNaTabela(_saida);
  if not result then result := ExisteRegistroNaTabela(_funcionario);
  if not result then result := ExisteRegistroNaTabela(_itmovto);
  if not result then result := ExisteRegistroNaTabela(_rim);
  if not result then result := ExisteRegistroNaTabela(_solicitacao);
  if not result then result := ExisteRegistroNaTabela(_itpedidomaterial);
  if not result then result := ExisteRegistroNaTabela(_ordcompra);
  if not result then result := ExisteRegistroNaTabela(_equipamento);
  if not result then result := ExisteRegistroNaTabela(_apontamento);
end;

class function TCntcusto.Inserir(nome: string; cdpai: integer): integer;
var
  cntcustopai : tcntcusto;
  cntcusto : tcntcusto;
begin
  cntcustopai := tcntcusto.create;
  cntcusto    := tcntcusto.create;
  try
    cntcusto.cdcntcusto := qgerar.gerarcodigo(_cntcusto);
    cntcusto.nmcntcusto := nome;
    cntcusto.bobloqueio := _N;
    if cntcustopai.select(cdpai) then
    begin
      cntcusto.cdcntcustopai := cdpai;
      cntcusto.boduplicata   := cntcustopai.boduplicata;
      cntcusto.boautpagto    := cntcustopai.boautpagto;
      cntcustopai.bobloqueio := _s;
      cntcustopai.update;
    end;
    cntcusto.nunivel := tcntcusto.ObterNuNivel(cdpai);
    cntcusto.insert;
    result := cntcusto.cdcntcusto;
  finally
    freeandnil(cntcustopai);
    freeandnil(cntcusto);
  end;
end;

class function TCntcusto.ObterNuNivel(cdpai: integer): string;
  function makesql : string;
  begin
    result := 'select * from cntcusto where cdempresa='+empresa.cdempresa.tostring+' and cdcntcustopai';
    if cdpai <> 0 then
    begin
      result := result + '='+cdpai.tostring;
    end
    else
    begin
      result := result + ' is null';
    end;
    result := result + ' order by nunivel';
  end;
var
  cntcusto : TcntcustoList;
  cntcustopai : tcntcusto;
  q : tclassequery;
  ilista, iItem, I: Integer;
  snivel : string;
begin
  iItem      := 0;
  snivel     := '';
  ilista     := 0;
  cntcusto    := tcntcustolist.create;
  q          := tclassequery.create(makesql);
  cntcustopai := tcntcusto.create;
  try
    if cntcustopai.select(cdpai) then
    begin
      snivel := cntcustopai.nunivel;
      ilista := TListaMascaraNIvel.IndicedoNivel(cntcustopai.nunivel)+1;
    end;
    cntcusto.ler(q.q);
    for I := 0 to cntcusto.count - 1 do
    begin
      iItem := i + 1;
      if empresa.financeiro.maskcntcusto.Lista[ilista].nufaixa = i + 1 then
      begin
        messagedlg('Limite atingido.', mtinformation, [mbok], 0);
        abort;
      end;
      if TListaMascaraNIvel.ObterItemdoNivel(cntcusto.items[i].nunivel) <> iItem then
      begin
        Dec(iItem);
        break;
      end;
    end;
    inc(iItem);
    result := empresa.financeiro.maskcntcusto.FormatarNunivel(snivel, iItem);
  finally
    freeandnil(cntcusto);
    freeandnil(cntcustopai);
    freeandnil(q);
  end;
end;

class procedure TCntcusto.ValidarNucntcusto(dataset: TDataset; nmfield: string=''; bloqueio:boolean=true);
var
  cntcusto : tcntcusto;
begin
  if dataset.fieldbyname(_nucntcusto+nmfield).asstring = '' then
  begin
    dataset.fieldbyname(_cdcntcusto+nmfield).clear;
    dataset.fieldbyname(_nmcntcusto+nmfield).clear;
    Exit;
  end;
  cntcusto := tcntcusto.create;
  try
    if not cntcusto.select(_cdempresa+'='+empresa.cdempresa.tostring+' and '+_nunivel+'='+dataset.fieldbyname(_nucntcusto+nmfield).asstring.QuotedString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [dataset.fieldbyname(_nucntcusto+nmfield).asstring, qstring.maiuscula(_Centro+' de '+_custo)]), mterror, [mbok], 0);
      dataset.fieldbyname(_cdcntcusto+nmfield).clear;
      dataset.fieldbyname(_nmcntcusto+nmfield).clear;
      dataset.fieldbyname(_nucntcusto+nmfield).FocusControl;
      abort;
    end;
    if bloqueio then
    begin
      cntcusto.VerificarBloqueio;
    end;
    dataset.fieldbyname(_cdcntcusto+nmfield).AsInteger := cntcusto.cdcntcusto;
    dataset.fieldbyname(_nmcntcusto+nmfield).asstring  := cntcusto.nmcntcusto;
  finally
    freeandnil(cntcusto);
  end;
end;

procedure TCntcusto.VerificarBloqueio;
begin
  if bobloqueio = _s then
  begin
    messagedlg('Não é possível usar o centro de custo '+nunivel+' - '+nmcntcusto+'.'#13+
               'É uma centro de custo sintético porque possui subitens.', mtinformation, [mbok], 0);
    abort;
  end;
end;

function TCntcustoList.GetItem(Index: Integer): TCntcusto;
begin
  Result := Tcntcusto(Inherited Items[Index]);
end;

function TCntcustoList.Ler(DataSet: TDataset): boolean;
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

function TCntcustoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_cntcusto, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TCntcustoList.New: TCntcusto;
begin
  Result := Tcntcusto.Create;
  Add(Result);
end;

procedure TCntcustoList.SetItem(Index: Integer; const Value: TCntcusto);
begin
  Put(Index, Value);
end;

function TCntcustoList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_cntcusto, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
