unit Fiscal.Livrop3;

interface

uses
  System.Actions, System.UITypes,
  forms, Buttons, ExtCtrls, sysutils, windows, dialogs, Gauges, ToolWin,
  Controls, StdCtrls, ComCtrls, Mask, Classes, ActnList, Menus,
  SqlExpr, FMTBcd, DB, DBClient, Provider, Grids,
  rotina.registro, uconstantes, rotina.tipo, rotina.strings, rotina.rotinas,
  rotina.datahora, dialogo.progressbar, dialogo.exportarexcel, Localizar.Produto,
  orm.usuario, rotina.retornasql, rotina.consiste, classe.gerar,
  classe.aplicacao, orm.empresa, classe.executasql, classe.registro, classe.query,
  classe.registrainformacao, classe.form, orm.livroproducao,
  cxPC, cxControls, dxBar, cxClasses, cxSplitter, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxLabel, cxDBLabel, cxTextEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCurrencyEdit, dxNavBarCollns, dxNavBarBase,
  dxNavBar, cxLookAndFeels, cxLookAndFeelPainters, cxPCdxBarPopupMenu,
  cxNavigator, dxCore, dxBarBuiltInMenu;

type
  TfrmlivroP3 = class(TForm)
    pnl: TPanel;
    act: TActionList;
    actNovo: TAction;
    actAbrir: TAction;
    actSalvar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actEditar: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actabrirsaida: TAction;
    actabrirEntrada: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    actGerarLivro: TAction;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    actimprimirlivro: TAction;
    actimprimirtermoabertura: TAction;
    actimprimirtermofechamento: TAction;
    actAbrirProduto: TAction;
    actimprimirlivroResumoMovimentacao: TAction;
    actfechar: TAction;
    pgc: TcxPageControl;
    tbsitlivro: TcxTabSheet;
    tbslivroproduto: TcxTabSheet;
    bmg1: TdxBarManager;
    dxbrManager1Bar: TdxBar;
    dxbrManager1Bar1: TdxBar;
    dxbrsbtmRegistro: TdxBarSubItem;
    dxbrlrgbtnNovo: TdxBarLargeButton;
    dxbrlrgbtnEditar: TdxBarLargeButton;
    dxbrlrgbtnAbrir: TdxBarLargeButton;
    dxbrlrgbtnsalvar: TdxBarLargeButton;
    dxbrlrgbtncancelar: TdxBarLargeButton;
    dxbrlrgbtnexcluir: TdxBarLargeButton;
    dxbrsprtr1: TdxBarSeparator;
    dxbrlrgbtnprimeiro: TdxBarLargeButton;
    dxbrlrgbtnanterior: TdxBarLargeButton;
    dxbrlrgbtnproximo: TdxBarLargeButton;
    dxbrlrgbtnultimo: TdxBarLargeButton;
    dxbrsprtr2: TdxBarSeparator;
    dxbrsprtr3: TdxBarSeparator;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxbrlrgbtn10: TdxBarLargeButton;
    dxbrlrgbtn11: TdxBarLargeButton;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    dts: TDataSource;
    sdsCDLIVRO: TIntegerField;
    sdsDTINICIO: TDateField;
    sdsDTTERMINO: TDateField;
    cdsCDLIVRO: TIntegerField;
    cdsDTINICIO: TDateField;
    cdsDTTERMINO: TDateField;
    sdsitlivro: TSQLDataSet;
    cdsitlivro: TClientDataSet;
    dtsitlivro: TDataSource;
    dts1: TDataSource;
    sdsitlivroCDLIVRO: TIntegerField;
    sdsitlivroCDITLIVRO: TIntegerField;
    sdsitlivroCDPRODUTO: TIntegerField;
    sdsitlivroDSESPECIE: TStringField;
    sdsitlivroDSSUBSERIE: TStringField;
    sdsitlivroNUDOCUMENTO: TIntegerField;
    sdsitlivroNULIVRO: TIntegerField;
    sdsitlivroNUFOLHA: TIntegerField;
    sdsitlivroDTSAIDA: TDateField;
    sdsitlivroNUDIA: TIntegerField;
    sdsitlivroNUMES: TIntegerField;
    sdsitlivroDSCONTABIL: TStringField;
    sdsitlivroNUFISCAL: TIntegerField;
    sdsitlivroTPENTSAI: TStringField;
    sdsitlivroQTITEMENTRADA: TFloatField;
    sdsitlivroVLBASEIPIENTRADA: TFMTBCDField;
    sdsitlivroVLIPIENTRADA: TFMTBCDField;
    sdsitlivroQTESTOQUE: TFloatField;
    sdsitlivroOBSERVACAO: TStringField;
    sdsitlivroQTITEMSAIDA: TFloatField;
    sdsitlivroVLBASEIPISAIDA: TFMTBCDField;
    sdsitlivroVLIPISAIDA: TFMTBCDField;
    sdsitlivroQTENTPROPRIO: TFloatField;
    sdsitlivroQTENTOUTRO: TFloatField;
    sdsitlivroQTSAIPROPRIO: TFloatField;
    sdsitlivroQTSAIOUTRO: TFloatField;
    cdssdsitlivro: TDataSetField;
    cdsitlivroCDLIVRO: TIntegerField;
    cdsitlivroCDITLIVRO: TIntegerField;
    cdsitlivroCDPRODUTO: TIntegerField;
    cdsitlivroDSESPECIE: TStringField;
    cdsitlivroDSSUBSERIE: TStringField;
    cdsitlivroNUDOCUMENTO: TIntegerField;
    cdsitlivroNULIVRO: TIntegerField;
    cdsitlivroNUFOLHA: TIntegerField;
    cdsitlivroDTSAIDA: TDateField;
    cdsitlivroNUDIA: TIntegerField;
    cdsitlivroNUMES: TIntegerField;
    cdsitlivroDSCONTABIL: TStringField;
    cdsitlivroNUFISCAL: TIntegerField;
    cdsitlivroTPENTSAI: TStringField;
    cdsitlivroQTITEMENTRADA: TFloatField;
    cdsitlivroVLBASEIPIENTRADA: TFMTBCDField;
    cdsitlivroVLIPIENTRADA: TFMTBCDField;
    cdsitlivroQTESTOQUE: TFloatField;
    cdsitlivroOBSERVACAO: TStringField;
    cdsitlivroQTITEMSAIDA: TFloatField;
    cdsitlivroVLBASEIPISAIDA: TFMTBCDField;
    cdsitlivroVLIPISAIDA: TFMTBCDField;
    cdsitlivroQTENTPROPRIO: TFloatField;
    cdsitlivroQTENTOUTRO: TFloatField;
    cdsitlivroQTSAIPROPRIO: TFloatField;
    cdsitlivroQTSAIOUTRO: TFloatField;
    grditlivroDBTableView1: TcxGridDBTableView;
    lvlitlivro: TcxGridLevel;
    grditlivro: TcxGrid;
    grditlivroDBTableView1CDPRODUTO: TcxGridDBColumn;
    grditlivroDBTableView1DSESPECIE: TcxGridDBColumn;
    grditlivroDBTableView1DSSUBSERIE: TcxGridDBColumn;
    grditlivroDBTableView1NUDOCUMENTO: TcxGridDBColumn;
    grditlivroDBTableView1NULIVRO: TcxGridDBColumn;
    grditlivroDBTableView1NUFOLHA: TcxGridDBColumn;
    grditlivroDBTableView1DTSAIDA: TcxGridDBColumn;
    grditlivroDBTableView1NUDIA: TcxGridDBColumn;
    grditlivroDBTableView1NUMES: TcxGridDBColumn;
    grditlivroDBTableView1DSCONTABIL: TcxGridDBColumn;
    grditlivroDBTableView1NUFISCAL: TcxGridDBColumn;
    grditlivroDBTableView1TPENTSAI: TcxGridDBColumn;
    grditlivroDBTableView1QTITEMENTRADA: TcxGridDBColumn;
    grditlivroDBTableView1VLBASEIPIENTRADA: TcxGridDBColumn;
    grditlivroDBTableView1VLIPIENTRADA: TcxGridDBColumn;
    grditlivroDBTableView1QTESTOQUE: TcxGridDBColumn;
    grditlivroDBTableView1OBSERVACAO: TcxGridDBColumn;
    grditlivroDBTableView1QTITEMSAIDA: TcxGridDBColumn;
    grditlivroDBTableView1VLBASEIPISAIDA: TcxGridDBColumn;
    grditlivroDBTableView1VLIPISAIDA: TcxGridDBColumn;
    grditlivroDBTableView1QTENTPROPRIO: TcxGridDBColumn;
    grditlivroDBTableView1QTENTOUTRO: TcxGridDBColumn;
    grditlivroDBTableView1QTSAIPROPRIO: TcxGridDBColumn;
    grditlivroDBTableView1QTSAIOUTRO: TcxGridDBColumn;
    lblinicio: TcxDBLabel;
    lbldttermino: TcxDBLabel;
    edtCodigo: TcxTextEdit;
    sdsitlivroNMPRODUTO: TStringField;
    cdsitlivroNMPRODUTO: TStringField;
    grditlivroDBTableView1NMPRODUTO: TcxGridDBColumn;
    tbvitlivro: TcxGridDBBandedTableView;
    tbvitlivroCDPRODUTO: TcxGridDBBandedColumn;
    tbvitlivroDSESPECIE: TcxGridDBBandedColumn;
    tbvitlivroDSSUBSERIE: TcxGridDBBandedColumn;
    tbvitlivroNUDOCUMENTO: TcxGridDBBandedColumn;
    tbvitlivroNULIVRO: TcxGridDBBandedColumn;
    tbvitlivroNUFOLHA: TcxGridDBBandedColumn;
    tbvitlivroDTSAIDA: TcxGridDBBandedColumn;
    tbvitlivroNUDIA: TcxGridDBBandedColumn;
    tbvitlivroNUMES: TcxGridDBBandedColumn;
    tbvitlivroDSCONTABIL: TcxGridDBBandedColumn;
    tbvitlivroNUFISCAL: TcxGridDBBandedColumn;
    tbvitlivroTPENTSAI: TcxGridDBBandedColumn;
    tbvitlivroQTITEMENTRADA: TcxGridDBBandedColumn;
    tbvitlivroVLBASEIPIENTRADA: TcxGridDBBandedColumn;
    tbvitlivroVLIPIENTRADA: TcxGridDBBandedColumn;
    tbvitlivroQTESTOQUE: TcxGridDBBandedColumn;
    tbvitlivroOBSERVACAO: TcxGridDBBandedColumn;
    tbvitlivroQTITEMSAIDA: TcxGridDBBandedColumn;
    tbvitlivroVLBASEIPISAIDA: TcxGridDBBandedColumn;
    tbvitlivroVLIPISAIDA: TcxGridDBBandedColumn;
    tbvitlivroQTENTPROPRIO: TcxGridDBBandedColumn;
    tbvitlivroQTENTOUTRO: TcxGridDBBandedColumn;
    tbvitlivroQTSAIPROPRIO: TcxGridDBBandedColumn;
    tbvitlivroQTSAIOUTRO: TcxGridDBBandedColumn;
    tbvitlivroNMPRODUTO: TcxGridDBBandedColumn;
    sdslivroproduto: TSQLDataSet;
    cdslivroproduto: TClientDataSet;
    dtslivroproduto: TDataSource;
    lvllivroproduto: TcxGridLevel;
    grdlivroproduto: TcxGrid;
    sdslivroprodutoCDLIVRO: TIntegerField;
    sdslivroprodutoCDPRODUTO: TIntegerField;
    sdslivroprodutoNMPRODUTO: TStringField;
    sdslivroprodutoQTESTOQUE: TFloatField;
    sdslivroprodutoQTITEMENTRADA: TFloatField;
    sdslivroprodutoVLBASEIPIENTRADA: TFMTBCDField;
    sdslivroprodutoVLIPIENTRADA: TFMTBCDField;
    sdslivroprodutoQTITEMSAIDA: TFloatField;
    sdslivroprodutoVLBASEIPISAIDA: TFMTBCDField;
    sdslivroprodutoVLIPISAIDA: TFMTBCDField;
    sdslivroprodutoQTENTPROPRIO: TFloatField;
    sdslivroprodutoQTENTOUTRO: TFloatField;
    sdslivroprodutoQTSAIPROPRIO: TFloatField;
    sdslivroprodutoQTSAIOUTRO: TFloatField;
    cdslivroprodutoCDLIVRO: TIntegerField;
    cdslivroprodutoCDPRODUTO: TIntegerField;
    cdslivroprodutoNMPRODUTO: TStringField;
    cdslivroprodutoQTESTOQUE: TFloatField;
    cdslivroprodutoQTITEMENTRADA: TFloatField;
    cdslivroprodutoVLBASEIPIENTRADA: TFMTBCDField;
    cdslivroprodutoVLIPIENTRADA: TFMTBCDField;
    cdslivroprodutoQTITEMSAIDA: TFloatField;
    cdslivroprodutoVLBASEIPISAIDA: TFMTBCDField;
    cdslivroprodutoVLIPISAIDA: TFMTBCDField;
    cdslivroprodutoQTENTPROPRIO: TFloatField;
    cdslivroprodutoQTENTOUTRO: TFloatField;
    cdslivroprodutoQTSAIPROPRIO: TFloatField;
    cdslivroprodutoQTSAIOUTRO: TFloatField;
    tbvlivroproduto: TcxGridDBBandedTableView;
    tbvlivroprodutoCDPRODUTO: TcxGridDBBandedColumn;
    tbvlivroprodutoNMPRODUTO: TcxGridDBBandedColumn;
    tbvlivroprodutoQTESTOQUE: TcxGridDBBandedColumn;
    tbvlivroprodutoQTITEMENTRADA: TcxGridDBBandedColumn;
    tbvlivroprodutoVLBASEIPIENTRADA: TcxGridDBBandedColumn;
    tbvlivroprodutoVLIPIENTRADA: TcxGridDBBandedColumn;
    tbvlivroprodutoQTITEMSAIDA: TcxGridDBBandedColumn;
    tbvlivroprodutoVLBASEIPISAIDA: TcxGridDBBandedColumn;
    tbvlivroprodutoVLIPISAIDA: TcxGridDBBandedColumn;
    tbvlivroprodutoQTENTPROPRIO: TcxGridDBBandedColumn;
    tbvlivroprodutoQTENTOUTRO: TcxGridDBBandedColumn;
    tbvlivroprodutoQTSAIPROPRIO: TcxGridDBBandedColumn;
    tbvlivroprodutoQTSAIOUTRO: TcxGridDBBandedColumn;
    actGerarEstoqueDiario: TAction;
    actimprimirlivroResumoMovimentacaoMP: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsitlivroCDITSAIDA: TIntegerField;
    sdsitlivroCDUSUARIOI: TIntegerField;
    sdsitlivroCDUSUARIOA: TIntegerField;
    sdsitlivroCDCOMPUTADORI: TIntegerField;
    sdsitlivroCDCOMPUTADORA: TIntegerField;
    sdsitlivroQTESTOQUEA: TFloatField;
    sdsitlivroTSINCLUSAO: TSQLTimeStampField;
    sdsitlivroTSALTERACAO: TSQLTimeStampField;
    sdsitlivroCDITENTRADA: TIntegerField;
    sdsitlivroCDITMOVTO: TIntegerField;
    cdsitlivroCDITSAIDA: TIntegerField;
    cdsitlivroCDUSUARIOI: TIntegerField;
    cdsitlivroCDUSUARIOA: TIntegerField;
    cdsitlivroCDCOMPUTADORI: TIntegerField;
    cdsitlivroCDCOMPUTADORA: TIntegerField;
    cdsitlivroQTESTOQUEA: TFloatField;
    cdsitlivroTSINCLUSAO: TSQLTimeStampField;
    cdsitlivroTSALTERACAO: TSQLTimeStampField;
    cdsitlivroCDITENTRADA: TIntegerField;
    cdsitlivroCDITMOVTO: TIntegerField;
    dxBarLargeButton4: TdxBarLargeButton;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    sdsCDEMPRESA: TLargeintField;
    cdsCDEMPRESA: TLargeintField;
    sdsitlivroCDREINSPECAO: TIntegerField;
    sdsitlivroCDEMPRESA: TLargeintField;
    cdsitlivroCDREINSPECAO: TIntegerField;
    cdsitlivroCDEMPRESA: TLargeintField;
    sdslivroprodutoCDEMPRESA: TLargeintField;
    cdslivroprodutoCDEMPRESA: TLargeintField;
    btnimprimir: TdxBarLargeButton;
    pumimprimir: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    pumopcoes: TdxBarPopupMenu;
    btnopcoes: TdxBarLargeButton;
    actopcoes: TAction;
    dxBarButton9: TdxBarButton;
    dsplivroproduto: TDataSetProvider;
    procedure actAbrirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actabrirsaidaExecute(Sender: TObject);
    procedure actabrirEntradaExecute(Sender: TObject);
    procedure actimprimirtermofechamentoExecute(Sender: TObject);
    procedure actimprimirlivroExecute(Sender: TObject);
    procedure actimprimirtermoaberturaExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actAbrirProdutoExecute(Sender: TObject);
    procedure actGerarLivroExecute(Sender: TObject);
    procedure actimprimirlivroResumoMovimentacaoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actfecharExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure nviprodutoClick(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure actGerarEstoqueDiarioExecute(Sender: TObject);
    procedure actimprimirlivroResumoMovimentacaoMPExecute(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure actopcoesExecute(Sender: TObject);
  private      { Private declarations }
    livroproducao : TLivroProducao;
    procedure set_livroproduto;
  public  { Public declarations }
    registro : tregistro;
    function  Abrir(codigo:Integer):boolean;
  end;

var
  frmlivroP3: TfrmlivroP3;

implementation

uses uDtmMain, uMain;

{$R *.DFM}

const
  tbl      = 'livro';
  exibe    = 'Livro de Produção';
  artigoI  = 'o';

function TfrmlivroP3.Abrir(codigo:integer):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure TfrmlivroP3.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

procedure TfrmlivroP3.actNovoExecute(Sender: TObject);
begin
  abrir(livroproducao.Novo);
end;

procedure TfrmlivroP3.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure TfrmlivroP3.actSalvarExecute(Sender: TObject);
var
  key : char;
begin
  if registro.salvar then
  begin
    key := #13;
    nextcontrol(Self.ActiveControl, key);
    actGerarLivroExecute(Self);
  end;
end;

procedure TfrmlivroP3.actExcluirExecute(Sender: TObject);
begin
  if RetornaSQLData('select max(dttermino) from livro where cdempresa='+empresa.cdempresa.tostring) = cdsdttermino.AsDateTime then
  begin
    registro.excluir;
    pnl.caption := exibe;
  end
  else
  begin
    messagedlg('Este Livro não pode ser excluido!'#13'Existe outro livro com data posterior a este.',mtInformation,[mbok],0);
  end;
end;

procedure TfrmlivroP3.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmlivroP3.actCancelarExecute(Sender: TObject);
begin
  registro.cancelar;
end;

procedure TfrmlivroP3.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure TfrmlivroP3.edtCodigoEnter(Sender: TObject);
begin

  tedit(sender).selectall;
end;

procedure TfrmlivroP3.FormShow(Sender: TObject);
begin
  registro.set_readonly_dados(self, true);
  livroproducao := tlivroproducao.create;
  pnl.caption := exibe;
  edtCodigo.SetFocus;
end;

procedure TfrmlivroP3.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure TfrmlivroP3.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure TfrmlivroP3.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure TfrmlivroP3.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure TfrmlivroP3.nextcontrol(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    key := #0;
  end;
end;

procedure TfrmlivroP3.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure TfrmlivroP3.actabrirsaidaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsitlivro);
end;

procedure TfrmlivroP3.actabrirEntradaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsitlivro);
end;

procedure TfrmlivroP3.actimprimirtermofechamentoExecute(Sender: TObject);
begin
  livroproducao.imprimirTermoEncerramento;
end;

procedure TfrmlivroP3.actimprimirlivroExecute(Sender: TObject);
begin
  livroproducao.imprimir;
end;

procedure TfrmlivroP3.actimprimirtermoaberturaExecute(Sender: TObject);
begin
  livroproducao.imprimirtermoabertura;
end;

procedure TfrmlivroP3.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure TfrmlivroP3.actAbrirProdutoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsitlivro);
end;

procedure TfrmlivroP3.actGerarLivroExecute(Sender: TObject);
begin
//
end;

procedure TfrmlivroP3.actimprimirlivroResumoMovimentacaoExecute(Sender: TObject);
begin
  livroproducao.ImprimirResumoMovimentacao;
end;

procedure TfrmlivroP3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmlivroP3.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmlivroP3.FormDestroy(Sender: TObject);
begin
  registro.Destroy;
  livroproducao.Destroy;
end;

procedure TfrmlivroP3.actEditarExecute(Sender: TObject);
begin
  registro.editar;
end;

procedure TfrmlivroP3.cdsBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cds);
end;

procedure TfrmlivroP3.nviprodutoClick(Sender: TObject);
begin
  tbsitlivro.TabVisible      := false;
  tbslivroproduto.TabVisible := true;
  pgc.ActivePage := tbslivroproduto;
end;

procedure TfrmlivroP3.cdsAfterScroll(DataSet: TDataSet);
begin
  livroproducao.cdlivro := cdscdlivro.AsInteger;
  livroproducao.dti     := cdsdtinicio.asdatetime;
  livroproducao.dtf     := cdsdttermino.asdatetime;
end;

procedure TfrmlivroP3.actGerarEstoqueDiarioExecute(Sender: TObject);
var
  c : TClasseQuery;
  cdlivro, cdproduto : string;
  dtsaida : TDate;
  qtestoque : Currency;
  sql : TStrings;
  procedure inserir_registro;
  begin
    sql.Add('insert into itlivroestoque(cdempresa,cdlivro,cdproduto,dtsaida,qtestoque)values('+empresa.cdempresa.tostring+','+cdlivro+','+cdproduto+','+getdtbanco(dtsaida)+','+getcurrencys(qtestoque)+');');
  end;
begin
  frmprogressbar := Tfrmprogressbar.Create(nil);
  cdlivro := cdscdlivro.AsString;
  sql := TStringList.Create;
  c := TClasseQuery.Create('select cdempresa,cdproduto,dtsaida,cditlivro,qtestoque from itlivro where cdempresa='+empresa.cdempresa.tostring+' and cdlivro='+cdlivro+' order by cdproduto,dtsaida,cditlivro');
  try
    sql.Add('delete from itlivroestoque where cdempresa='+empresa.cdempresa.tostring+' and cdlivro='+cdlivro+';');
    cdproduto := c.q.fieldbyname(_cdproduto).AsString;
    dtsaida   := c.q.fieldbyname(_dtsaida).AsDateTime;
    frmprogressbar.gau.MaxValue := c.q.RecordCount;
    frmprogressbar.Show;
    while not c.q.Eof do
    begin
      frmprogressbar.gau.Progress := c.q.RecNo;
      Application.ProcessMessages;
      if cdproduto <> c.q.Fieldbyname(_cdproduto).Asstring then
      begin
        inserir_registro;
        cdproduto := c.q.fieldbyname(_cdproduto).AsString;
        dtsaida   := c.q.fieldbyname(_dtsaida).AsDateTime;
      end;
      if dtsaida <> c.q.Fieldbyname(_dtsaida).AsDateTime then
      begin
        inserir_registro;
        dtsaida   := c.q.fieldbyname(_dtsaida).AsDateTime;
      end;
      qtestoque := c.q.fieldbyname(_qtestoque).AsCurrency;
      c.q.Next;
    end;
    inserir_registro;
    ExecutaScript(sql);
    MessageDlg('Concluído!', mtInformation, [mbOK], 0);
  finally
    freeandnil(c);
    FreeAndNil(sql);
    FreeAndNil(frmprogressbar);
  end;
end;

procedure TfrmlivroP3.actimprimirlivroResumoMovimentacaoMPExecute(Sender: TObject);
begin
  livroproducao.ImprimirResumoMovimentacaoMP;
end;

procedure TfrmlivroP3.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmlivroP3.pgcChange(Sender: TObject);
begin
  if pgc.ActivePage = tbslivroproduto then
  begin
    set_livroproduto;
  end;
end;

procedure TfrmlivroP3.set_livroproduto;
begin
  if cdscdlivro.AsString <> cdslivroprodutocdlivro.AsString then
  begin
    cdslivroproduto.Close;
    if cdscdlivro.AsString <> '' then
    begin
      sdslivroproduto.Parambyname(_cdlivro).AsString := cdscdlivro.AsString;
      sdslivroproduto.Parambyname(_cdempresa).AsString := cdscdempresa.AsString;
      cdslivroproduto.Open;
    end;
  end;
end;

procedure TfrmlivroP3.FormCreate(Sender: TObject);
begin
  registro := tregistro.create(self, tbl, exibe, artigoI, cds, dts, edtcodigo);
end;

end.
