unit Financeiro.Parcelamento;

interface

uses
  System.Actions, System.UITypes, Winapi.Messages, System.DateUtils,
  forms, Windows, Classes, StdCtrls, Controls, ExtCtrls, Buttons, dialogs, sysutils,
  ActnList, ComCtrls, ToolWin, Mask, Menus,
  FMTBcd, DB, DBCtrls, DBGrids, DBClient, Provider, Grids, sqlexpr,
  rotina.rotinas, rotina.registroib, rotina.registro, uconstantes, ulocalizar, rotina.strings,
  rotina.numero, dialogo.ExportarExcel, localizar.produto, rotina.datahora,
  orm.cntcusto, orm.usuario, rotina.consiste, classe.executasql, classe.gerar,
  orm.empresa, classe.registrainformacao, classe.form, orm.autpagto,
  rotina.retornasql, classe.registro, orm.plconta, orm.parcelamento, ORM.Movbancario,
  dxBar, cxClasses, cxControls, cxContainer, cxEdit, cxTextEdit, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxDBEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxButtonEdit, cxLabel, cxDBLabel, cxSplitter, cxLookAndFeels,
  cxLookAndFeelPainters, cxCalc, cxPCdxBarPopupMenu, cxPC,
  cxNavigator, cxMemo, dxBarBuiltInMenu, cxSpinEdit, cxButtons;

type
  Tfrmparcelamento = class(TForm)
    pnl: TPanel;
    act: TActionList;
    actNovo: TAction;
    actAbrir: TAction;
    actEditar: TAction;
    actSalvar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actprocessar: TAction;
    actabrirautpagto: TAction;
    actabrirautpagtosaida: TAction;
    actfechar: TAction;
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
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
    btnimprimir: TdxBarLargeButton;
    dxbrsprtr3: TdxBarSeparator;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    dts: TDataSource;
    edtcodigo: TcxTextEdit;
    edtdtemissao: TcxDBDateEdit;
    dts1: TDataSource;
    cdssaida: TClientDataSet;
    dtssaida: TDataSource;
    sdssaida: TSQLDataSet;
    sdsCDPARCELAMENTO: TIntegerField;
    sdsDTEMISSAO: TDateField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsVLDESCONTO: TFMTBCDField;
    sdsVLJUROS: TFMTBCDField;
    sdsVLACRESCIMO: TFMTBCDField;
    cdsCDPARCELAMENTO: TIntegerField;
    cdsDTEMISSAO: TDateField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdsVLENTRADA: TFMTBCDField;
    cdsVLSAIDA: TFMTBCDField;
    cdsVLDESCONTO: TFMTBCDField;
    cdsVLJUROS: TFMTBCDField;
    cdsVLACRESCIMO: TFMTBCDField;
    sdssaidaCDPARCELAMENTOSAIDA: TIntegerField;
    sdssaidaCDAUTPAGTO: TIntegerField;
    sdssaidaCDUSUARIOI: TIntegerField;
    sdssaidaCDUSUARIOA: TIntegerField;
    sdssaidaCDCOMPUTADORI: TIntegerField;
    sdssaidaCDCOMPUTADORA: TIntegerField;
    sdssaidaCDPARCELAMENTO: TIntegerField;
    sdssaidaVLAUTPAGTO: TFMTBCDField;
    sdssaidaTSINCLUSAO: TSQLTimeStampField;
    sdssaidaTSALTERACAO: TSQLTimeStampField;
    sdssaidaNUAUTPAGTO: TStringField;
    cdssdssaida: TDataSetField;
    cdssaidaCDPARCELAMENTOSAIDA: TIntegerField;
    cdssaidaCDAUTPAGTO: TIntegerField;
    cdssaidaCDUSUARIOI: TIntegerField;
    cdssaidaCDUSUARIOA: TIntegerField;
    cdssaidaCDCOMPUTADORI: TIntegerField;
    cdssaidaCDCOMPUTADORA: TIntegerField;
    cdssaidaCDPARCELAMENTO: TIntegerField;
    cdssaidaVLAUTPAGTO: TFMTBCDField;
    cdssaidaTSINCLUSAO: TSQLTimeStampField;
    cdssaidaTSALTERACAO: TSQLTimeStampField;
    cdssaidaNUAUTPAGTO: TStringField;
    lblcdfornecedor: TLabel;
    edtCDFORNECEDOR: TcxDBButtonEdit;
    sdsCDSTPARCELAMENTO: TIntegerField;
    cdsCDSTPARCELAMENTO: TIntegerField;
    sdssaidaDTVENCIMENTO: TDateField;
    cdssaidaDTVENCIMENTO: TDateField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    actdesfazer: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    sdssaidaCDSTAUTPAGTO: TIntegerField;
    cdssaidaCDSTAUTPAGTO: TIntegerField;
    sdsVLENTRADA: TFMTBCDField;
    sdsVLSAIDA: TFMTBCDField;
    sdssaidaCDTPCOBRANCA: TIntegerField;
    cdssaidaCDTPCOBRANCA: TIntegerField;
    pum: TdxBarPopupMenu;
    sdsentrada: TSQLDataSet;
    sdsentradaCDPARCELAMENTOENTRADA: TIntegerField;
    sdsentradaCDAUTPAGTO: TIntegerField;
    sdsentradaCDUSUARIOI: TIntegerField;
    sdsentradaCDUSUARIOA: TIntegerField;
    sdsentradaCDCOMPUTADORI: TIntegerField;
    sdsentradaCDCOMPUTADORA: TIntegerField;
    sdsentradaCDPARCELAMENTO: TIntegerField;
    sdsentradaVLAUTPAGTO: TFMTBCDField;
    sdsentradaVLJUROS: TFMTBCDField;
    sdsentradaTSINCLUSAO: TSQLTimeStampField;
    sdsentradaTSALTERACAO: TSQLTimeStampField;
    sdsentradaNUAUTPAGTO: TStringField;
    sdsentradaVLTOTAL: TFMTBCDField;
    sdsentradaDTEMISSAO: TDateField;
    sdsentradaDTPRORROGACAO: TDateField;
    cdsentrada: TClientDataSet;
    cdssdsentrada: TDataSetField;
    cdsentradaCDPARCELAMENTOENTRADA: TIntegerField;
    cdsentradaCDAUTPAGTO: TIntegerField;
    cdsentradaCDUSUARIOI: TIntegerField;
    cdsentradaCDUSUARIOA: TIntegerField;
    cdsentradaCDCOMPUTADORI: TIntegerField;
    cdsentradaCDCOMPUTADORA: TIntegerField;
    cdsentradaCDPARCELAMENTO: TIntegerField;
    cdsentradaVLAUTPAGTO: TFMTBCDField;
    cdsentradaVLJUROS: TFMTBCDField;
    cdsentradaTSINCLUSAO: TSQLTimeStampField;
    cdsentradaTSALTERACAO: TSQLTimeStampField;
    cdsentradaNUAUTPAGTO: TStringField;
    cdsentradaVLTOTAL: TFMTBCDField;
    cdsentradaDTEMISSAO: TDateField;
    cdsentradaDTPRORROGACAO: TDateField;
    dtsentrada: TDataSource;
    sdsDSOBSERVACAO: TBlobField;
    cdsDSOBSERVACAO: TBlobField;
    pgc: TcxPageControl;
    tbstitulo: TcxTabSheet;
    tbsobservacao: TcxTabSheet;
    Panel2: TPanel;
    grdsaida: TcxGrid;
    tbvsaida: TcxGridDBTableView;
    tbvsaidaNUAUTPAGTO: TcxGridDBColumn;
    tbvsaidaVLAUTPAGTO: TcxGridDBColumn;
    tbvsaidaDTVENCIMENTO: TcxGridDBColumn;
    tbvsaidaCDSTAUTPAGTO: TcxGridDBColumn;
    tbvsaidaCDTPCOBRANCA: TcxGridDBColumn;
    tbvsaidaCDAUTPAGTO: TcxGridDBColumn;
    lvlsaida: TcxGridLevel;
    cxLabel2: TcxLabel;
    Panel4: TPanel;
    pnl2: TPanel;
    lbldesconto: TLabel;
    Label3: TLabel;
    edtvldesconto: TcxDBCalcEdit;
    edtvlacrescimo: TcxDBCalcEdit;
    grdentrada: TcxGrid;
    tbventrada: TcxGridDBTableView;
    tbventradaNUAUTPAGTO: TcxGridDBColumn;
    tbventradaVLAUTPAGTO: TcxGridDBColumn;
    tbventradaDTEMISSAO: TcxGridDBColumn;
    tbventradaDTPRORROGACAO: TcxGridDBColumn;
    tbventradaVLJUROS: TcxGridDBColumn;
    tbventradaVLTOTAL: TcxGridDBColumn;
    lvlentrada: TcxGridLevel;
    splcalculo: TcxSplitter;
    memdsobservacao: TcxDBMemo;
    actabrirfornecedor: TAction;
    txtNMFORNECEDOR: TDBText;
    sdsNMFORNECEDOR: TStringField;
    cdsNMFORNECEDOR: TStringField;
    sdsCDEMPRESA: TLargeintField;
    sdsCDFORNECEDOR: TLargeintField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDFORNECEDOR: TLargeintField;
    sdsentradaCDEMPRESA: TLargeintField;
    cdsentradaCDEMPRESA: TLargeintField;
    sdssaidaCDEMPRESA: TLargeintField;
    cdssaidaCDEMPRESA: TLargeintField;
    txtmmfornecedor2: TDBText;
    edtcdfornecedor2: TcxDBButtonEdit;
    lblcdfornecedor2: TLabel;
    sdsCDFORNECEDOR2: TLargeintField;
    sdsNMFORNECEDOR2: TStringField;
    cdsCDFORNECEDOR2: TLargeintField;
    cdsNMFORNECEDOR2: TStringField;
    sdssaidaCDCNTCUSTO: TIntegerField;
    sdssaidaNUCNTCUSTO: TStringField;
    sdssaidaNMCNTCUSTO: TStringField;
    sdssaidaCDPLCONTA: TIntegerField;
    sdssaidaNUPLCONTA: TStringField;
    sdssaidaNMPLCONTA: TStringField;
    cdssaidaCDCNTCUSTO: TIntegerField;
    cdssaidaNUCNTCUSTO: TStringField;
    cdssaidaNMCNTCUSTO: TStringField;
    cdssaidaCDPLCONTA: TIntegerField;
    cdssaidaNUPLCONTA: TStringField;
    cdssaidaNMPLCONTA: TStringField;
    tbvsaidaNUCNTCUSTO: TcxGridDBColumn;
    tbvsaidaNMCNTCUSTO: TcxGridDBColumn;
    tbvsaidaNUPLCONTA: TcxGridDBColumn;
    tbvsaidaNMPLCONTA: TcxGridDBColumn;
    lblnuplconta: TLabel;
    edtnuplconta: TcxDBButtonEdit;
    txtnmplconta: TcxDBLabel;
    sdsCDCNTCUSTO: TIntegerField;
    sdsNUCNTCUSTO: TStringField;
    sdsNMCNTCUSTO: TStringField;
    sdsCDPLCONTA: TIntegerField;
    sdsNUPLCONTA: TStringField;
    sdsNMPLCONTA: TStringField;
    sdsCDTPCOBRANCA: TIntegerField;
    cdsCDCNTCUSTO: TIntegerField;
    cdsNUCNTCUSTO: TStringField;
    cdsNMCNTCUSTO: TStringField;
    cdsCDPLCONTA: TIntegerField;
    cdsNUPLCONTA: TStringField;
    cdsNMPLCONTA: TStringField;
    cdsCDTPCOBRANCA: TIntegerField;
    sdsNUPARCELA: TIntegerField;
    cdsNUPARCELA: TIntegerField;
    sdsNUDIAVENCIMENTO: TIntegerField;
    cdsNUDIAVENCIMENTO: TIntegerField;
    lblnucntcusto: TLabel;
    edtnucntcusto: TcxDBButtonEdit;
    txtnmcntcusto: TcxDBLabel;
    Label5: TLabel;
    edtnuparcela: TcxDBSpinEdit;
    Label7: TLabel;
    edtnudiavencimento: TcxDBSpinEdit;
    Label11: TLabel;
    cbxcdtpcobranca: TcxDBLookupComboBox;
    btngerar: TcxButton;
    actgerar: TAction;
    sdsVLTOTAL: TFMTBCDField;
    cdsVLTOTAL: TFMTBCDField;
    Label4: TLabel;
    txtVLTOTAL: TcxDBLabel;
    procedure actNovoExecute(Sender: TObject);
    procedure actAbrirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actfecharExecute(Sender: TObject);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure dtsStateChange(Sender: TObject);
    procedure cdssaidaBeforePost(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdssaidaNewRecord(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure edtCDFORNECEDORKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCDFORNECEDORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtCDFORNECEDORPropertiesEditValueChanged(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actabrirautpagtoExecute(Sender: TObject);
    procedure actabrirautpagtosaidaExecute(Sender: TObject);
    procedure tbvsaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actprocessarExecute(Sender: TObject);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure actdesfazerExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actImprimirExecute(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsentradaBeforePost(DataSet: TDataSet);
    procedure cdsentradaNewRecord(DataSet: TDataSet);
    procedure tbventradaNUAUTPAGTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbventradaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure tbventradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure actabrirfornecedorExecute(Sender: TObject);
    procedure lblcdfornecedorDblClick(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure edtcdfornecedor2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedor2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtcdfornecedor2PropertiesEditValueChanged(Sender: TObject);
    procedure tbvsaidaNUPLCONTAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbvsaidaNUCNTCUSTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actgerarExecute(Sender: TObject);
    procedure edtnuplcontaPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtnuplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsNUCNTCUSTOValidate(Sender: TField);
    procedure cdsNUPLCONTAValidate(Sender: TField);
    procedure cdsCDFORNECEDOR2Validate(Sender: TField);
    procedure cdsCDFORNECEDORValidate(Sender: TField);
    procedure cdsentradaCDAUTPAGTOValidate(Sender: TField);
    procedure cdsentradaNUAUTPAGTOValidate(Sender: TField);
    procedure cdssaidaNUPLCONTAValidate(Sender: TField);
    procedure cdssaidaNUCNTCUSTOValidate(Sender: TField);
  private
    parcelamento : Tparcelamento;
    procedure GravarTotais;
    procedure DesativarOnValidate;
    procedure AtivarOnValidate;
    function parcelamento_saida_em_aberto:boolean;
    procedure ConfigurarActDesfazer;
    procedure ConfigurarActProcessar;
    procedure VerificarCdAutpagtoRepetido(cdautpagto:string);
    procedure ConfigurarDataset;
    procedure AbrirTabelas;
    procedure ConfigurarEmpresa;
    procedure LimparAutpagtoEntrada;
  public
    registro : tregistro;
    function Abrir(codigo:integer):boolean;
  end;

var
  frmparcelamento: Tfrmparcelamento;

implementation

uses uDtmMain, uMain, Localizar.Autpagto;

{$R *.dfm}

const
  tbl      = 'parcelamento';
  exibe    = 'Parcelamento';
  artigoI  = 'o';

procedure Tfrmparcelamento.actNovoExecute(Sender: TObject);
begin
  registro.novo(sender);
end;

function Tfrmparcelamento.Abrir(codigo:integer):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure Tfrmparcelamento.ConfigurarEmpresa;
begin
  edtnucntcusto.visible := empresa.financeiro.bocntcusto;
  txtnmcntcusto.visible := empresa.financeiro.bocntcusto;
  lblnucntcusto.visible := empresa.financeiro.bocntcusto;
  edtnuplconta.visible  := empresa.financeiro.boplconta;
  txtnmplconta.visible  := empresa.financeiro.boplconta;
  lblnuplconta.visible  := empresa.financeiro.boplconta;
end;

procedure Tfrmparcelamento.DesativarOnValidate;
begin
  cdsNUCNTCUSTO.OnValidate        := nil;
  cdsNUPLCONTA.OnValidate         := nil;
  cdsCDFORNECEDOR2.OnValidate     := nil;
  cdsCDFORNECEDOR.OnValidate      := nil;
  cdsentradaCDAUTPAGTO.OnValidate := nil;
  cdsentradaNUAUTPAGTO.OnValidate := nil;
  cdssaidaNUPLCONTA.OnValidate    := nil;
  cdssaidaNUCNTCUSTO.OnValidate   := nil;
end;

procedure Tfrmparcelamento.AbrirTabelas;
begin
  cbxcdtpcobranca.Properties.ListSource                                   := abrir_tabela(_tpcobranca);
  TcxLookupComboBoxProperties(tbvsaidaCDSTAUTPAGTO.Properties).ListSource := abrir_tabela(_stautpagto);
  TcxLookupComboBoxProperties(tbvsaidaCDTPCOBRANCA.Properties).ListSource := abrir_tabela(_tpcobranca);
end;

procedure Tfrmparcelamento.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

procedure Tfrmparcelamento.actEditarExecute(Sender: TObject);
begin
  registro.editar;
end;

procedure Tfrmparcelamento.actSalvarExecute(Sender: TObject);
begin
  registro.Verificar_Bloqueio_chave;
  Self.Perform(WM_NEXTDLGCTL,0,0);
  gravarTotais;
  registro.Salvar;
end;

procedure Tfrmparcelamento.actExcluirExecute(Sender: TObject);
begin
  registro.excluir;
end;

procedure Tfrmparcelamento.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure Tfrmparcelamento.actCancelarExecute(Sender: TObject);
begin
  registro.cancelar;
end;

procedure Tfrmparcelamento.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure Tfrmparcelamento.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure Tfrmparcelamento.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure Tfrmparcelamento.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure Tfrmparcelamento.AtivarOnValidate;
begin
  cdsNUCNTCUSTO.OnValidate        := cdsNUCNTCUSTOValidate;
  cdsNUPLCONTA.OnValidate         := cdsNUPLCONTAValidate;
  cdsCDFORNECEDOR2.OnValidate     := cdsCDFORNECEDOR2Validate;
  cdsCDFORNECEDOR.OnValidate      := cdsCDFORNECEDORValidate;
  cdsentradaCDAUTPAGTO.OnValidate := cdsentradaCDAUTPAGTOValidate;
  cdsentradaNUAUTPAGTO.OnValidate := cdsentradaNUAUTPAGTOValidate;
  cdssaidaNUPLCONTA.OnValidate    := cdssaidaNUPLCONTAValidate;
  cdssaidaNUCNTCUSTO.OnValidate   := cdssaidaNUCNTCUSTOValidate;
end;

procedure Tfrmparcelamento.edtCodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure Tfrmparcelamento.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure Tfrmparcelamento.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure Tfrmparcelamento.edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtnucntcustoPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure Tfrmparcelamento.edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  TCntcusto.edtnucntcustoPropertiesButtonClick(cds);
end;

procedure Tfrmparcelamento.edtnuplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtnuplcontaPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure Tfrmparcelamento.edtnuplcontaPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tplconta.edtnuplcontaPropertiesButtonClick(cds);
end;

procedure Tfrmparcelamento.FormShow(Sender: TObject);
begin
  registro.set_readonly_dados(self, true);
  parcelamento := Tparcelamento.create;
  pnl.caption := exibe;
  edtCodigo.SetFocus;
end;

procedure Tfrmparcelamento.GravarTotais;
begin
  DesativarOnValidate;
  try
    parcelamento.select(cds);
    parcelamento.parcelamentoentrada.ler(cdsentrada);
    parcelamento.parcelamentosaida.ler(cdssaida);
    parcelamento.GravarTotais;
    parcelamento.Atribuir(cds);
  finally
    AtivarOnValidate;
  end;
end;

procedure Tfrmparcelamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrmparcelamento.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure Tfrmparcelamento.actgerarExecute(Sender: TObject);
var
  i : integer;
begin
  if (cds.state = dsinsert) or (cds.state = dsedit) then
  begin
    cds.post;
  end;
  cdssaida.First;
  while not cdssaida.Eof do
  begin
    cdssaida.Delete;
  end;
  gravartotais;
  parcelamento.gerar;
  for I := 0 to parcelamento.parcelamentosaida.count - 1 do
  begin
    cdssaida.Insert;
    parcelamento.parcelamentosaida.items[i].Atribuir(cdssaida);
    cdssaida.post;
  end;
end;

procedure Tfrmparcelamento.cdsBeforePost(DataSet: TDataSet);
begin
  if cds.FieldByName(_CDfornecedor).IsNull then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_fornecedor]), mtinformation, [mbok], 0);
    cds.FieldByName(_CDfornecedor).FocusControl;
    Abort;
  end;
  registro.set_update(cds);
end;

procedure Tfrmparcelamento.dtsStateChange(Sender: TObject);
begin
  if (dts.State = dsInsert) or (dts.State = dsEdit) then
  begin
    edtdtemissao.SetFocus;
  end;
end;

procedure Tfrmparcelamento.cdssaidaBeforePost(DataSet: TDataSet);
begin
  if cdssaidaDTVENCIMENTO.IsNull then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Data+' '+_de+' '+_vencimento]), mtinformation, [mbok], 0);
    cdssaidaDTVENCIMENTO.FocusControl;
    Abort;
  end;
  if cdssaidaDTVENCIMENTO.AsDateTime < cdsDTEMISSAO.AsDateTime then
  begin
    MessageDlg('Data vencimento não pode ser menor do que a data de Emissão.', mtInformation, [mbOK], 0);
    cdssaidaDTVENCIMENTO.FocusControl;
    Abort;
  end;
  registro.set_update(dataset);
end;

procedure Tfrmparcelamento.cdsNewRecord(DataSet: TDataSet);
begin
  registro.NewRecord;
  Dataset.fieldbyname(_cdstparcelamento).asinteger := qregistro.Codigo_status_novo(_parcelamento);
  Dataset.fieldbyname(_DTEMISSAO).AsDateTime       := DtBanco;
  Dataset.fieldbyname(_VLENTRADA).AsCurrency       := 0;
  Dataset.fieldbyname(_VLSAIDA).AsCurrency         := 0;
  Dataset.fieldbyname(_VLDESCONTO).AsCurrency      := 0;
  Dataset.fieldbyname(_VLJUROS).AsCurrency         := 0;
  Dataset.fieldbyname(_vltotal).AsCurrency         := 0;
  Dataset.fieldbyname(_VLACRESCIMO).AsCurrency     := 0;
  dataset.fieldbyname(_nuparcela).asinteger        := 1;
  dataset.fieldbyname(_nudiavencimento).asinteger  := DayOf(Dataset.fieldbyname(_DTEMISSAO).AsDateTime);
end;

procedure Tfrmparcelamento.cdsNUCNTCUSTOValidate(Sender: TField);
begin
  if sender.AsString = '' then
  begin
    cdsCDcntcusto.Clear;
    cdsNMcntcusto.Clear;
    exit;
  end;
  if not codigoexiste( _cntcusto, _nunivel, _string, sender.AsString) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_centro+' '+_custo)]), mterror, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
  cdsCDcntcusto.AsString := CodigodoCampo(_cntcusto, sender.AsString, _nunivel);
  cdsNMcntcusto.AsString := Nomedocodigo(_cntcusto, cdsCDcntcusto.AsString);
end;

procedure Tfrmparcelamento.cdsNUPLCONTAValidate(Sender: TField);
begin
  if sender.AsString = '' then
  begin
    cdsCDPLCONTA.Clear;
    cdsNMPLCONTA.Clear;
    exit;
  end;
  if not codigoexiste( _plconta, _nunivel, _string, sender.AsString) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_plano+' '+_contas)]), mterror, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
  cdsCDPLCONTA.AsString := CodigodoCampo( _plconta, sender.AsString, _nunivel);
  cdsNMPLCONTA.AsString := Nomedocodigo( _plconta, cdsCDPLCONTA.AsString);
end;

procedure Tfrmparcelamento.VerificarCdAutpagtoRepetido(cdautpagto: string);
var
  c : TClientdataset;
begin
  c := TClientDataSet.Create(nil);
  try
    c.CloneCursor(cdsentrada, true);
    if c.Locate(_cdautpagto, cdautpagto, []) then
    begin
      MessageDlg('Contas a pagar repetido.', mtInformation, [mbOK], 0);
      Abort;
    end;
  finally
    c.Free;
  end;
end;

procedure Tfrmparcelamento.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure Tfrmparcelamento.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure Tfrmparcelamento.ConfigurarDataset;
begin
  sds.CommandText := 'SELECT PARCELAMENTO.*'+
                           ',CNTCUSTO.NMCNTCUSTO'+
                           ',PLCONTA.NMPLCONTA'+
                           ',FORNECEDOR.NMFORNECEDOR'+
                           ',FORNECEDOR2.NMFORNECEDOR NMFORNECEDOR2 '+
                     'FROM PARCELAMENTO '+
                     'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDEMPRESA=PARCELAMENTO.CDEMPRESA AND FORNECEDOR.CDFORNECEDOR=PARCELAMENTO.CDFORNECEDOR '+
                     'LEFT JOIN FORNECEDOR FORNECEDOR2 ON FORNECEDOR2.CDEMPRESA=PARCELAMENTO.CDEMPRESA AND FORNECEDOR2.CDFORNECEDOR=PARCELAMENTO.CDFORNECEDOR2 '+
                     'LEFT JOIN CNTCUSTO ON CNTCUSTO.CDEMPRESA=PARCELAMENTO.CDEMPRESA AND CNTCUSTO.CDCNTCUSTO=PARCELAMENTO.CDCNTCUSTO '+
                     'LEFT JOIN PLCONTA ON PLCONTA.CDEMPRESA=PARCELAMENTO.CDEMPRESA AND PLCONTA.CDPLCONTA=PARCELAMENTO.CDPLCONTA '+
                     'WHERE PARCELAMENTO.CDEMPRESA=:CDEMPRESA AND PARCELAMENTO.CDPARCELAMENTO=:CDPARCELAMENTO';
  sds.Params[0].DataType  := ftLargeint;
  sds.Params[0].Name      := UpperCase(_cdempresa);
  sds.Params[0].ParamType := ptInput;
  sds.Params[0].Size      := 34;
  sds.Params[1].DataType  := ftInteger;
  sds.Params[1].Name      := UpperCase(_cdparcelamento);
  sds.Params[1].ParamType := ptInput;
  sds.Params[1].Size      := 4;

  sdsentrada.CommandText := 'SELECT PARCELAMENTOENTRADA.*'+
                                  ',AUTPAGTO.DTEMISSAO'+
                                  ',AUTPAGTO.DTPRORROGACAO '+
                            'FROM PARCELAMENTOENTRADA '+
                            'LEFT JOIN AUTPAGTO ON AUTPAGTO.CDAUTPAGTO=PARCELAMENTOENTRADA.CDAUTPAGTO AND AUTPAGTO.CDEMPRESA=PARCELAMENTOENTRADA.CDEMPRESA '+
                            'WHERE PARCELAMENTOENTRADA.CDEMPRESA=:CDEMPRESA AND PARCELAMENTOENTRADA.CDPARCELAMENTO=:CDPARCELAMENTO';
  sdsentrada.Params[0].DataType  := ftLargeint;
  sdsentrada.Params[0].Name      := UpperCase(_cdempresa);
  sdsentrada.Params[0].ParamType := ptInput;
  sdsentrada.Params[0].Size      := 34;
  sdsentrada.Params[1].DataType  := ftInteger;
  sdsentrada.Params[1].Name      := UpperCase(_cdparcelamento);
  sdsentrada.Params[1].ParamType := ptInput;
  sdsentrada.Params[1].Size      := 4;

  sdssaida.commandtext := 'SELECT PARCELAMENTOSAIDA.*'+
                                ',CNTCUSTO.NMCNTCUSTO'+
                                ',PLCONTA.NMPLCONTA'+
                                ',AUTPAGTO.CDSTAUTPAGTO '+
                          'FROM PARCELAMENTOSAIDA '+
                          'LEFT JOIN AUTPAGTO ON AUTPAGTO.CDAUTPAGTO=PARCELAMENTOSAIDA.CDAUTPAGTO AND PARCELAMENTOSAIDA.CDEMPRESA=AUTPAGTO.CDEMPRESA '+
                          'LEFT JOIN CNTCUSTO ON CNTCUSTO.CDEMPRESA=PARCELAMENTOSAIDA.CDEMPRESA AND CNTCUSTO.CDCNTCUSTO=PARCELAMENTOSAIDA.CDCNTCUSTO '+
                          'LEFT JOIN PLCONTA ON PLCONTA.CDEMPRESA=PARCELAMENTOSAIDA.CDEMPRESA AND PLCONTA.CDPLCONTA=PARCELAMENTOSAIDA.CDPLCONTA '+
                          'WHERE PARCELAMENTOSAIDA.CDEMPRESA=:CDEMPRESA AND PARCELAMENTOSAIDA.CDPARCELAMENTO=:CDPARCELAMENTO';
  sdssaida.Params[0].DataType  := ftLargeint;
  sdssaida.Params[0].Name      := UpperCase(_cdempresa);
  sdssaida.Params[0].ParamType := ptInput;
  sdssaida.Params[0].Size      := 34;
  sdssaida.Params[1].DataType  := ftInteger;
  sdssaida.Params[1].Name      := UpperCase(_cdparcelamento);
  sdssaida.Params[1].ParamType := ptInput;
  sdssaida.Params[1].Size      := 4;
end;

procedure Tfrmparcelamento.cdssaidaNewRecord(DataSet: TDataSet);
begin
  registro.set_insert(dataset);
  dataset.fieldbyname(_CDPARCELAMENTOSAIDA).AsInteger := qgerar.GerarCodigo(_parcelamentosaida);
  dataset.fieldbyname(_DTVENCIMENTO).AsDateTime      := DtBanco;
end;

procedure Tfrmparcelamento.cdssaidaNUCNTCUSTOValidate(Sender: TField);
begin
  if Sender.AsString <> '' then
  begin
    if not CodigoExiste(_cntcusto, _nunivel, _string, Sender.AsString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [Sender.asstring, qstring.maiuscula(_Centro+' '+_Custo)]), mterror, [mbok], 0);
      sender.FocusControl;
      abort;
    end;
    cdssaidacdcntcusto.asstring := CodigodoCampo(_cntcusto, sender.AsString, _nunivel);
    cdssaidaNMcntcusto.AsString := NomedoCodigo( _cntcusto, cdssaidacdcntcusto.asstring);
  end
  else
  begin
    cdssaidacdcntcusto.clear;
    cdssaidaNMcntcusto.Clear;
  end;
end;

procedure Tfrmparcelamento.cdssaidaNUPLCONTAValidate(Sender: TField);
begin
  if Sender.AsString <> '' then
  begin
    if not CodigoExiste(_plconta, _nunivel, _string, Sender.AsString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [Sender.asstring, qstring.maiuscula(_Plano+' '+_Contas)]), mterror, [mbok], 0);
      sender.FocusControl;
      abort;
    end;
    cdssaidacdplconta.asstring := CodigodoCampo(_plconta, sender.AsString, _nunivel);
    cdssaidaNMPLCONTA.AsString := NomedoCodigo( _plconta, cdssaidacdplconta.asstring);
  end
  else
  begin
    cdssaidacdplconta.clear;
    cdssaidaNMPLCONTA.Clear;
  end;
end;

procedure Tfrmparcelamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(registro);
  FreeAndNil(parcelamento);
end;

procedure Tfrmparcelamento.edtcdfornecedor2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedor2PropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure Tfrmparcelamento.edtcdfornecedor2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  QForm.edtCDfornecedorPropertiesButtonClick(self, cds, _cdfornecedor+_2);
end;

procedure Tfrmparcelamento.edtcdfornecedor2PropertiesEditValueChanged(Sender: TObject);
begin
  if (cds.State = dsedit) or (cds.State = dsinsert) then
  begin
    lblcdfornecedor2.Hint := parcelamento.fornecedor2.hint_rzsocial;
  end;
end;

procedure Tfrmparcelamento.edtCDFORNECEDORKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedorPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure Tfrmparcelamento.edtCDFORNECEDORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  QForm.edtCDfornecedorPropertiesButtonClick(self, cds);
end;

procedure Tfrmparcelamento.edtCDFORNECEDORPropertiesEditValueChanged(Sender: TObject);
begin
  if (cds.State = dsedit) or (cds.State = dsinsert) then
  begin
    lblcdfornecedor.Hint := parcelamento.fornecedor.hint_rzsocial;
  end;
end;

procedure Tfrmparcelamento.cdsCDFORNECEDOR2Validate(Sender: TField);
begin
  if not parcelamento.fornecedor2.select(Sender.AsLargeInt) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [Sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  if sender.aslargeint = sender.dataset.fieldbyname(_cdfornecedor).aslargeint then
  begin
    MessageDlg('Fornecedor da transferência não pode ser o mesmo fornecedor do parcelamento.', mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  sender.DataSet.FieldByName(_nmfornecedor+_2).AsString := parcelamento.fornecedor2.nmfornecedor;
  lblcdfornecedor2.Hint := parcelamento.fornecedor2.hint_rzsocial;
end;

procedure Tfrmparcelamento.cdsCDFORNECEDORValidate(Sender: TField);
begin
  if parcelamento.cdfornecedor = sender.aslargeint then
  begin
    exit;
  end;
  if not parcelamento.fornecedor.select(Sender.AsLargeInt) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [Sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  parcelamento.cdfornecedor := sender.aslargeint;
  sender.DataSet.FieldByName(_nmfornecedor).AsString := parcelamento.fornecedor.nmfornecedor;
  lblcdfornecedor.Hint := parcelamento.fornecedor.hint_rzsocial;
  LimparAutpagtoEntrada;
end;

procedure Tfrmparcelamento.cdsentradaBeforePost(DataSet: TDataSet);
begin
  registro.set_update(dataset);
end;

procedure Tfrmparcelamento.cdsentradaCDAUTPAGTOValidate(Sender: TField);
var
  autpagto : Tautpagto;
begin
  VerificarCdAutpagtoRepetido(sender.AsString);
  autpagto := tautpagto.create;
  try
    autpagto.Select(sender.Asinteger);
    if autpagto.cdstautpagto <> 1 then
    begin
      MessageDlg('Contas a pagar '+autpagto.nuautpagto+' não está aberta.', mtInformation, [mbOK], 0);
      Abort;
    end;
    if autpagto.cdfornecedor <> cds.fieldbyname(_cdfornecedor).AsLargeInt then
    begin
      autpagto.fornecedor.select(autpagto.cdfornecedor);
      MessageDlg('Fornecedor do contas a Pagar ('+autpagto.cdfornecedor.tostring+' - '+autpagto.fornecedor.nmfornecedor+')'#13'diferente do fornecedor do parcelamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
    sender.dataset.fieldbyname(_nuautpagto).onvalidate    := nil;
    sender.dataset.fieldbyname(_NUautpagto).AsString      := autpagto.nuautpagto;
    sender.dataset.fieldbyname(_NUautpagto).OnValidate    := cdsentradaNUautpagtoValidate;
    sender.dataset.fieldbyname(_VLautpagto).AsCurrency    := autpagto.vlsaldo;
    sender.dataset.fieldbyname(_VLJUROS).AsCurrency       := 0;//autpagto.vljuros;
    sender.dataset.fieldbyname(_VLTOTAL).AsCurrency       := autpagto.vlsaldo;// + autpagto.vljuros;
    sender.dataset.fieldbyname(_DTEMISSAO).AsDateTime     := autpagto.dtemissao;
    sender.dataset.fieldbyname(_DTPRORROGACAO).AsDateTime := autpagto.dtprorrogacao;
    if edtnucntcusto.text = '' then
    begin
      cdsNUCNTCUSTO.asstring := autpagto.nucntcusto;
      cdsNUCNTCUSTOValidate(cdsnucntcusto);
    end;
    if edtnuplconta.text = '' then
    begin
      cdsNUPLCONTA.asstring := autpagto.nuplconta;
      cdsNUPLCONTAValidate(cdsnuplconta);
    end;
    if (cbxcdtpcobranca.text = '') and (autpagto.cdtpcobranca <> 0) then
    begin
      cdscdtpcobranca.asinteger := autpagto.cdtpcobranca;
    end;
  finally
    freeandnil(autpagto);
  end;
end;

procedure Tfrmparcelamento.cdsentradaNewRecord(DataSet: TDataSet);
begin
  dataset.fieldbyname(_cdparcelamentoentrada).AsInteger := qgerar.GerarCodigo(_parcelamentoentrada);
  registro.set_insert(dataset);
end;

procedure Tfrmparcelamento.cdsentradaNUAUTPAGTOValidate(Sender: TField);
begin
  cdsentradaCDAUTPAGTO.asinteger := registro.Codigonumero(sender.AsString, _autpagto);
end;

procedure Tfrmparcelamento.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure Tfrmparcelamento.ConfigurarActDesfazer;
begin
  if parcelamento.stparcelamento.boalterar = _n then
  begin
    actdesfazer.Enabled := parcelamento_saida_em_aberto;
    actdesfazer.Visible := actdesfazer.Enabled;
  end
  else
  begin
    actdesfazer.Enabled := false;
    actdesfazer.Visible := false;
  end;
end;

procedure Tfrmparcelamento.ConfigurarActProcessar;
begin
  actprocessar.Enabled := parcelamento.stparcelamento.boalterar = _s;
  actprocessar.Visible := parcelamento.stparcelamento.boalterar = _s;
end;

procedure Tfrmparcelamento.tbventradaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBColumn(ACellViewInfo.Item).DataBinding.FieldName) = _nuautpagto then
  begin
    actabrirautpagtoExecute(actabrirautpagto);
  end;
end;

procedure Tfrmparcelamento.tbventradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  registro.ExibirInformacaoRegistro(cdsentrada, key);
  if (key = __KeySearch) and (LowerCase(tbventrada.Controller.FocusedColumn.DataBinding.FilterFieldName) = _nuautpagto) then
  begin
    tbventradaNUAUTPAGTOPropertiesButtonClick(sender, 0);
  end;
end;

procedure Tfrmparcelamento.tbventradaNUAUTPAGTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cdautpagto : TStrings;
  i: Integer;
begin
  cdautpagto := TStringList.Create;
  try
    cdautpagto.Text := LocalizarautpagtoMulti(cds.FieldByName(_CDfornecedor).AsString, _1);
    if cdautpagto.Text = '' then
    begin
      Exit;
    end;
    if (cds.State <> dsinsert) and (cds.State <> dsedit) then
    begin
      cdsentrada.Edit;
    end;
    for i := 0 to cdautpagto.Count - 1 do
    begin
      if i > 0 then
      begin
        cdsentrada.Insert;
      end;
      cdsentrada.fieldbyname(_CDautpagto).AsString := cdautpagto[i];
    end;
  finally
    FreeAndNil(cdautpagto);
  end;
end;

procedure Tfrmparcelamento.actabrirautpagtoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsentrada);
end;

procedure Tfrmparcelamento.actabrirautpagtosaidaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdssaida);
end;

procedure Tfrmparcelamento.tbvsaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBColumn(ACellViewInfo.Item).DataBinding.FieldName) = _nuautpagto then
  begin
    actabrirautpagtosaidaExecute(actabrirautpagtosaida);
  end;
end;

procedure Tfrmparcelamento.tbvsaidaNUCNTCUSTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : string;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := ulocalizar.Localizar(_cntcusto, _nunivel, _nmcntcusto, 'Centro de Custo', 'o', _nunivel);
  if cd = '' then
  begin
    exit;
  end;
  if (cdssaida.State <> dsedit) and (cdssaida.State <> dsinsert) then
  begin
    cdssaida.Edit;
  end;
  cdssaidaNUcntcusto.AsString := cd;
end;

procedure Tfrmparcelamento.tbvsaidaNUPLCONTAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : string;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := ulocalizar.Localizar(_plconta, _nunivel, _nmplconta, 'Plano Conta', 'o', _nunivel);
  if cd = '' then
  begin
    exit;
  end;
  if (cdssaida.State <> dsedit) and (cdssaida.State <> dsinsert) then
  begin
    cdssaida.Edit;
  end;
  cdssaidaNUPLCONTA.AsString := cd;
end;

procedure Tfrmparcelamento.actprocessarExecute(Sender: TObject);
begin
  if parcelamento.processar then
  begin
    Abrir(cds.fieldbyname(_cdparcelamento).AsInteger);
  end;
end;

procedure Tfrmparcelamento.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure Tfrmparcelamento.cdsAfterScroll(DataSet: TDataSet);
begin
  parcelamento.Select(dataset);
  parcelamento.stparcelamento.select(parcelamento.cdstparcelamento);
  parcelamento.parcelamentoSaida.Ler(cdssaida);
  parcelamento.parcelamentoentrada.Ler(cdsentrada);

  //registro.setStatus(tbl, dataset);
  ConfigurarActDesfazer;
  ConfigurarActProcessar;
  if not cds.FieldByName(_CDfornecedor).IsNull then
  begin
    parcelamento.fornecedor.select(cds.FieldByName(_cdfornecedor).AsLargeInt);
    lblcdfornecedor.Hint := parcelamento.fornecedor.hint_rzsocial;
  end;
end;

function Tfrmparcelamento.parcelamento_saida_em_aberto:boolean;
begin
  result := False;
  cdssaida.DisableControls;
  try
    cdssaida.First;
    while not cdssaida.Eof do
    begin
      Result := cdssaida.fieldbyname(_cdstautpagto).AsString = _1;
      if not Result then
      begin
        Break;
      end;
      cdssaida.Next;
    end;
  finally
    cdssaida.EnableControls;
  end;
end;

procedure Tfrmparcelamento.actdesfazerExecute(Sender: TObject);
begin
  if parcelamento.Desfazer then
  begin
    Abrir(cds.fieldbyname(_CDparcelamento).asinteger);
  end;
end;

procedure Tfrmparcelamento.FormCreate(Sender: TObject);
begin
  configurarDataset;
  AbrirTabelas;
  ConfigurarEmpresa;
  registro := tregistro.create(self, tbl, exibe, artigoI, cds, dts, edtcodigo);
end;

procedure Tfrmparcelamento.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure Tfrmparcelamento.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure Tfrmparcelamento.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure Tfrmparcelamento.actabrirfornecedorExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure Tfrmparcelamento.lblcdfornecedorDblClick(Sender: TObject);
begin
  actabrirfornecedorExecute(actabrirfornecedor);
end;

procedure Tfrmparcelamento.LimparAutpagtoEntrada;
begin
  if cdsentrada.recordcount = 0 then
  begin
    exit;
  end;
  cdsentrada.first;
  while not cdsentrada.eof do
  begin
    cdsentrada.delete;
  end;
end;

end.
