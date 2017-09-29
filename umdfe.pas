{$I ACBr.inc}
unit umdfe;

interface

uses Classe.Main,
  System.Actions, System.UITypes, System.Variants,
  windows, sysutils, dialogs, graphics, Classes, ActnList, StdCtrls, forms,
  ShellAPI, Menus, IniFiles, ComCtrls, Mask, ToolWin, Controls, ExtCtrls, Buttons,
  Clipbrd, dateutils,
  Grids,
  DB, sqlexpr, Provider, DBClient,
  pmdfeConversaoMDFe, model.mdfe,

  ACBrMDFeDAMDFeClass, ACBrMDFeDAMDFEFR, ACBrMDFe, pcnConversao, ACBrDFeSSL, ACBrMail, ACBrDFeException, blcksock,
  acbr.MDFEGerar,
  Dialogo.Tabela,

  rotina.registroIb, rotina.rotinas, rotina.strings, rotina.registro,
  uconstantes, rotina.numero, urichedit, rotina.datahora, dialogo.exportarexcel, dialogo.progressbar,
  classe.email, orm.transportadora, orm.mdfe, classe.Registro, rotina.retornasql,
  classe.query, orm.empresa, classe.registrainformacao, classe.gerar, orm.usuario, orm.cte, classe.executasql,
  rotina.consiste, classe.form,
  orm.fornecedor, orm.serie, orm.Veiculo, orm.CTETransportadora,
  dxBar, cxClasses, cxGraphics, cxLookAndFeels, cxPC, cxControls, cxContainer,
  cxLookAndFeelPainters, cxEdit, cxGroupBox,
  cxSplitter, cxTreeView, xmldom,
  XMLIntf, msxmldom, XMLDoc, cxLabel, cxPCdxBarPopupMenu, FMTBcd, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, cxCheckBox,
  cxMemo, cxDBLabel, cxButtonEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView, cxCurrencyEdit,
  cxBlobEdit, cxSpinEdit, DBCtrls, cxTimeEdit, dxBevel, cxNavigator,
  dxBarBuiltInMenu, ACBrBase, ACBrDFe;

type
  Tfrmmdfe = class(TForm)
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
    actfechar: TAction;
    actnfe: TAction;
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
    dxbrlrgbtnimprimir: TdxBarLargeButton;
    dxbrsprtr3: TdxBarSeparator;
    dxbrlrgbtnfechar: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    btnmdfe: TdxBarLargeButton;
    actnfemenu: TAction;
    pumnfe: TdxBarPopupMenu;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    btnopcoes: TdxBarLargeButton;
    actopcoes: TAction;
    ACBrMDFe1: TACBrMDFe;
    actabrircte: TAction;
    actabrirfornecedor: TAction;
    actabrirresponsavel: TAction;
    actabrirtransportadora: TAction;
    actabrirveiculo: TAction;
    actstatus: TAction;
    actconfigurar: TAction;
    actvalidar: TAction;
    actenviar: TAction;
    actabrirveiculo2: TAction;
    actcancelarmdfe: TAction;
    actencerrar: TAction;
    dxBarButton2: TdxBarButton;
    actexportarxml: TAction;
    actgerarpdf: TAction;
    actenviaremail: TAction;
    actconsultar: TAction;
    pnltop: TPanel;
    lbltpmdfe: TLabel;
    cbxcdtpmdfe: TcxDBLookupComboBox;
    edtcodigo: TcxTextEdit;
    lblcodigo: TLabel;
    lbldtemissao: TLabel;
    edtdtemissao: TcxDBDateEdit;
    lblhremissao: TLabel;
    edthremissao: TcxDBTimeEdit;
    lblcduf: TLabel;
    cbxcduf: TcxDBLookupComboBox;
    lblCDMDFETPEMITENTE: TLabel;
    cbxCDMDFETPEMITENTE: TcxDBLookupComboBox;
    lblcdmdfemodalidade: TLabel;
    cbxCDMDFEMODALIDADE: TcxDBLookupComboBox;
    lblcdmdfeformaemissao: TLabel;
    cbxCDMDFEFORMAEMISSAO: TcxDBLookupComboBox;
    lblcdstmdfe: TLabel;
    txtnmstmdfe: TcxDBLabel;
    lblveiculo: TLabel;
    edtcdveiculo: TcxDBButtonEdit;
    lbl3: TLabel;
    edtcdciot: TcxDBTextEdit;
    lbl1: TLabel;
    cbxcdufinicio: TcxDBLookupComboBox;
    lbl2: TLabel;
    cbxcduffim: TcxDBLookupComboBox;
    pnl: TcxLabel;
    gbx1: TcxGroupBox;
    Label2: TLabel;
    lbl4: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txt1: TcxDBLabel;
    txt2: TcxDBLabel;
    edtvlcarga: TcxDBCalcEdit;
    cbxcdunidade: TcxDBLookupComboBox;
    edtqtcarga: TcxDBCalcEdit;
    pgc: TcxPageControl;
    tbscarregamento: TcxTabSheet;
    grdmdfecarregamento: TcxGrid;
    tbvmdfecarregamento: TcxGridDBTableView;
    tbvmdfecarregamentoCDMUNICIPIO: TcxGridDBColumn;
    lvlmdfecarregamento: TcxGridLevel;
    tbspercurso: TcxTabSheet;
    grdmdfeufpercurso: TcxGrid;
    tbvmdfeufpercurso: TcxGridDBTableView;
    tbvmdfeufpercursoCDUF: TcxGridDBColumn;
    lvlmdfeufpercurso: TcxGridLevel;
    tbsdocumento: TcxTabSheet;
    grdmdfedescarregamento: TcxGrid;
    tbvmdfedescarregamento: TcxGridDBTableView;
    tbvmdfedescarregamentoCDMUNICIPIO: TcxGridDBColumn;
    tbvmdfedescarregamentoQTCTE: TcxGridDBColumn;
    tbvmdfedescarregamentoQTNFE: TcxGridDBColumn;
    tbvmdfedescarregamentoVLCARGA: TcxGridDBColumn;
    tbvmdfedescarregamentoQTCARGA: TcxGridDBColumn;
    lvlmdfedescarregamento: TcxGridLevel;
    pgcdocumento: TcxPageControl;
    tbscte: TcxTabSheet;
    grdmdfecte: TcxGrid;
    tbvmdfecte: TcxGridDBTableView;
    tbvmdfecteCDCTE: TcxGridDBColumn;
    tbvmdfecteDTEMISSAO: TcxGridDBColumn;
    tbvmdfecteVLCARGA: TcxGridDBColumn;
    tbvmdfecteQTCARGA: TcxGridDBColumn;
    tbvmdfecteNUCHAVENFE: TcxGridDBColumn;
    lvlmdfecte: TcxGridLevel;
    tbsnfe: TcxTabSheet;
    grdmdfenfe: TcxGrid;
    tbvmdfenfe: TcxGridDBTableView;
    tbvmdfenfeNUCHAVENFE: TcxGridDBColumn;
    lvlmdfenfe: TcxGridLevel;
    spl1: TcxSplitter;
    cxLabel1: TcxLabel;
    tbsinfoadic: TcxTabSheet;
    lblnmstdocumento: TLabel;
    grdmdfelacre: TcxGrid;
    tbvmdfelacre: TcxGridDBTableView;
    tbvmdfelacreNULACRE: TcxGridDBColumn;
    lvlmdfelacre: TcxGridLevel;
    tbstransportadora: TcxTabSheet;
    grdmdfetransportadora: TcxGrid;
    tbvmdfetransportadora: TcxGridDBTableView;
    tbvmdfetransportadoraCDTRANSPORTADORA: TcxGridDBColumn;
    tbvmdfetransportadoraNMTRANSPORTADORA: TcxGridDBColumn;
    tbvmdfetransportadoraNUCPF: TcxGridDBColumn;
    lvlmdfetransportadora: TcxGridLevel;
    tbsreboque: TcxTabSheet;
    grdmdfeveiculo: TcxGrid;
    tbvmdfeveiculo: TcxGridDBTableView;
    tbvmdfeveiculoCDVEICULO: TcxGridDBColumn;
    tbvmdfeveiculoNUPLACA: TcxGridDBColumn;
    lvlmdfeveiculo: TcxGridLevel;
    tbspedagio: TcxTabSheet;
    grdmdfepedagio: TcxGrid;
    tbvmdfepedagio: TcxGridDBTableView;
    tbvmdfepedagioCDFORNECEDOR: TcxGridDBColumn;
    tbvmdfepedagioNMFORNECEDOR: TcxGridDBColumn;
    tbvmdfepedagioNUCOMPROVANTE: TcxGridDBColumn;
    tbvmdfepedagioCDRESPONSAVEL: TcxGridDBColumn;
    tbvmdfepedagioNMRESPONSAVEL: TcxGridDBColumn;
    lvlmdfepedagio: TcxGridLevel;
    ACBrMail1: TACBrMail;
    actenviaremailremetente: TAction;
    dxBarButton1: TdxBarButton;
    actImportarXML: TAction;
    dxBarButton4: TdxBarButton;
    tbsObservacao: TcxTabSheet;
    memdsobservacao: TcxDBMemo;
    Label1: TLabel;
    cbxtptransp: TcxDBLookupComboBox;
    tbvmdfecteINDREENTREGA: TcxGridDBColumn;
    tbvmdfenfeINDREENTREGA: TcxGridDBColumn;
    tbsseguradora: TcxTabSheet;
    txtnmfornecedor: TDBText;
    edtcdfornecedor: TcxDBButtonEdit;
    Label13: TLabel;
    lblnuapolice: TLabel;
    edtNAPOL: TcxDBTextEdit;
    edtnuaver: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cbxCDMDFERESPSEG: TcxDBLookupComboBox;
    actmdfeautxml: TAction;
    pumopcoes: TdxBarPopupMenu;
    dxBarButton5: TdxBarButton;
    edtnucnpjcpf: TcxDBTextEdit;
    Label8: TLabel;
    tbvmdfepedagioVVALEPED: TcxGridDBColumn;
    procedure actAbrirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actfecharExecute(Sender: TObject);
    procedure actnfeExecute(Sender: TObject);
    procedure actopcoesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure colorexit(Sender: TObject);
    procedure colorenter(Sender: TObject);
    procedure edtcdveiculoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsmdfecarregamentoNewRecord(DataSet: TDataSet);
    procedure grdmdfecteDBTableView1CDCTEPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actabrircteExecute(Sender: TObject);
    procedure tbvmdfecteCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure grdmdfepedagioDBTableView1CDFORNECEDORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure grdmdfepedagioDBTableView1CDRESPONSAVELPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actabrirfornecedorExecute(Sender: TObject);
    procedure actabrirresponsavelExecute(Sender: TObject);
    procedure tbvmdfepedagioCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure grdmdfetransportadoraDBTableView1CDTRANSPORTADORAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbvmdfetransportadoraCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actabrirtransportadoraExecute(Sender: TObject);
    procedure grdmdfeveiculoDBTableView1CDVEICULOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbvmdfeveiculoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actabrirveiculoExecute(Sender: TObject);
    procedure cdsmdfecarregamentoCDMUNICIPIOValidate(Sender: TField);
    procedure cdsmdfedescarregamentoCDMUNICIPIOValidate(Sender: TField);
    procedure actnfemenuExecute(Sender: TObject);
    procedure actstatusExecute(Sender: TObject);
    procedure actconfigurarExecute(Sender: TObject);
    procedure actvalidarExecute(Sender: TObject);
    procedure actenviarExecute(Sender: TObject);
    procedure cdsmdfeufpercursoCDUFValidate(Sender: TField);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblveiculoDblClick(Sender: TObject);
    procedure actabrirveiculo2Execute(Sender: TObject);
    procedure actcancelarmdfeExecute(Sender: TObject);
    procedure actencerrarExecute(Sender: TObject);
    procedure actexportarxmlExecute(Sender: TObject);
    procedure actgerarpdfExecute(Sender: TObject);
    procedure edtcdveiculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfecteEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure tbvmdfetransportadoraEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure tbvmdfeveiculoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure tbvmdfepedagioEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure tbvmdfecarregamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfeufpercursoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfedescarregamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfecteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfenfeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfelacreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfetransportadoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfeveiculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbvmdfepedagioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actenviaremailExecute(Sender: TObject);
    procedure actconsultarExecute(Sender: TObject);
    procedure actenviaremailremetenteExecute(Sender: TObject);
    procedure actImportarXMLExecute(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdfornecedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actmdfeautxmlExecute(Sender: TObject);
  private      { Private declarations }
    boinsert : boolean;
    email : TEmail_;
    procedure Consultar_MDFe;
    procedure LerConfiguracao;
    function  Loadmdfe:boolean;
    procedure encerrar_mdfe(nuprotocolo, retornoXml:string);
    procedure get_municipio_carregamento(cdembarque:string);
    procedure get_informacao_documento(cdembarque:string);
    procedure AbrirTabelas;
    procedure ConsistirSalvar;
  public  { Public declarations }
    function  Abrir(codigo:integer):boolean;
    function  Novo(cdembarque:string):Boolean;
    class procedure ExibirMain(main : TMain);
  end;

var
  frmmdfe : Tfrmmdfe;

implementation

uses UMain,
  uDtmMain,
  ulocalizar,
  localizar.fornecedor,
  uacbr,
  dialogo.xmltotreeview, Impressao.relatoriopadrao,
  localizar.veiculo, localizar.cte, pmdfeMDFe,
  dialogo.InfNumIntervencao,
  ACBrMDFeWebServices,
  pmdfeRetConsReciMDFe,
  acbr.mdfereport,
  acbr.cartacorrecao,
  acbr.ACBR;

{$R *.DFM}

function Tfrmmdfe.Abrir(codigo:integer):boolean;
begin
  result := dmMdfe.registro.RegistroAbrir(codigo);
end;

procedure Tfrmmdfe.actAbrirExecute(Sender: TObject);
begin
  dmMdfe.registro.Abrir;
end;

procedure Tfrmmdfe.actNovoExecute(Sender: TObject);
begin
  dmMdfe.registro.Novo(sender);
  cbxcdtpmdfe.SetFocus;
  boinsert := true;
end;

procedure Tfrmmdfe.actSalvarExecute(Sender: TObject);
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  ConsistirSalvar;
  dmMdfe.dts.OnStateChange := nil;
  if not dmMdfe.registro.aplicar_atualizacao then
  begin
    Exit;
  end;
  if ((dmMdfe.cds.State = dsedit) or (dmMdfe.cds.State = dsinsert)) and (not dmMdfe.registro.aplicar_atualizacao) then
  begin
    Exit;
  end;
  dmMdfe.dts.OnStateChange := dmMdfe.dtsStateChange;
  dmMdfe.Registro.RegistroAbrir(dmMdfe.cdscdmdfe.asinteger);
  boinsert := false;
  dmMdfe.registro.set_grade_item(self, false);
end;

procedure Tfrmmdfe.actExcluirExecute(Sender: TObject);
var
  numdfe, cdserie, codigo : integer;
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  if dmMdfe.cdsnumdfe.asstring <> edtcodigo.text then
  begin
    if messagedlg('No momento está aberto o registro '+dmMdfe.cdsnumdfe.asstring+#13' você gostaria de abrir registro '+edtcodigo.text+' para exclusão?', mtConfirmation, [mbyes, mbno], 0) = mrno then
    begin
      edtcodigo.Text := dmMdfe.cdsnumdfe.asstring;
      exit;
    end;
    codigo := dmMdfe.mdfe.CodigoMDFE(edtcodigo.text);
    if codigo = -1 then
    begin
      edtcodigo.text := dmMdfe.cdsnumdfe.asstring;
      exit;
    end;
    if not abrir(codigo) then
    begin
      if messagedlg('Código '+edtcodigo.text+' inexistente na tabela '+dmmdfe.exibe+'.'#13'Deseja inserí-lo?', mtConfirmation, [mbyes, mbno], 0) = mrno then
      begin
        edtcodigo.text := dmMdfe.cdsnumdfe.asstring;
        exit;
      end;
      actNovoExecute(sender);
    end;
    edtcodigo.selectall;
  end;
  if not dmMdfe.registro.RegistroAbrir(dmMdfe.cdscdmdfe.asinteger) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [dmMdfe.cdscdmdfe.asstring, qstring.maiuscula(_mdfe)]), mterror, [mbok], 0);
    exit;
  end;
  if not dmMdfe.registro.RegistroAbrir(dmMdfe.cdscdmdfe.asinteger) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [dmMdfe.cdscdmdfe.asstring, qstring.maiuscula(_mdfe)]), mterror, [mbok], 0);
    exit;
  end;
  numdfe := dmMdfe.cdsnumdfe.AsInteger-1;
  cdserie := dmMdfe.cdscdserie.asinteger;
  if dmMdfe.registro.Excluir then
  begin
    Tserie.Voltar_Numero_Serie(numdfe, cdserie);
  end;
end;

procedure Tfrmmdfe.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure Tfrmmdfe.actCancelarExecute(Sender: TObject);
begin
  if boinsert then
  begin
    tserie.voltar_Numero_serie(dmMdfe.cdsnumdfe.AsInteger-1, dmMdfe.cdscdserie.asInteger);
  end;
  dmMdfe.registro.Cancelar;
end;

procedure Tfrmmdfe.actEditarExecute(Sender: TObject);
begin
  dmMdfe.registro.Editar;
end;

procedure Tfrmmdfe.FormShow(Sender: TObject);
begin
  AbrirTabelas;
  pnl.caption        := dmmdfe.exibe;
  lerconfiguracao;
  ACBrMDFe1.Configuracoes.Arquivos.PathSchemas := ExtractFilePath(Application.ExeName)+'Schemasmdfe';
  edtCodigo.SetFocus;
end;

procedure Tfrmmdfe.actImportarXMLExecute(Sender: TObject);
var
  opd : topendialog;
  arquivo : TStrings;
  texto : TStringStream;
begin
  opd     := topendialog.Create(nil);
  arquivo := TStringList.Create;
  texto   := TStringStream.Create('');
  try
    opd.Title      := 'Selecione a MDF-e';
    opd.DefaultExt := '*.XML';
    opd.Filter     := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    if not opd.Execute then
    begin
      exit;
    end;
    ACBrMDFe1.Manifestos.Clear;
    arquivo.LoadFromFile(opd.FileName);
    texto.WriteString(UTF8Encode(arquivo.text));
    ACBrMDFe1.Manifestos.LoadFromStream(texto);
    // selecionar o arquivo xml
    // carregar no acbr
    // verificar se o xml é autorizado
    if ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.chMDFe = '' then
    begin
      messagedlg('XML não está autorizado.', mtinformation, [mbok], 0);
      abort;
    end;
    // verificar se é do mesmo emitente
    if ACBrMDFe1.Manifestos.Items[0].MDFe.emit.CNPJ <> empresa.nucnpj_ then
    begin
      messagedlg('XML não pertence ao emitente.', mtinformation, [mbok], 0);
      abort;
    end;
    // verificar número
    dmMdfe.mdfe.dsxml                  := ACBrMDFe1.Manifestos.Items[0].XML;
    dmMdfe.mdfe.nuchavenfe             := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.chMDFe;
    dmMdfe.mdfe.nuprotocoloautorizacao := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt;
    dmMdfe.mdfe.tsprotocoloautorizacao := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.dhRecbto;
    dmMdfe.mdfe.cdstmdfe                := 2;
    dmMdfe.mdfe.Update;
    Abrir(dmMdfe.cdsCDMDFE.AsInteger);
  finally
    freeandnil(opd);
    freeandnil(arquivo);
    freeandnil(texto);
  end;
end;

procedure Tfrmmdfe.actImprimirExecute(Sender: TObject);
begin
  if ACBrMDFe1.Manifestos.Count < 1 then
  begin
    Loadmdfe;
  end;
  if ACBrMDFe1.Manifestos.Count > 0 then
  begin
    mdfe_imprimir(ACBrMDFe1, dmMdfe.cdsCDSTMDFE.asstring = _3);
  end;
end;

procedure Tfrmmdfe.actmdfeautxmlExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_mdfeautxml, dmMdfe.cds.FieldByName(_cdmdfe).AsInteger, _cdmdfe);
end;

procedure Tfrmmdfe.actPrimeiroExecute(Sender: TObject);
begin
  dmMdfe.registro.Primeiro;
end;

procedure Tfrmmdfe.actAnteriorExecute(Sender: TObject);
begin
  dmMdfe.registro.Anterior;
end;

procedure Tfrmmdfe.actProximoExecute(Sender: TObject);
begin
  dmMdfe.registro.Proximo;
end;

procedure Tfrmmdfe.actUltimoExecute(Sender: TObject);
begin
  dmMdfe.registro.Ultimo;
end;

procedure Tfrmmdfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrmmdfe.FormDestroy(Sender: TObject);
begin
  freeandnil(dmmdfe);
  freeandnil(email);
end;

procedure Tfrmmdfe.actfecharExecute(Sender: TObject);
var
  numdfe : Integer;
  cdserie : integer;
begin
  numdfe := dmMdfe.cdsnumdfe.AsInteger;
  cdserie := dmMdfe.cdscdserie.asinteger;
  if FinalizarTransacao(dmMdfe.cds) = mrcancel then
  begin
    exit;
  end;
  if boinsert then
  begin
    tserie.voltar_Numero_serie(numdfe-1, cdserie);
  end;
  close;
  frmmain.main.DestruirBotaoFormAtual(_mdfe, frmmain.tlbnew);
end;

procedure Tfrmmdfe.actnfeExecute(Sender: TObject);
begin
//
end;

procedure Tfrmmdfe.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure Tfrmmdfe.FormCreate(Sender: TObject);
begin
  email := temail_.Create;
  dmMdfe := TdmMdfe.Create(nil);
  dmMdfe.registro := tregistro.create(self, _mdfe, dmMdfe.exibe, _a, dmMdfe.cds, dmMdfe.dts, edtcodigo, true);
end;

procedure Tfrmmdfe.edtcodigoExit(Sender: TObject);
begin
  if (edtcodigo.Text <> '') and (dmMdfe.cds.state = dsinsert) and (not dmMdfe.cdscdmdfe.IsNull) and
    (not dmMdfe.cdscdserie.IsNull) and
     (RetornaSQLInteger('select count(*) '+
                        'from mdfe '+
                        'where cdempresa='+empresa.cdempresa.tostring+' '+
                        'and numdfe='+edtcodigo.Text+' '+
                        'and cdmdfe<>'+dmMdfe.cdscdmdfe.asstring+' '+
                        'and cdserie='+dmMdfe.cdscdserie.asstring) > 0) then
  begin
    edtCodigo.SetFocus;
    messagedlg('Número de MDFE duplicado!', mtInformation, [mbOK], 0);
    Abort;
  end;
  colorexit(sender);
end;

procedure Tfrmmdfe.edtcodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  dmmdfe.registro.ExibirInformacaoRegistro(dmMdfe.cds, key);
end;

procedure Tfrmmdfe.edtcodigoKeyPress(Sender: TObject; var Key: Char);
var
  codigo : integer;
begin
  QForm.KeyPressControl(key);
  if not ((key = #13) and (TEdit(sender).text <> '')) then
  begin
    exit;
  end;
  if (dmMdfe.cds.state = dsinsert) or (dmMdfe.cds.state = dsedit) then
  begin
    dmMdfe.cdscdmdfe.focuscontrol;
    exit;
  end;
  codigo := dmMdfe.mdfe.CodigoMDFE(edtcodigo.text);
  if codigo = -1 then
  begin
    edtcodigo.clear;
    exit;
  end;
  if not dmMdfe.registro.RegistroAbrir(codigo) then
  begin
    if actnovo.Enabled then
    begin
      if messagedlg('Código '+edtcodigo.text+' inexistente na tabela '+dmMdfe.exibe+'.'#13'Deseja inserí-lo?', mtConfirmation, [mbyes, mbno], 0) = mryes then
      begin
        actNovoExecute(sender)
      end
      else
      begin
        edtcodigo.text := dmMdfe.cdsnumdfe.asstring;
      end;
    end
    else
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [codigo.ToString, qstring.maiuscula(_mdfe)]), mterror, [mbok], 0);
      edtcodigo.text := dmMdfe.cdscdmdfe.asstring;
    end;
  end;
  edtcodigo.selectall;
end;

procedure Tfrmmdfe.encerrar_mdfe(nuprotocolo, retornoXml:string);
begin
  dmMdfe.cds.DisableControls;
  dmMdfe.cds.ReadOnly := False;
  try
    dmMdfe.cds.edit;
    dmMdfe.cdsnuprotocoloencerramento.asstring := nuprotocolo;
    dmMdfe.cdsdsxmlencerramento.asstring       := retornoXml;
    dmMdfe.cdsCDSTMDFE.AsString                := _4;
    dmMdfe.cdsdtencerramento.asdatetime        := DtBanco;
    if not dmMdfe.registro.aplicar_atualizacao then
    begin
      Exit;
    end;
  finally
    dmMdfe.cds.EnableControls;
    dmMdfe.cds.ReadOnly := True;
  end;
end;

class procedure Tfrmmdfe.ExibirMain(main : TMain);
begin
  if main.processarabertura(_frm+_mdfe) then
  begin
    exit;
  end;
  if not QForm.ExisteFormulario(_frm+_mdfe) then
  begin
    frmmdfe := Tfrmmdfe.Create(frmMain);
  end;
  tmain.set_merge(frmMain.bmg, frmMain.bmg1, frmmdfe.bmg1);
  main.configform(frmmdfe, frmMain.tlbnew, dmmdfe.registro);
end;

procedure Tfrmmdfe.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure Tfrmmdfe.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure Tfrmmdfe.edtcdveiculoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd: integer;
begin
  cd := localizarveiculo;
  if cd <> 0 then
  begin
    dmMdfe.cdsCDVEICULO.AsInteger := cd;
  end;
end;

procedure Tfrmmdfe.cdsmdfecarregamentoNewRecord(DataSet: TDataSet);
begin
  if cbxcdufinicio.Text = '' then
  begin
    MessageDlg('UF de Carregamento não está preenchido.', mtInformation, [mbOK], 0);
    cbxcdufinicio.SetFocus;
    abort;
  end;
end;

procedure Tfrmmdfe.grdmdfecteDBTableView1CDCTEPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(dmmdfe.cdsmdfecte, _cte, _cdcte, false);
end;

procedure Tfrmmdfe.actabrircteExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmmdfe.cds, dmmdfe.cdsmdfecte);
end;

procedure Tfrmmdfe.tbvmdfecteCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _CDCTE then
  begin
    actabrircte.onExecute(actabrircte);
  end;
end;

procedure Tfrmmdfe.grdmdfepedagioDBTableView1CDFORNECEDORPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(dmMdfe.cdsmdfepedagio, _fornecedor, _cd+_fornecedor, false);
end;

procedure Tfrmmdfe.grdmdfepedagioDBTableView1CDRESPONSAVELPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(dmMdfe.cdsmdfepedagio, _fornecedor, _cd+_responsavel, false);
end;

procedure Tfrmmdfe.actabrirfornecedorExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmMdfe.cds, dmMdfe.cdsmdfepedagio);
end;

procedure Tfrmmdfe.actabrirresponsavelExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmMdfe.cds, dmMdfe.cdsmdfepedagio, _cd+_responsavel, true);
end;

procedure Tfrmmdfe.tbvmdfepedagioCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cdfornecedor then
  begin
    actabrirfornecedor.onExecute(actabrirfornecedor)
  end
  else if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cd+_responsavel then
  begin
    actabrirresponsavel.onExecute(actabrirresponsavel);
  end;
end;

procedure Tfrmmdfe.grdmdfetransportadoraDBTableView1CDTRANSPORTADORAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(dmMdfe.cdsmdfetransportadora, _transportadora, _cdtransportadora, false);
end;

procedure Tfrmmdfe.tbvmdfetransportadoraCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cdtransportadora then
  begin
    actabrirtransportadora.onExecute(actabrirtransportadora)
  end;
end;

procedure Tfrmmdfe.actabrirtransportadoraExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmMdfe.cds, dmMdfe.cdsmdfetransportadora);
end;

procedure Tfrmmdfe.grdmdfeveiculoDBTableView1CDVEICULOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  tregistro.ButtonEdit(dmMdfe.cdsmdfeveiculo, _veiculo, _cd+_veiculo, false);
end;

procedure Tfrmmdfe.tbvmdfeveiculoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cdveiculo then actabrirveiculo.onExecute(actabrirveiculo)
end;

procedure Tfrmmdfe.actabrirveiculoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmMdfe.cds, dmMdfe.cdsmdfeveiculo);
end;

procedure Tfrmmdfe.cdsmdfecarregamentoCDMUNICIPIOValidate(Sender: TField);
var
  nmmunicipio, sguf : string;
begin
  if Sender.AsString = '' then
  begin
    exit;
  end;
  sguf := NomedoCodigo(_uf, NomedoCodigo(_municipio, sender.AsString, _cduf), _sguf);
  if sguf <> cbxcdufinicio.Text then
  begin
    nmmunicipio := NomedoCodigo(_municipio, sender.AsString);
    MessageDlg('Cidade '+nmmunicipio+' ('+sguf+') não pertence a UF '+cbxcdufinicio.Text+' de Carregamento.', mtinformation, [mbOK], 0);
    sender.FocusControl;
    Abort;
  end;
end;

procedure Tfrmmdfe.cdsmdfedescarregamentoCDMUNICIPIOValidate(Sender: TField);
var
  nmmunicipio, sguf : string;
begin
  if Sender.AsString = '' then
  begin
    exit;
  end;
  sguf := NomedoCodigo(_uf, NomedoCodigo(_municipio, sender.AsString, _cduf), _sguf);
  if sguf <> cbxcduffim.Text then
  begin
    nmmunicipio := NomedoCodigo(_municipio, sender.AsString);
    MessageDlg('Cidade '+nmmunicipio+' ('+sguf+') não pertence a UF '+cbxcduffim.Text+' de Carregamento.', mtinformation, [mbOK], 0);
    sender.FocusControl;
    Abort;
  end;
end;

procedure Tfrmmdfe.actnfemenuExecute(Sender: TObject);
begin
  btnmdfe.DropDown(false);
end;

procedure Tfrmmdfe.actstatusExecute(Sender: TObject);
begin
  ACBrMDFe1.WebServices.StatusServico.Executar;
  MessageDlg(ACBrMDFe1.WebServices.StatusServico.xMotivo, mtInformation, [mbOK], 0);
end;

procedure Tfrmmdfe.actconfigurarExecute(Sender: TObject);
begin
  if dlgsetNFEAcbr then
  begin
    LerConfiguracao;
  end;
end;

procedure Tfrmmdfe.LerConfiguracao;
begin
  ACBR.ACBR.acbr.LerConfiguracao;
  ACBR.ACBR.acbr.AplicarConfiguracao(ACBrMDFe1);
  ACBR.ACBR.acbr.aplicarEmail(acbrmail1, email);
end;

procedure Tfrmmdfe.actvalidarExecute(Sender: TObject);
begin
  TMDFEGerar.Gerar(dmMdfe.mdfe, acbrmdfe1);
  ACBrMDFe1.Manifestos.Assinar;
  ACBrMDFe1.Manifestos.Validar;
  Exibir_chave_nfe(dmmdfe.exibe, dmMdfe.cdsnumdfe.asstring, ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID);
end;

procedure Tfrmmdfe.actenviarExecute(Sender: TObject);
  procedure gerar_numero_lote;
  begin
    dmMdfe.mdfe.nulote := qgerar.GerarCodigo(_numlote);
    dmMdfe.mdfe.Update;
  end;
  procedure RegistrarEnviado;
  begin
    dmMdfe.mdfe.cdstmdfe := 99;
    dmMdfe.mdfe.Update;
  end;
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  TMDFEGerar.Gerar(dmMdfe.mdfe, ACBrMDFe1);
  gerar_numero_lote;
  RegistrarEnviado;
  try
    if ACBrMDFe1.Enviar(dmMdfe.mdfe.nulote) then
    begin
      dmMdfe.mdfe.dsxml := ACBrMDFe1.Manifestos.Items[0].XML;
      dmMdfe.mdfe.nuchavenfe := ACBrMDFe1.WebServices.Retorno.MDFeRetorno.ProtMDFe.Items[0].chMDFe;
      dmMdfe.mdfe.nuprotocoloautorizacao := ACBrMDFe1.WebServices.Retorno.MDFeRetorno.ProtMDFe.Items[0].nProt;
      dmMdfe.mdfe.tsprotocoloautorizacao := ACBrMDFe1.WebServices.Retorno.MDFeRetorno.ProtMDFe.Items[0].dhRecbto;
      dmMdfe.mdfe.nurecibonfe := ACBrMDFe1.WebServices.Retorno.MDFeRetorno.nRec;
      dmMdfe.mdfe.cdstmdfe := 2;
      dmMdfe.mdfe.Update;
      MDFE_imprimir(ACBrMDFe1, dmMdfe.cdsCDSTMDFE.asstring = _3);
    end;
  except
    if (ACBrMDFe1.WebServices.Retorno.cStat = 578) or
       (ACBrMDFe1.WebServices.Retorno.cStat = 698) then
    begin
      dmMdfe.mdfe.cdstmdfe := 1;
      dmMdfe.mdfe.Update;
      Abrir(dmMdfe.cdsCDMDFE.asinteger);
    end;
    if ACBrMDFe1.WebServices.Retorno.cStat = 539 then
    begin
      if messagedlg('Rejeicao: Duplicidade de MDF-e, com diferença na Chave de Acesso.'#13+
                    'Foi enviado a chave '+ACBrMDFe1.WebServices.Retorno.ChaveMDFe+#13+
                    'mas na receita está  '+copy(ACBrMDFe1.WebServices.Retorno.xMotivo, 75, 44)+'.'#13+
                    'Realizar download do XML no site da receita?', mtinformation, [mbyes, mbno], 0) = mryes then
      begin
        Clipboard.AsText := copy(ACBrMDFe1.WebServices.Retorno.xMotivo, 75, 44);
        ShellExecute(Handle, _open, 'https://mdfe-portal.sefaz.rs.gov.br/SiteSSL/DownloadXMLMDFe', Nil, Nil, SW_SHOWDEFAULT);
      end;
    end
    else
    begin
      raise EACBrDFeException.CreateDef(ACBrMDFe1.WebServices.Retorno.cStat.tostring+' - '+ACBrMDFe1.WebServices.Retorno.xMotivo);
    end;
  end;
  Abrir(dmMdfe.cdsCDMDFE.asinteger);
end;

function Tfrmmdfe.Loadmdfe:boolean;
begin
  result := False;
  ACBrMDFe1.Manifestos.Clear;
  if dmMdfe.cdsDSXML.asstring = '' then
  begin
    if dmMdfe.cdsCDSTMDFE.asstring = _1 then
    begin
      result := True;
    end;
    Exit;
  end;
  ACBrMDFe1.Manifestos.LoadFromString(dmMdfe.cdsDSXML.asstring, true);
  result := True;
  actnfe.Enabled           := (not result) and (dmMdfe.cds.RecordCount > 0);
  actnfe.Visible           := (not result) and (dmMdfe.cds.RecordCount > 0);
  if result then
  begin
    actEditar.Enabled  := false;
  end;
end;

procedure Tfrmmdfe.cdsmdfeufpercursoCDUFValidate(Sender: TField);
begin
  if Sender.AsString = dmMdfe.cdsCDUFINICIO.AsString then
  begin
    MessageDlg('UF do percurso não pode ser igual a UF de Carregamento.', mtinformation, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  if Sender.AsString = dmMdfe.cdsCDUFFIM.AsString then
  begin
    MessageDlg('UF do percurso não pode ser igual a UF de Descarregamento.', mtinformation, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
end;

procedure Tfrmmdfe.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure Tfrmmdfe.lblveiculoDblClick(Sender: TObject);
begin
  actabrirveiculo2Execute(actabrirveiculo2);
end;

procedure Tfrmmdfe.actabrirveiculo2Execute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), dmmdfe.cds, dmmdfe.cds);
end;

procedure Tfrmmdfe.actcancelarmdfeExecute(Sender: TObject);
var
  idLote, Justificativa : String;
begin
  if empresa.get_bloqueado or (messagedlg('Tem certeza que deseja cancelar o MDFE '+dmmdfe.cdsnumdfe.asstring+'?', mtconfirmation, [mbyes,mbno], 0) = mrno) then
  begin
    exit;
  end;
  if not GerarCartaCorrecao(Justificativa) then
  begin
    exit;
  end;
  Loadmdfe;
  idLote := _1;
  ACBrMDFe1.EventoMDFe.Evento.Clear;
  with ACBrMDFe1.EventoMDFe.Evento.Add do
  begin
    infEvento.chMDFe          := Copy(ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID, 5, 44);
    infEvento.CNPJ            := empresa.nucnpj_;
    infEvento.dhEvento        := tsBanco;
    infEvento.tpEvento        := teCancelamento;
    infEvento.nSeqEvento      := dmmdfe.cdsNUSEQEVENTO.AsInteger + 1;
    infEvento.detEvento.nProt := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt;
    infEvento.detEvento.xJust := trim(Justificativa);
  end;
  if not ACBrMDFe1.EnviarEvento(StrToInt(idLote)) then
  begin
    MessageDlg('Não foi possível enviar o cancelamento do mdfe.', mtInformation, [mbOK], 0);
    abort;
  end;
  if ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat = 135 then
  begin
    dmMdfe.mdfe.Cancelar(Justificativa, ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.InfEvento.detEvento.nProt, ACBrMDFe1.WebServices.EnvEvento.RetWS);
  end;
  MessageDlg('Status: '+inttostr(ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat)+' - '+ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo, mtInformation, [mbOK], 0);
  Abrir(dmmdfe.cdscdmdfe.asinteger);
end;

procedure Tfrmmdfe.actencerrarExecute(Sender: TObject);
var
  idLote : String;
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  if (empresa.faturamento.mdfe.nudiasencerramento > 0) and (DaysBetween(dmmdfe.cdsDTEMISSAO.AsDateTime, DtBanco) <= empresa.faturamento.mdfe.nudiasencerramento)  then
  begin
    messagedlg('MDFE só pode ser encerrado a partir da data '+FormatDateTime(_dd__mm__yyyy, dmmdfe.cdsDTEMISSAO.AsDateTime + empresa.faturamento.mdfe.nudiasencerramento)+'.', mtinformation, [mbok], 0);
    exit;
  end;
  if messagedlg('Tem certeza que deseja encerrar o MDFE '+dmmdfe.cdsnumdfe.asstring+'?'#13'Após encerrar não poderá cancelar o MDFE e nem o CTE.', mtconfirmation, [mbyes,mbno], 0) = mrno then
  begin
    exit;
  end;

  Loadmdfe;

  idLote := _1;
  ACBrMDFe1.EventoMDFe.Evento.Clear;

  with ACBrMDFe1.EventoMDFe.Evento.Add do
  begin
    infEvento.chMDFe          := Copy(ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID, 5, 44);
    infEvento.CNPJ            := empresa.nucnpj_;
    infEvento.dhEvento        := tsBanco;
    infEvento.tpEvento        := teEncerramento;
    infEvento.nSeqEvento      := dmmdfe.cdsNUSEQEVENTO.AsInteger + 1;
    infEvento.detEvento.nProt := ACBrMDFe1.Manifestos.Items[0].MDFe.procMDFe.nProt;
    infEvento.detEvento.dtEnc := DtBanco;
    infEvento.detEvento.cUF   := StrToInt(Copy(IntToStr(ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga),1,2));
    infEvento.detEvento.cMun  := ACBrMDFe1.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga;
  end;

  if not ACBrMDFe1.EnviarEvento(StrToInt(idLote)) then
  begin
    MessageDlg('Não foi possível enviar o encerramento do mdfe.', mtInformation, [mbOK], 0);
    abort;
  end;
  if ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat = 135 then
  begin
    encerrar_mdfe(ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.InfEvento.detEvento.nProt, ACBrMDFe1.WebServices.EnvEvento.RetWS);
  end;
  MessageDlg('Status: '+inttostr(ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat)+' - '+ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo, mtInformation, [mbOK], 0);
  Abrir(dmmdfe.cdscdmdfe.asinteger);
end;

procedure Tfrmmdfe.actexportarxmlExecute(Sender: TObject);
var
  arquivo : tstrings;
  diretorio : string;
begin
  if dmmdfe.cdsdsxml.IsNull and (ACBrMDFe1.Manifestos.Count = 0) then
  begin
    messagedlg('Não há MDF-e para ser exportada.', mtInformation, [mbok], 0);
    exit;
  end;
  arquivo := tstringlist.create;
  try
    diretorio := QRotinas.getdiretorio;
    if diretorio = '' then
    begin
      exit;
    end;
    if ACBrMDFe1.Manifestos.Count > 0 then
    begin
      arquivo.Text := ACBrMDFe1.Manifestos.Items[0].XML
    end
    else
    begin
      arquivo.Text := dmmdfe.cdsdsxml.asstring;
    end;
    if dmmdfe.cdsnuchavenfe.asstring <> '' then
    begin
      arquivo.SaveToFile(diretorio+'\'+dmmdfe.cdsnuchavenfe.asstring+'.'+_xml)
    end
    else
    begin
      arquivo.SaveToFile(diretorio+'\'+dmmdfe.cdsnumdfe.asstring+'.'+_xml);
    end;
    messagedlg(_msg_Exportacao_concluida, mtInformation, [mbok], 0);
  finally
    freeandnil(arquivo);
  end;
end;

procedure Tfrmmdfe.actgerarpdfExecute(Sender: TObject);
begin
  if ACBrMDFe1.Manifestos.Count < 1 then
  begin
    Loadmdfe;
  end;
  if MDFE_GerarPDF(ACBrMDFe1) then
  begin
    messagedlg('Gerado PDF com sucesso.', mtinformation, [mbok], 0);
  end;
end;

procedure Tfrmmdfe.edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedorPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure Tfrmmdfe.edtcdfornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure Tfrmmdfe.edtcdfornecedorPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  QForm.edtcdfornecedorPropertiesButtonClick(self, dmmdfe.cds);
end;

procedure Tfrmmdfe.edtcdveiculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdveiculoPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure Tfrmmdfe.tbvmdfecteEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    if LowerCase(AItem.DataBinding.FilterFieldName) = _cdcte then
    begin
      grdmdfecteDBTableView1CDCTEPropertiesButtonClick(tbvmdfecteCDCTE, 0);
    end;
  end;
end;

procedure Tfrmmdfe.tbvmdfetransportadoraEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    if LowerCase(AItem.DataBinding.FilterFieldName) = _cdtransportadora then
    begin
      grdmdfetransportadoraDBTableView1CDTRANSPORTADORAPropertiesButtonClick(tbvmdfetransportadoraCDTRANSPORTADORA, 0);
    end;
  end;
end;

procedure Tfrmmdfe.tbvmdfeveiculoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    if LowerCase(AItem.DataBinding.FilterFieldName) = _cdveiculo then
    begin
      grdmdfeveiculoDBTableView1CDVEICULOPropertiesButtonClick(tbvmdfeveiculoCDVEICULO, 0);
    end;
  end;
end;

procedure Tfrmmdfe.tbvmdfepedagioEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    if LowerCase(AItem.DataBinding.FilterFieldName) = _cdfornecedor then
    begin
      grdmdfepedagioDBTableView1CDFORNECEDORPropertiesButtonClick(tbvmdfepedagioCDFORNECEDOR, 0);
    end;
    if LowerCase(AItem.DataBinding.FilterFieldName) = _cd+_responsavel then
    begin
      grdmdfepedagioDBTableView1CDRESPONSAVELPropertiesButtonClick(tbvmdfepedagioCDRESPONSAVEL, 0);
    end;
  end;
end;

procedure Tfrmmdfe.tbvmdfecarregamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfecarregamento, key);
end;

procedure Tfrmmdfe.tbvmdfeufpercursoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfeufpercurso, key);
end;

procedure Tfrmmdfe.tbvmdfedescarregamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfedescarregamento, key);
end;

procedure Tfrmmdfe.tbvmdfecteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfecte, key);
end;

procedure Tfrmmdfe.tbvmdfenfeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfenfe, key);
end;

procedure Tfrmmdfe.tbvmdfelacreKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfelacre, key);
end;

procedure Tfrmmdfe.tbvmdfetransportadoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfetransportadora, key);
end;

procedure Tfrmmdfe.tbvmdfeveiculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfeveiculo, key);
end;

procedure Tfrmmdfe.tbvmdfepedagioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel(Key, sender);
  tregistro.ExibirInformacaoRegistro(dmmdfe.cdsmdfepedagio, key);
end;

procedure Tfrmmdfe.actenviaremailExecute(Sender: TObject);
begin
  if not Loadmdfe then
  begin
    MessageDlg('MDF-e inexistente.'#13'Não é possível enviar e-mail.', mtInformation, [mbOK], 0);
    Exit;
  end;
  MDFE_enviar_email(ACBrMDFe1, email);
end;

procedure Tfrmmdfe.actenviaremailremetenteExecute(Sender: TObject);
begin
  if not Loadmdfe then
  begin
    MessageDlg('MDF-e inexistente.'#13'Não é possível enviar e-mail.', mtInformation, [mbOK], 0);
    Exit;
  end;
  MDFE_enviar_email(ACBrMDFe1, email, dmMdfe.mdfe.ListaEmailRemetenteCTE);
end;

procedure Tfrmmdfe.actconsultarExecute(Sender: TObject);
var
  nuchave : string;
begin
  nuchave := dmmdfe.cdsnuchavenfe.asstring;
  if nuchave <> '' then
  begin
    if Loadmdfe and (dmmdfe.cdsCDSTMDFE.asstring <> _1) then
    begin
      Exibir_chave_nfe(dmmdfe.exibe, dmmdfe.cdsNUMDFE.asstring, nuchave);
      ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID := nuchave;
      consultar_mdfe;
    end;
  end
  else
  begin
    TMDFEGerar.Gerar(dmMdfe.mdfe, ACBrMDFe1);
    ACBrMDFe1.Manifestos.assinar;
    ACBrMDFe1.Manifestos.Validar;
    consultar_mdfe;
  end;
end;

procedure Tfrmmdfe.Consultar_MDFe;
begin
  if ACBrMDFe1.Manifestos.Items[0].MDFe.infMDFe.ID = '' then
  begin
    Exit;
  end;
  ACBrMDFe1.Consultar;
  if (ACBrMDFe1.WebServices.Consulta.cStat = 132) and (dmmdfe.cdsCDSTMDFE.AsInteger <> 4) then
  begin
    encerrar_mdfe(ACBrMDFe1.WebServices.Consulta.Protocolo, ACBrMDFe1.WebServices.Consulta.RetWS);
    Abrir(dmmdfe.cdscdmdfe.asinteger);
  end;
  ShowMessage('Motivo: '+ACBrMDFe1.WebServices.Consulta.XMotivo);
  if (ACBrMDFe1.WebServices.Consulta.cStat = 217) and (dmMdfe.mdfe.cdstmdfe = 99) then
  begin
    dmMdfe.mdfe.cdstmdfe := 1;
    dmMdfe.mdfe.update;
    Abrir(dmMdfe.mdfe.cdmdfe);
  end;
  if (ACBrMDFe1.WebServices.Consulta.XMotivo = 'Cancelamento de MDF-e homologado') and (dmMdfe.mdfe.cdstmdfe = 2) then
  begin
    dmMdfe.mdfe.Cancelar('', ACBrMDFe1.WebServices.Consulta.Protocolo, ACBrMDFe1.WebServices.Consulta.RetWS);
  end;
end;

function Tfrmmdfe.Novo(cdembarque: string): Boolean;
var
  q : tclassequery;
begin
  q := tclassequery.create;
  try
    q.q.open('select embarque.*,itembarque.*,transportadora.cdveiculo '+
              'from embarque '+
              'left join itembarque on itembarque.cdempresa=embarque.cdempresa and itembarque.cdembarque=embarque.cdembarque '+
              'left join transportadora on transportadora.cdempresa=embarque.cdempresa and transportadora.cdtransportadora=embarque.cdtransportadora '+
              'where embarque.cdempresa='+empresa.cdempresa.tostring+' and embarque.cdembarque='+cdembarque);
    actnovoexecute(actnovo);
    dmmdfe.cds.fieldbyname(_cdveiculo).asstring  := q.q.fieldbyname(_cdveiculo).asstring;
    dmmdfe.cds.FieldByName(_cdufinicio).AsString := RetornaSQLString('select cdufinicio from cte where cdempresa='+empresa.cdempresa.tostring+' and cdcte='+q.q.fieldbyname(_cdcte).AsString);
    dmmdfe.cds.FieldByName(_cduffim).AsString    := RetornaSQLString('select cduftermino from cte where cdempresa='+empresa.cdempresa.tostring+' and cdcte='+q.q.fieldbyname(_cdcte).AsString);
    if cbxcdunidade.Properties.ListSource.DataSet.RecordCount > 0 then
    begin
      dmmdfe.cdsCDUNIDADE.AsInteger := cbxcdunidade.Properties.ListSource.DataSet.FieldByName(_cdunidade).AsInteger;
    end;
    get_municipio_carregamento(cdembarque);
    get_informacao_documento(cdembarque);
    actSalvarExecute(actsalvar);
    result := True;
  finally
    freeandnil(q);
  end;
end;

procedure Tfrmmdfe.ConsistirSalvar;
begin
  if cbxcdunidade.Text = '' then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_Unidade]), mtInformation, [mbOK], 0);
    cbxcdunidade.SetFocus;
    Abort;
  end;
  if varisnull(cbxCDMDFERESPSEG.EditValue) then
  begin
    MessageDlg('Responsável pelo seguro é um campo obrigatório.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsseguradora;
    cbxCDMDFERESPSEG.SetFocus;
    Abort;
  end;
  if cbxCDMDFERESPSEG.EditValue <> 2 then
  begin
    edtnucnpjcpf.Clear;
  end;
  if (cbxCDMDFERESPSEG.EditValue = 2) and (edtnucnpjcpf.Text = '') then
  begin
    MessageDlg('CNPJ/CPF do Responsável pelo seguro é um campo obrigatório,'#13'' + 'quando o Responsável pelo seguro for "RESPONSAVEL PELA CONTRATACAO DO SERVICO DE TRANSPORTE".', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsseguradora;
    cbxCDMDFERESPSEG.SetFocus;
    Abort;
  end;
end;

procedure Tfrmmdfe.AbrirTabelas;
begin
  TcxLookupComboBoxProperties(tbvmdfecarregamentoCDMUNICIPIO.Properties).ListSource := abrir_tabela(_municipio);
  TcxLookupComboBoxProperties(tbvmdfedescarregamentoCDMUNICIPIO.Properties).ListSource := abrir_tabela(_municipio);
  TcxLookupComboBoxProperties(tbvmdfeufpercursoCDUF.Properties).ListSource := abrir_tabela(_uf);
  cbxcdunidade.Properties.ListSource          := abrir_tabela(_mdfe + _unidade);
  cbxcdtpmdfe.Properties.ListSource           := abrir_tabela(_tp + _mdfe);
  cbxcduf.Properties.ListSource               := abrir_tabela(_uf);
  cbxcdufinicio.Properties.ListSource         := abrir_tabela(_uf);
  cbxcdmdferespseg.properties.listsource      := abrir_tabela(_mdferespseg);
  cbxcduffim.Properties.ListSource            := abrir_tabela(_uf);
  cbxtptransp.Properties.ListSource           := abrir_tabela(_mdfetptransp);
  cbxCDMDFETPEMITENTE.Properties.ListSource   := abrir_tabela(_mdfe + _tp + _emitente);
  cbxCDMDFEMODALIDADE.Properties.ListSource   := abrir_tabela(_mdfe + _modalidade);
  cbxCDMDFEFORMAEMISSAO.Properties.ListSource := abrir_tabela(_mdfe + _forma + _emissao);
end;

procedure Tfrmmdfe.get_municipio_carregamento(cdembarque: string);
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create;
  try
    q.q.Open('select cte.CDMUNICIPIOINICIO '+
             'from cte '+
             'left join itembarque on itembarque.cdempresa=cte.cdempresa and itembarque.cdcte=cte.cdcte '+
             'where itembarque.cdempresa='+empresa.cdempresa.tostring+' and itembarque.cdembarque='+cdembarque+' '+
             'group by cte.CDMUNICIPIOINICIO');
    while not q.q.eof do
    begin
      dmmdfe.cdsmdfecarregamento.insert;
      dmmdfe.cdsmdfecarregamentoCDMUNICIPIO.asstring := q.q.fieldbyname(_CDMUNICIPIOINICIO).asstring;
      dmmdfe.cdsmdfecarregamento.post;
      q.q.next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure Tfrmmdfe.get_informacao_documento(cdembarque: string);
var
  q : TClasseQuery;
  cdmunicipio : string;
  ctetransportadora : TCTETransportadoraList;
begin
  q := TClasseQuery.create;
  try
    q.q.Open('select c.CDMUNICIPIOTERMINO,c.cdcte '+
             'from cte c '+
             'left join itembarque i on i.cdempresa=c.cdempresa and i.cdcte=c.cdcte '+
             'where i.cdempresa='+empresa.cdempresa.tostring+' and i.cdembarque='+cdembarque+' '+
             'group by c.CDMUNICIPIOTERMINO,c.cdcte');
    while not q.q.Eof do
    begin
      if cdmunicipio <> q.q.FieldByName(_CDMUNICIPIOTERMINO).asstring then
      begin
        dmmdfe.cdsmdfedescarregamento.Insert;
        dmmdfe.cdsmdfedescarregamento.FieldByName(_cdmunicipio).AsString := q.q.FieldByName(_CDMUNICIPIOTERMINO).asstring;
        dmmdfe.cdsmdfedescarregamento.Post;
        cdmunicipio := q.q.FieldByName(_CDMUNICIPIOTERMINO).asstring;
      end;
      dmmdfe.cdsmdfecte.Insert;
      dmmdfe.cdsmdfecte.FieldByName(_cdcte).AsString := q.q.fieldbyname(_cdcte).AsString;
      dmmdfe.cdsmdfecte.Post;
      ctetransportadora := TCTETransportadoraList.Create;
      try
        ctetransportadora.Ler(q.q.FieldByName(_cdcte).AsInteger);
        if ctetransportadora.Count > 0 then
        begin
          if ctetransportadora.Items[0].cdveiculocarreta > 0 then
          begin
            if not dmmdfe.cdsmdfeveiculo.Locate(_cdveiculo,  ctetransportadora.Items[0].cdveiculocarreta, []) then
            begin
              dmmdfe.cdsmdfeveiculo.Insert;
              dmmdfe.cdsmdfeveiculoCDVEICULO.AsInteger := ctetransportadora.Items[0].cdveiculocarreta;
              dmmdfe.cdsmdfeveiculo.Post;
            end;
          end;
          if ctetransportadora.Items[0].cdveiculocarreta2 > 0 then
          begin
            if not dmmdfe.cdsmdfeveiculo.Locate(_cdveiculo,  ctetransportadora.Items[0].cdveiculocarreta2, []) then
            begin
              dmmdfe.cdsmdfeveiculo.Insert;
              dmmdfe.cdsmdfeveiculoCDVEICULO.AsInteger := ctetransportadora.Items[0].cdveiculocarreta2;
              dmmdfe.cdsmdfeveiculo.Post;
            end;
          end;
        end;
      finally
        FreeAndNil(ctetransportadora);
      end;
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
