unit Importacao.Excel;

interface

uses forms, ExcelXP, System.SysUtils, System.Variants, Winapi.Windows,
  uconstantes, rotina.Rotinas, dialogo.ProgressBar,
  orm.produto, orm.unidade;

type
  TImportacaoExcelProduto = class
  private
    LCID : integer;
    filename : string;
    AplicacaoE : TExcelApplication;
    Planilha : TExcelWorksheet;
    wkbk : _Workbook;
    produto : tprodutolist;
    function ObterFileName:boolean;
    procedure AbrirPlanilha;
    function processar:boolean;
  public
    class function Importar:boolean;
    constructor create;
    destructor destroy; override;
  end;
  TImportacaoExcel = class
  private
  public
    class function Produto:boolean;
  end;

implementation

{ TImportacaoExcel }

class function TImportacaoExcel.Produto: boolean;
begin
  result := TImportacaoExcelProduto.Importar;
end;

{ TImportacaoExcelProduto }

procedure TImportacaoExcelProduto.AbrirPlanilha;
begin
  AplicacaoE := TExcelApplication.Create(nil);
  Planilha   := TExcelWorksheet.Create(nil);
  LCID       := GetUserDefaultLCID;
  wkbk       := AplicacaoE.Workbooks.Open(filename, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, LCID);
  Planilha.ConnectTo(wkbk.Worksheets[1] as _Worksheet);
  Planilha.Activate; // torna a planilha da lista a planilha ativa
end;

constructor TImportacaoExcelProduto.create;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  produto := tprodutolist.create;
  inherited;
end;

destructor TImportacaoExcelProduto.destroy;
begin
  freeandnil(frmprogressbar);
  freeandnil(produto);
  AplicacaoE.Workbooks.Close(lcid);
  FreeAndNil(planilha);
  FreeAndNil(AplicacaoE);
  inherited;
end;

class function TImportacaoExcelProduto.Importar: boolean;
var
  ImportacaoProduto : timportacaoexcelproduto;
begin
  importacaoproduto := timportacaoexcelproduto.create;
  try
    if not importacaoproduto.ObterFilename then
    begin
      result := false;
      exit;
    end;
    ImportacaoProduto.AbrirPlanilha;
    result := importacaoproduto.processar;
  finally
    freeandnil(importacaoproduto);
  end;
end;

function TImportacaoExcelProduto.ObterFileName: boolean;
begin
  result := QRotinas.SelecionarNomeArquivo(filename);
end;

function TImportacaoExcelProduto.processar: boolean;
var
  i : integer;
  codigo : string;
begin
  frmprogressbar.gau.MaxValue := 100;
  frmprogressbar.Show;
  i      := 2;
  codigo := Trim(Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2);
  while codigo <> '' do
  begin
    application.Title           := codigo;
    frmprogressbar.pnl.Caption  := codigo;
    frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
    Application.ProcessMessages;
    if frmprogressbar.gau.Progress = 100 then
    begin
      frmprogressbar.gau.Progress := 0;
    end;
    produto.New;
    produto.items[produto.count-1].cdproduto  := codigo.tointeger;
    produto.items[produto.count-1].nmproduto  := Planilha.Range[_B+inttostr(i),_B+inttostr(i)].Value2;
    produto.items[produto.count-1].cdunidade  := tunidade.InserirUnidadeSeNaoExistir(Planilha.Range[_C+inttostr(i),_C+inttostr(i)].Value2);
    produto.items[produto.count-1].nuclfiscal := Planilha.Range[_D+inttostr(i),_D+inttostr(i)].Value2;
    produto.items[produto.count-1].nusticms   := Planilha.Range[_F+inttostr(i),_F+inttostr(i)].Value2;
    Inc(i);
    codigo := Trim(Planilha.Range[_A+inttostr(i),_A+inttostr(i)].Value2);
  end;
  result := produto.inserir;
end;

end.
