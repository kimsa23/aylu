unit ORM.Importacao;

interface

uses System.SysUtils, System.Generics.Collections, forms, ExcelXP, System.Variants, Winapi.Windows,
  data.db,
  Classe.DAO, classe.query, rotina.retornasql, classe.gerar, rotina.Rotinas, classe.registro,
  rotina.registro, orm.itimportacao,
  uConstantes, dialogo.progressbar;

type
  TImportacao = class(TRegistroQuipos)
  strict private
    fnmimportacao: string;
    fcdtpimportacao: integer;
    fcdimportacao: Integer;
    fnmtabela: string;
    fitimportacao: TItImportacaoList;
  public
    [KeyField]
    property cdimportacao: Integer read fcdimportacao write fcdimportacao;
    [fk, AObrigatorio]
    property cdtpimportacao: integer read fcdtpimportacao write fcdtpimportacao;
    [AObrigatorio]
    property nmimportacao: string read fnmimportacao write fnmimportacao;
    [AObrigatorio]
    property nmtabela: string read fnmtabela write fnmtabela;
    property itimportacao : TItImportacaoList read fitimportacao write fitimportacao;
    constructor Create;
    destructor destroy; override;
    function BuscarCampos:Boolean;
    function importar:Boolean;
  end;
  TImportarExcel = class
  private
    filename : string;
    AplicacaoE : TExcelApplication;
    Planilha : TExcelWorksheet;
    wkbk : _Workbook;
    LCID : integer;
    p : Tfrmprogressbar;
    q : TClasseQuery;
    importacao : TImportacao;
    function processar(value:TImportacao):boolean;
    function ValorCelula(item: titimportacao; i: Integer):string;
    procedure AbrirPlanilha;
    procedure AbrirQuery;
    procedure TratarFornecedor;
    procedure TratarAutpagto;
    procedure TratarValorZerado(item: titimportacao; i: Integer);
    procedure TratarPlConta;
    procedure Tratarcntcusto;
  public
    constructor Create;
    destructor destroy; override;
    class function Importar(value:TImportacao):Boolean;
  end;

implementation

function TImportacao.BuscarCampos: Boolean;
var
  q : TClasseQuery;
  p : Tfrmprogressbar;
begin
  q := TClasseQuery.create;
  p := Tfrmprogressbar.Create(nil);
  try
    q.q.Open('select rdb$field_name from rdb$relation_fields where rdb$relation_name='+nmtabela.QuotedString+' ORDER BY rdb$field_position');
    itimportacao.lista.Clear;
    p.gau.MaxValue := q.q.RecordCount;
    P.Show;
    while not q.q.Eof do
    begin
      p.gau.Progress := q.q.RecNo;
      P.pnl.Caption := 'Buscar campos '+p.gau.Progress.ToString+' de '+p.gau.MaxValue.ToString;
      application.ProcessMessages;
      itimportacao.lista.Add(TitImportacao.create);
      itimportacao.lista.Items[q.q.RecNo-1].cdimportacao   := cdimportacao;
      itimportacao.lista.Items[q.q.RecNo-1].cditimportacao := qgerar.gerarcodigo(_itimportacao);
      itimportacao.lista.Items[q.q.RecNo-1].nmcampo        := q.q.Fields[0].AsString;
      q.q.Next;
    end;
    result := itimportacao.lista.Count > 0;
  finally
    FreeAndNil(q);
    FreeAndNil(p);
  end;
end;

constructor TImportacao.Create;
begin
  fitimportacao := TItImportacaoList.Create;
end;

destructor TImportacao.destroy;
begin
  FreeAndNil(fitimportacao);
  inherited;
end;

function TImportacao.importar: Boolean;
begin
  result := TImportarExcel.Importar(Self);
end;

{ TImportarExcel }

procedure TImportarExcel.AbrirPlanilha;
begin
  wkbk           := AplicacaoE.Workbooks.Open(filename, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, LCID);
  Planilha.ConnectTo(wkbk.Worksheets[1] as _Worksheet);
  Planilha.Activate; // torna a planilha da lista a planilha ativa
end;

procedure TImportarExcel.AbrirQuery;
begin
  q.q.SQL.Text := 'SELECT * FROM '+importacao.nmtabela+' where cd'+importacao.nmtabela+'=0';
  q.q.Open;
end;

constructor TImportarExcel.Create;
begin
  q := TClasseQuery.create;
  AplicacaoE     := TExcelApplication.Create(nil);
  Planilha       := TExcelWorksheet.Create(nil);
  LCID           := GetUserDefaultLCID;
  p := Tfrmprogressbar.Create(nil);
end;

destructor TImportarExcel.destroy;
begin
  AplicacaoE.Workbooks.Close(lcid);
  FreeAndNil(planilha);
  FreeAndNil(AplicacaoE);
  FreeAndNil(p);
  FreeAndNil(q);
  inherited;
end;

class function TImportarExcel.Importar(value: TImportacao): Boolean;
var
  importarexcel : timportarexcel;
begin
  importarexcel := TImportarExcel.Create;
  try
    result := importarexcel.Processar(value);
  finally
    freeandnil(importarexcel);
  end;
end;

procedure TImportarExcel.TratarAutpagto;
begin
  if LowerCase(importacao.nmtabela) <> _autpagto then
  begin
    Exit;
  end;
  if q.q.FieldByName(_cdautpagto).AsString = '' then
  begin
    q.q.FieldByName(_cdautpagto).asinteger := QGerar.GerarCodigo(_autpagto);
  end;
  if q.q.FieldByName(_nuautpagto).IsNull then
  begin
    q.q.FieldByName(_nuautpagto).AsString := q.q.FieldByName(_cdautpagto).AsString;
  end;
  if q.q.FieldByName(_vlautpagto).AsCurrency < 0 then
  begin
    q.q.FieldByName(_vlautpagto).AsCurrency := q.q.FieldByName(_vlautpagto).AsCurrency * -1;
  end;
  if q.q.FieldByName(_vlsaldo).AsCurrency < 0 then
  begin
    q.q.FieldByName(_vlsaldo).AsCurrency := q.q.FieldByName(_vlsaldo).AsCurrency * -1;
  end;
end;

procedure TImportarExcel.TratarPlConta;
begin
  if LowerCase(importacao.nmtabela) <> _plconta then
  begin
    Exit;
  end;
  if q.q.FieldByName(_cdplconta).AsString = '' then
  begin
    q.q.FieldByName(_cdplconta).asinteger := QGerar.GerarCodigo(_plconta);
  end;
end;

procedure TImportarExcel.Tratarcntcusto;
begin
  if LowerCase(importacao.nmtabela) <> _cntcusto then
  begin
    Exit;
  end;
  if q.q.FieldByName(_cdcntcusto).AsString = '' then
  begin
    q.q.FieldByName(_cdcntcusto).asinteger := QGerar.GerarCodigo(_cntcusto);
  end;
end;

procedure TImportarExcel.TratarFornecedor;
begin
  if LowerCase(importacao.nmtabela) <> _fornecedor then
  begin
    Exit;
  end;
  if q.q.FieldByName(_nmfornecedor).AsString = '' then
  begin
    q.q.FieldByName(_nmfornecedor).AsString := q.q.FieldByName(_rzsocial).AsString;
  end;
  if q.q.FieldByName(_cdSTfornecedor).IsNull then
  begin
    q.q.FieldByName(_cdSTfornecedor).AsInteger := 1;
  end;
end;

function TImportarExcel.processar(value: TImportacao): boolean;
var
  x, i : Integer;
  codigo : string;
begin
  result := QRotinas.SelecionarNomeArquivo(filename);
  if not result then
  begin
    Exit;
  end;
  importacao := value;
  AbrirPlanilha;
  AbrirQuery;

  p.gau.MaxValue := 100;
  p.Show;
  i      := 1;
  codigo := Trim(Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2);
  while codigo <> '' do
  begin
    p.pnl.Caption     := 'Importar Planilha '+i.tostring;
    p.gau.Progress    := p.gau.Progress + 1;
    Application.ProcessMessages;
    if p.gau.Progress = 100 then
    begin
      p.gau.Progress := 0;
    end;
    q.q.Insert;
    for x := 0 to importacao.itimportacao.lista.Count - 1 do
    begin
      if importacao.itimportacao.lista[x].nmcelula <> '' then
      begin
        q.q.FieldByName(importacao.itimportacao.lista[x].nmcampo).AsString := valorcelula(importacao.itimportacao.lista[x], i);
      end;
      if importacao.itimportacao.lista[x].vlpadrao <> '' then
      begin
        q.q.FieldByName(importacao.itimportacao.lista[x].nmcampo).AsString := importacao.itimportacao.lista[x].vlpadrao;
      end;
      TratarValorZerado(importacao.itimportacao.lista[x], i);
    end;
    TratarFornecedor;
    TratarAutpagto;
    TratarPlconta;
    TratarCntCusto;
    tregistro.setUpdate(q.q);
    q.q.Post;
    Inc(i);
    codigo := Trim(Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2);
  end;
end;

procedure TImportarExcel.TratarValorZerado(item: titimportacao; i: Integer);
begin
  if LowerCase(Copy(item.nmcampo, 1, 2)) = _vl then
  begin
    if q.q.FieldByName(item.nmcampo).AsString = '' then
    begin
      q.q.FieldByName(item.nmcampo).AsString := _0;
    end;
  end;
end;

function TImportarExcel.ValorCelula(item: titimportacao; i: Integer): string;
var
  valor, p : string;
begin
  p := item.nmcelula+i.ToString;
  if LowerCase(Copy(item.nmcampo, 1, 2)) = _dt then
  begin
    valor := FormatDateTime(_DD_MM_yyyy, Planilha.Range[p,p].Value2);
  end
  else
  begin
    valor := Planilha.Range[p,p].Value2;
  end;
  if item.nmtabela2 <> '' then
  begin
    valor := qregistro.StringdoString(item.nmtabela2, valor, item.nmcampo2, item.nmcampo);
  end;
  result := valor;
end;

end.
