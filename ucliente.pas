unit ucliente;

interface

uses
  System.Actions, System.UITypes, Winapi.Windows, Winapi.Messages,
  forms, Classes, ActnList, ComCtrls, ExtCtrls, Grids, StdCtrls, Menus,
  Vcl.DBCtrls, Buttons, Mask, sysutils, dialogs, types, graphics, Controls, ToolWin,
  Variants, ACBrValidador,
  FMTBcd, DB, DBClient, Provider, sqlexpr,
  ulocalizar, rotina.registro, rotina.validadocumento, rotina.rotinas, dialogo.exportarexcel, rotina.datahora,
  rotina.tipo, dialogo.AssinaturaDigital, localizar.produto, uconstantes, rotina.strings,
  orm.cntcusto, orm.cliente, rotina.retornasql, classe.Registro, orm.empresa, rotina.consiste,
  orm.rmatividade, orm.tpclientemensalidade, orm.tpcliente,
  classe.gerar, orm.plconta,
  classe.registrainformacao, classe.query, orm.usuario, orm.cte, classe.form,
  cxPC, cxControls, cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, dxBar,
  cxClasses, cxGraphics, cxLookAndFeels, cxLabel, cxSplitter, cxPCdxBarPopupMenu,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBLabel, cxCheckBox, cxDBEdit, cxCalendar, cxMemo,
  cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCalc, cxBlobEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, cxButtonEdit,
  cxRadioGroup, cxCurrencyEdit, cxButtons, cxNavigator, dxBarBuiltInMenu;

type
  TfrmCliente = class(TForm)
    act: TActionList;
    actNovo: TAction;
    actAbrir: TAction;
    actSalvar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actEditar: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actPrimeiro: TAction;
    pumCobranca: TPopupMenu;
    CopiarEndereoComercialparaCobrana1: TMenuItem;
    actImpCadg: TAction;
    actAbrirPedido: TAction;
    actAbrirSaida: TAction;
    actAbrirDuplicata: TAction;
    actabriradntcliente: TAction;
    actabrirmovbancario: TAction;
    actconsultapedido: TAction;
    actconsultasaida: TAction;
    actconsultaduplicata: TAction;
    actconsultaadntcliente: TAction;
    actconsultamovbancario: TAction;
    actconsultacheque: TAction;
    actconsultaordserv: TAction;
    actabrirCheque: TAction;
    actabrirordserv: TAction;
    actAbrirDuplicata2: TAction;
    actfechar: TAction;
    actconsultaEquipamento: TAction;
    actabrirequipamento: TAction;
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
    dxBarButton1: TdxBarButton;
    actfichasaldoadntcliente: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    pgc: TcxPageControl;
    tbscadastro: TcxTabSheet;
    tbsobservacao: TcxTabSheet;
    tbsproprietario: TcxTabSheet;
    tbsfinanceiro: TcxTabSheet;
    cxSplitter1: TcxSplitter;
    tbsconsulta: TcxTabSheet;
    tbsopcoes: TcxTabSheet;
    pnl1: TPanel;
    pnl: TcxLabel;
    lblcodigo: TLabel;
    lblnome: TLabel;
    lblrzsocial: TLabel;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    sds: TSQLDataSet;
    sdsitproprietario: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    cdsitproprietario: TClientDataSet;
    dts: TDataSource;
    dts1: TDataSource;
    dtsitproprietario: TDataSource;
    sdsCDSTCLIENTE: TIntegerField;
    sdsCDREPRESENTANTE: TIntegerField;
    sdsCDUF: TIntegerField;
    sdsCDUFCBRNC: TIntegerField;
    sdsNMCLIENTE: TStringField;
    sdsRZSOCIAL: TStringField;
    sdsDSENDERECO: TStringField;
    sdsDSNUMERO: TStringField;
    sdsDSCOMPLEMENTO: TStringField;
    sdsNUCXPOSTAL: TStringField;
    sdsNMBAIRRO: TStringField;
    sdsNUCEP: TStringField;
    sdsNUFONE1: TStringField;
    sdsNUFONE2: TStringField;
    sdsNUFONE3: TStringField;
    sdsNUFAX: TStringField;
    sdsDSENDCBRNC: TStringField;
    sdsDSNUMCBRNC: TStringField;
    sdsDSCOMCBRNC: TStringField;
    sdsNMBAICBRNC: TStringField;
    sdsNUCXPCBRNC: TStringField;
    sdsNUCEPCBRNC: TStringField;
    sdsNUFONE1CBRNC: TStringField;
    sdsNUFONE2CBRNC: TStringField;
    sdsNUFONE3CBRNC: TStringField;
    sdsNUFAXCBRNC: TStringField;
    sdsTPPESSOA: TStringField;
    sdsNUINSCEST: TStringField;
    sdsNUCNPJ: TStringField;
    sdsNUINSCMUNICIPAL: TStringField;
    sdsNUIDENTID: TStringField;
    sdsNUCPF: TStringField;
    sdsCDESTCIVIL: TStringField;
    sdsCDSEXO: TStringField;
    sdsDTNASCIMENTO: TDateField;
    sdsNMMAE: TStringField;
    sdsNMPAI: TStringField;
    sdsNMCONJUGE: TStringField;
    sdsEMAIL: TStringField;
    sdsHOMEPAGE: TStringField;
    sdsDTFUNDACAO: TDateField;
    sdsDTCADASTRO: TDateField;
    sdsDTLIMITE: TDateField;
    sdsVLLIMITE: TFMTBCDField;
    sdsVLFAT6MESES: TFMTBCDField;
    sdsBOCONSUMIDORFINAL: TStringField;
    sdsNURAMAL: TStringField;
    sdsNUCAE: TStringField;
    sdsDSOBSFINANC: TBlobField;
    sdsDSOBSERVACAO: TBlobField;
    sdsCDTPCLIENTE: TIntegerField;
    sdsCDTPCLIENTEMENSALIDADE: TIntegerField;
    sdsNUDIAMENSALIDADE: TIntegerField;
    sdsDTCADASTROSOCIO: TDateField;
    sdsNMNATURALIDADE: TStringField;
    sdsNUCNTCORRENTE: TStringField;
    sdsCDRMATIVIDADE: TIntegerField;
    sdsCDFUNCIONARIOVENDEDOR: TIntegerField;
    sdsBOPENDENTECOBRANCA: TStringField;
    sdsTPFATURAMENTOVALOR: TStringField;
    sdsCDMUNICIPIO: TIntegerField;
    sdsCDMUNICIPIOCBRNC: TIntegerField;
    sdsBONGERARBOLETOFATURAMENTO: TStringField;
    sdsDTDESFILIACAO: TDateField;
    sdsNUCELULAR: TStringField;
    sdsBONFEENVIARPDF: TStringField;
    sdsBOSINCRONIZADO: TStringField;
    sdsCDPAIS: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsCDCLIENTEANTIGO: TStringField;
    sdsBONENVIARPDF: TStringField;
    cdsCDSTCLIENTE: TIntegerField;
    cdsCDREPRESENTANTE: TIntegerField;
    cdsCDUF: TIntegerField;
    cdsCDUFCBRNC: TIntegerField;
    cdsNMCLIENTE: TStringField;
    cdsRZSOCIAL: TStringField;
    cdsDSENDERECO: TStringField;
    cdsDSNUMERO: TStringField;
    cdsDSCOMPLEMENTO: TStringField;
    cdsNUCXPOSTAL: TStringField;
    cdsNMBAIRRO: TStringField;
    cdsNUCEP: TStringField;
    cdsNUFONE1: TStringField;
    cdsNUFONE2: TStringField;
    cdsNUFONE3: TStringField;
    cdsNUFAX: TStringField;
    cdsDSENDCBRNC: TStringField;
    cdsDSNUMCBRNC: TStringField;
    cdsDSCOMCBRNC: TStringField;
    cdsNMBAICBRNC: TStringField;
    cdsNUCXPCBRNC: TStringField;
    cdsNUCEPCBRNC: TStringField;
    cdsNUFONE1CBRNC: TStringField;
    cdsNUFONE2CBRNC: TStringField;
    cdsNUFONE3CBRNC: TStringField;
    cdsNUFAXCBRNC: TStringField;
    cdsTPPESSOA: TStringField;
    cdsNUINSCEST: TStringField;
    cdsNUCNPJ: TStringField;
    cdsNUINSCMUNICIPAL: TStringField;
    cdsNUIDENTID: TStringField;
    cdsNUCPF: TStringField;
    cdsCDESTCIVIL: TStringField;
    cdsCDSEXO: TStringField;
    cdsDTNASCIMENTO: TDateField;
    cdsNMMAE: TStringField;
    cdsNMPAI: TStringField;
    cdsNMCONJUGE: TStringField;
    cdsEMAIL: TStringField;
    cdsHOMEPAGE: TStringField;
    cdsDTFUNDACAO: TDateField;
    cdsDTCADASTRO: TDateField;
    cdsDTLIMITE: TDateField;
    cdsVLLIMITE: TFMTBCDField;
    cdsVLFAT6MESES: TFMTBCDField;
    cdsBOCONSUMIDORFINAL: TStringField;
    cdsNURAMAL: TStringField;
    cdsNUCAE: TStringField;
    cdsDSOBSFINANC: TBlobField;
    cdsDSOBSERVACAO: TBlobField;
    cdsCDTPCLIENTE: TIntegerField;
    cdsCDTPCLIENTEMENSALIDADE: TIntegerField;
    cdsNUDIAMENSALIDADE: TIntegerField;
    cdsDTCADASTROSOCIO: TDateField;
    cdsNMNATURALIDADE: TStringField;
    cdsNUCNTCORRENTE: TStringField;
    cdsCDRMATIVIDADE: TIntegerField;
    cdsCDFUNCIONARIOVENDEDOR: TIntegerField;
    cdsBOPENDENTECOBRANCA: TStringField;
    cdsTPFATURAMENTOVALOR: TStringField;
    cdsCDMUNICIPIO: TIntegerField;
    cdsCDMUNICIPIOCBRNC: TIntegerField;
    cdsBONGERARBOLETOFATURAMENTO: TStringField;
    cdsDTDESFILIACAO: TDateField;
    cdsNUCELULAR: TStringField;
    cdsBONFEENVIARPDF: TStringField;
    cdsBOSINCRONIZADO: TStringField;
    cdsCDPAIS: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdsCDCLIENTEANTIGO: TStringField;
    cdsBONENVIARPDF: TStringField;
    cxGroupBox1: TcxGroupBox;
    Label38: TLabel;
    Label58: TLabel;
    lblcdstcliente: TLabel;
    lblrmatividade: TLabel;
    edthomepage: TcxDBTextEdit;
    edtemail: TcxDBTextEdit;
    cbxcdstcliente: TcxDBLookupComboBox;
    chkBOCONSUMIDORFINAL: TcxDBCheckBox;
    gbxJuridica: TcxGroupBox;
    Label24: TLabel;
    lblnuinscest: TLabel;
    edtnucnpj: TcxDBMaskEdit;
    edtnuinscest: TcxDBTextEdit;
    edtdtfundacao: TcxDBDateEdit;
    edtnuinscmunicipal: TcxDBTextEdit;
    edtnucae: TcxDBTextEdit;
    Label26: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    tbsoutros: TcxTabSheet;
    gbxFisica: TcxGroupBox;
    Label27: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    edtnmconjuge: TcxDBTextEdit;
    edtdtnascimento: TcxDBDateEdit;
    cbxcdestcivil: TcxDBComboBox;
    cbxcdsexo: TcxDBComboBox;
    edtnmpai: TcxDBTextEdit;
    edtnmmae: TcxDBTextEdit;
    edtnuidentid: TcxDBTextEdit;
    edtnucpf: TcxDBMaskEdit;
    gbxComercial: TcxGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    lbl2: TLabel;
    edtnufax: TcxDBMaskEdit;
    edtnufone2: TcxDBMaskEdit;
    edtnufone1: TcxDBMaskEdit;
    edtnucep: TcxDBMaskEdit;
    edtNmbairro: TcxDBTextEdit;
    edtdscomplemento: TcxDBTextEdit;
    edtdsnumero: TcxDBTextEdit;
    edtDsEndereco: TcxDBTextEdit;
    cbxcduf: TcxDBLookupComboBox;
    edtnufone3: TcxDBMaskEdit;
    cbxcdpais: TcxDBLookupComboBox;
    cxGroupBox14: TcxGroupBox;
    Label18: TLabel;
    Label44: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    edtnufaxcbrnc: TcxDBMaskEdit;
    edtnufone2cbrnc: TcxDBMaskEdit;
    edtnufone1cbrnc: TcxDBMaskEdit;
    edtNUCEPCBRNC: TcxDBMaskEdit;
    edtNMBAICBRNC: TcxDBTextEdit;
    edtdscomcbrnc: TcxDBTextEdit;
    edtdsnumcbrnc: TcxDBTextEdit;
    edtDSENDCBRNC: TcxDBTextEdit;
    cbxcdufcbrnc: TcxDBLookupComboBox;
    edtnufone3cbrnc: TcxDBMaskEdit;
    memdsobservacao: TcxDBMemo;
    grditproprietario: TcxGrid;
    tbvitproprietario: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    sdsitproprietarioNMPROPRIETARIO: TStringField;
    sdsitproprietarioNUCPFCNPJ: TStringField;
    sdsitproprietarioPRSOCIEDADE: TFloatField;
    sdsitproprietarioDTNASCIMENTO: TDateField;
    sdsitproprietarioTPPESSOA: TStringField;
    sdsitproprietarioCDUSUARIOI: TIntegerField;
    sdsitproprietarioCDUSUARIOA: TIntegerField;
    sdsitproprietarioCDCOMPUTADORI: TIntegerField;
    sdsitproprietarioCDCOMPUTADORA: TIntegerField;
    sdsitproprietarioTSINCLUSAO: TSQLTimeStampField;
    sdsitproprietarioTSALTERACAO: TSQLTimeStampField;
    sdsitproprietarioCDITPROPRIETARIO: TIntegerField;
    sdsitproprietarioTSLIBERADO: TSQLTimeStampField;
    sdsitproprietarioCDUSUARIOL: TIntegerField;
    sdsitproprietarioCDCOMPUTADORL: TIntegerField;
    cdssdsitproprietario: TDataSetField;
    cdsitproprietarioNMPROPRIETARIO: TStringField;
    cdsitproprietarioNUCPFCNPJ: TStringField;
    cdsitproprietarioPRSOCIEDADE: TFloatField;
    cdsitproprietarioDTNASCIMENTO: TDateField;
    cdsitproprietarioTPPESSOA: TStringField;
    cdsitproprietarioCDUSUARIOI: TIntegerField;
    cdsitproprietarioCDUSUARIOA: TIntegerField;
    cdsitproprietarioCDCOMPUTADORI: TIntegerField;
    cdsitproprietarioCDCOMPUTADORA: TIntegerField;
    cdsitproprietarioTSINCLUSAO: TSQLTimeStampField;
    cdsitproprietarioTSALTERACAO: TSQLTimeStampField;
    cdsitproprietarioCDITPROPRIETARIO: TIntegerField;
    cdsitproprietarioTSLIBERADO: TSQLTimeStampField;
    cdsitproprietarioCDUSUARIOL: TIntegerField;
    cdsitproprietarioCDCOMPUTADORL: TIntegerField;
    tbvitproprietarioNMPROPRIETARIO: TcxGridDBColumn;
    tbvitproprietarioNUCPFCNPJ: TcxGridDBColumn;
    tbvitproprietarioPRSOCIEDADE: TcxGridDBColumn;
    tbvitproprietarioDTNASCIMENTO: TcxGridDBColumn;
    tbvitproprietarioTPPESSOA: TcxGridDBColumn;
    gbxsuframa: TcxGroupBox;
    lblcdsuframa: TLabel;
    Label48: TLabel;
    cxGroupBox11: TcxGroupBox;
    edtcdsuframa: TcxDBTextEdit;
    sdsCDSUFRAMA: TIntegerField;
    sdsBOIPI: TStringField;
    sdsBOPIS: TStringField;
    sdsBOCOFINS: TStringField;
    sdsBOICMS: TStringField;
    sdsDTVALIDADE: TDateField;
    cdsCDSUFRAMA: TIntegerField;
    cdsBOIPI: TStringField;
    cdsBOPIS: TStringField;
    cdsBOCOFINS: TStringField;
    cdsBOICMS: TStringField;
    cdsDTVALIDADE: TDateField;
    edtdtvalidade: TcxDBDateEdit;
    ckbboipi: TcxDBCheckBox;
    ckbbopis: TcxDBCheckBox;
    ckbboicms: TcxDBCheckBox;
    ckbbocofins: TcxDBCheckBox;
    ckb1: TcxDBCheckBox;
    rdgfaturamento: TcxDBRadioGroup;
    edtcodigo: TcxTextEdit;
    edtnome: TcxDBTextEdit;
    edtrzsocial: TcxDBTextEdit;
    rdbtppessoa: TcxDBRadioGroup;
    sdsconsulta: TSQLDataSet;
    dspconsulta: TDataSetProvider;
    cdsconsulta: TClientDataSet;
    dtsconsulta: TDataSource;
    dtsitconsulta: TDataSource;
    cdsitconsulta: TClientDataSet;
    dspitconsulta: TDataSetProvider;
    sdsitconsulta: TSQLDataSet;
    grdconsultaLevel1: TcxGridLevel;
    grdconsulta: TcxGrid;
    dxBarDockControl1: TdxBarDockControl;
    bmg1Bar1: TdxBar;
    btnpedido: TdxBarLargeButton;
    btnsaida: TdxBarLargeButton;
    btnduplicata: TdxBarLargeButton;
    btnadntcliente: TdxBarLargeButton;
    btnmovbancario: TdxBarLargeButton;
    btncheque: TdxBarLargeButton;
    btnordserv: TdxBarLargeButton;
    btnequipamento: TdxBarLargeButton;
    grdconsultaduplicata: TcxGridDBBandedTableView;
    grdconsultaduplicataNUDUPLICATA: TcxGridDBBandedColumn;
    grdconsultaduplicataDTEMISSAO: TcxGridDBBandedColumn;
    grdconsultaduplicataDTPRORROGACAO: TcxGridDBBandedColumn;
    grdconsultaduplicataDTBAIXA: TcxGridDBBandedColumn;
    grdconsultaduplicataVLDUPLICATA: TcxGridDBBandedColumn;
    grdconsultaduplicataVLSALDO: TcxGridDBBandedColumn;
    grdconsultaduplicataVLRECEBIDO: TcxGridDBBandedColumn;
    grdconsultaduplicataDSHISTORICO: TcxGridDBBandedColumn;
    grdconsultaduplicataNMTPCOBRANCA: TcxGridDBBandedColumn;
    grdconsultaduplicataNMSTDUPLICATA: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    grdconsultaadntcliente: TcxGridDBBandedTableView;
    grdconsultaadntclienteCDADNTCLIENTE: TcxGridDBBandedColumn;
    grdconsultaadntclienteDTEMISSAO: TcxGridDBBandedColumn;
    grdconsultaadntclienteVLADNTCLIENTE: TcxGridDBBandedColumn;
    grdconsultaadntclienteVLSALDO: TcxGridDBBandedColumn;
    grdconsultaadntclienteVLUTILIZADO: TcxGridDBBandedColumn;
    grdconsultasaida: TcxGridDBBandedTableView;
    grdconsultaordserv: TcxGridDBBandedTableView;
    grdconsultacheque: TcxGridDBBandedTableView;
    grdconsultachequeCDCHEQUE: TcxGridDBBandedColumn;
    grdconsultachequeNUCHEQUE: TcxGridDBBandedColumn;
    grdconsultachequeDTEMISSAO: TcxGridDBBandedColumn;
    grdconsultachequeDTENTRADA: TcxGridDBBandedColumn;
    grdconsultachequeVLCHEQUE: TcxGridDBBandedColumn;
    grdconsultachequeNMBANCO: TcxGridDBBandedColumn;
    grdconsultachequeNUAGENCIA: TcxGridDBBandedColumn;
    grdconsultachequeNUCONTACORRENTE: TcxGridDBBandedColumn;
    grdconsultachequeNMSTCHEQUE: TcxGridDBBandedColumn;
    grdconsultaequipamento: TcxGridDBTableView;
    grdconsultaequipamentoCDEQUIPAMENTO: TcxGridDBColumn;
    grdconsultaequipamentoNUSERIE: TcxGridDBColumn;
    grdconsultaequipamentoNUPATRIMONIO: TcxGridDBColumn;
    grdconsultaequipamentonmtpequipamento: TcxGridDBColumn;
    grdconsultaequipamentonmmarca: TcxGridDBColumn;
    grdconsultaequipamentonmmodelo: TcxGridDBColumn;
    grdconsultaequipamentonmcor: TcxGridDBColumn;
    grdconsultamovbancario: TcxGridDBTableView;
    grdconsultamovbancariocdmovbancario: TcxGridDBColumn;
    grdconsultamovbancarionmmovimentacao: TcxGridDBColumn;
    grdconsultamovbancariodtemissao: TcxGridDBColumn;
    grdconsultamovbancarionmconta: TcxGridDBColumn;
    grdconsultamovbancariovllancamento: TcxGridDBColumn;
    grdconsultasaidaNUSAIDA: TcxGridDBBandedColumn;
    grdconsultasaidaDTEMISSAO: TcxGridDBBandedColumn;
    grdconsultasaidaDTSAIDA: TcxGridDBBandedColumn;
    grdconsultasaidanudocfiscalicms: TcxGridDBBandedColumn;
    grdconsultasaidanmstdocumento: TcxGridDBBandedColumn;
    grdconsultasaidacdcfop: TcxGridDBBandedColumn;
    grdconsultasaidanmtpsaida: TcxGridDBBandedColumn;
    grdconsultasaidanmrepresentante: TcxGridDBBandedColumn;
    grdconsultasaidaNMCONDPAGTO: TcxGridDBBandedColumn;
    grdconsultasaidavltotal: TcxGridDBBandedColumn;
    grdconsultasaidavlicms: TcxGridDBBandedColumn;
    grdconsultasaidaVLIPI: TcxGridDBBandedColumn;
    grdconsultaLevel2: TcxGridLevel;
    grdconsultaitsaida: TcxGridDBBandedTableView;
    grdconsultaitordserv: TcxGridDBBandedTableView;
    grdconsultaitpedido: TcxGridDBBandedTableView;
    grdconsultaitsaidaNUPEDIDO: TcxGridDBBandedColumn;
    grdconsultaitsaidaCDDIGITADO: TcxGridDBBandedColumn;
    grdconsultaitsaidaNMPRODUTO: TcxGridDBBandedColumn;
    grdconsultaitsaidaQTITEM: TcxGridDBBandedColumn;
    grdconsultaitsaidaVLUNITARIO: TcxGridDBBandedColumn;
    grdconsultaitsaidaVLTOTAL: TcxGridDBBandedColumn;
    grdconsultaitsaidaVLICMS: TcxGridDBBandedColumn;
    grdconsultaitsaidavlipi: TcxGridDBBandedColumn;
    grdconsultapedido: TcxGridDBTableView;
    grdconsultapedidonupedido: TcxGridDBColumn;
    grdconsultapedidodtemissao: TcxGridDBColumn;
    grdconsultapedidonmcondpagto: TcxGridDBColumn;
    grdconsultapedidonmtpcobranca: TcxGridDBColumn;
    grdconsultapedidonmrepresentante: TcxGridDBColumn;
    grdconsultapedidonmstpedido: TcxGridDBColumn;
    grdconsultapedidovltotal: TcxGridDBColumn;
    grdconsultaitpedidocddigitado: TcxGridDBBandedColumn;
    grdconsultaitpedidonmproduto: TcxGridDBBandedColumn;
    grdconsultaitpedidoqtitem: TcxGridDBBandedColumn;
    grdconsultaitpedidoqtatendida: TcxGridDBBandedColumn;
    grdconsultaitpedidovlunitario: TcxGridDBBandedColumn;
    grdconsultaitpedidovltotal: TcxGridDBBandedColumn;
    grdconsultaordservnuordserv: TcxGridDBBandedColumn;
    grdconsultaordservdtentrada: TcxGridDBBandedColumn;
    grdconsultaordservdtsaida: TcxGridDBBandedColumn;
    grdconsultaordservnmetapa: TcxGridDBBandedColumn;
    grdconsultaordservnmstordserv: TcxGridDBBandedColumn;
    grdconsultaordservvltotal: TcxGridDBBandedColumn;
    grdconsultaitordservcddigitado: TcxGridDBBandedColumn;
    grdconsultaitordservnmproduto: TcxGridDBBandedColumn;
    grdconsultaitordservqtitem: TcxGridDBBandedColumn;
    grdconsultaitordservvlunitario: TcxGridDBBandedColumn;
    grdconsultaitordservvltotal: TcxGridDBBandedColumn;
    sdsCDCONTRATO: TIntegerField;
    cdsCDCONTRATO: TIntegerField;
    lblrepresentante: TLabel;
    lblcdtpcliente: TLabel;
    Label35: TLabel;
    lbltecnico: TLabel;
    lblnucntcontabil: TLabel;
    edtnucntcontabil: TcxDBTextEdit;
    edtdtcadastro: TcxDBDateEdit;
    lblcdtpmensalidade: TLabel;
    lbldtcadastrosocio: TLabel;
    edtdtcadastrosocio: TcxDBDateEdit;
    lblnudiamensalidade: TLabel;
    edtnudiamensalidade: TcxDBSpinEdit;
    lbldtdesfiliacao: TLabel;
    edtdtdesfiliacao: TcxDBDateEdit;
    lblcontrato: TLabel;
    pumexportar: TdxBarPopupMenu;
    lbltpregimne: TLabel;
    cbxcdtpregime: TcxDBLookupComboBox;
    sdsCDTPREGIME: TIntegerField;
    cdsCDTPREGIME: TIntegerField;
    ckbbosincronizado: TcxDBCheckBox;
    edtcdproduto: TcxDBButtonEdit;
    lblproduto: TLabel;
    sdsCDPRODUTO: TIntegerField;
    cdsCDPRODUTO: TIntegerField;
    actabrircontrato: TAction;
    grdconsultaduplicataNUCOR: TcxGridDBBandedColumn;
    Label4: TLabel;
    edtNUDDG1: TcxDBMaskEdit;
    edtNUDDG2: TcxDBMaskEdit;
    sdsNUDDG1: TStringField;
    sdsNUDDG2: TStringField;
    cdsNUDDG1: TStringField;
    cdsNUDDG2: TStringField;
    btnorcamento: TdxBarLargeButton;
    actconsultaorcamento: TAction;
    grdconsultaorcamento: TcxGridDBTableView;
    grdconsultaitorcamento: TcxGridDBBandedTableView;
    grdconsultaorcamentocdorcamento: TcxGridDBColumn;
    grdconsultaorcamentodtemissao: TcxGridDBColumn;
    grdconsultaorcamentonmcondpagto: TcxGridDBColumn;
    grdconsultaorcamentonmtpcobranca: TcxGridDBColumn;
    grdconsultaorcamentonmrepresentante: TcxGridDBColumn;
    grdconsultaorcamentonmstorcamento: TcxGridDBColumn;
    grdconsultaorcamentovltotal: TcxGridDBColumn;
    grdconsultaitorcamentocddigitado: TcxGridDBBandedColumn;
    grdconsultaitorcamentonmproduto: TcxGridDBBandedColumn;
    grdconsultaitorcamentoqtitem: TcxGridDBBandedColumn;
    grdconsultaitorcamentoqtatendida: TcxGridDBBandedColumn;
    grdconsultaitorcamentovlunitario: TcxGridDBBandedColumn;
    grdconsultaitorcamentovltotal: TcxGridDBBandedColumn;
    sdsPRICMSDUPLICATACTE: TFloatField;
    cdsPRICMSDUPLICATACTE: TFloatField;
    btnimprimir: TdxBarLargeButton;
    pumimprimir: TdxBarPopupMenu;
    grdconsultaordservColumn1: TcxGridDBBandedColumn;
    sdsDTCONSULTASPC: TDateField;
    cdsDTCONSULTASPC: TDateField;
    lbldtconsultaspc: TLabel;
    edtdtconsultaspc: TcxDBDateEdit;
    actconsultalocacao: TAction;
    btnlocacao: TdxBarLargeButton;
    grdconsultalocacao: TcxGridDBTableView;
    grdconsultalocacaoCDLOCACAO: TcxGridDBColumn;
    grdconsultalocacaoDTEMISSAO: TcxGridDBColumn;
    grdconsultalocacaoDTPREVISTA: TcxGridDBColumn;
    grdconsultalocacaoVLLOCACAO: TcxGridDBColumn;
    grdconsultalocacaoCDEQUIPAMENTO: TcxGridDBColumn;
    grdconsultalocacaoNUSERIE: TcxGridDBColumn;
    grdconsultalocacaoNUPATRIMONIO: TcxGridDBColumn;
    grdconsultalocacaoNMTPEQUIPAMENTO: TcxGridDBColumn;
    grdconsultalocacaoNMMARCA: TcxGridDBColumn;
    grdconsultalocacaoNMMODELO: TcxGridDBColumn;
    grdconsultalocacaoQTITEM: TcxGridDBColumn;
    grdconsultalocacaoNMSTLOCACAO: TcxGridDBColumn;
    btnopcoes: TdxBarLargeButton;
    actopcoes: TAction;
    pumopcoes: TdxBarPopupMenu;
    actcampanha: TAction;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton13: TdxBarButton;
    sdsCDPLCONTA: TIntegerField;
    sdsCDCNTCUSTO: TIntegerField;
    sdsNUPLCONTA: TStringField;
    cdsCDPLCONTA: TIntegerField;
    cdsCDCNTCUSTO: TIntegerField;
    cdsNUPLCONTA: TStringField;
    actabrirlocacao: TAction;
    sdsNUCEI: TStringField;
    sdsNUMEI: TStringField;
    cdsNUCEI: TStringField;
    cdsNUMEI: TStringField;
    gbxceimei: TcxGroupBox;
    lblnucei: TLabel;
    edtnucei: TcxDBTextEdit;
    lblnumei: TLabel;
    edtnumei: TcxDBTextEdit;
    actfilial: TAction;
    dxBarButton17: TdxBarButton;
    sdsNUCNTCONTABIL: TStringField;
    cdsNUCNTCONTABIL: TStringField;
    tbsRisco: TcxTabSheet;
    tbvclienteprofissao: TcxGridDBTableView;
    grdclienteprofissaoLevel1: TcxGridLevel;
    grdclienteprofissao: TcxGrid;
    tbvclienteprofissaorisco: TcxGridDBTableView;
    grdclienteprofissaoriscoLevel1: TcxGridLevel;
    grdclienteprofissaorisco: TcxGrid;
    cxSplitter3: TcxSplitter;
    sdsclienteprofissao: TSQLDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    SQLTimeStampField5: TSQLTimeStampField;
    SQLTimeStampField6: TSQLTimeStampField;
    cdsclienteprofissao: TClientDataSet;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    SQLTimeStampField7: TSQLTimeStampField;
    SQLTimeStampField8: TSQLTimeStampField;
    dtsclienteprofissao: TDataSource;
    dts2: TDataSource;
    sdsclienteprofissaorisco: TSQLDataSet;
    cdsclienteprofissaorisco: TClientDataSet;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    SQLTimeStampField11: TSQLTimeStampField;
    SQLTimeStampField12: TSQLTimeStampField;
    dtsclienteprofissaorisco: TDataSource;
    sdsclienteprofissaoCDCLIENTEPROFISSAO: TIntegerField;
    sdsclienteprofissaoCDPROFISSAO: TIntegerField;
    sdsclienteprofissaoriscoCDCLIENTEPROFISSAORISCO: TIntegerField;
    sdsclienteprofissaoriscoCDCLIENTEPROFISSAO: TIntegerField;
    sdsclienteprofissaoriscoCDRISCO: TIntegerField;
    sdsclienteprofissaoriscoCDUSUARIOI: TIntegerField;
    sdsclienteprofissaoriscoCDUSUARIOA: TIntegerField;
    sdsclienteprofissaoriscoCDCOMPUTADORI: TIntegerField;
    sdsclienteprofissaoriscoCDCOMPUTADORA: TIntegerField;
    sdsclienteprofissaoriscoTSINCLUSAO: TSQLTimeStampField;
    sdsclienteprofissaoriscoTSALTERACAO: TSQLTimeStampField;
    cdssdsclienteprofissao: TDataSetField;
    cdsclienteprofissaoCDCLIENTEPROFISSAO: TIntegerField;
    cdsclienteprofissaoCDPROFISSAO: TIntegerField;
    cdsclienteprofissaosdsclienteprofissaorisco: TDataSetField;
    cdsclienteprofissaoriscoCDCLIENTEPROFISSAORISCO: TIntegerField;
    cdsclienteprofissaoriscoCDCLIENTEPROFISSAO: TIntegerField;
    cdsclienteprofissaoriscoCDRISCO: TIntegerField;
    tbvclienteprofissaoCDPROFISSAO: TcxGridDBColumn;
    tbvclienteprofissaoriscoCDRISCO: TcxGridDBColumn;
    actestatisica: TAction;
    dxBarButton18: TdxBarButton;
    memDSOBSFINANC: TcxDBMemo;
    gbxCredito: TcxGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label41: TLabel;
    lblvlcredidotutilizado: TLabel;
    lblvlfat6meses: TLabel;
    edtvllimite: TcxDBCalcEdit;
    edtdtlimite: TcxDBDateEdit;
    edtvlfat6meses: TcxDBCalcEdit;
    cxGroupBox6: TcxGroupBox;
    lblplconta: TLabel;
    lblcntcusto: TLabel;
    edtnuplconta: TcxDBButtonEdit;
    txtnmplconta: TcxDBLabel;
    sdsCDINDIEDEST: TIntegerField;
    cdsCDINDIEDEST: TIntegerField;
    lblCDINDIEDEST: TLabel;
    cbxcdindiedest: TcxDBLookupComboBox;
    tbvitproprietarioNUIDENTID: TcxGridDBColumn;
    tbvitproprietarioCDMUNICIPIO: TcxGridDBColumn;
    tbvitproprietarioCDUF: TcxGridDBColumn;
    sdsitproprietarioCDUF: TIntegerField;
    sdsitproprietarioCDMUNICIPIO: TIntegerField;
    sdsitproprietarioNUIDENTID: TStringField;
    cdsitproprietarioCDUF: TIntegerField;
    cdsitproprietarioCDMUNICIPIO: TIntegerField;
    cdsitproprietarioNUIDENTID: TStringField;
    sdsNUAPOLICE: TStringField;
    cdsNUAPOLICE: TStringField;
    gbxseguradora: TcxGroupBox;
    lbl3: TLabel;
    lblnuapolice: TLabel;
    edtnuapolice: TcxDBTextEdit;
    lblcdcondpagto: TLabel;
    sdsCDCONDPAGTO: TIntegerField;
    sdsCDTPCOBRANCA: TIntegerField;
    cdsCDCONDPAGTO: TIntegerField;
    cdsCDTPCOBRANCA: TIntegerField;
    lblcdtpcobranca: TLabel;
    cbxcdtpcobranca: TcxDBLookupComboBox;
    cdsNMPRODUTO: TStringField;
    txtnmproduto: TDBText;
    sdsNMPRODUTO: TStringField;
    actabrirproduto: TAction;
    actclientecondpagto: TAction;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    actclientetpcobranca: TAction;
    actclienteentrega: TAction;
    dxBarButton21: TdxBarButton;
    actitcontcliente: TAction;
    dxBarButton22: TdxBarButton;
    actitbanco: TAction;
    dxBarButton23: TdxBarButton;
    actitrefcomercial: TAction;
    dxBarButton24: TdxBarButton;
    actitclienteemail: TAction;
    dxBarButton25: TdxBarButton;
    ckbbonenviarpdf: TcxDBCheckBox;
    actitclienteinfcomercial: TAction;
    dxBarButton26: TdxBarButton;
    actitclienteproduto: TAction;
    dxBarButton27: TdxBarButton;
    sdsCDEMPRESA: TLargeintField;
    sdsCDCLIENTE: TLargeintField;
    sdsCDFORNECEDORSEGURADORA: TLargeintField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDCLIENTE: TLargeintField;
    cdsCDFORNECEDORSEGURADORA: TLargeintField;
    sdsitproprietarioCDEMPRESA: TLargeintField;
    sdsitproprietarioCDCLIENTE: TLargeintField;
    cdsitproprietarioCDEMPRESA: TLargeintField;
    cdsitproprietarioCDCLIENTE: TLargeintField;
    sdsclienteprofissaoCDEMPRESA: TLargeintField;
    sdsclienteprofissaoCDCLIENTE: TLargeintField;
    sdsclienteprofissaoriscoCDEMPRESA: TLargeintField;
    cdsclienteprofissaoCDEMPRESA: TLargeintField;
    cdsclienteprofissaoCDCLIENTE: TLargeintField;
    cdsclienteprofissaoriscoCDEMPRESA: TLargeintField;
    edtPRICMSDUPLICATACTE: TcxDBCalcEdit;
    lblPRICMSDUPLICATACTE: TLabel;
    lblnmfornecedor: TDBText;
    edtcdfornecedorseguradora: TcxDBButtonEdit;
    sdsNMFORNECEDOR: TStringField;
    cdsNMFORNECEDOR: TStringField;
    edtcdcontrato: TcxDBButtonEdit;
    txtNMCONTRATO: TDBText;
    sdsNMCONTRATO: TStringField;
    cdsNMCONTRATO: TStringField;
    txtnmcondpagto: TDBText;
    edtcdcondpagto: TcxDBButtonEdit;
    actabrircondpagto: TAction;
    sdsNMCONDPAGTO: TStringField;
    cdsNMCONDPAGTO: TStringField;
    edtcdrepresentante: TcxDBButtonEdit;
    txtnmrepresentante: TDBText;
    sdsNMREPRESENTANTE: TStringField;
    sdsNMFUNCIONARIO: TStringField;
    cdsNMFUNCIONARIO: TStringField;
    cdsNMREPRESENTANTE: TStringField;
    txtnmfuncionario: TDBText;
    edtcdfuncionariovendedor: TcxDBButtonEdit;
    txtnmmunicipio: TDBText;
    edtcdmunicipio: TcxDBButtonEdit;
    sdsNMMUNICIPIO: TStringField;
    cdsNMMUNICIPIO: TStringField;
    edtCDMUNICIPIOCBRNC: TcxDBButtonEdit;
    txtNMMUNICIPIOCBRNC: TDBText;
    sdsNMMUNICIPIOCBRNC: TStringField;
    cdsNMMUNICIPIOCBRNC: TStringField;
    edtcdtpcliente: TcxDBButtonEdit;
    txtnmtpcliente: TDBText;
    sdsNMTPCLIENTE: TStringField;
    cdsNMTPCLIENTE: TStringField;
    txtnmrmatividade: TDBText;
    edtcdrmatividade: TcxDBButtonEdit;
    sdsNMRMATIVIDADE: TStringField;
    cdsNMRMATIVIDADE: TStringField;
    txtnmtpclientemensalidade: TDBText;
    edtcdtpclientemensalidade: TcxDBButtonEdit;
    sdsNMTPCLIENTEMENSALIDADE: TStringField;
    cdsNMTPCLIENTEMENSALIDADE: TStringField;
    edtnucntcusto: TcxDBButtonEdit;
    txtnmcntcusto: TcxDBLabel;
    sdsNMCNTCUSTO: TStringField;
    cdsNMCNTCUSTO: TStringField;
    sdsNUCNTCUSTO: TStringField;
    cdsNUCNTCUSTO: TStringField;
    sdsNMPLCONTA: TStringField;
    cdsNMPLCONTA: TStringField;
    tbvitproprietarioNMMUNICIPIO: TcxGridDBColumn;
    sdsitproprietarioNMMUNICIPIO: TStringField;
    cdsitproprietarioNMMUNICIPIO: TStringField;
    actabrirrepresentante: TAction;
    memDSOBSERVACAOCTEREMETENTE: TcxDBMemo;
    lblDSOBSERVACAOCTEREMETENTE: TLabel;
    sdsDSOBSERVACAOCTEREMETENTE: TBlobField;
    cdsDSOBSERVACAOCTEREMETENTE: TBlobField;
    grdconsultachequeDTVENCIMENTO: TcxGridDBBandedColumn;
    edtnucontrato: TcxDBTextEdit;
    lblnucontrato: TLabel;
    sdsNUCONTRATO: TStringField;
    cdsNUCONTRATO: TStringField;
    procedure actAbrirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actImpCadgExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actAbrirPedidoExecute(Sender: TObject);
    procedure actAbrirSaidaExecute(Sender: TObject);
    procedure actAbrirDuplicataExecute(Sender: TObject);
    procedure actabriradntclienteExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actabrirmovbancarioExecute(Sender: TObject);
    procedure actabrirChequeExecute(Sender: TObject);
    procedure actabrirordservExecute(Sender: TObject);
    procedure edtnomeExit(Sender: TObject);
    procedure actfecharExecute(Sender: TObject);
    procedure actconsultaEquipamentoExecute(Sender: TObject);
    procedure actabrirequipamentoExecute(Sender: TObject);
    procedure actfichasaldoadntclienteExecute(Sender: TObject);
    procedure cdsCDREPRESENTANTEValidate(Sender: TField);
    procedure cdsCDFUNCIONARIOVENDEDORValidate(Sender: TField);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsNUCEPValidate(Sender: TField);
    procedure cdsitproprietarioBeforePost(DataSet: TDataSet);
    procedure cdsclientecondpagtoCDCONDPAGTOValidate(Sender: TField);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dtsStateChange(Sender: TObject);
    procedure colorenter(Sender: TObject);
    procedure colorexit(Sender: TObject);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actconsultapedidoExecute(Sender: TObject);
    procedure actconsultasaidaExecute(Sender: TObject);
    procedure actconsultaduplicataExecute(Sender: TObject);
    procedure actconsultaadntclienteExecute(Sender: TObject);
    procedure actconsultamovbancarioExecute(Sender: TObject);
    procedure actconsultachequeExecute(Sender: TObject);
    procedure actconsultaordservExecute(Sender: TObject);
    procedure grdconsultaduplicataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure grdconsultaadntclienteDblClick(Sender: TObject);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdbtppessoaPropertiesChange(Sender: TObject);
    procedure cdsNUFONE1Validate(Sender: TField);
    procedure cdsNUFONE2Validate(Sender: TField);
    procedure cdsNUFONE3Validate(Sender: TField);
    procedure cdsNUFAXValidate(Sender: TField);
    procedure cdsNUFONE1CBRNCValidate(Sender: TField);
    procedure cdsNUFONE2CBRNCValidate(Sender: TField);
    procedure cdsNUFONE3CBRNCValidate(Sender: TField);
    procedure cdsNUFAXCBRNCValidate(Sender: TField);
    procedure cdsNUCELULARValidate(Sender: TField);
    procedure cdsNMCLIENTEValidate(Sender: TField);
    procedure cdsCDCONTRATOValidate(Sender: TField);
    procedure cdsCDTPCLIENTEMENSALIDADEValidate(Sender: TField);
    procedure cdsNUCEPCBRNCValidate(Sender: TField);
    procedure edtcdprodutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure edtcdprodutoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actabrircontratoExecute(Sender: TObject);
    procedure lblcontratoDblClick(Sender: TObject);
    procedure grdconsultaduplicataCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure pgcChange(Sender: TObject);
    procedure actconsultaorcamentoExecute(Sender: TObject);
    procedure grdconsultasaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cdsDTNASCIMENTOValidate(Sender: TField);
    procedure cdsitproprietarioDTNASCIMENTOValidate(Sender: TField);
    procedure cdsNUCPFValidate(Sender: TField);
    procedure cdsNUCNPJValidate(Sender: TField);
    procedure cdsCDUFValidate(Sender: TField);
    procedure cdsCDUFCBRNCValidate(Sender: TField);
    procedure actconsultalocacaoExecute(Sender: TObject);
    procedure actopcoesExecute(Sender: TObject);
    procedure actcampanhaExecute(Sender: TObject);
    procedure edtnuplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnuplcontaPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure grdconsultalocacaoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure actabrirlocacaoExecute(Sender: TObject);
    procedure actfilialExecute(Sender: TObject);
    procedure cdsclienteprofissaoBeforePost(DataSet: TDataSet);
    procedure cdsclienteprofissaoriscoBeforePost(DataSet: TDataSet);
    procedure actestatisicaExecute(Sender: TObject);
    procedure grdconsultaordservCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cbxcdtpcobrancaEnter(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure cdsCDPRODUTOValidate(Sender: TField);
    procedure actabrirprodutoExecute(Sender: TObject);
    procedure txtnmprodutoDblClick(Sender: TObject);
    procedure cdsCDINDIEDESTValidate(Sender: TField);
    procedure actclientecondpagtoExecute(Sender: TObject);
    procedure actclientetpcobrancaExecute(Sender: TObject);
    procedure actclienteentregaExecute(Sender: TObject);
    procedure actitcontclienteExecute(Sender: TObject);
    procedure actitbancoExecute(Sender: TObject);
    procedure actitrefcomercialExecute(Sender: TObject);
    procedure actitclienteemailExecute(Sender: TObject);
    procedure actitclienteinfcomercialExecute(Sender: TObject);
    procedure actitclienteprodutoExecute(Sender: TObject);
    procedure edtcdfornecedorseguradoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedorseguradoraPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsCDFORNECEDORSEGURADORAValidate(Sender: TField);
    procedure edtcdcontratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdcontratoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure txtNMCONTRATODblClick(Sender: TObject);
    procedure edtcdcondpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdcondpagtoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure txtnmcondpagtoDblClick(Sender: TObject);
    procedure actabrircondpagtoExecute(Sender: TObject);
    procedure cdsCDCONDPAGTOValidate(Sender: TField);
    procedure edtcdrepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdrepresentantePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtcdfuncionariovendedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfuncionariovendedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtcdmunicipioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdmunicipioPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtCDMUNICIPIOCBRNCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCDMUNICIPIOCBRNCPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsCDTPCLIENTEValidate(Sender: TField);
    procedure edtcdtpclienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdtpclientePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtcdrmatividadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdrmatividadePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsCDRMATIVIDADEValidate(Sender: TField);
    procedure edtcdtpclientemensalidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdtpclientemensalidadePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsNUCNTCUSTOValidate(Sender: TField);
    procedure cdsNUPLCONTAValidate(Sender: TField);
    procedure cdsitproprietarioCDMUNICIPIOValidate(Sender: TField);
    procedure cdsCDMUNICIPIOValidate(Sender: TField);
    procedure cdsCDMUNICIPIOCBRNCValidate(Sender: TField);
    procedure tbvitproprietarioCDMUNICIPIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cdsitproprietarioCDUFValidate(Sender: TField);
    procedure txtnmrepresentanteDblClick(Sender: TObject);
    procedure actabrirrepresentanteExecute(Sender: TObject);
    procedure cdsTPPESSOAValidate(Sender: TField);
  private      { Private declarations }
    cliente  : TCliente;
    cdclienteestatisca : string;
    procedure CopiarEnderecoCobranca;
    procedure Estatisca;
    procedure SetQuery(tbl:string);
    function  EnderecoCobrancaNaoPreenchido:boolean;
    procedure SetMascaraNumeroFoneAcordoEstado;
    procedure SetMascaraNumeroFoneCobrancaAcordoEstado;
    procedure setrecord(cdtp:integer);
    procedure AbrirTabelas;
    procedure ConfigurarEmpresa;
    procedure setNuinscestVisible;
    procedure SetQueryBotaoAtivo;
    procedure check_email_obrigatorio;
    procedure check_endereco_obrigatorio;
    procedure check_nome_obrigatorio;
    procedure check_preenchimento_informacao_proprietario;
    procedure check_ramo_atividade_obrigatorio;
    procedure check_razao_social_obrigatorio;
    procedure check_bairro_obrigatorio;
    procedure check_cep_invalido;
    procedure check_cep_obrigatorio;
    procedure check_dsendereco_obrigatorio;
    procedure check_municipio_obrigatorio;
    procedure check_numero_obrigatorio;
    procedure check_uf_obrigatorio;
    procedure ValidarCPF_(tppessoa, nucpf: string);
    procedure Validarcnpj_(tppessoa, nucnpj: string);
    procedure LiberarcomAssinatura(msg: string);
    procedure Validarcpfproprietariodebito;
    procedure Validarcnpjproprietariodebito;
    procedure consisteobrigatoriedadeinterna;
    procedure formatardocumento;
    procedure ConfigurarSQLDataSet;
    procedure check_indiedest;
  public  { Public declarations }
    registro : TRegistro;
    function Abrir(codigo:LargeInt):boolean;
  end;

const
  tbl      = 'cliente';
  exibe    = 'Cliente';
  artigoI  = 'o';
var
  frmCliente: TfrmCliente;

implementation

uses uDtmMain,
  uMain,
  impressao.relatoriopadrao,
  dialogo.databalanco,
  impressao.MenuRelatorio,
  dialogo.tabela,
  dialogo.clientefinanceiro, orm.fornecedor, localizar.Contrato, orm.contrato,
  orm.condpagto, orm.representante, orm.funcionario, orm.produto,
  localizar.Funcionario, orm.Municipio, orm.movbancario;

{$R *.DFM}

procedure TfrmCliente.SetMascaraNumeroFoneAcordoEstado;
begin
  if BooleandoCodigo(_uf, cdsCDUF.AsString, _bodigito9) then
  begin
    edtnufone1.Properties.EditMask := _99_99999_9999;
    edtnufone2.Properties.EditMask := _99_99999_9999;
    edtnufone3.Properties.EditMask := _99_99999_9999;
    edtnufax.Properties.EditMask   := _99_99999_9999;
  end
  else
  begin
    edtnufone1.Properties.EditMask := _99_9999_9999;
    edtnufone2.Properties.EditMask := _99_9999_9999;
    edtnufone3.Properties.EditMask := _99_9999_9999;
    edtnufax.Properties.EditMask   := _99_9999_9999;
  end;
end;

procedure TfrmCliente.SetMascaraNumeroFoneCobrancaAcordoEstado;
begin
  if BooleandoCodigo(_uf, cdsCDUFCBRNC.AsString, _bodigito9) then
  begin
    edtnufone1cbrnc.Properties.EditMask := _99_99999_9999;
    edtnufone2cbrnc.Properties.EditMask := _99_99999_9999;
    edtnufone3cbrnc.Properties.EditMask := _99_99999_9999;
    edtnufaxcbrnc.Properties.EditMask   := _99_99999_9999;
  end
  else
  begin
    edtnufone1cbrnc.Properties.EditMask := _99_9999_9999;
    edtnufone2cbrnc.Properties.EditMask := _99_9999_9999;
    edtnufone3cbrnc.Properties.EditMask := _99_9999_9999;
    edtnufaxcbrnc.Properties.EditMask   := _99_9999_9999;
  end;
end;

procedure TfrmCliente.CopiarEnderecoCobranca;
begin
  cdsDSENDCBRNC.Asstring       := cdsDSENDERECO.Asstring;
  cdsDSNUMCBRNC.Asstring       := cdsDSNUMERO.Asstring;
  cdsDSCOMCBRNC.Asstring       := cdsDSCOMPLEMENTO.Asstring;
  cdsNMBAICBRNC.Asstring       := cdsNMBAIRRO.Asstring;
  cdsNUCXPCBRNC.Asstring       := cdsNUCXPOSTAL.AsString;
  cdsCDUFCBRNC.Asstring        := cdsCDUF.Asstring;
  cdsNUCEPCBRNC.Asstring       := cdsNUCEP.Asstring;
  cdsCDMUNICIPIOCBRNC.Asstring := cdsCDMUNICIPIO.Asstring;
end;

procedure TfrmCliente.setNuinscestVisible;
begin
  edtnuinscest.visible := cdsCDINDIEDEST.asinteger = 1;
  lblnuinscest.visible := cdsCDINDIEDEST.asinteger = 1;
end;

procedure TFrmCliente.Estatisca;
begin
  if (cds.State = dsinsert) or cds.FieldByName(_CDCLIENTE).IsNull or (pgc.ActivePage <> tbsfinanceiro) or (cds.FieldByName(_CDCLIENTE).AsString = cdclienteestatisca) then
  begin
    exit;
  end;
  cliente.cdcliente := cds.FieldByName(_CDCLIENTE).AsLargeInt;
  lblvlcredidotutilizado.Caption    := formatfloat(__moeda, cliente.VlCreditoUtilizado);
  cdclienteestatisca                := cds.FieldByName(_CDCLIENTE).AsString;
end;

function TFrmCliente.Abrir(codigo:LargeInt):boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure TfrmCliente.SetQueryBotaoAtivo;
begin
  if btnsaida.Down then
  begin
    setquery(_saida);
  end
  else if btnduplicata.Down then
  begin
    setquery(_duplicata);
  end
  else if btnadntcliente.Down then
  begin
    setquery(_adntcliente);
  end
  else if btnpedido.Down then
  begin
    setquery(_pedido);
  end
  else if btnmovbancario.Down then
  begin
    setquery(_movbancario);
  end
  else if btnordserv.Down then
  begin
    setquery(_ordserv);
  end
  else if btnequipamento.Down then
  begin
    setquery(_equipamento);
  end
  else if btnlocacao.Down then
  begin
    SetQuery(_locacao);
  end
  else if btncheque.Down then
  begin
    setquery(_cheque);
  end
  else if btnorcamento.Down then
  begin
    SetQuery(_orcamento);
  end;
end;

procedure TfrmCliente.ConfigurarEmpresa;
begin
  lblproduto.Visible                := empresa.faturamento.cte.bo;
  edtcdproduto.Visible              := empresa.faturamento.cte.bo;
  txtnmproduto.Visible              := empresa.faturamento.cte.bo;
  gbxseguradora.visible             := empresa.faturamento.cte.bo;
  ckbbosincronizado.Visible         := empresa.livro.bopdv;
  lblPRICMSDUPLICATACTE.Visible     := empresa.faturamento.cte.bo;
  edtPRICMSDUPLICATACTE.Visible     := empresa.faturamento.cte.bo;
  tbsoutros.tabvisible              := empresa.cliente.booutros;
  lblcdtpcliente.Visible            := empresa.cliente.botpcliente;
  edtcdtpcliente.Visible            := empresa.cliente.botpcliente;
  txtnmtpcliente.Visible            := empresa.cliente.botpcliente;
  lblcdtpmensalidade.Visible        := empresa.cliente.bomensalidade;
  edtcdtpclientemensalidade.Visible := empresa.cliente.bomensalidade;
  txtnmtpclientemensalidade.Visible := empresa.cliente.bomensalidade;
  lbldtdesfiliacao.Visible          := empresa.cliente.bomensalidade;
  edtdtdesfiliacao.Visible          := empresa.cliente.bomensalidade;
  lbldtcadastrosocio.Visible        := empresa.cliente.bomensalidade;
  edtdtcadastrosocio.Visible        := empresa.cliente.bomensalidade;
  lblnudiamensalidade.Visible       := empresa.cliente.bomensalidade;
  edtnudiamensalidade.Visible       := empresa.cliente.bomensalidade;

  tbsopcoes.TabVisible        := empresa.faturamento.bo;
  tbscadastro.TabVisible      := empresa.cliente.bocadastro;
  tbsproprietario.TabVisible  := empresa.cliente.boproprietario;
  tbsfinanceiro.TabVisible    := empresa.cliente.bofinanceiro;
  tbsobservacao.TabVisible    := empresa.cliente.boobservacao;
  actitclienteproduto.Visible := empresa.cliente.boproduto;

  edtcdfuncionariovendedor.Visible := empresa.cliente.bofuncionariovendedor;
  txtnmfuncionario.Visible         := empresa.cliente.bofuncionariovendedor;
  lbltecnico.Visible               := empresa.cliente.bofuncionariovendedor;

  if not empresa.cliente.bocadastro then
  begin
    pgc.ActivePage := tbsobservacao;
  end;
  lblrepresentante.Visible   := Empresa.comercial.representante.bo;
  edtcdrepresentante.Visible := Empresa.comercial.representante.bo;
  txtnmrepresentante.Visible := Empresa.comercial.representante.bo;
  //
  actconsultasaida.Enabled       := empresa.faturamento.saida.bo;
  actconsultasaida.Visible       := empresa.faturamento.saida.bo;
  actconsultaduplicata.Enabled   := empresa.financeiro.duplicata.bo;
  actconsultaduplicata.Visible   := empresa.financeiro.duplicata.bo;
  actconsultaadntcliente.Enabled := empresa.financeiro.boadntcliente;
  actconsultaadntcliente.Visible := empresa.financeiro.boadntcliente;
  actconsultamovbancario.Enabled := empresa.financeiro.caixafinanceiro.bo;
  actconsultamovbancario.Visible := empresa.financeiro.caixafinanceiro.bo;
  actconsultapedido.Enabled      := empresa.comercial.pedido.bo;
  actconsultapedido.Visible      := empresa.comercial.pedido.bo;
  actconsultalocacao.Visible     := Empresa.bolocacao;
  //
  actconsultaordserv.Visible := false;
  actconsultaordserv.enabled := false;
  if empresa.ordserv.bo then
  begin
    actconsultaordserv.Visible := empresa.ordserv.bo;
    actconsultaordserv.enabled := empresa.ordserv.bo;
  end;
  actconsultacheque.Visible  := empresa.financeiro.cheque.bo;
  actconsultacheque.enabled  := empresa.financeiro.cheque.bo;
  //
  lblnucntcontabil.Visible := empresa.bocodigocontabil;
  edtnucntcontabil.visible := empresa.bocodigocontabil;
  edtcdrmatividade.Visible := empresa.cliente.bormatividade;
  txtnmrmatividade.Visible := empresa.cliente.bormatividade;
  lblrmatividade.Visible   := empresa.cliente.bormatividade;
  lblcontrato.Visible      := empresa.bocontrato;
  edtcdcontrato.Visible    := empresa.bocontrato;
  txtNMCONTRATO.Visible    := empresa.bocontrato;
end;

procedure TfrmCliente.actAbrirExecute(Sender: TObject);
begin
  registro.Abrir;
end;

procedure TfrmCliente.actNovoExecute(Sender: TObject);
begin
  registro.Novo(Sender);
end;

procedure TfrmCliente.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure TfrmCliente.check_nome_obrigatorio;
begin
  if edtnome.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Nome]), mtinformation, [mbok], 0);
    cdsnmcliente.FocusControl;
    Abort;
  end;
end;

procedure TfrmCliente.check_razao_social_obrigatorio;
begin
  if edtrzsocial.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [lblrzsocial.caption]), mtinformation, [mbok], 0);
    cdsRZSOCIAL.FocusControl;
    Abort;
  end;
end;

procedure TfrmCliente.check_cep_obrigatorio;
begin
  if (edtnucep.Text = '') or (edtnucep.Text = '     -   ') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_CEP]), mtinformation, [mbok], 0);
    cdsNUCEP.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_cep_invalido;
begin
  if Length(RemoverEspacosVazios(removercaracteres(edtnucep.Text))) < 8 then
  begin
    MessageDlg('CEP inválido.', mtInformation, [mbOK], 0);
    cdsNUCEP.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_dsendereco_obrigatorio;
begin
  if edtDsEndereco.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [__Endereco]), mtinformation, [mbok], 0);
    cdsDSENDERECO.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_numero_obrigatorio;
begin
  if edtdsnumero.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [__numero+' '+_do+' '+__endereco]), mtinformation, [mbok], 0);
    cdsDSNUMERO.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_bairro_obrigatorio;
begin
  if edtNmbairro.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Bairro]), mtinformation, [mbok], 0);
    cdsNMBAIRRO.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_uf_obrigatorio;
begin
  if cbxcduf.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Unidade_Federativa]), mtinformation, [mbok], 0);
    cdsCDUF.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_municipio_obrigatorio;
begin
  if edtcdmunicipio.Text = '' then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [__Municipio]), mtinformation, [mbok], 0);
    cdsCDMUNICIPIO.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.check_endereco_obrigatorio;
begin
  if not empresa.cliente.boenderecoobrigatorio then
  begin
    Exit;
  end;
  check_cep_obrigatorio;
  check_cep_invalido;
  check_dsendereco_obrigatorio;
  check_numero_obrigatorio;
  check_bairro_obrigatorio;
  check_uf_obrigatorio;
  check_municipio_obrigatorio;
end;

procedure TfrmCliente.check_indiedest;
begin
  if (cdsCDINDIEDEST.AsInteger = 1) and (cdsNUINSCEST.asstring = '') then
  begin
    messagedlg('Incrição Estadual obrigatório para "CONTRIBUINTE".', mtinformation, [mbok], 0);
    pgc.ActivePage := tbscadastro;
    cdsNUINSCEST.FocusControl;
    abort;
  end;
end;

procedure TfrmCliente.check_ramo_atividade_obrigatorio;
begin
  if empresa.cliente.bormatividadeobrigatorio and (edtcdrmatividade.Text = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Ramo_de_Atividade]), mtinformation, [mbok], 0);
    pgc.ActivePage := tbscadastro;
    cdsCDRMATIVIDADE.FocusControl;
    Abort;
  end;
end;

procedure TfrmCliente.check_preenchimento_informacao_proprietario;
begin
  if (cds.State = dsinsert) and Empresa.cliente.boproprietarioobrigato and (cdsitproprietario.RecordCount = 0) then
  begin
    messagedlg('Preenchimento de informações do proprietário é obrigatório.', mtinformation, [mbok], 0);
    pgc.ActivePage := tbsProprietario;
    abort;
  end;
end;

procedure TfrmCliente.check_email_obrigatorio;
begin
  if empresa.cliente.boemailjuridicaobrigatorio and (edtemail.Text = '') and (rdbtppessoa.Properties.Items[rdbtppessoa.ItemIndex].Value = _j) then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Email]), mtinformation, [mbok], 0);
    cdsEMAIL.focuscontrol;
    Abort;
  end;
end;

procedure TfrmCliente.actSalvarExecute(Sender: TObject);
begin
  Self.Perform(WM_NEXTDLGCTL,0,0);
  check_nome_obrigatorio;
  check_razao_social_obrigatorio;
  check_endereco_obrigatorio;
  check_ramo_atividade_obrigatorio;
  check_preenchimento_informacao_proprietario;
  check_email_obrigatorio;
  check_indiedest;
  registro.Salvar;
end;

procedure TfrmCliente.actExcluirExecute(Sender: TObject);
begin
  registro.Excluir;
end;

procedure TfrmCliente.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmCliente.actCancelarExecute(Sender: TObject);
begin
  registro.Cancelar;
end;

procedure TfrmCliente.actEditarExecute(Sender: TObject);
begin
  registro.Editar;
end;

procedure TfrmCliente.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.CodigoKeyPress(Sender, Key, actNovo.Enabled);
end;

procedure TfrmCliente.edtCodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
  pgc.ActivePageIndex := 0;
  pnl.Caption := exibe;
  edtCodigo.SetFocus;
end;

procedure TfrmCliente.actProximoExecute(Sender: TObject);
begin
  registro.Proximo;
end;

procedure TfrmCliente.actAnteriorExecute(Sender: TObject);
begin
  registro.Anterior;
end;

procedure TfrmCliente.actcampanhaExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itclientecampanha, cds.FieldByName(_cd+_cliente).AsInteger, _cd+_cliente);
end;

procedure TfrmCliente.actUltimoExecute(Sender: TObject);
begin
  registro.Ultimo;
end;

procedure TfrmCliente.actPrimeiroExecute(Sender: TObject);
begin
  registro.Primeiro;
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmCliente.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure TfrmCliente.actImpCadgExecute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(319, cds.FieldByName(_CDCLIENTE).asstring);
end;

procedure TfrmCliente.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure TfrmCliente.actitrefcomercialExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itrefcomercial, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actitbancoExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itbanco, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actitclienteemailExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itclienteemail, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actitclienteinfcomercialExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itclienteinfcomercial, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actitclienteprodutoExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itclienteproduto, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actitcontclienteExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_itcontcliente, cds.FieldByName(_cdcliente).AsLargeInt, _cdcliente);
end;

procedure TfrmCliente.actAbrirPedidoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actabrirprodutoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmCliente.actabrirrepresentanteExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmCliente.actAbrirSaidaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actAbrirDuplicataExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actabriradntclienteExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.FormDestroy(Sender: TObject);
begin
  cliente.free;
  registro.destroy;
end;

procedure TfrmCliente.actabrirlocacaoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actabrirmovbancarioExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actabrirChequeExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.actabrirordservExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.edtnomeExit(Sender: TObject);
begin
  colorexit(sender);
  if ((cds.State = dsedit) or (cds.State = dsinsert)) and (cdsRZSOCIAL.IsNull) and (not cdsNMCLIENTE.isnull) then
  begin
    cdsRZSOCIAL.asstring := cdsNMCLIENTE.asstring;
  end;
end;

procedure TfrmCliente.edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtnucntcustoPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure TfrmCliente.edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  TCntcusto.edtnucntcustoPropertiesButtonClick(cds);
end;

procedure TfrmCliente.edtnuplcontaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtnuplcontaPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure TfrmCliente.edtnuplcontaPropertiesButtonClick(Sender: TObject;AButtonIndex: Integer);
begin
  tplconta.edtnuplcontaPropertiesButtonClick(cds);
end;

procedure TfrmCliente.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmCliente.actconsultaEquipamentoExecute(Sender: TObject);
begin
  SetQuery(_equipamento);
end;

procedure TfrmCliente.actconsultalocacaoExecute(Sender: TObject);
begin
  SetQuery(_locacao);
end;

procedure TfrmCliente.actabrirequipamentoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmCliente.SetQuery(tbl:string);
var
  sql2, sql : string;
  procedure set_duplicata;
  begin
    sql := 'SELECT D.NUDUPLICATA'+
                 ',D.DTEMISSAO'+
                 ',D.DTPRORROGACAO'+
                 ',D.DTBAIXA'+
                 ',D.VLDUPLICATA'+
                 ',D.VLSALDO'+
                 ',D.VLRECEBIDO'+
                 ',D.VLJUROSNRECEBIDO'+
                 ',D.CDDUPLICATA'+
                 ',D.DSHISTORICO'+
                 ',T.NMTPCOBRANCA'+
                 ',S.NUCOR'+
                 ',S.NMSTDUPLICATA '+
           'FROM DUPLICATA d '+
           'LEFT JOIN STDUPLICATA S ON S.CDSTDUPLICATA=D.CDSTDUPLICATA '+
           'LEFT JOIN TPCOBRANCA T ON T.CDTPCOBRANCA=D.CDTPCOBRANCA and d.cdempresa=t.cdempresa '+
           'where d.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and d.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_adntcliente;
  begin
    sql := 'SELECT CDADNTCLIENTE,DTEMISSAO,DTENTRADA,VLADNTCLIENTE,VLSALDO,VLUTILIZADO '+
           'FROM ADNTCLIENTE '+
           'where cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_equipamento;
  begin
    sql := 'select e.cdequipamento'+
                 ',e.nuserie'+
                 ',e.nupatrimonio'+
                 ',t.nmtpequipamento'+
                 ',m.nmmarca'+
                 ',mo.nmmodelo'+
                 ',c.nmcor '+
           'from equipamento E '+
           'left join marca M on m.cdmarca=e.cdmarca and m.cdempresa=e.cdempresa '+
           'left join modelo MO on mo.cdmodelo=e.cdmodelo and mo.cdempresa=e.cdempresa '+
           'left join tpequipamento T on t.cdtpequipamento=e.cdtpequipamento and e.cdempresa=t.cdempresa '+
           'left join cor C on c.cdcor=e.cdcor and c.cdempresa=e.cdempresa '+
           'where e.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and e.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_locacao;
  begin
    sql := 'select l.cdlocacao'+
                 ',l.dtemissao'+
                 ',l.dtprevista'+
                 ',l.vllocacao'+
                 ',l.QTITEM'+
                 ',s.nmstlocacao'+
                 ',e.cdequipamento'+
                 ',e.nuserie'+
                 ',e.nupatrimonio'+
                 ',t.nmtpequipamento'+
                 ',m.nmmarca'+
                 ',mo.nmmodelo'+
                 ',c.nmcor '+
           'from locacao l '+
           'left join stlocacao s on s.cdstlocacao=l.cdstlocacao '+
           'left join equipamento E on e.cdequipamento=l.cdequipamento and e.cdempresa=l.cdempresa '+
           'left join marca M on m.cdmarca=e.cdmarca and m.cdempresa=e.cdempresa '+
           'left join modelo MO on mo.cdmodelo=e.cdmodelo and mo.cdempresa=e.cdempresa '+
           'left join tpequipamento T on t.cdtpequipamento=e.cdtpequipamento and e.cdempresa=t.cdempresa '+
           'left join cor C on c.cdcor=e.cdcor and c.cdempresa=e.cdempresa '+
           'where e.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and l.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_cheque;
  begin
    sql := 'SELECT C.CDCHEQUE'+
                 ',C.NUCHEQUE'+
                 ',C.DTEMISSAO'+
                 ',C.DTENTRADA'+
                 ',c.dtvencimento'+
                 ',C.VLCHEQUE'+
                 ',S.NMSTCHEQUE'+
                 ',B.NMBANCO'+
                 ',C.NUAGENCIA'+
                 ',C.NUCONTACORRENTE '+
           'FROM CHEQUE C '+
           'LEFT JOIN BANCO B ON B.CDBANCO=C.CDBANCO '+
           'LEFT JOIN STCHEQUE S ON S.CDSTCHEQUE=C.CDSTCHEQUE and s.cdempresa=c.cdempresa '+
           'where c.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and c.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_movbancario;
  begin
    sql := 'SELECT M.CDMOVBANCARIO'+
                 ',O.NMMOVIMENTACAO'+
                 ',M.DTEMISSAO'+
                 ',C.NMCONTA'+
                 ',M.VLLANCAMENTO '+
           'FROM MOVBANCARIO M '+
           'LEFT JOIN CONTA C ON C.CDCONTA=M.CDCONTA and m.cdempresa=c.cdempresa '+
           'LEFT JOIN MOVIMENTACAO O ON O.CDMOVIMENTACAO=M.CDMOVIMENTACAO and o.cdempresa=m.cdempresa '+
           'where m.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and m.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_ordserv;
  begin
    sql := 'SELECT O.CDORDSERV'+
                 ',O.NUORDSERV'+
                 ',O.DTENTRADA'+
                 ',O.DTSAIDA'+
                 ',E.NMETAPA'+
                 ',t.nmtpordserv'+
                 ',S.NMSTORDSERV'+
                 ',O.VLTOTAL '+
           'FROM ORDSERV O '+
           'LEFT JOIN ETAPA E ON E.CDETAPA=O.CDETAPA and o.cdempresa=e.cdempresa '+
           'LEFT JOIN STORDSERV S ON S.CDSTORDSERV=O.CDSTORDSERV and s.cdempresa=o.cdempresa '+
           'left join tpordserv t on t.cdempresa=o.cdempresa and t.cdtpordserv=o.cdtpordserv '+
           'where o.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and o.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
    sql2 := 'SELECT I.CDORDSERV'+
                   ',I.CDDIGITADO'+
                   ',P.NMPRODUTO'+
                   ',I.QTITEM'+
                   ',I.VLUNITARIO'+
                   ',I.VLTOTAL '+
             'FROM ITORDSERV I '+
             'left join ordserv o on o.cdordserv=i.cdordserv and i.cdempresa=o.cdempresa '+
             'LEFT JOIN PRODUTO P ON P.CDPRODUTO=I.CDPRODUTO and p.cdempresa=i.cdempresa '+
             'where i.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and o.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;

  end;
  procedure set_pedido;
  begin
    sql   := 'SELECT P.CDPEDIDO'+
                   ',P.NUPEDIDO'+
                   ',P.DTEMISSAO'+
                   ',C.NMCONDPAGTO'+
                   ',T.NMTPCOBRANCA'+
                   ',R.NMREPRESENTANTE'+
                   ',S.NMSTPEDIDO'+
                   ',P.VLTOTAL '+
             'FROM PEDIDO P '+
             'LEFT JOIN CONDPAGTO C ON C.CDCONDPAGTO=P.CDCONDPAGTO and c.cdempresa=p.cdempresa '+
             'LEFT JOIN REPRESENTANTE R ON R.CDREPRESENTANTE=P.CDREPRESENTANTE and r.cdempresa=p.cdempresa '+
             'LEFT JOIN STPEDIDO S ON S.CDSTPEDIDO=P.CDSTPEDIDO and s.cdempresa=p.cdempresa '+
             'LEFT JOIN TPCOBRANCA T ON T.CDTPCOBRANCA=P.CDTPCOBRANCA and t.cdempresa=p.cdempresa '+
             'where p.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and p.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
    sql2 := 'SELECT I.CDPEDIDO'+
                   ',I.CDDIGITADO'+
                   ',P.NMPRODUTO'+
                   ',I.QTITEM'+
                   ',I.QTATENDIDA'+
                   ',I.VLUNITARIO'+
                   ',I.VLTOTAL '+
             'FROM ITPEDIDO I '+
             'left join pedido pe on pe.cdpedido=i.cdpedido and i.cdempresa=pe.cdempresa '+
             'LEFT JOIN PRODUTO P ON P.CDPRODUTO=I.CDPRODUTO and p.cdempresa=i.cdempresa '+
             'where pe.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and pe.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_orcamento;
  begin
    sql   := 'SELECT P.CDorcamento'+
                   ',P.DTEMISSAO'+
                   ',C.NMCONDPAGTO'+
                   ',T.NMTPCOBRANCA'+
                   ',R.NMREPRESENTANTE'+
                   ',S.NMSTorcamento'+
                   ',P.VLTOTAL '+
             'FROM orcamento P '+
             'LEFT JOIN CONDPAGTO C ON C.CDCONDPAGTO=P.CDCONDPAGTO and c.cdempresa=p.cdempresa '+
             'LEFT JOIN REPRESENTANTE R ON R.CDREPRESENTANTE=P.CDREPRESENTANTE and r.cdempresa=p.cdempresa '+
             'LEFT JOIN STorcamento S ON S.CDSTorcamento=P.CDSTorcamento and s.cdempresa=p.cdempresa '+
             'LEFT JOIN TPCOBRANCA T ON T.CDTPCOBRANCA=P.CDTPCOBRANCA and t.cdempresa=p.cdempresa '+
             'where p.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and p.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
    sql2 := 'SELECT I.CDorcamento'+
                   ',I.CDDIGITADO'+
                   ',P.NMPRODUTO'+
                   ',I.QTITEM'+
                   ',I.qtaprovado'+
                   ',I.VLUNITARIO'+
                   ',I.VLTOTAL '+
             'FROM ITorcamento I '+
             'left join orcamento pe on pe.cdorcamento=i.cdorcamento and i.cdempresa=pe.cdempresa '+
             'LEFT JOIN PRODUTO P ON P.CDPRODUTO=I.CDPRODUTO and p.cdempresa=i.cdempresa '+
             'where pe.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and pe.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
  procedure set_saida;
  begin
    sql := 'SELECT S.NUSAIDA'+
                 ',S.DTEMISSAO'+
                 ',S.DTSAIDA'+
                 ',S.NUDOCFISCALICMS'+
                 ',T.NMTPSAIDA'+
                 ',S.CDCFOP'+
                 ',R.NMREPRESENTANTE'+
                 ',C.NMCONDPAGTO'+
                 ',S.VLTOTAL'+
                 ',S.VLICMS'+
                 ',S.VLIPI'+
                 ',ST.NMSTDOCUMENTO'+
                 ',S.CDSAIDA '+
            'FROM SAIDA s '+
            'LEFT JOIN REPRESENTANTE r ON R.CDREPRESENTANTE=S.CDREPRESENTANTE and s.cdempresa=r.cdempresa '+
            'LEFT JOIN STDOCUMENTO ST ON ST.NUSTDOCUMENTO=S.NUSTDOCUMENTO '+
            'LEFT JOIN TPSAIDA T ON T.CDTPSAIDA=S.CDTPSAIDA and t.cdempresa=s.cdempresa '+
            'LEFT JOIN CONDPAGTO c ON C.CDCONDPAGTO=S.CDCONDPAGTO and c.cdempresa=s.cdempresa '+
            'where s.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and s.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
    sql2 := 'SELECT I.CDSAIDA'+
                   ',I.NUPEDIDO'+
                   ',I.CDITSAIDA'+
                   ',I.CDDIGITADO'+
                   ',P.NMPRODUTO'+
                   ',I.QTITEM'+
                   ',I.VLUNITARIO'+
                   ',I.VLICMS'+
                   ',I.VLIPI'+
                   ',I.VLTOTAL '+
             'FROM ITSAIDA i '+
             'left join saida s on s.cdsaida=i.cdsaida and s.cdempresa=i.cdempresa '+
             'LEFT JOIN PRODUTO p ON P.CDPRODUTO=I.CDPRODUTO and p.cdempresa=i.cdempresa '+
             'where s.cdempresa='+cds.FieldByName(_CDEMPRESA).AsString+' and s.cdcliente='+cds.FieldByName(_CDCLIENTE).AsString;
  end;
begin
  sql2 := '';
  cdsconsulta.Close;
  cdsitconsulta.Close;
  if cds.FieldByName(_CDCLIENTE).asstring = '' then
  begin
    exit;
  end;
  grdconsultaLevel2.Visible := False;
  if tbl = _duplicata then
  begin
    set_duplicata;
    grdconsultaLevel1.GridView := grdconsultaduplicata;
  end
  else if tbl = _adntcliente then
  begin
    set_adntcliente;
    grdconsultaLevel1.GridView := grdconsultaadntcliente;
  end
  else if tbl = _cheque then
  begin
    set_cheque;
    grdconsultaLevel1.GridView := grdconsultacheque;
  end
  else if tbl = _equipamento then
  begin
    set_equipamento;
    grdconsultaLevel1.GridView := grdconsultaequipamento;
  end
  else if tbl = _locacao then
  begin
    set_locacao;
    grdconsultaLevel1.GridView := grdconsultalocacao;
  end
  else if tbl = _movbancario then
  begin
    set_movbancario;
    grdconsultaLevel1.GridView := grdconsultamovbancario;
  end
  else if tbl = _ordserv then
  begin
    set_ordserv;
    grdconsultaLevel1.GridView := grdconsultaordserv;
    grdconsultaLevel2.GridView := grdconsultaitordserv;
  end
  else if tbl = _pedido then
  begin
    set_pedido;
    grdconsultaLevel1.GridView := grdconsultapedido;
    grdconsultaLevel2.GridView := grdconsultaitpedido;
  end
  else if tbl = _orcamento then
  begin
    set_orcamento;
    grdconsultaLevel1.GridView := grdconsultaorcamento;
    grdconsultaLevel2.GridView := grdconsultaitorcamento;
  end
  else if tbl = _saida then
  begin
    set_saida;
    grdconsultaLevel1.GridView := grdconsultasaida;
    grdconsultaLevel2.GridView := grdconsultaitsaida;
  end;
  sdsconsulta.CommandText := sql;
  cdsconsulta.SetProvider(dspconsulta);
  cdsconsulta.Open;
  if sql2 <> '' then
  begin
    grdconsultaLevel2.Visible := true;
    sdsitconsulta.CommandText := sql2;
    cdsitconsulta.SetProvider(dspitconsulta);
    cdsitconsulta.Open;
  end;
end;

function TfrmCliente.EnderecoCobrancaNaoPreenchido:boolean;
begin
  result := ((cdsDSENDCBRNC.IsNull) or (cdsDSENDCBRNC.AsString = '')) and
            ((cdsDSNUMCBRNC.IsNull) or (cdsDSNUMCBRNC.AsString = '')) and
            ((cdsDSCOMCBRNC.IsNull) or (cdsDSCOMCBRNC.AsString = '')) and
            ((cdsNMBAICBRNC.IsNull) or (cdsNMBAICBRNC.AsString = '')) and
            ((cdsCDMUNICIPIOCBRNC.IsNull) or (cdsCDMUNICIPIOCBRNC.AsString = ''));
end;

procedure TfrmCliente.actfichasaldoadntclienteExecute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(304, cds.FieldByName(_CDCLIENTE).AsString);
end;

procedure TfrmCliente.cdsCDREPRESENTANTEValidate(Sender: TField);
var
  representante : Trepresentante;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmrepresentante).Clear;
    Exit;
  end;
  representante := trepresentante.create;
  try
    if not representante.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    representante.strepresentante.Select(representante.cdstrepresentante);
    if representante.strepresentante.bogerarcliente = _N then
    begin
      messagedlg('Representante está no status '+representante.strepresentante.nmstrepresentante+#13+
                 'que não permite ser inserido no '+exibe+'.'#13+
                 'Escolha outro código para prosseguir.', mtinformation, [mbok], 0);
    end;
    sender.DataSet.FieldByName(_nmrepresentante).asstring := representante.nmrepresentante;
  finally
    FreeAndNil(representante);
  end;
end;

procedure TfrmCliente.cdsCDRMATIVIDADEValidate(Sender: TField);
var
  rmatividade : Trmatividade;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmrmatividade).Clear;
    Exit;
  end;
  rmatividade := trmatividade.create;
  try
    if not rmatividade.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmrmatividade).asstring := rmatividade.nmrmatividade;
  finally
    FreeAndNil(rmatividade);
  end;
end;

procedure TfrmCliente.cdsCDFORNECEDORSEGURADORAValidate(Sender: TField);
var
  fornecedor : tfornecedor;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmfornecedor).Clear;
    exit;
  end;
  fornecedor := TFornecedor.create;
  try
    if not fornecedor.Select(sender.AsLargeInt) then
    begin
      MessageDlg('Registro inexistente no cadstro de Fornecedor.', mtWarning, [mbOk], 0);
      sender.FocusControl;
      Abort;
    end;
    if fornecedor.bocteseguradora <> _s then
    begin
      MessageDlg('Fornecedor não está identificado como seguradora.', mtWarning, [mbOk], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmfornecedor).AsString := fornecedor.nmfornecedor;
  finally
    FreeAndNil(fornecedor);
  end;
end;

procedure TfrmCliente.cdsCDFUNCIONARIOVENDEDORValidate(Sender: TField);
var
  funcionario : tfuncionario;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmfuncionario).Clear;
    exit;
  end;
  funcionario := Tfuncionario.create;
  try
    if not funcionario.Select(sender.AsLargeInt) then
    begin
      MessageDlg('Registro inexistente no cadstro de funcionario.', mtWarning, [mbOk], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmfuncionario).AsString := funcionario.nmfuncionario;
  finally
    FreeAndNil(funcionario);
  end;
end;

procedure TfrmCliente.cdsCDINDIEDESTValidate(Sender: TField);
begin
  setnuinscestVisible;
  if sender.asinteger <> 1 then
  begin
    sender.dataset.fieldbyname(_nuinscest).clear;
  end;
end;

procedure TfrmCliente.cdsCDMUNICIPIOCBRNCValidate(Sender: TField);
var
  municipio : TMunicipio;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmmunicipio+_cbrnc).Clear;
    Exit;
  end;
  municipio := TMunicipio.create;
  try
    if not municipio.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmmunicipio+_cbrnc).asstring := municipio.nmmunicipio;
    if municipio.cduf <> sender.DataSet.FieldByName(_cdufcbrnc).AsInteger then
    begin
      sender.DataSet.FieldByName(_cdufcbrnc).AsInteger := municipio.cduf;
    end;
  finally
    FreeAndNil(municipio);
  end;
end;

procedure TfrmCliente.cdsCDMUNICIPIOValidate(Sender: TField);
var
  municipio : TMunicipio;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmmunicipio).Clear;
    Exit;
  end;
  municipio := TMunicipio.create;
  try
    if not municipio.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmmunicipio).asstring := municipio.nmmunicipio;
    if municipio.cduf <> sender.DataSet.FieldByName(_cduf).AsInteger then
    begin
      sender.DataSet.FieldByName(_cduf).AsInteger := municipio.cduf;
    end;
  finally
    FreeAndNil(municipio);
  end;
end;

procedure TfrmCliente.cdsCDPRODUTOValidate(Sender: TField);
var
  produto : Tproduto;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmproduto).Clear;
    Exit;
  end;
  produto := tproduto.create;
  try
    if not produto.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmproduto).asstring := produto.nmproduto;
  finally
    FreeAndNil(produto);
  end;
end;

procedure TfrmCliente.cdsNewRecord(DataSet: TDataSet);
var
  nucor : Integer;
begin
  dataset.FieldByName(_cdpais).asinteger := _nscpais;
  if Empresa.cliente.novopadraotppessoa <> '' then
  begin
    cdsTPPESSOA.Asstring := empresa.cliente.novopadraotppessoa;
  end;
  pnl.Caption              := exibe+ ' ' +  cds.FieldByName(_CDCLIENTE).asstring + ' - ' + edtnome.text;
  cdsCDSTCLIENTE.AsInteger  := qregistro.Codigo_status_novo(tbl);
  nucor                    := InteirodoCodigo(_st+tbl, cdsCDSTCLIENTE.AsString, _nucor);
  pnl.Style.Font.Color     := nucor;
  cdsDTCADASTRO.AsDateTime := dtbanco;
  gbxJuridica.BringToFront;
end;

procedure TfrmCliente.cdsAfterScroll(DataSet: TDataSet);
var
  nucor : Integer;
begin
  if cds.RecordCount > 0 then
  begin
    pnl.Caption := Exibe+' '+ cds.FieldByName(_CDCLIENTE).asstring + ' - '+cdsNMCLIENTE.Asstring+' ('+nomedocodigo(_st+tbl, cdsCDSTCLIENTE.asstring)+')';
    nucor := InteirodoCodigo(_st+tbl, cdsCDSTCLIENTE.AsString, _nucor);
    pnl.Style.Font.Color := nucor;
  end
  else
  begin
    pnl.caption := exibe;
    pnl.Style.Font.Color := 0;
  end;
  setNuinscestVisible;
  //registro.setStatus(tbl, cds);
  SetQueryBotaoAtivo;

  cliente.cdcliente := cds.FieldByName(_CDCLIENTE).AsLargeInt;
  Estatisca;
  SetMascaraNumeroFoneAcordoEstado;
  SetMascaraNumeroFoneCobrancaAcordoEstado;
  actcampanha.visible := BooleandoCodigo(_tpcliente, cdsCDTPCLIENTE.AsString, _bocampanha);
  actfilial.visible   := BooleandoCodigo(_tpcliente, cdsCDTPCLIENTE.AsString, _bofilial);
  tbsRisco.TabVisible := BooleandoCodigo(_tpcliente, cdsCDTPCLIENTE.AsString, _borisco);
end;

procedure TfrmCliente.cdsBeforePost(DataSet: TDataSet);
begin
  if Copy(cdsRZSOCIAL.AsString, 1, 1) = ' ' then
  begin
    MessageDlg('Razão Social não pode conter espaço no início.'#13'Altere a razão social para poder continuar.', mtInformation, [mbOK], 0);
    cdsRZSOCIAL.FocusControl;
    Abort;
  end;
  if not cdsDTCADASTRO.IsNull then
  begin
    if cdsDTCADASTRO.AsDateTime > dtbanco then
    begin
      messagedlg('Data do Cadastro do Cliente não pode ser maior do que a data atual.'#13'Digite outra data para continuar.', mtinformation, [mbok], 0);
      cdsDTCADASTRO.FocusControl;
      abort;
    end;
  end
  else
  begin
    cdsDTCADASTRO.AsDateTime := dtbanco;
  end;
  if cdsTPPESSOA.AsString = _J then
  begin
    if empresa.cliente.bocnpjobrigatorio and
      ((cdsNUCNPJ.asstring = '') or (cdsNUCNPJ.asstring = _cnpj_vazio)) and
      ((cdsCDPAIS.AsInteger = _nscpais) or
       (cdsCDPAIS.asstring = '')) then
    begin
      gbxJuridica.BringToFront;
      cdsNUCNPJ.FocusControl;
      messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_CNPJ]), mtinformation, [mbok], 0);
      Abort;
    end;
    ConsisteCNPJ(dataset, tbl, exibe, Empresa.cliente.BOCNPJrepetido);
    if cbxcdindiedest.Text = '' then
    begin
      messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, ['Indicador de Inscrição Estadual']), mtinformation, [mbok], 0);
      gbxJuridica.BringToFront;
      cdsCDINDIEDEST.FocusControl;
      Abort;
    end;
    if cdsCDINDIEDEST.AsInteger = 1 then
    begin
      ConsisteInscricaoEstadual(dataset, gbxJuridica, TEdit(edtnuinscest), pgc);
    end;
    cdsNUCPF.Clear;
    cdsNUIDENTID.clear;
    cdsDTNASCIMENTO.clear;
    cdsNMMAE.Clear;
    cdsNMPAI.clear;
    cdsCDSEXO.clear;
    cdsCDESTCIVIL.clear;
    cdsNMCONJUGE.clear;
  end
  else if cdsTPPESSOA.AsString = _F then // Pessoa Física - obrigatóriedade de CPF
  begin
    if empresa.cliente.bocpfobrigatorio and ((cdsNUCPF.asstring = '') or (cdsNUCPF.asstring = _cpf_vazio)) then
    begin
      gbxFisica.BringToFront;
      cdsNUCPF.FocusControl;
      messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_CPF]), mtinformation, [mbok], 0);
      Abort;
    end;
    cdsNUCNPJ.Clear;
    ConsisteCPF (dataset, tbl, exibe, Empresa.cliente.boCPFrepetido);
  end;
  // Representante - obrigatoriedade
  if (empresa.comercial.representante.bo and empresa.comercial.representante.boobrigatorio) and (cdsCDREPRESENTANTE.IsNull) then
  begin
    cdsCDREPRESENTANTE.FocusControl;
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Representante]), mtinformation, [mbok], 0);
    Abort;
  end;
  if Dataset.State = dsinsert then // gerar codigo do cliente automaticamente
  begin
    if registro.codigoinsercao = '' then
    begin
      if Empresa.cliente.bocdreduzido or empresa.livro.bopdv then
      begin
        registro.codigoinsercao := QGerar.GerarCodigo(tbl).ToString;
      end
      else
      begin
        if cdsTPPESSOA.AsString = _J then
        begin
          if cdsNUCNPJ.AsString <> '' then
          begin
            registro.codigoinsercao := removercaracteres(cdsNUCNPJ.AsString)
          end
          else
          begin
            registro.codigoinsercao := QGerar.GerarCodigo(tbl).ToString;
          end;
        end
        else if cdsTPPESSOA.AsString = _F then
        begin
          if cdsNUCPF.AsString <> '' then
          begin
            registro.codigoinsercao := removercaracteres(cdsNUCPF.AsString)
          end
          else
          begin
            registro.codigoinsercao := QGerar.GerarCodigo(tbl).ToString;
          end;
        end
        else
        begin
          registro.codigoinsercao := QGerar.GerarCodigo(tbl).ToString;
        end;
      end;
    end;
    cds.FieldByName(_CDCLIENTE).Asstring := registro.codigoinsercao;
    edtcodigo.text        := registro.codigoinsercao;
  end;
  // verifica se o endereço de cobrança não está preenchido para copiar os dados de endereço comercial
  if enderecocobrancanaopreenchido then
  begin
    CopiarEnderecoCobranca;
  end;
  if cdsCDTPCLIENTE.IsNull then // verifica se o tipo de cliente gera mensalidade
  begin
    cdsCDTPCLIENTEMENSALIDADE.Clear;
    cdsDTCADASTROSOCIO.Clear;
    cdsNUDIAMENSALIDADE.Clear;
  end;
  if empresa.cliente.botpcliente then
  begin
    if empresa.cliente.botpobrigatorio and cdsCDTPCLIENTE.IsNull then
    begin
      messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Tipo]), mtinformation, [mbok], 0);
      cdsCDTPCLIENTE.FocusControl;
      abort;
    end;
    if not cdsCDTPCLIENTE.IsNull then
    begin
      if not BooleandoCodigo(_tp+tbl, cdsCDTPCLIENTE.AsString, _bogerar+_mensalidade) then
      begin
        cdsCDTPCLIENTEMENSALIDADE.Clear;
        cdsDTCADASTROSOCIO.Clear;
        cdsNUDIAMENSALIDADE.Clear;
        cdsCDCONTRATO.Clear;
      end
      else if (cdsCDTPCLIENTEMENSALIDADE.AsString = '') and  (cdsCDCONTRATO.AsString = '') then
      begin
        messagedlg('O campo tipo de Mensalidade ou o contrato é obrigatório'#13'para o tipo de cliente '+cdsNMTPCLIENTEMENSALIDADE.AsString+'!', mtinformation, [mbok], 0);
        cdsCDTPCLIENTEMENSALIDADE.FocusControl;
        abort;
      end;
    end;
  end;
  if (cdsBOPENDENTECOBRANCA.IsNull) and (dataset.State = dsinsert) then
  begin
    cdsBOPENDENTECOBRANCA.Asstring := _N;
  end;
  if (not cdsDTCADASTROSOCIO.IsNull) and (cdsDTCADASTROSOCIO.AsDateTime > DtBanco) then
  begin
    MessageDlg('Data do sócio não pode ser maior do que a data atual.'#13'Altere a data para poder continuar.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbscadastro;
    if edtdtcadastrosocio.Visible then
    begin
      edtdtcadastrosocio.SetFocus;
    end;
  end;
  if dataset.fieldbyname(_cdindiedest).isnull then
  begin
    dataset.fieldbyname(_cdindiedest).asinteger := cliente.get_cdindiedest(dataset.fieldbyname(_cduf).asinteger, dataset.fieldbyname(_tppessoa).asstring, dataset.fieldbyname(_nuinscest).asstring);
  end;
  registro.set_update(cds);
end;

procedure TfrmCliente.cdsNUCEPValidate(Sender: TField);
begin
  consistircep(sender);
end;

procedure TfrmCliente.ValidarCPF_(tppessoa, nucpf:string);
var
  mensagem : string;
begin
  if tppessoa <> _F then
  begin
    exit;
  end;
  mensagem := ValidarCPF(nucpf);
  if mensagem <> '' then
  begin
    cdsitproprietarioNUCPFCNPJ.FocusControl;
    messagedlg(mensagem, mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfrmCliente.Validarcnpj_(tppessoa, nucnpj:string);
begin
  if tppessoa <> _J then
  begin
    exit;
  end;
  if (removercaracteres(nucnpj) <> '') and (ValidarCNPJ(nucnpj)<>'') then
  begin
    cdsitproprietarioNUCPFCNPJ.FocusControl;
    messagedlg('CNPJ inválido!', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

procedure TfrmCliente.LiberarcomAssinatura(msg:string);
var
  cdusuario: Integer;
begin
  if assinaturadigital(msg, cdusuario) then
  begin
    cdsitproprietarioCDUSUARIOL.AsInteger   := cdusuario;
    cdsitproprietarioCDCOMPUTADORL.Asstring := vgcdcomputador;
    cdsitproprietarioTSLIBERADO.AsDateTime  := tsbanco;
  end
  else
  begin
    cdsitproprietarioNMPROPRIETARIO.FocusControl;
    abort;
  end;
end;

procedure TfrmCliente.Validarcpfproprietariodebito;
var
  cdcliente : string;
begin
  cdcliente := cds.fieldbyname(_cdcliente).ASString;
  if (not empresa.cliente.bocpfproprietariodebito) or (cdsitproprietarioNUCPFCNPJ.Asstring = '') or (cdsitproprietarioTPPESSOA.AsString <> _F) then
  begin
    exit;
  end;
  cliente.cdcliente := cdcliente.ToInt64;
  cdcliente         := Cliente.ConsistirProprietarioEmOutroCadastro(cdsitproprietarioNUCPFCNPJ.Asstring);
  if (cdcliente <> '') and (messagedlg('CPF '+cdsitproprietarioNUCPFCNPJ.Asstring+' já é propritário na(s) empresa(s) '#13+cdcliente+'.'#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrno) then
  begin
    abort;
  end;
  cdcliente         := Cliente.ConsistirProprietarioEmDebito(cdsitproprietarioTPPESSOA.AsString, cdsitproprietarioNUCPFCNPJ.Asstring);
  if (cdcliente <> '') then
  begin
    if (messagedlg('CPF '+cdsitproprietarioNUCPFCNPJ.Asstring+' possui débito em atraso no '#13'cliente '+cdcliente+' - '+nomedocodigo(_cliente, cdcliente)+'.'#13+_msg_deseja_Continuar, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      Abort;
    end
    else
    begin
      liberarcomassinatura('CPF '+cdsitproprietarioNUCPFCNPJ.Asstring+' possui débito em atraso no '#13+
                           'cliente '+cdcliente+' - '+nomedocodigo(_cliente, cdcliente)+'.'#13+
                           'Assine digitalmente para liberar o cadastro do proprietário.');
    end;
  end;
  cdcliente := CodigodoCampo(_cliente, cdsitproprietarioNUCPFCNPJ.Asstring, _nucpf);
  if cdcliente <> '' then
  begin
    messagedlg('CPF já cadastrado no cliente '#13+cdcliente+' - '+nomedocodigo(_cliente, cdcliente)+'.', mtinformation, [mbok], 0);
  end;
end;

procedure TfrmCliente.Validarcnpjproprietariodebito;
var
  cdcliente : String;
begin
  cdcliente := cds.fieldbyname(_cdcliente).AsString;
  if (not empresa.cliente.bocpfproprietariodebito) or (cdsitproprietarioNUCPFCNPJ.Asstring = '') or (cdsitproprietarioTPPESSOA.AsString <> _J) then
  begin
    exit;
  end;
  cliente.cdcliente := cdcliente.ToInt64;
  cdcliente := Cliente.ConsistirProprietarioEmDebito(cdsitproprietarioTPPESSOA.AsString, cdsitproprietarioNUCPFCNPJ.Asstring);
  if cdcliente <> '' then
  begin
    liberarcomassinatura('CNPJ '+cdsitproprietarioNUCPFCNPJ.Asstring+' possui débito em atraso no '#13+
                         'cliente '+cdcliente+' - '+nomedocodigo(_cliente, cdcliente)+'.'#13+
                         'Assine digitalmente para liberar o cadastro do proprietário.');
  end;
  cdcliente := CodigodoCampo(_cliente, cdsitproprietarioNUCPFCNPJ.Asstring, _nucnpj);
  if cdcliente <> '' then
  begin
    messagedlg('CNPJ já cadastrado no cliente '#13+cdcliente+' - '+nomedocodigo(_cliente, cdcliente)+'.', mtinformation, [mbok], 0);
  end;
end;

procedure TfrmCliente.consisteobrigatoriedadeinterna;
begin
  if Empresa.cliente.boproprietarionome and (cdsitproprietarioNMPROPRIETARIO.AsString = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_nome+' '+_do+' '+__proprietario]), mtinformation, [mbok], 0);
    cdsitproprietarioNMPROPRIETARIO.FocusControl;
    abort;
  end;
  if Empresa.cliente.boproprietariocpfcnpj and (cdsitproprietarioTPPESSOA.AsString = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_tipo+' '+_de+' '+_pessoa]), mtinformation, [mbok], 0);
    cdsitproprietarioTPPESSOA.FocusControl;
    abort;
  end;
  if empresa.cliente.boproprietariocpfcnpj and (cdsitproprietarioNUCPFCNPJ.AsString = '') then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_CPF+'/'+_CNPJ]), mtinformation, [mbok], 0);
    cdsitproprietarioNUCPFCNPJ.FocusControl;
    abort;
  end;
  if Empresa.cliente.boproprietarioprsocio and cdsitproprietarioPRSOCIEDADE.IsNull then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, ['%'+' '+_da+' '+_sociedade]), mtinformation, [mbok], 0);
    cdsitproprietarioPRSOCIEDADE.FocusControl;
    abort;
  end;
end;

procedure TfrmCliente.formatardocumento;
var
  nudoc : string;
begin
  if cdsitproprietarioNUCPFCNPJ.Asstring = '' then
  begin
    exit;
  end;
  nudoc := cdsitproprietarioNUCPFCNPJ.Asstring;
  nudoc := removercaracteres(nudoc);
  if cdsitproprietarioTPPESSOA.Asstring = _F then
  begin
    nudoc := copy(nudoc, 1, 3)+'.'+copy(nudoc, 4, 3)+'.'+copy(nudoc, 7, 3)+'-'+copy(nudoc, 10, 2)
  end
  else
  begin
    nudoc := copy(nudoc, 1, 2)+'.'+copy(nudoc, 3, 3)+'.'+copy(nudoc, 6, 3)+'/'+copy(nudoc, 9, 4)+'-'+copy(nudoc, 13, 2);
  end;
  cdsitproprietarioNUCPFCNPJ.Asstring := nudoc;
end;

procedure TfrmCliente.cdsitproprietarioBeforePost(DataSet: TDataSet);
begin
  if (dataset.State = dsinsert) or (dataset.State = dsedit) then
  begin
    consisteobrigatoriedadeinterna;
    ValidarCPF_(cdsitproprietarioTPPESSOA.Asstring, cdsitproprietarioNUCPFCNPJ.AsString);
    Validarcpfproprietariodebito;
    validarcnpj_(cdsitproprietarioTPPESSOA.Asstring, cdsitproprietarioNUCPFCNPJ.AsString);
    Validarcnpjproprietariodebito;
    formatardocumento;
    if cdsitproprietarioCDITPROPRIETARIO.IsNull then
    begin
      cdsitproprietarioCDITPROPRIETARIO.AsInteger := qgerar.GerarCodigo(_itproprietario);
    end;
  end;
  registro.set_update(cdsitproprietario);
end;

procedure TfrmCliente.cdsitproprietarioCDMUNICIPIOValidate(Sender: TField);
var
  municipio : TMunicipio;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmmunicipio).Clear;
    Exit;
  end;
  municipio := TMunicipio.create;
  try
    if not municipio.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmmunicipio).asstring := municipio.nmmunicipio;
    if municipio.cduf <> sender.DataSet.FieldByName(_cduf).AsInteger then
    begin
      sender.DataSet.FieldByName(_cduf).AsInteger := municipio.cduf;
    end;
  finally
    FreeAndNil(municipio);
  end;
end;

procedure TfrmCliente.cdsitproprietarioCDUFValidate(Sender: TField);
begin
  if sender.IsNull then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
    Exit;
  end;
  if sender.DataSet.FieldByName(_cdmunicipio).IsNull then
  begin
    Exit;
  end;
  if Sender.AsInteger <> qregistro.InteirodoCodigo(_municipio, Sender.DataSet.FieldByName(_cdmunicipio).AsInteger, _cduf) then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
  end;
end;

procedure TfrmCliente.cdsclientecondpagtoCDCONDPAGTOValidate(Sender: TField);
begin
  if not BooleandoCodigo(_condpagto, sender.AsString, _bosaida) then
  begin
    messagedlg('Condição de Pagamento näo está liberada para Nota Fiscal.'#13'Escolha outro código para prosseguir.', mtinformation, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
end;

procedure TfrmCliente.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  exit;
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  ConfigurarSQLDataSet;
  ConfigurarEmpresa;
  AbrirTabelas;
  registro := tregistro.create(self, tbl, exibe, artigoI, cds, dts, edtcodigo);
  actitclienteemail.Visible           := registroexiste(_serie, _nudocfiscalicms+'='+quotedstr(_55)) or Empresa.faturamento.cte.bo or empresa.financeiro.duplicata.bo;
  GeraMenuRelatorio ('', btnimprimir, 3, cds, _cliente);
  cliente := Tcliente.create;
  tbsconsulta.TabVisible := false;
end;

procedure TfrmCliente.dtsStateChange(Sender: TObject);
begin
  actcampanha.enabled := acteditar.enabled;
end;

procedure TfrmCliente.colorenter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmCliente.colorexit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmCliente.ConfigurarSQLDataSet;
begin
  sds.CommandText := 'SELECT CLIENTE.*'+
                           ',fornecedor.nmfornecedor'+
                           ',contrato.nmcontrato'+
                           ',condpagto.nmcondpagto'+
                           ',REPRESENTANTE.NMREPRESENTANTE'+
                           ',FUNCIONARIO.NMFUNCIONARIO'+
                           ',MUNICIPIO.NMMUNICIPIO'+
                           ',municipiocbrnc.nmmunicipio NMMUNICIPIOCBRNC'+
                           ',TPCLIENTE.NMTPCLIENTE'+
                           ',TPCLIENTEMENSALIDADE.NMTPCLIENTEMENSALIDADE'+
                           ',RMATIVIDADE.NMRMATIVIDADE'+
                           ',CNTCUSTO.NMCNTCUSTO'+
                           ',PLCONTA.NMPLCONTA'+
                           ',PRODUTO.NMPRODUTO '+
                     'FROM CLIENTE '+
                     'LEFT JOIN PRODUTO ON PRODUTO.CDPRODUTO=CLIENTE.CDPRODUTO AND PRODUTO.CDEMPRESA=CLIENTE.CDEMPRESA '+
                     'LEFT JOIN CNTCUSTO ON CNTCUSTO.CDEMPRESA=CLIENTE.CDEMPRESA AND CNTCUSTO.CDCNTCUSTO=CLIENTE.CDCNTCUSTO '+
                     'LEFT JOIN PLCONTA ON PLCONTA.CDEMPRESA=CLIENTE.CDEMPRESA AND PLCONTA.CDPLCONTA=CLIENTE.CDPLCONTA '+
                     'LEFT JOIN RMATIVIDADE ON RMATIVIDADE.CDEMPRESA=CLIENTE.CDEMPRESA AND RMATIVIDADE.CDRMATIVIDADE=CLIENTE.CDRMATIVIDADE '+
                     'LEFT JOIN TPCLIENTE ON TPCLIENTE.CDEMPRESA=CLIENTE.CDEMPRESA AND TPCLIENTE.CDTPCLIENTE=CLIENTE.CDTPCLIENTE '+
                     'LEFT JOIN TPCLIENTEMENSALIDADE ON TPCLIENTEMENSALIDADE.CDEMPRESA=CLIENTE.CDEMPRESA AND TPCLIENTEMENSALIDADE.CDTPCLIENTEMENSALIDADE=CLIENTE.CDTPCLIENTEMENSALIDADE '+
                     'LEFT JOIN MUNICIPIO ON MUNICIPIO.CDMUNICIPIO=CLIENTE.CDMUNICIPIO '+
                     'LEFT JOIN MUNICIPIO MUNICIPIOCBRNC ON MUNICIPIOCBRNC.CDMUNICIPIO=CLIENTE.CDMUNICIPIO '+
                     'LEFT JOIN FORNECEDOR ON FORNECEDOR.CDFORNECEDOR=CLIENTE.CDFORNECEDORSEGURADORA AND FORNECEDOR.CDEMPRESA=CLIENTE.CDEMPRESA '+
                     'left join CONTRATO ON CONTRATO.CDEMPRESA=CLIENTE.CDEMPRESA AND CONTRATO.CDCONTRATO=CLIENTE.CDCONTRATO '+
                     'left join CONDPAGTO ON CONDPAGTO.CDEMPRESA=CLIENTE.CDEMPRESA AND CONDPAGTO.CDCONDPAGTO=CLIENTE.CDCONDPAGTO '+
                     'LEFT JOIN REPRESENTANTE ON REPRESENTANTE.CDEMPRESA=CLIENTE.CDEMPRESA AND REPRESENTANTE.CDREPRESENTANTE=CLIENTE.CDREPRESENTANTE '+
                     'LEFT JOIN FUNCIONARIO ON FUNCIONARIO.CDEMPRESA=CLIENTE.CDEMPRESA AND FUNCIONARIO.CDFUNCIONARIO=CLIENTE.CDFUNCIONARIOVENDEDOR '+
                     'WHERE CLIENTE.CDEMPRESA=:CDEMPRESA AND CLIENTE.CDCLIENTE=:CDCLIENTE';
  sds.Params[0].DataType  := ftLargeint;
  sds.Params[0].Name      := UpperCase(_cdempresa);
  sds.Params[0].ParamType := ptInput;
  sds.Params[0].Size      := 34;
  sds.Params[1].DataType  := ftLargeint;
  sds.Params[1].Name      := UpperCase(_cdcliente);
  sds.Params[1].ParamType := ptInput;
  sds.Params[1].Size      := 34;
  sdsitproprietario.CommandText := 'SELECT ITPROPRIETARIO.*,MUNICIPIO.NMMUNICIPIO '+
                                   'FROM ITPROPRIETARIO '+
                                   'LEFT JOIN MUNICIPIO ON MUNICIPIO.CDMUNICIPIO=ITPROPRIETARIO.CDMUNICIPIO '+
                                   'WHERE CDEMPRESA=:CDEMPRESA AND CDCLIENTE=:CDCLIENTE';
  sdsitproprietario.Params[0].DataType  := ftLargeint;
  sdsitproprietario.Params[0].Name      := UpperCase(_cdempresa);
  sdsitproprietario.Params[0].ParamType := ptInput;
  sdsitproprietario.Params[0].Size      := 34;
  sdsitproprietario.Params[1].DataType  := ftLargeint;
  sdsitproprietario.Params[1].Name      := UpperCase(_cdcliente);
  sdsitproprietario.Params[1].ParamType := ptInput;
  sdsitproprietario.Params[1].Size      := 34;
end;

procedure TfrmCliente.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure TfrmCliente.actconsultapedidoExecute(Sender: TObject);
begin
  SetQuery(_pedido);
end;

procedure TfrmCliente.actconsultasaidaExecute(Sender: TObject);
begin
  SetQuery(_saida);
end;

procedure TfrmCliente.actconsultaduplicataExecute(Sender: TObject);
begin
  SetQuery(_duplicata);
end;

procedure TfrmCliente.actclientecondpagtoExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_clientecondpagto, cds.FieldByName(_cdcliente).AsLargeInt, _cd+_cliente);
end;

procedure TfrmCliente.actclienteentregaExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_clienteentrega, cds.FieldByName(_cdcliente).AsLargeInt, _cd+_cliente);
end;

procedure TfrmCliente.actclientetpcobrancaExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_clientetpcobranca, cds.FieldByName(_cdcliente).AsLargeInt, _cd+_cliente);
end;

procedure TfrmCliente.actconsultaadntclienteExecute(Sender: TObject);
begin
  SetQuery(_adntcliente);
end;

procedure TfrmCliente.actconsultamovbancarioExecute(Sender: TObject);
begin
  SetQuery(_movbancario);
end;

procedure TfrmCliente.actconsultachequeExecute(Sender: TObject);
begin
  SetQuery(_cheque);
end;

procedure TfrmCliente.actconsultaordservExecute(Sender: TObject);
begin
  SetQuery(_ordserv);
end;

procedure TfrmCliente.grdconsultaduplicataCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actAbrirDuplicataExecute(actAbrirDuplicata);
end;

procedure TfrmCliente.grdconsultaadntclienteDblClick(Sender: TObject);
begin
  actabriradntclienteExecute(actabriradntcliente);
end;

procedure TfrmCliente.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ExportarExcel(Key, sender);
end;

procedure TfrmCliente.rdbtppessoaPropertiesChange(Sender: TObject);
begin
  QForm.ConfigurarRDBTpPessoaPropertiesChange(rdbtppessoa, gbxJuridica, lblrzsocial, gbxFisica);
end;

procedure TfrmCliente.cdsNUFONE1Validate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFONE2Validate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFONE3Validate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUPLCONTAValidate(Sender: TField);
var
  plconta : tplconta;
begin
  if sender.AsString = '' then
  begin
    Sender.DataSet.FieldByName(_cdplconta).Clear;
    Sender.DataSet.FieldByName(_nmplconta).Clear;
    exit;
  end;
  plconta := tplconta.Create;
  try
    if not plconta.Select(_nunivel+'='+sender.AsString.QuotedString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_plano+' '+_conta)]), mterror, [mbok], 0);
      sender.FocusControl;
      abort;
    end;
    Sender.DataSet.FieldByName(_cdplconta).AsInteger := plconta.cdplconta;
    Sender.DataSet.FieldByName(_nmplconta).AsString  := plconta.nmplconta;
  finally
    FreeAndNil(plconta);
  end;
end;

procedure TfrmCliente.cdsTPPESSOAValidate(Sender: TField);
begin
  if sender.asstring = _f then
  begin
    sender.dataset.fieldbyname(_cdindiedest).asinteger := 3;
  end;
end;

procedure TfrmCliente.cdsNUFAXValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFONE1CBRNCValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFONE2CBRNCValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFONE3CBRNCValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUFAXCBRNCValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNUCELULARValidate(Sender: TField);
begin
  registro.check_numero_telefone(Sender);
end;

procedure TfrmCliente.cdsNMCLIENTEValidate(Sender: TField);
begin
  if sender.IsNull then
  begin
    messagedlg(Format(_msg_s_eh_um_campo_obrigatorio, [_Nome]), mtinformation, [mbok], 0);
    sender.FocusControl;
    Abort;
  end;
end;

procedure TfrmCliente.cdsCDCONDPAGTOValidate(Sender: TField);
var
  condpagto : Tcondpagto;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmcondpagto).Clear;
    Exit;
  end;
  condpagto := tcondpagto.create;
  try
    if not condpagto.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    if condpagto.bocte <> _s then
    begin
      MessageDlg('Condição de Pagamento não está liberado para CTE.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmcondpagto).asstring := condpagto.nmcondpagto;
  finally
    FreeAndNil(condpagto);
  end;
end;

procedure TfrmCliente.cdsCDCONTRATOValidate(Sender: TField);
var
  contrato : TContrato;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmcontrato).Clear;
    Exit;
  end;
  contrato := tcontrato.create;
  try
    if not contrato.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    if contrato.bomensalidade <> _s then
    begin
      cdsCDTPCLIENTEMENSALIDADE.Clear;
    end;
    sender.DataSet.FieldByName(_nmcontrato).asstring := contrato.nmcontrato;
  finally
    FreeAndNil(contrato);
  end;
end;

procedure TfrmCliente.cdsCDTPCLIENTEMENSALIDADEValidate(Sender: TField);
var
  tpclientemensalidade : Ttpclientemensalidade;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmtpclientemensalidade).Clear;
    Exit;
  end;
  tpclientemensalidade := Ttpclientemensalidade.create;
  try
    if not tpclientemensalidade.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmtpclientemensalidade).asstring := tpclientemensalidade.nmtpclientemensalidade;
    setrecord(Sender.AsInteger);
    sender.DataSet.FieldByName(_CDCONTRATO).Clear;
  finally
    FreeAndNil(tpclientemensalidade);
  end;
end;

procedure TfrmCliente.cdsCDTPCLIENTEValidate(Sender: TField);
var
  tpcliente : Ttpcliente;
begin
  if sender.AsString = '' then
  begin
    sender.DataSet.FieldByName(_nmtpcliente).Clear;
    Exit;
  end;
  tpcliente := ttpcliente.create;
  try
    if not tpcliente.Select(sender.AsInteger) then
    begin
      MessageDlg('Registro inexistente.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    sender.DataSet.FieldByName(_nmtpcliente).asstring := tpcliente.nmtpcliente;
    setrecord(Sender.AsInteger);
  finally
    FreeAndNil(tpcliente);
  end;
end;

procedure TfrmCliente.cdsCDUFCBRNCValidate(Sender: TField);
begin
  SetMascaraNumeroFoneCobrancaAcordoEstado;
  if sender.IsNull then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
    Exit;
  end;
  if sender.DataSet.FieldByName(_cdmunicipio).IsNull then
  begin
    Exit;
  end;
  if Sender.AsInteger <> qregistro.InteirodoCodigo(_municipio, Sender.DataSet.FieldByName(_cdmunicipio).AsInteger, _cduf) then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
  end;
end;

procedure TfrmCliente.cdsCDUFValidate(Sender: TField);
begin
  SetMascaraNumeroFoneAcordoEstado;
  if sender.asstring = _99 then
  begin
    cdsNUCNPJ.AsString    := _cnpj_exterior;
    cdsNUINSCEST.AsString := qstring.maiuscula(_ISENTO);
  end;
  if sender.IsNull then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
    Exit;
  end;
  if sender.DataSet.FieldByName(_cdmunicipio).IsNull then
  begin
    Exit;
  end;
  if Sender.AsInteger <> qregistro.InteirodoCodigo(_municipio, Sender.DataSet.FieldByName(_cdmunicipio).AsInteger, _cduf) then
  begin
    sender.DataSet.FieldByName(_cdmunicipio).Clear;
  end;
end;

procedure TfrmCliente.cdsNUCEPCBRNCValidate(Sender: TField);
begin
  consistircep(sender, true);
end;

procedure TfrmCliente.edtcdcondpagtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdcondpagtoPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdcondpagtoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_condpagto);
  if cd <> 0 then
  begin
    cdscdcondpagto.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdcontratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdcontratoPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdcontratoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := LocalizarContrato;
  if cd <> 0 then
  begin
    cdscdcontrato.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdfornecedorseguradoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedorseguradoraPropertiesButtonClick(sender, 0)
  end;
end;

procedure TfrmCliente.edtcdfornecedorseguradoraPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  QForm.edtcdfornecedorPropertiesButtonClick(self, cds, _cdfornecedor+_seguradora);
end;

procedure TfrmCliente.edtcdfuncionariovendedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfuncionariovendedorPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdfuncionariovendedorPropertiesButtonClick(sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := Localizarfuncionario;
  if cd <> 0 then
  begin
    cdscdfuncionariovendedor.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtCDMUNICIPIOCBRNCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdmunicipioCBRNCPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtCDMUNICIPIOCBRNCPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_municipio);
  if cd <> 0 then
  begin
    cdsCDMUNICIPIOCBRNC.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdmunicipioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdmunicipioPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdmunicipioPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_municipio);
  if cd <> 0 then
  begin
    cdscdmunicipio.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdprodutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdprodutoPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure TfrmCliente.edtcdprodutoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := Localizarproduto;
  if cd <> 0 then
  begin
    cdscdproduto.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdrepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdrepresentantePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdrepresentantePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_representante);
  if cd <> 0 then
  begin
    cdscdrepresentante.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdrmatividadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdrmatividadePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdrmatividadePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_rmatividade);
  if cd <> 0 then
  begin
    cdscdrmatividade.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdtpclienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdtpclientePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdtpclientemensalidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdtpclientemensalidadePropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift);
  end;
end;

procedure TfrmCliente.edtcdtpclientemensalidadePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_tpclientemensalidade);
  if cd <> 0 then
  begin
    cdsCDTPCLIENTEMENSALIDADE.AsInteger := cd;
  end
end;

procedure TfrmCliente.edtcdtpclientePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_tpcliente);
  if cd <> 0 then
  begin
    cdscdtpcliente.AsInteger := cd;
  end
end;

procedure TfrmCliente.actabrircondpagtoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmCliente.actabrircontratoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmCliente.lblcontratoDblClick(Sender: TObject);
begin
  actAbrircontrato.onExecute(actAbrircontrato);
end;

procedure TfrmCliente.tbvitproprietarioCDMUNICIPIOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd : integer;
begin
  if (cds.State <> dsedit) and (cds.State <> dsinsert) then
  begin
    Exit;
  end;
  cd := uLocalizar.Localizar(_municipio);
  if cd <> 0 then
  begin
    if (cdsitproprietario.State <> dsedit) and (cdsitproprietario.State <> dsinsert) then
    begin
      cdsitproprietario.Edit;
    end;
    cdsitproprietariocdmunicipio.AsInteger := cd;
  end
end;

procedure TfrmCliente.txtnmcondpagtoDblClick(Sender: TObject);
begin
  actAbrircondpagtoExecute(actAbrircondpagto);
end;

procedure TfrmCliente.txtNMCONTRATODblClick(Sender: TObject);
begin
  actAbrircontratoExecute(actAbrircontrato);
end;

procedure TfrmCliente.txtnmprodutoDblClick(Sender: TObject);
begin
  actAbrirProdutoExecute(actAbrirProduto);
end;

procedure TfrmCliente.txtnmrepresentanteDblClick(Sender: TObject);
begin
  actAbrirrepresentanteExecute(actAbrirrepresentante);
end;

procedure TfrmCliente.grdconsultaduplicataCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column : TcxGridDBBandedColumn;
begin
  Column             := grdconsultaduplicataNUDUPLICATA;
  if AViewInfo.Item.ID = Column.Index then
  begin
    Exit;
  end;
  Column             := grdconsultaduplicataNUCOR;
  ACanvas.Font.Color := strtoint(AViewInfo.GridRecord.DisplayTexts[Column.Index]);
  if ACanvas.Font.Color = clred then
  begin
    ACanvas.Font.Style := [fsStrikeOut, fsBold]
  end
  else if ACanvas.Font.Color = clblue then
  begin
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TfrmCliente.grdconsultalocacaoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actAbrirlocacaoExecute(actAbrirlocacao);
end;

procedure TfrmCliente.pgcChange(Sender: TObject);
begin
  if pgc.ActivePage = tbsfinanceiro then
  begin
    Estatisca;
  end;
end;

procedure TfrmCliente.actconsultaorcamentoExecute(Sender: TObject);
begin
  SetQuery(_orcamento);
end;

procedure TfrmCliente.grdconsultasaidaCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _nusaida then actabrirsaidaExecute(actabrirsaida);
end;

procedure TfrmCliente.cdsDTNASCIMENTOValidate(Sender: TField);
begin
  registro.consistir_data_nascimento(Sender);
end;

procedure TfrmCliente.cdsitproprietarioDTNASCIMENTOValidate(Sender: TField);
begin
  registro.consistir_data_nascimento(Sender);
end;

procedure TfrmCliente.cdsNUCPFValidate(Sender: TField);
var
  cdcliente : string;
begin
  if removercaracteres(Sender.AsString) = '' then
  begin
    Exit;
  end;
  cdcliente := qregistro.codigo_do_registro_existe(_nucpf, Sender.AsString, tbl, cds.FieldByName(_CDCLIENTE).AsString);
  if cdcliente <> '' then
  begin
    cdsNUCPF.OnValidate := nil;
    MessageDlg('CPF repetido no cliente '+cdcliente+' - '+NomedoCodigo(_cliente, cdcliente)+'.', mtInformation, [mbOK], 0);
    cdsNUCPF.OnValidate := cdsNUCPFValidate;
    if not empresa.cliente.boCPFrepetido then
    begin
      sender.FocusControl;
      Abort;
    end;
  end;
end;

procedure TfrmCliente.cdsNUCNPJValidate(Sender: TField);
var
  cdcliente : string;
begin
  if (removercaracteres(Sender.AsString) = '') or (cdscduf.asstring = _99) then
  begin
    exit;
  end;
  cdcliente := qregistro.codigo_do_registro_existe(_nucnpj, Sender.AsString, tbl, cds.FieldByName(_CDCLIENTE).AsString);
  if cdcliente <> '' then
  begin
    MessageDlg('CNPJ repetido no cliente '+cdcliente+' - '+NomedoCodigo(_cliente, cdcliente)+'.', mtInformation, [mbOK], 0);
    if not empresa.cliente.boCNPJrepetido then
    begin
      sender.FocusControl;
      Abort;
    end;
  end;
end;

procedure TfrmCliente.cdsNUCNTCUSTOValidate(Sender: TField);
var
  cntcusto : tcntcusto;
begin
  if sender.AsString = '' then
  begin
    Sender.DataSet.FieldByName(_cdcntcusto).Clear;
    Sender.DataSet.FieldByName(_nmcntcusto).Clear;
    exit;
  end;
  cntcusto := tcntcusto.Create;
  try
    if not cntcusto.Select(_nunivel+'='+sender.AsString.QuotedString) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_centro+' '+_custo)]), mterror, [mbok], 0);
      sender.FocusControl;
      abort;
    end;
    Sender.DataSet.FieldByName(_cdcntcusto).AsInteger := cntcusto.cdcntcusto;
    Sender.DataSet.FieldByName(_nmcntcusto).AsString  := cntcusto.nmcntcusto;
  finally
    FreeAndNil(cntcusto);
  end;
end;

procedure TfrmCliente.actfilialExecute(Sender: TObject);
begin
  Abrir_dlg_Tabela(_clientefilial, cds.FieldByName(_cd+_cliente).AsInteger, _cd+_cliente);
end;

procedure TfrmCliente.cdsclienteprofissaoBeforePost(DataSet: TDataSet);
begin
  if cdsclienteprofissaoCDCLIENTEPROFISSAO.IsNull then
  begin
    cdsclienteprofissaoCDCLIENTEPROFISSAO.AsInteger := qgerar.GerarCodigo(_clienteprofissao);
  end;
  registro.set_update(cdsclienteprofissao);
end;

procedure TfrmCliente.cdsclienteprofissaoriscoBeforePost(DataSet: TDataSet);
begin
  if cdsclienteprofissaoriscoCDCLIENTEPROFISSAORISCO.IsNull then
  begin
    cdsclienteprofissaoriscoCDCLIENTEPROFISSAORISCO.AsInteger := qgerar.GerarCodigo(_clienteprofissaorisco);
  end;
  registro.set_update(cdsclienteprofissaorisco);
end;

procedure TfrmCliente.setrecord(cdtp: integer);
begin
  if cdtp = 0 then
  begin
    exit;
  end;
  cliente.tpcliente.Select(cdtp);
  tbsRisco.TabVisible := cliente.tpcliente.borisco = _s;
end;

procedure TfrmCliente.actestatisicaExecute(Sender: TObject);
begin
  if cds.Active and (cds.fieldbyname(_cdcliente).AsString <> '') then
  begin
    dlgclientefinanceiro(cds.fieldbyname(_cdcliente).AsLargeInt);
  end;
end;

procedure TfrmCliente.grdconsultaordservCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  actabrirordservExecute(actabrirordserv);
end;

procedure TfrmCliente.AbrirTabelas;
begin
  cbxcduf.Properties.ListSource                   := abrir_tabela(_uf);
  cbxcdufcbrnc.Properties.ListSource              := abrir_tabela(_uf);
  cbxcdstcliente.Properties.ListSource            := abrir_tabela(_stcliente);
  cbxcdtpregime.Properties.ListSource             := abrir_tabela(_tpregime);
  cbxcdpais.Properties.ListSource                 := abrir_tabela(_pais);
  cbxcdindiedest.Properties.ListSource            := abrir_tabela(_indiedest);
  cbxcdtpcobranca.Properties.ListSource           := abrir_tabela(_tpcobranca);
  TcxLookupComboBoxProperties(tbvitproprietariocduf.Properties).ListSource := abrir_tabela(_uf);
  TcxLookupComboBoxProperties(tbvclienteprofissaoCDPROFISSAO.Properties).ListSource  := abrir_tabela(_profissao);
  TcxLookupComboBoxProperties(tbvclienteprofissaoriscoCDRISCO.Properties).ListSource := abrir_tabela(_risco);
end;

procedure TfrmCliente.cbxcdtpcobrancaEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_tpcobranca);
end;

end.
