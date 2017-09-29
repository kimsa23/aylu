unit Dialogo.Negociacao;

interface

uses
  System.Actions, System.UITypes,
  forms, Windows, Classes, StdCtrls, Controls, ExtCtrls, Buttons, dialogs, sysutils,
  ActnList, ComCtrls, ToolWin, Mask, Menus,
  FMTBcd, DB, DBCtrls, DBGrids, DBClient, Provider, Grids, sqlexpr,
  rotina.registro, uconstantes, ulocalizar, rotina.strings,
  dialogo.ExportarExcel, rotina.datahora, classe.gerar,
  orm.duplicata, orm.empresa, classe.form, classe.registro, orm.negociacao,
  dxBar, cxClasses, cxControls, cxContainer, cxEdit, cxTextEdit, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxDBEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxButtonEdit, cxLabel, cxDBLabel, cxSplitter, cxLookAndFeels,
  cxLookAndFeelPainters, cxCalc, cxPCdxBarPopupMenu, cxPC,
  cxNavigator, cxMemo, dxBarBuiltInMenu;

type
  ESegurancaException = class(Exception);
  Tfrmnegociacao = class(TForm)
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
    actabrirduplicata: TAction;
    actabrirduplicatasaida: TAction;
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
    sdsCDNEGOCIACAO: TIntegerField;
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
    cdsCDNEGOCIACAO: TIntegerField;
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
    sdssaidaCDNEGOCIACAOSAIDA: TIntegerField;
    sdssaidaCDDUPLICATA: TIntegerField;
    sdssaidaCDUSUARIOI: TIntegerField;
    sdssaidaCDUSUARIOA: TIntegerField;
    sdssaidaCDCOMPUTADORI: TIntegerField;
    sdssaidaCDCOMPUTADORA: TIntegerField;
    sdssaidaCDNEGOCIACAO: TIntegerField;
    sdssaidaVLDUPLICATA: TFMTBCDField;
    sdssaidaTSINCLUSAO: TSQLTimeStampField;
    sdssaidaTSALTERACAO: TSQLTimeStampField;
    sdssaidaNUDUPLICATA: TStringField;
    cdssdssaida: TDataSetField;
    cdssaidaCDNEGOCIACAOSAIDA: TIntegerField;
    cdssaidaCDDUPLICATA: TIntegerField;
    cdssaidaCDUSUARIOI: TIntegerField;
    cdssaidaCDUSUARIOA: TIntegerField;
    cdssaidaCDCOMPUTADORI: TIntegerField;
    cdssaidaCDCOMPUTADORA: TIntegerField;
    cdssaidaCDNEGOCIACAO: TIntegerField;
    cdssaidaVLDUPLICATA: TFMTBCDField;
    cdssaidaTSINCLUSAO: TSQLTimeStampField;
    cdssaidaTSALTERACAO: TSQLTimeStampField;
    cdssaidaNUDUPLICATA: TStringField;
    lblcdcliente: TLabel;
    edtCDCLIENTE: TcxDBButtonEdit;
    sdsCDSTNEGOCIACAO: TIntegerField;
    cdsCDSTNEGOCIACAO: TIntegerField;
    sdssaidaDTVENCIMENTO: TDateField;
    sdssaidaPRMORADIARIA: TFloatField;
    cdssaidaDTVENCIMENTO: TDateField;
    cdssaidaPRMORADIARIA: TFloatField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    actdesfazer: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    sdssaidaCDSTDUPLICATA: TIntegerField;
    cdssaidaCDSTDUPLICATA: TIntegerField;
    sdsVLCOMISSAO: TFMTBCDField;
    cdsVLCOMISSAO: TFMTBCDField;
    sdssaidaVLCOMISSAO: TFMTBCDField;
    cdssaidaVLCOMISSAO: TFMTBCDField;
    sdsCDREPRESENTANTE: TIntegerField;
    cdsCDREPRESENTANTE: TIntegerField;
    sdssaidaCDREPRESENTANTE: TIntegerField;
    cdssaidaCDREPRESENTANTE: TIntegerField;
    lblrepresentante: TLabel;
    cbxcdrepresentante: TcxDBLookupComboBox;
    sdsVLENTRADA: TFMTBCDField;
    sdsVLSAIDA: TFMTBCDField;
    sdssaidaCDTPCOBRANCA: TIntegerField;
    cdssaidaCDTPCOBRANCA: TIntegerField;
    actimprimirboleto: TAction;
    actimprimirboletodoso: TAction;
    pum: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    actimprimircarne: TAction;
    dxBarButton3: TdxBarButton;
    sdsentrada: TSQLDataSet;
    sdsentradaCDNEGOCIACAOENTRADA: TIntegerField;
    sdsentradaCDDUPLICATA: TIntegerField;
    sdsentradaCDUSUARIOI: TIntegerField;
    sdsentradaCDUSUARIOA: TIntegerField;
    sdsentradaCDCOMPUTADORI: TIntegerField;
    sdsentradaCDCOMPUTADORA: TIntegerField;
    sdsentradaCDNEGOCIACAO: TIntegerField;
    sdsentradaVLDUPLICATA: TFMTBCDField;
    sdsentradaVLJUROS: TFMTBCDField;
    sdsentradaTSINCLUSAO: TSQLTimeStampField;
    sdsentradaTSALTERACAO: TSQLTimeStampField;
    sdsentradaNUDUPLICATA: TStringField;
    sdsentradaVLTOTAL: TFMTBCDField;
    sdsentradaVLCOMISSAO: TFMTBCDField;
    sdsentradaDTEMISSAO: TDateField;
    sdsentradaDTPRORROGACAO: TDateField;
    cdsentrada: TClientDataSet;
    cdssdsentrada: TDataSetField;
    cdsentradaCDNEGOCIACAOENTRADA: TIntegerField;
    cdsentradaCDDUPLICATA: TIntegerField;
    cdsentradaCDUSUARIOI: TIntegerField;
    cdsentradaCDUSUARIOA: TIntegerField;
    cdsentradaCDCOMPUTADORI: TIntegerField;
    cdsentradaCDCOMPUTADORA: TIntegerField;
    cdsentradaCDNEGOCIACAO: TIntegerField;
    cdsentradaVLDUPLICATA: TFMTBCDField;
    cdsentradaVLJUROS: TFMTBCDField;
    cdsentradaTSINCLUSAO: TSQLTimeStampField;
    cdsentradaTSALTERACAO: TSQLTimeStampField;
    cdsentradaNUDUPLICATA: TStringField;
    cdsentradaVLTOTAL: TFMTBCDField;
    cdsentradaVLCOMISSAO: TFMTBCDField;
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
    tbvsaidaNUDUPLICATA: TcxGridDBColumn;
    tbvsaidaVLDUPLICATA: TcxGridDBColumn;
    tbvsaidaDTVENCIMENTO: TcxGridDBColumn;
    tbvsaidaPRMORADIARIA: TcxGridDBColumn;
    tbvsaidaCDSTDUPLICATA: TcxGridDBColumn;
    tbvsaidaCDREPRESENTANTE: TcxGridDBColumn;
    tbvsaidaCDTPCOBRANCA: TcxGridDBColumn;
    tbvsaidaVLCOMISSAO: TcxGridDBColumn;
    tbvsaidaCDDUPLICATA: TcxGridDBColumn;
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
    tbventradaNUDUPLICATA: TcxGridDBColumn;
    tbventradaVLDUPLICATA: TcxGridDBColumn;
    tbventradaDTEMISSAO: TcxGridDBColumn;
    tbventradaDTPRORROGACAO: TcxGridDBColumn;
    tbventradaVLJUROS: TcxGridDBColumn;
    tbventradaVLTOTAL: TcxGridDBColumn;
    tbventradaVLCOMISSAO: TcxGridDBColumn;
    lvlentrada: TcxGridLevel;
    splcalculo: TcxSplitter;
    memdsobservacao: TcxDBMemo;
    actabrircliente: TAction;
    lblNMCLIENTE: TDBText;
    sdsNMCLIENTE: TStringField;
    cdsNMCLIENTE: TStringField;
    sdsCDEMPRESA: TLargeintField;
    sdsCDCLIENTE: TLargeintField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDCLIENTE: TLargeintField;
    sdsentradaCDEMPRESA: TLargeintField;
    cdsentradaCDEMPRESA: TLargeintField;
    sdssaidaCDEMPRESA: TLargeintField;
    cdssaidaCDEMPRESA: TLargeintField;
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
    procedure edtCDCLIENTEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCDCLIENTEPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtCDCLIENTEPropertiesEditValueChanged(Sender: TObject);
    procedure cdsCDCLIENTEValidate(Sender: TField);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actabrirduplicataExecute(Sender: TObject);
    procedure actabrirduplicatasaidaExecute(Sender: TObject);
    procedure tbvsaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actprocessarExecute(Sender: TObject);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure actdesfazerExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actimprimirboletoExecute(Sender: TObject);
    procedure actimprimirboletodosoExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actimprimircarneExecute(Sender: TObject);
    procedure cdsentradaBeforePost(DataSet: TDataSet);
    procedure cdsentradaNewRecord(DataSet: TDataSet);
    procedure cdsentradaCDDUPLICATAValidate(Sender: TField);
    procedure tbventradaNUDUPLICATAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbventradaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cdsentradaNUDUPLICATAValidate(Sender: TField);
    procedure tbventradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure actabrirclienteExecute(Sender: TObject);
    procedure lblcdclienteDblClick(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
  private
    negociacao : TNegociacao;
    function negociacao_saida_em_aberto:boolean;
    procedure set_actdesfazer;
    procedure set_actprocessar;
    procedure VerificarCdduplicataRepetido(cdduplicata:string);
  public
    registro : tregistro;
    function Abrir(codigo:integer):boolean;
  end;

var
  frmnegociacao: Tfrmnegociacao;

implementation

uses uDtmMain, uMain, Localizar.Duplicata;

{$R *.dfm}

const
  tbl      = 'negociacao';
  exibe    = 'Negociação';
  artigoI  = 'o';

procedure Tfrmnegociacao.actNovoExecute(Sender: TObject);
begin
  registro.novo(sender);
end;

function Tfrmnegociacao.Abrir(codigo:integer):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure Tfrmnegociacao.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

procedure Tfrmnegociacao.actEditarExecute(Sender: TObject);
begin
  registro.editar;
end;

procedure Tfrmnegociacao.actSalvarExecute(Sender: TObject);
begin
  registro.Salvar;
end;

procedure Tfrmnegociacao.actExcluirExecute(Sender: TObject);
begin
  registro.excluir;
end;

procedure Tfrmnegociacao.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure Tfrmnegociacao.actCancelarExecute(Sender: TObject);
begin
  registro.cancelar;
end;

procedure Tfrmnegociacao.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure Tfrmnegociacao.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure Tfrmnegociacao.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure Tfrmnegociacao.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure Tfrmnegociacao.edtCodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure Tfrmnegociacao.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure Tfrmnegociacao.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure Tfrmnegociacao.FormShow(Sender: TObject);
begin
  registro.set_readonly_dados(self, true);
  negociacao  := TNegociacao.create;
  pnl.caption := exibe;
  edtCodigo.SetFocus;
end;

procedure Tfrmnegociacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrmnegociacao.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure Tfrmnegociacao.cdsBeforePost(DataSet: TDataSet);
begin
  if cds.FieldByName(_CDCLIENTE).IsNull then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Cliente]), mtinformation, [mbok], 0);
    cds.FieldByName(_CDCLIENTE).FocusControl;
    Abort;
  end;
  registro.set_update(cds);
end;

procedure Tfrmnegociacao.dtsStateChange(Sender: TObject);
begin
  set_actprocessar;
  if (dts.State = dsInsert) or (dts.State = dsEdit) then
  begin
    edtdtemissao.SetFocus;
  end;
end;

procedure Tfrmnegociacao.cdssaidaBeforePost(DataSet: TDataSet);
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

procedure Tfrmnegociacao.cdsNewRecord(DataSet: TDataSet);
begin
  registro.NewRecord;
  cdsCDSTNEGOCIACAO.AsInteger := qregistro.Codigo_status_novo(_negociacao);
  cdsDTEMISSAO.AsDateTime     := DtBanco;
  cdsVLENTRADA.AsCurrency     := 0;
  cdsVLSAIDA.AsCurrency       := 0;
  cdsVLDESCONTO.AsCurrency    := 0;
  cdsVLJUROS.AsCurrency       := 0;
  cdsVLACRESCIMO.AsCurrency   := 0;
  cdsVLCOMISSAO.AsCurrency    := 0;
end;

procedure Tfrmnegociacao.VerificarCdduplicataRepetido(cdduplicata: string);
var
  c : TClientdataset;
begin
  c := TClientDataSet.Create(nil);
  try
    c.CloneCursor(cdsentrada, true);
    if c.Locate(_cdduplicata, cdduplicata, []) then
    begin
      MessageDlg('Contas a receber repetido.', mtInformation, [mbOK], 0);
      Abort;
    end;
  finally
    c.Free;
  end;
end;

procedure Tfrmnegociacao.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure Tfrmnegociacao.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure Tfrmnegociacao.cdssaidaNewRecord(DataSet: TDataSet);
begin
  registro.set_insert(dataset);
  cdssaidaPRMORADIARIA.AsFloat       := empresa.financeiro.duplicata.prmoradiaria;
  cdssaidaCDNEGOCIACAOSAIDA.AsInteger := qgerar.GerarCodigo(_negociacaosaida);
  cdssaidaDTVENCIMENTO.AsDateTime    := DtBanco;
  cdssaidaVLCOMISSAO.AsCurrency      := 0;
  if cdsCDREPRESENTANTE.AsString <> '' then
  begin
    cdssaidaCDREPRESENTANTE.AsString := cdsCDREPRESENTANTE.AsString;
  end;
end;

procedure Tfrmnegociacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(registro);
  FreeAndNil(negociacao);
end;

procedure Tfrmnegociacao.edtCDCLIENTEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdclientePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure Tfrmnegociacao.edtCDCLIENTEPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  QForm.edtCDCLIENTEPropertiesButtonClick(self, cds, false);
end;

procedure Tfrmnegociacao.edtCDCLIENTEPropertiesEditValueChanged(Sender: TObject);
begin
  if (cds.State = dsedit) or (cds.State = dsinsert) then
  begin
    lblcdcliente.Hint := negociacao.cliente.hint_rzsocial;
  end;
end;

procedure Tfrmnegociacao.cdsCDCLIENTEValidate(Sender: TField);
begin
  if not negociacao.cliente.select(Sender.AsLargeInt) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [Sender.AsString, qstring.maiuscula(_cliente)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  if negociacao.cliente.cdrepresentante <> 0 then
  begin
    cdsCDREPRESENTANTE.AsInteger := negociacao.cliente.cdrepresentante;
  end
  else
  begin
    cdsCDREPRESENTANTE.Clear;
  end;
  sender.DataSet.FieldByName(_nmcliente).AsString := negociacao.cliente.nmcliente;
  lblcdcliente.Hint                               := negociacao.cliente.hint_rzsocial;
end;

procedure Tfrmnegociacao.cdsentradaBeforePost(DataSet: TDataSet);
begin
  registro.set_update(dataset);
end;

procedure Tfrmnegociacao.cdsentradaCDDUPLICATAValidate(Sender: TField);
var
  duplicata : TDuplicata;
begin
  VerificarCdduplicataRepetido(sender.AsString);
  duplicata := tduplicata.create;
  try
    duplicata.Select(sender.Asinteger);
    if duplicata.cdstduplicata <> 1 then
    begin
      MessageDlg('Contas a receber '+duplicata.nuduplicata+' não está aberta.', mtInformation, [mbOK], 0);
      Abort;
    end;
    cdsentradaNUDUPLICATA.OnValidate   := nil;
    cdsentradaNUDUPLICATA.AsString     := duplicata.nuduplicata;
    cdsentradaNUDUPLICATA.OnValidate   := cdsentradaNUDUPLICATAValidate;
    cdsentradaVLDUPLICATA.AsCurrency   := duplicata.vlsaldo;
    cdsentradaVLJUROS.AsCurrency       := duplicata.vljuros;
    cdsentradaVLTOTAL.AsCurrency       := duplicata.vlsaldo + duplicata.vljuros;
    cdsentradaDTEMISSAO.AsDateTime     := duplicata.dtemissao;
    cdsentradaDTPRORROGACAO.AsDateTime := duplicata.dtprorrogacao;
    cdsentradaVLCOMISSAO.AsCurrency    := duplicata.vlcomissaoaberta;
    if cdsCDREPRESENTANTE.IsNull and (duplicata.cdrepresentante <> 0) then
    begin
      cdscdrepresentante.AsInteger := duplicata.cdrepresentante;
    end;
  finally
    freeandnil(duplicata);
  end;
end;

procedure Tfrmnegociacao.cdsentradaNewRecord(DataSet: TDataSet);
begin
  cdsentradaCDNEGOCIACAOENTRADA.AsInteger := qgerar.GerarCodigo(_negociacaoentrada);
  registro.set_insert(dataset);
end;

procedure Tfrmnegociacao.cdsentradaNUDUPLICATAValidate(Sender: TField);
begin
  cdsentradaCDDUPLICATA.asinteger := registro.Codigonumero(sender.AsString, _duplicata);
end;

procedure Tfrmnegociacao.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure Tfrmnegociacao.set_actdesfazer;
begin
  if not actprocessar.Enabled then
  begin
    actdesfazer.Enabled := negociacao_saida_em_aberto;
    actdesfazer.Visible := actdesfazer.Enabled;
  end
  else
  begin
    actdesfazer.Enabled := false;
    actdesfazer.Visible := false;
  end;
end;

procedure Tfrmnegociacao.set_actprocessar;
begin
  actprocessar.Enabled := actEditar.Enabled;
  actprocessar.Visible := actEditar.Enabled;
end;

procedure Tfrmnegociacao.tbventradaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBColumn(ACellViewInfo.Item).DataBinding.FieldName) = _nuduplicata then
  begin
    actabrirduplicataExecute(actabrirduplicata);
  end;
end;

procedure Tfrmnegociacao.tbventradaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  registro.ExibirInformacaoRegistro(cdsentrada, key);
  if (key = __KeySearch) and (LowerCase(tbventrada.Controller.FocusedColumn.DataBinding.FilterFieldName) = _nuduplicata) then
  begin
    tbventradaNUDUPLICATAPropertiesButtonClick(sender, 0);
  end;
end;

procedure Tfrmnegociacao.tbventradaNUDUPLICATAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cdduplicata : TStrings;
  i: Integer;
begin
  cdduplicata := TStringList.Create;
  try
    cdduplicata.Text := LocalizarDuplicataMulti(cds.FieldByName(_CDCLIENTE).AsString, _1);
    if cdduplicata.Text = '' then
    begin
      Exit;
    end;
    if (cds.State <> dsinsert) and (cds.State <> dsedit) then
    begin
      cdsentrada.Edit;
    end;
    for i := 0 to cdduplicata.Count - 1 do
    begin
      if i > 0 then
      begin
        cdsentrada.Insert;
      end;
      cdsentradaCDDUPLICATA.AsString := cdduplicata[i];
    end;
  finally
    FreeAndNil(cdduplicata);
  end;
end;

procedure Tfrmnegociacao.actabrirduplicataExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsentrada);
end;

procedure Tfrmnegociacao.actabrirduplicatasaidaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdssaida);
end;

procedure Tfrmnegociacao.tbvsaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBColumn(ACellViewInfo.Item).DataBinding.FieldName) = _nuduplicata then
  begin
    actabrirduplicatasaidaExecute(actabrirduplicatasaida);
  end;
end;

procedure Tfrmnegociacao.actprocessarExecute(Sender: TObject);
begin
  if negociacao.processar then
  begin
    Abrir(cds.fieldbyname(_cdnegociacao).AsInteger);
    Abrir(cds.fieldbyname(_cdnegociacao).AsInteger);
    //set_actdesfazer;
  end;
end;

procedure Tfrmnegociacao.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure Tfrmnegociacao.cdsAfterScroll(DataSet: TDataSet);
begin
  negociacao.Select(dataset);
  negociacao.negociacaoSaida.Ler(cdssaida);
  negociacao.negociacaoentrada.Ler(cdsentrada);

  //registro.setStatus(tbl, dataset);
  set_actprocessar;
  set_actdesfazer;
  if not cds.FieldByName(_CDCLIENTE).IsNull then
  begin
    negociacao.cliente.select(cds.FieldByName(_cdcliente).AsLargeInt);
    lblcdcliente.Hint := negociacao.cliente.hint_rzsocial;
  end;
end;

function Tfrmnegociacao.negociacao_saida_em_aberto:boolean;
begin
  result := False;
  cdssaida.DisableControls;
  try
    cdssaida.First;
    while not cdssaida.Eof do
    begin
      Result := cdssaidaCDSTDUPLICATA.AsString = _1;
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

procedure Tfrmnegociacao.actdesfazerExecute(Sender: TObject);
begin
  if negociacao.Desfazer then
  begin
    Abrir(cdsCDNEGOCIACAO.asinteger);
    Abrir(cdsCDNEGOCIACAO.asinteger);
  end;
end;

procedure Tfrmnegociacao.FormCreate(Sender: TObject);
begin
  cbxcdrepresentante.Visible      := empresa.comercial.representante.bo;
  lblrepresentante.Visible        := empresa.comercial.representante.bo;
  tbvsaidaCDREPRESENTANTE.Visible := empresa.comercial.representante.bo;

  TcxLookupComboBoxProperties(tbvsaidaCDSTDUPLICATA.Properties).ListSource   := abrir_tabela(_stduplicata);
  TcxLookupComboBoxProperties(tbvsaidaCDREPRESENTANTE.Properties).ListSource := abrir_tabela(_representante);
  TcxLookupComboBoxProperties(tbvsaidaCDTPCOBRANCA.Properties).ListSource    := abrir_tabela(_tpcobranca);
  cbxcdrepresentante.Properties.ListSource                                   := abrir_tabela(_representante);
  registro := tregistro.create(self, tbl, exibe, artigoI, cds, dts, edtcodigo);
end;

procedure Tfrmnegociacao.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure Tfrmnegociacao.actimprimirboletoExecute(Sender: TObject);
var
  duplicata : TDuplicata;
begin
  duplicata := TDuplicata.create;
  try
    duplicata.Select(cdssaidaCDDUPLICATA.Asinteger);
    duplicata.ImprimirBoletoAcbr;
  finally
    freeandnil(duplicata);
  end;
end;

procedure Tfrmnegociacao.actimprimircarneExecute(Sender: TObject);
var
  duplicatalist : TDuplicataList;
  i : integer;
begin
  if tbvsaida.ViewData.RowCount = 0 then
  begin
    exit;
  end;
  duplicatalist := tDuplicataList.create;
  try
    for i := 0 to tbvsaida.ViewData.RecordCount -1 do
    begin
      duplicatalist.New.Select(strtoint(tbvsaida.ViewData.Records[i].Values[tbvsaida.GetColumnByFieldName(_cdduplicata).Index]));
    end;
    if duplicatalist.count > 0 then
    begin
      duplicatalist.ImprimirCarneAcbr;
    end;
  finally
    freeandnil(duplicatalist);
  end;
end;

procedure Tfrmnegociacao.actimprimirboletodosoExecute(Sender: TObject);
var
  duplicataList : TDuplicataList;
  cdduplicata, i : integer;
begin
  if tbvsaida.ViewData.RowCount = 0 then
  begin
    exit;
  end;
  duplicatalist := tduplicatalist.create;
  try
    for i := 0 to tbvsaida.ViewData.RecordCount -1 do
    begin
      if tbvsaida.ViewData.Records[i].Selected then
      begin
        cdduplicata := strtoint(tbvsaida.ViewData.Records[i].Values[tbvsaida.GetColumnByFieldName(_cdduplicata).Index]);
        duplicatalist.New.Select(cdduplicata);
      end;
    end;
    if duplicatalist.Count > 0 then
    begin
      duplicatalist.ImprimirBoletoAcbr
    end;
  finally
    freeandnil(duplicatalist);
  end;
end;

procedure Tfrmnegociacao.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure Tfrmnegociacao.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure Tfrmnegociacao.actabrirclienteExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure Tfrmnegociacao.lblcdclienteDblClick(Sender: TObject);
begin
  actabrirclienteExecute(actabrircliente);
end;

end.
