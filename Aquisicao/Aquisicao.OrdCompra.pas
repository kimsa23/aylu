unit Aquisicao.OrdCompra;

interface

uses
  System.Actions, System.UITypes, Winapi.Messages,
  forms, ComCtrls, ToolWin, ExtCtrls, Mask, Controls, Buttons, sysutils, windows,
  Graphics, dialogs, StdCtrls, Classes, ActnList, Menus,
  FMTBcd, DB, DBClient, Provider, DBCtrls, SqlExpr, Grids,
  rotina.datahora, rotina.strings, dialogo.ExportarExcel,
  localizar.Fornecedor, uconstantes, ulocalizar,
  rotina.registro, orm.plconta,
  orm.cntcusto, orm.ordproducao, classe.Registro, classe.gerar,
  orm.produto, classe.form, orm.ordcompra, orm.condpagto,
  classe.executasql, orm.usuario, orm.fornecedor, orm.empresa,
  classe.aplicacao,
  cxLookAndFeelPainters, cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxPC, dxBar, cxClasses, cxGraphics, cxLookAndFeels, cxDBEdit, cxStyles,
  cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxButtonEdit, cxCalc, cxCurrencyEdit, cxGridBandedTableView, cxGridDBBandedTableView,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxDBLabel, cxSpinEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSplitter, cxRichEdit,
  cxBlobEdit, cxCheckBox, cxNavigator, dxBarBuiltInMenu, cxCustomData, cxFilter,
  cxData;

type
  TfrmOrdCompra = class(TForm)
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
    actGerarCompra: TAction;
    actAbrirFornecedor: TAction;
    actAbrirTransportadora: TAction;
    actAbrirProduto: TAction;
    actfechar: TAction;
    actimprimirModelo1: TAction;
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
    dxBarLargeButton1: TdxBarLargeButton;
    pnl1: TPanel;
    gbxfornecedor: TcxGroupBox;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    dts: TDataSource;
    dts1: TDataSource;
    dtsdetail: TDataSource;
    cdsdetail: TClientDataSet;
    sdsdetail: TSQLDataSet;
    sdsdetailCDITORDCOMPRA: TIntegerField;
    sdsdetailCDORDCOMPRA: TIntegerField;
    sdsdetailCDPRODUTO: TIntegerField;
    sdsdetailCDUSUARIOI: TIntegerField;
    sdsdetailCDUSUARIOA: TIntegerField;
    sdsdetailCDCOMPUTADORI: TIntegerField;
    sdsdetailCDCOMPUTADORA: TIntegerField;
    sdsdetailCDTPAPLICACAO: TIntegerField;
    sdsdetailCDDIGITADO: TStringField;
    sdsdetailQTITEM: TFloatField;
    sdsdetailQTATENDIDA: TFloatField;
    sdsdetailVLUNITARIO: TFMTBCDField;
    sdsdetailVLTOTAL: TFMTBCDField;
    sdsdetailALICMS: TFloatField;
    sdsdetailVLICMS: TFMTBCDField;
    sdsdetailALIPI: TFloatField;
    sdsdetailVLIPI: TFMTBCDField;
    sdsdetailTSINCLUSAO: TSQLTimeStampField;
    sdsdetailTSALTERACAO: TSQLTimeStampField;
    sdsdetailNMPRODUTO: TStringField;
    sdsdetailNMTPAPLICACAO: TStringField;
    cdsdetailCDITORDCOMPRA: TIntegerField;
    cdsdetailCDORDCOMPRA: TIntegerField;
    cdsdetailCDPRODUTO: TIntegerField;
    cdsdetailCDUSUARIOI: TIntegerField;
    cdsdetailCDUSUARIOA: TIntegerField;
    cdsdetailCDCOMPUTADORI: TIntegerField;
    cdsdetailCDCOMPUTADORA: TIntegerField;
    cdsdetailCDTPAPLICACAO: TIntegerField;
    cdsdetailCDDIGITADO: TStringField;
    cdsdetailQTITEM: TFloatField;
    cdsdetailQTATENDIDA: TFloatField;
    cdsdetailVLUNITARIO: TFMTBCDField;
    cdsdetailVLTOTAL: TFMTBCDField;
    cdsdetailALICMS: TFloatField;
    cdsdetailVLICMS: TFMTBCDField;
    cdsdetailALIPI: TFloatField;
    cdsdetailVLIPI: TFMTBCDField;
    cdsdetailTSINCLUSAO: TSQLTimeStampField;
    cdsdetailTSALTERACAO: TSQLTimeStampField;
    cdsdetailNMPRODUTO: TStringField;
    cdsdetailNMTPAPLICACAO: TStringField;
    gbxentrega: TcxGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    gbxcotacao: TcxGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    gbxAprovacao: TcxGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    edtdtaprovacao: TcxDBDateEdit;
    Panel1: TPanel;
    sdsCDORDCOMPRA: TIntegerField;
    sdsCDSTORDCOMPRA: TIntegerField;
    sdsCDPEDIDOMATERIAL: TIntegerField;
    sdsCDTPORDCOMPRA: TIntegerField;
    sdsCDCONDPAGTO: TIntegerField;
    sdsCDFUNCIONARIOSOLICITANTE: TIntegerField;
    sdsCDFUNCIONARIOAPROVACAO: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsCDFUNCIONARIOCONTATO: TIntegerField;
    sdsCDTPAPLICACAO: TIntegerField;
    sdsCDTPCOBRANCA: TIntegerField;
    sdsDTEMISSAO: TDateField;
    sdsDTENTREGA: TDateField;
    sdsDTAPROVACAO: TDateField;
    sdsNUDIAS: TIntegerField;
    sdsNUSOLICITACAO: TStringField;
    sdsVLTOTAL: TFMTBCDField;
    sdsPRENTREGA: TStringField;
    sdsALIPI: TFloatField;
    sdsALICMS: TFloatField;
    sdsDSOBSERVACAO: TBlobField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsVLFRETE: TFMTBCDField;
    sdsNMSTORDCOMPRA: TStringField;
    sdsNUCOTACAO: TIntegerField;
    cdsCDORDCOMPRA: TIntegerField;
    cdsCDSTORDCOMPRA: TIntegerField;
    cdsCDPEDIDOMATERIAL: TIntegerField;
    cdsCDTPORDCOMPRA: TIntegerField;
    cdsCDCONDPAGTO: TIntegerField;
    cdsCDFUNCIONARIOSOLICITANTE: TIntegerField;
    cdsCDFUNCIONARIOAPROVACAO: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsCDFUNCIONARIOCONTATO: TIntegerField;
    cdsCDTPAPLICACAO: TIntegerField;
    cdsCDTPCOBRANCA: TIntegerField;
    cdsDTEMISSAO: TDateField;
    cdsDTENTREGA: TDateField;
    cdsDTAPROVACAO: TDateField;
    cdsNUDIAS: TIntegerField;
    cdsNUSOLICITACAO: TStringField;
    cdsVLTOTAL: TFMTBCDField;
    cdsPRENTREGA: TStringField;
    cdsALIPI: TFloatField;
    cdsALICMS: TFloatField;
    cdsDSOBSERVACAO: TBlobField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdsVLFRETE: TFMTBCDField;
    cdsNMSTORDCOMPRA: TStringField;
    cdsNUCOTACAO: TIntegerField;
    cdssdsdetail: TDataSetField;
    sdsdetailDTPREVENTREGA: TDateField;
    cdsdetailDTPREVENTREGA: TDateField;
    dxBarButton3: TdxBarButton;
    actimprimirmodelo2: TAction;
    actimprimirmodelo3: TAction;
    dxBarButton4: TdxBarButton;
    lblnusolicitacao: TLabel;
    edtnusolicitacao: TcxDBTextEdit;
    sdsDSSOLICITANTE: TStringField;
    cdsDSSOLICITANTE: TStringField;
    edtdssolicitante: TcxDBTextEdit;
    edtcdfornecedor: TcxDBButtonEdit;
    cbxCDFUNCIONARIOCONTATO: TcxDBLookupComboBox;
    cbxCDFUNCIONARIOAPROVACAO: TcxDBLookupComboBox;
    pgc: TcxPageControl;
    tbsproduto: TcxTabSheet;
    tbsobservacao: TcxTabSheet;
    mem1: TcxDBMemo;
    grd: TcxGrid;
    tbv: TcxGridDBBandedTableView;
    tbvCDDIGITADO: TcxGridDBBandedColumn;
    tbvNMPRODUTO: TcxGridDBBandedColumn;
    tbvQTITEM: TcxGridDBBandedColumn;
    tbvQTATENDIDA: TcxGridDBBandedColumn;
    tbvVLUNITARIO: TcxGridDBBandedColumn;
    tbvVLTOTAL: TcxGridDBBandedColumn;
    tbvALICMS: TcxGridDBBandedColumn;
    tbvVLICMS: TcxGridDBBandedColumn;
    tbvALIPI: TcxGridDBBandedColumn;
    tbvVLIPI: TcxGridDBBandedColumn;
    tbvCDTPAPLICACAO: TcxGridDBBandedColumn;
    tbvNMTPAPLICACAO: TcxGridDBBandedColumn;
    tbvDTPREVENTREGA: TcxGridDBBandedColumn;
    grlLevel1: TcxGridLevel;
    sdsdetailDSFORMULA: TStringField;
    cdsdetailDSFORMULA: TStringField;
    sdsdetailDSOBSERVACAO: TBlobField;
    cdsdetailDSOBSERVACAO: TBlobField;
    tbvDSFORMULA: TcxGridDBBandedColumn;
    tbvDSOBSERVACAO: TcxGridDBBandedColumn;
    cbxcdtpaplicacao: TcxDBLookupComboBox;
    cbxcdfuncionariosolicitante: TcxDBLookupComboBox;
    sdsCDFINALIDADEORDCOMPRA: TIntegerField;
    sdsCDTPFORNECEDOR: TIntegerField;
    sdsDSAPLICACAO: TStringField;
    sdsDSLOCAL: TStringField;
    cdsCDFINALIDADEORDCOMPRA: TIntegerField;
    cdsCDTPFORNECEDOR: TIntegerField;
    cdsDSAPLICACAO: TStringField;
    cdsDSLOCAL: TStringField;
    edtdsaplicacao: TcxDBTextEdit;
    edtdslocal: TcxDBTextEdit;
    txtnmfornecedor: TDBText;
    sdsNMFORNECEDOR: TStringField;
    cdsNMFORNECEDOR: TStringField;
    sdsNMFORNECEDORTRANSPORTADORA: TStringField;
    cdsNMFORNECEDORTRANSPORTADORA: TStringField;
    sdsVLDESCONTO: TFMTBCDField;
    sdsdetailCDCNTCUSTO: TIntegerField;
    sdsdetailBOCERTIFICADO: TStringField;
    sdsdetailVLDESCONTO: TFMTBCDField;
    cdsVLDESCONTO: TFMTBCDField;
    cdsdetailCDCNTCUSTO: TIntegerField;
    cdsdetailBOCERTIFICADO: TStringField;
    cdsdetailVLDESCONTO: TFMTBCDField;
    lbldesconto: TLabel;
    edtvldesconto: TcxDBCalcEdit;
    actavaliacaoiqf: TAction;
    btn1: TdxBarLargeButton;
    sdsdetailCDITPEDIDO: TIntegerField;
    cdsdetailCDITPEDIDO: TIntegerField;
    tbvCDORDPRODUCAO: TcxGridDBBandedColumn;
    actimprimirmodelo4: TAction;
    dxBarButton2: TdxBarButton;
    tbvNUCNTCUSTO: TcxGridDBBandedColumn;
    lblvendedor: TLabel;
    sdsCDITCONTFORNECEDOR: TIntegerField;
    cdsCDITCONTFORNECEDOR: TIntegerField;
    cbxcditcontfornecedor: TcxDBLookupComboBox;
    lblemail: TDBText;
    sdsitcontfornecedor: TSQLDataSet;
    dspitcontfornecedor: TDataSetProvider;
    cdsitcontfornecedor: TClientDataSet;
    dtsitcontfornecedor: TDataSource;
    sdsEMAIL: TStringField;
    cdsEMAIL: TStringField;
    actemail: TAction;
    dxBarButton6: TdxBarButton;
    actemailmodelo4: TAction;
    actemailmodelo1: TAction;
    actemailmodelo2: TAction;
    actemailmodelo3: TAction;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    sdsVLICMSSUBTRIB: TFMTBCDField;
    sdsdetailVLICMSSUBTRIB: TFMTBCDField;
    cdsVLICMSSUBTRIB: TFMTBCDField;
    cdsdetailVLICMSSUBTRIB: TFMTBCDField;
    tbvVLICMSSUBTRIB: TcxGridDBBandedColumn;
    tbsautpagto: TcxTabSheet;
    sdsordcompraautpagto: TSQLDataSet;
    cdsordcompraautpagto: TClientDataSet;
    dtsordcompraautpagto: TDataSource;
    sdsordcompraautpagtoCDORDCOMPRAAUTPAGTO: TIntegerField;
    sdsordcompraautpagtoCDORDCOMPRA: TIntegerField;
    sdsordcompraautpagtoVLORDCOMPRAAUTPAGTO: TFMTBCDField;
    sdsordcompraautpagtoDTPRORROGACAO: TDateField;
    sdsordcompraautpagtoCDUSUARIOI: TIntegerField;
    sdsordcompraautpagtoCDUSUARIOA: TIntegerField;
    sdsordcompraautpagtoCDCOMPUTADORI: TIntegerField;
    sdsordcompraautpagtoCDCOMPUTADORA: TIntegerField;
    sdsordcompraautpagtoTSINCLUSAO: TSQLTimeStampField;
    sdsordcompraautpagtoTSALTERACAO: TSQLTimeStampField;
    sdsordcompraautpagtoDTEMISSAO: TDateField;
    sdsordcompraautpagtoVLSALDO: TFMTBCDField;
    cdssdsordcompraautpagto: TDataSetField;
    cdsordcompraautpagtoCDORDCOMPRAAUTPAGTO: TIntegerField;
    cdsordcompraautpagtoCDORDCOMPRA: TIntegerField;
    cdsordcompraautpagtoVLORDCOMPRAAUTPAGTO: TFMTBCDField;
    cdsordcompraautpagtoDTPRORROGACAO: TDateField;
    cdsordcompraautpagtoCDUSUARIOI: TIntegerField;
    cdsordcompraautpagtoCDUSUARIOA: TIntegerField;
    cdsordcompraautpagtoCDCOMPUTADORI: TIntegerField;
    cdsordcompraautpagtoCDCOMPUTADORA: TIntegerField;
    cdsordcompraautpagtoTSINCLUSAO: TSQLTimeStampField;
    cdsordcompraautpagtoTSALTERACAO: TSQLTimeStampField;
    cdsordcompraautpagtoDTEMISSAO: TDateField;
    cdsordcompraautpagtoVLSALDO: TFMTBCDField;
    grdordcompraautapgto: TcxGrid;
    btvordcompraautpagto: TcxGridDBBandedTableView;
    cxGridLevel3: TcxGridLevel;
    btvordcompraautpagtoVLORDCOMPRAAUTPAGTO: TcxGridDBBandedColumn;
    btvordcompraautpagtoDTPRORROGACAO: TcxGridDBBandedColumn;
    sdsdetailBOIPIBCICMS: TStringField;
    cdsdetailBOIPIBCICMS: TStringField;
    tbvBOIPIBCICMS: TcxGridDBBandedColumn;
    Label16: TLabel;
    lblvlfrete: TLabel;
    txtNMFORNECEDORTRANSPORTADORA: TDBText;
    lblcdtransportadora: TLabel;
    cbxcdtpfrete: TcxDBLookupComboBox;
    edtvlfrete: TcxDBCalcEdit;
    edtcdfornecedortransportadora: TcxDBButtonEdit;
    lblclfornecedor: TLabel;
    txtnmclfornecedor: TDBText;
    sdsNMCLFORNECEDOR: TStringField;
    cdsNMCLFORNECEDOR: TStringField;
    sdsdetailQTPECA: TFloatField;
    sdsdetailQTPESOUNITARIO: TFloatField;
    cdsdetailQTPECA: TFloatField;
    cdsdetailQTPESOUNITARIO: TFloatField;
    tbvQTPECA: TcxGridDBBandedColumn;
    tbvQTPESOUNITARIO: TcxGridDBBandedColumn;
    sdsBOCERTIFICADO: TStringField;
    cdsBOCERTIFICADO: TStringField;
    ckbbocertificado: TcxDBCheckBox;
    sdsdetailVLPECA: TFMTBCDField;
    cdsdetailVLPECA: TFMTBCDField;
    tbvVLPECA: TcxGridDBBandedColumn;
    actcopiar: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    actatendido: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    tbsentrada: TcxTabSheet;
    grdconsultaDBTableView1: TcxGridDBTableView;
    grdconsultaLevel1: TcxGridLevel;
    grdconsulta: TcxGrid;
    sdsconsulta: TSQLDataSet;
    cdsconsulta: TClientDataSet;
    dtsconsulta: TDataSource;
    sdsconsultaCDENTRADA: TIntegerField;
    sdsconsultaNUENTRADA: TIntegerField;
    sdsconsultaDTEMISSAO: TDateField;
    sdsconsultaDTENTRADA: TDateField;
    sdsconsultaVLTOTAL: TFMTBCDField;
    sdsconsultaVLICMS: TFMTBCDField;
    sdsconsultaVLIPI: TFMTBCDField;
    cdssdsconsulta: TDataSetField;
    cdsconsultaCDENTRADA: TIntegerField;
    cdsconsultaNUENTRADA: TIntegerField;
    cdsconsultaDTEMISSAO: TDateField;
    cdsconsultaDTENTRADA: TDateField;
    cdsconsultaVLTOTAL: TFMTBCDField;
    cdsconsultaVLICMS: TFMTBCDField;
    cdsconsultaVLIPI: TFMTBCDField;
    grdconsultaDBTableView1NUENTRADA: TcxGridDBColumn;
    grdconsultaDBTableView1DTEMISSAO: TcxGridDBColumn;
    grdconsultaDBTableView1DTENTRADA: TcxGridDBColumn;
    grdconsultaDBTableView1VLTOTAL: TcxGridDBColumn;
    grdconsultaDBTableView1VLICMS: TcxGridDBColumn;
    grdconsultaDBTableView1VLIPI: TcxGridDBColumn;
    actabrirentrada: TAction;
    actreabrir: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    actabrirordproducao: TAction;
    tbvBOCERTIFICADO: TcxGridDBBandedColumn;
    actdeclinar: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    actabrirtpordcompra: TAction;
    actabrircondpagto: TAction;
    sdsdetailNUKMATUAL: TIntegerField;
    cdsdetailNUKMATUAL: TIntegerField;
    sdsdetailNUKMFINAL: TIntegerField;
    cdsdetailNUKMFINAL: TIntegerField;
    tbvNUKMATUAL: TcxGridDBBandedColumn;
    tbvNUKMFINAL: TcxGridDBBandedColumn;
    btnimprimir: TdxBarLargeButton;
    pumimprimir: TdxBarPopupMenu;
    btnemail: TdxBarLargeButton;
    pumemail: TdxBarPopupMenu;
    sdsdetailCDPLCONTA: TIntegerField;
    sdsdetailNUPLCONTA: TStringField;
    cdsdetailCDPLCONTA: TIntegerField;
    cdsdetailNUPLCONTA: TStringField;
    sdsdetailNMPLCONTA: TStringField;
    cdsdetailNMPLCONTA: TStringField;
    tbvNUPLCONTA: TcxGridDBBandedColumn;
    tbvNMPLCONTA: TcxGridDBBandedColumn;
    sdsNMTRANSPORTADORA: TStringField;
    cdsNMTRANSPORTADORA: TStringField;
    actopcoes: TAction;
    btnopcoes: TdxBarLargeButton;
    pumopcoes: TdxBarPopupMenu;
    actarquivo: TAction;
    dxBarButton5: TdxBarButton;
    sdsPSFRETE: TFloatField;
    cdsPSFRETE: TFloatField;
    lblPSFRETE: TLabel;
    edtPSFRETE: TcxDBCalcEdit;
    actaprovacao: TAction;
    dxBarButton10: TdxBarButton;
    sdsBOFINANCEIRO: TStringField;
    cdsBOFINANCEIRO: TStringField;
    sdsBOCONTROLERECEBIMENTO: TStringField;
    cdsBOCONTROLERECEBIMENTO: TStringField;
    sdsCDTPFRETE: TStringField;
    cdsCDTPFRETE: TStringField;
    sdsCDEMPRESA: TLargeintField;
    sdsCDFORNECEDORTRANSPORTADORA: TLargeintField;
    sdsCDFORNECEDOR: TLargeintField;
    sdsCDTPIPI: TIntegerField;
    sdsCDTRANSPORTADORA: TLargeintField;
    sdsDTFECHAMENTO: TDateField;
    sdsdetailCDEMPRESA: TLargeintField;
    sdsdetailNUITORDCOMPRA: TIntegerField;
    sdsdetailNUCNTCUSTO: TStringField;
    sdsordcompraautpagtoCDEMPRESA: TLargeintField;
    cdsCDEMPRESA: TLargeintField;
    cdsCDFORNECEDORTRANSPORTADORA: TLargeintField;
    cdsCDFORNECEDOR: TLargeintField;
    cdsCDTPIPI: TIntegerField;
    cdsCDTRANSPORTADORA: TLargeintField;
    cdsDTFECHAMENTO: TDateField;
    cdsdetailCDEMPRESA: TLargeintField;
    cdsdetailNUITORDCOMPRA: TIntegerField;
    cdsdetailNUCNTCUSTO: TStringField;
    cdsordcompraautpagtoCDEMPRESA: TLargeintField;
    tbvNMCNTCUSTO: TcxGridDBBandedColumn;
    sdsdetailNMCNTCUSTO: TStringField;
    cdsdetailNMCNTCUSTO: TStringField;
    sdsdetailCDORDPRODUCAO: TIntegerField;
    cdsdetailCDORDPRODUCAO: TIntegerField;
    tbvNUCLFISCAL: TcxGridDBBandedColumn;
    tbvnusticms: TcxGridDBBandedColumn;
    cdsdetailNUCLFISCAL: TStringField;
    cdsdetailNUSTICMS: TStringField;
    sdsdetailNUCLFISCAL: TStringField;
    sdsdetailNUSTICMS: TStringField;
    sdsdetailCDORCAMENTO: TIntegerField;
    cdsdetailCDORCAMENTO: TIntegerField;
    tbvCDORCAMENTO: TcxGridDBBandedColumn;
    actabrirorcamento: TAction;
    sdsdetailVLFRETE: TFMTBCDField;
    cdsdetailVLFRETE: TFMTBCDField;
    actabrirpedidomaterial: TAction;
    pnltop: TPanel;
    lblPedidoMaterial: TLabel;
    txtcdpedidomaterial: TcxDBLabel;
    txtnmstordcompra: TcxDBLabel;
    Label17: TLabel;
    cbxcdtpcobranca: TcxDBLookupComboBox;
    Label23: TLabel;
    cbxcdcondpagto: TcxDBLookupComboBox;
    lblcondpagto: TLabel;
    cbxcdtpordcompra: TcxDBLookupComboBox;
    lbltpordcompra: TLabel;
    edtnudias: TcxDBSpinEdit;
    lblnudias: TLabel;
    edtdtentrega: TcxDBDateEdit;
    Label3: TLabel;
    edtdtemissao: TcxDBDateEdit;
    Label2: TLabel;
    edtcodigo: TcxTextEdit;
    Label1: TLabel;
    Label11: TLabel;
    txtVLTOTAL: TcxDBLabel;
    ckbBOFRETEITEM: TcxDBCheckBox;
    sdsBOFRETEITEM: TStringField;
    cdsBOFRETEITEM: TStringField;
    tbvVLFRETE: TcxGridDBBandedColumn;
    ckbbodescontoitem: TcxDBCheckBox;
    sdsBODESCONTOITEM: TStringField;
    cdsBODESCONTOITEM: TStringField;
    tbvVLDESCONTO: TcxGridDBBandedColumn;
    sdsCDCNTCUSTO: TIntegerField;
    sdsNUCNTCUSTO: TStringField;
    sdsNMCNTCUSTO: TStringField;
    cdsCDCNTCUSTO: TIntegerField;
    cdsNUCNTCUSTO: TStringField;
    cdsNMCNTCUSTO: TStringField;
    edtnucntcusto: TcxDBButtonEdit;
    txtnmcntcusto: TcxDBLabel;
    procedure actNovoExecute(Sender: TObject);
    procedure actAbrirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtcdfornecedortransportadoraExit(Sender: TObject);
    procedure actGerarCompraExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actAbrirFornecedorExecute(Sender: TObject);
    procedure actAbrirTransportadoraExecute(Sender: TObject);
    procedure edtcdfornecedortransportadoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAbrirProdutoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actfecharExecute(Sender: TObject);
    procedure actimprimirModelo1Execute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure edtcdfornecedortransportadoraPropertiesButtonClick( Sender: TObject; AButtonIndex: Integer);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsdetailBeforePost(DataSet: TDataSet);
    procedure colDBBandedTableView1CDDIGITADOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure colDBBandedTableView1CDTPAPLICACAOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdsdetailNewRecord(DataSet: TDataSet);
    procedure exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtnudiasExit(Sender: TObject);
    procedure edtdtentregaExit(Sender: TObject);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure actimprimirmodelo2Execute(Sender: TObject);
    procedure actimprimirmodelo3Execute(Sender: TObject);
    procedure dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure colorEnter(Sender: TObject);
    procedure colorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtcdfornecedorExit(Sender: TObject);
    procedure edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtcdfornecedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtnmfornecedorDblClick(Sender: TObject);
    procedure actavaliacaoiqfExecute(Sender: TObject);
    procedure actimprimirmodelo4Execute(Sender: TObject);
    procedure actemailmodelo4Execute(Sender: TObject);
    procedure actemailExecute(Sender: TObject);
    procedure actemailmodelo1Execute(Sender: TObject);
    procedure actemailmodelo2Execute(Sender: TObject);
    procedure actemailmodelo3Execute(Sender: TObject);
    procedure cdsordcompraautpagtoNewRecord(DataSet: TDataSet);
    procedure cdsordcompraautpagtoBeforePost(DataSet: TDataSet);
    procedure tbvQTPESOUNITARIOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actcopiarExecute(Sender: TObject);
    procedure actatendidoExecute(Sender: TObject);
    procedure cbxcdcondpagtoEnter(Sender: TObject);
    procedure cbxcdtpordcompraEnter(Sender: TObject);
    procedure cbxcdtpcobrancaEnter(Sender: TObject);
    procedure cbxCDFUNCIONARIOCONTATOEnter(Sender: TObject);
    procedure cbxcdtpaplicacaoEnter(Sender: TObject);
    procedure cbxcdfuncionariosolicitanteEnter(Sender: TObject);
    procedure cbxCDFUNCIONARIOAPROVACAOEnter(Sender: TObject);
    procedure grdconsultaDBTableView1DblClick(Sender: TObject);
    procedure actabrirentradaExecute(Sender: TObject);
    procedure actreabrirExecute(Sender: TObject);
    procedure tbvCDORDPRODUCAOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actabrirordproducaoExecute(Sender: TObject);
    procedure tbvCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure eventokeypress(Sender: TObject; var Key: Char);
    procedure actdeclinarExecute(Sender: TObject);
    procedure lbltpordcompraDblClick(Sender: TObject);
    procedure actabrirtpordcompraExecute(Sender: TObject);
    procedure lblcondpagtoDblClick(Sender: TObject);
    procedure actabrircondpagtoExecute(Sender: TObject);
    procedure tbvNUPLCONTAPropertiesButtonClick(Sender: TObject;AButtonIndex: Integer);
    procedure actopcoesExecute(Sender: TObject);
    procedure actarquivoExecute(Sender: TObject);
    procedure actaprovacaoExecute(Sender: TObject);
    procedure actExecute(Action: TBasicAction; var Handled: Boolean);
    procedure tbvNUCNTCUSTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tbvCDORCAMENTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure actabrirorcamentoExecute(Sender: TObject);
    procedure actabrirpedidomaterialExecute(Sender: TObject);
    procedure txtcdpedidomaterialDblClick(Sender: TObject);
    procedure cdsdetailAfterPost(DataSet: TDataSet);
    procedure cdsCDTPORDCOMPRAValidate(Sender: TField);
    procedure cdsCDCONDPAGTOValidate(Sender: TField);
    procedure cdsdetailQTITEMValidate(Sender: TField);
    procedure cdsdetailCDDIGITADOValidate(Sender: TField);
    procedure cdsCDFORNECEDORValidate(Sender: TField);
    procedure cdsCDFORNECEDORTRANSPORTADORAValidate(Sender: TField);
    procedure cdsdetailALICMSValidate(Sender: TField);
    procedure cdsdetailALIPIValidate(Sender: TField);
    procedure cdsdetailCDTPAPLICACAOValidate(Sender: TField);
    procedure cdsCDITCONTFORNECEDORValidate(Sender: TField);
    procedure cdsdetailQTPECAValidate(Sender: TField);
    procedure cdsdetailVLPECAValidate(Sender: TField);
    procedure cdsdetailCDORDPRODUCAOValidate(Sender: TField);
    procedure cdsdetailNUKMATUALValidate(Sender: TField);
    procedure cdsdetailNUKMFINALValidate(Sender: TField);
    procedure cdsdetailNUPLCONTAValidate(Sender: TField);
    procedure cdsCDTRANSPORTADORAValidate(Sender: TField);
    procedure cdsdetailNUCNTCUSTOValidate(Sender: TField);
    procedure cdsdetailCDORCAMENTOValidate(Sender: TField);
    procedure cdsDTENTREGAValidate(Sender: TField);
    procedure cdsBOFRETEITEMValidate(Sender: TField);
    procedure cdsCDTPFRETEValidate(Sender: TField);
    procedure cdsVLFRETEValidate(Sender: TField);
    procedure cdsBODESCONTOITEMValidate(Sender: TField);
    procedure cdsVLDESCONTOValidate(Sender: TField);
    procedure cdsNUCNTCUSTOValidate(Sender: TField);
    procedure edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private      { Private declarations }
    tbl : string;
    exibe : string;
    artigoI : string;
    ordcompra  : TOrdcompra;
    procedure setrecord(cdtp:integer);
    procedure atualizarContatofornecedor;
    function  getemail:string;
    function  statusAtendimento:string;
    procedure travarOrdcompraAtendida;
    procedure set_observacao;
    procedure AbrirTabelas;
    procedure AtualizarOrdCompraAutpagto;
    procedure DesativarOnValidate;
    procedure AtivarOnValidate;
    procedure GravartotaisClasse;
    procedure ConfigurarEmpresa;
    procedure ConfigurarTpFrete;
    procedure ConfigurarFrete;
    procedure ConfigurarDesconto;
    procedure AlimentarORM(DataSet: TDataSet);
  public  { Public declarations }
    registro   : TRegistro;
    function  Abrir(codigo:integer):boolean;
    procedure Novo(cdpedidomaterial: Integer; cdfornecedor: LargeInt; cdtpordcompra: integer);overload;
  end;

var
  frmOrdCompra: TfrmOrdCompra;

implementation

uses UMain,
  dialogo.GerarCompra,
  uDtmMain,
  Impressao.relatoriopadrao,
  dialogo.calculopeso,
  dialogo.avaliacaoiqf,

  impressao.MenuRelatorio,
  orm.eventoemail,
  localizar.Transportadora,
  dialogo.arquivo,
  dialogo.ordcompraaprovacao,
  orm.orcamento;

{$R *.DFM}

procedure TfrmOrdCompra.actNovoExecute(Sender: TObject);
begin
  registro.novo(sender);
end;

procedure TfrmOrdCompra.actAbrirExecute(Sender: TObject);
begin
  registro.abrir;
end;

function TfrmOrdCompra.Abrir(codigo: integer): boolean;
begin
  result := registro.RegistroAbrir(codigo);
end;

procedure TfrmOrdCompra.actExcluirExecute(Sender: TObject);
begin
  registro.excluir;
end;

procedure TfrmOrdCompra.actExecute(Action: TBasicAction; var Handled: Boolean);
begin
  dtmmain.LogSiteAction(self.Name, action.Name);
end;

procedure TfrmOrdCompra.actPrimeiroExecute(Sender: TObject);
begin
  registro.primeiro;
end;

procedure TfrmOrdCompra.actAnteriorExecute(Sender: TObject);
begin
  registro.anterior;
end;

procedure TfrmOrdCompra.actProximoExecute(Sender: TObject);
begin
  registro.proximo;
end;

procedure TfrmOrdCompra.actUltimoExecute(Sender: TObject);
begin
  registro.ultimo;
end;

procedure TfrmOrdCompra.AtivarOnValidate;
begin
  cdsDTENTREGA.OnValidate                  := cdsDTENTREGAValidate;
  cdsvlfrete.OnValidate                    := cdsvlfreteValidate;
  cdsvldesconto.OnValidate                 := cdsvldescontoValidate;
  cdsdetailQTPECA.onValidate               := cdsdetailQTPECAValidate;
  cdsdetailVLPECA.onValidate               := cdsdetailVLPECAValidate;
  cdsdetailQTPESOUNITARIO.onValidate       := cdsdetailQTPECAValidate;
  cdsdetailQTITEM.onValidate               := cdsdetailQTITEMValidate;
  cdsdetailVLUNITARIO.onValidate           := cdsdetailQTITEMValidate;
  cdsCDTPORDCOMPRA.onvalidate              := cdsCDTPORDCOMPRAValidate;
  cdsCDCONDPAGTO.onvalidate                := cdsCDCONDPAGTOValidate;
  cdsdetailCDDIGITADO.onvalidate           := cdsdetailCDDIGITADOValidate;
  cdsCDFORNECEDOR.onvalidate               := cdsCDFORNECEDORValidate;
  cdsCDFORNECEDORTRANSPORTADORA.onvalidate := cdsCDFORNECEDORTRANSPORTADORAValidate;
  cdsdetailALICMS.onvalidate               := cdsdetailALICMSValidate;
  cdsdetailALIPI.onvalidate                := cdsdetailALIPIValidate;
  cdsdetailCDTPAPLICACAO.onvalidate        := cdsdetailCDTPAPLICACAOValidate;
  cdsCDITCONTFORNECEDOR.onvalidate         := cdsCDITCONTFORNECEDORValidate;
  cdsdetailCDORDPRODUCAO.onvalidate        := cdsdetailCDORDPRODUCAOValidate;
  cdsdetailNUKMATUAL.onvalidate            := cdsdetailNUKMATUALValidate;
  cdsdetailNUKMFINAL.onvalidate            := cdsdetailNUKMFINALValidate;
  cdsdetailNUPLCONTA.onvalidate            := cdsdetailNUPLCONTAValidate;
  cdsCDTRANSPORTADORA.onvalidate           := cdsCDTRANSPORTADORAValidate;
  cdsdetailNUCNTCUSTO.onvalidate           := cdsdetailNUCNTCUSTOValidate;
  cdsdetailCDORCAMENTO.onvalidate          := cdsdetailCDORCAMENTOValidate;
  cdsBOFRETEITEM.onvalidate                := cdsBOFRETEITEMValidate;
  cdsBOdescontoITEM.onvalidate             := cdsBOdescontoITEMValidate;
  cdsCDTPFRETE.onvalidate                  := cdsCDTPFRETEValidate;
end;

procedure TfrmOrdCompra.actEditarExecute(Sender: TObject);
begin
  registro.editar;
  edtdtemissao.SetFocus;
end;

procedure TfrmOrdCompra.actSalvarExecute(Sender: TObject);
begin
  Self.Perform(WM_NEXTDLGCTL,0,0);
  if cdsDTENTREGA.AsDateTime < cdsDTEMISSAO.AsDateTime then
  begin
    cdsDTENTREGA.FocusControl;
    MessageDlg('Data de entrega não pode ser anterior a data de emissão!', mtInformation, [mbOK], 0);
    Abort;
  end;
  if cds.fieldbyname(_CDcondpagto).IsNull then
  begin
    cds.fieldbyname(_CDcondpagto).FocusControl;
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_condicao_de_pagamento]), mtInformation, [mbOK], 0);
    Abort;
  end;
  if cds.fieldbyname(_CDFORNECEDOR).IsNull then
  begin
    cds.fieldbyname(_CDFORNECEDOR).FocusControl;
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_Fornecedor]), mtInformation, [mbOK], 0);
    Abort;
  end;
  if cbxcdtpfrete.Text = '' then
  begin
    messagedlg(format(_msg_s_eh_um_campo_obrigatorio, [_tipo_de_frete]), mtinformation, [mbok], 0);
    cdsCDTPFRETE.FocusControl;
    abort;
  end;
  if (cdsdetail.State = dsinsert) or (cdsdetail.State = dsedit) then
  begin
    cdsdetail.Post;
  end;
  GravartotaisClasse;
  ordcompra.gerarparcelas;
  AtualizarOrdCompraAutpagto;
  cds.ApplyUpdates(0);
  registro.set_readonly_dados(self, true);
  ordcompra.AtualizarPedidoMaterialFornecedor;
  registro.set_grade_item(self, false);
  abrir(cdsCDORDCOMPRA.asinteger);
end;

procedure TfrmOrdCompra.actCancelarExecute(Sender: TObject);
begin
  if registro.cancelar then
  begin
    registro.dados_atual;
  end;
end;

procedure TfrmOrdCompra.FormShow(Sender: TObject);
begin
  registro.set_readonly_dados(self, true);
  pnl.Caption := exibe;
  edtCodigo.SetFocus;
end;

procedure TfrmOrdCompra.edtCodigoEnter(Sender: TObject);
begin
  tedit(sender).selectall;
end;

procedure TfrmOrdCompra.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  registro.ExibirInformacaoRegistro(cds, key);
end;

procedure TfrmOrdCompra.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  registro.codigoKeypress(sender, key, actnovo.enabled);
end;

procedure TfrmOrdCompra.edtcdfornecedortransportadoraExit(Sender: TObject);
var
  codigo: string;
begin
  colorExit(sender);
  if edtcdfornecedortransportadora.Text = '' then
  begin
    exit;
  end;
  codigo := edtcdfornecedortransportadora.Text;
  if ordcompra.tpordcompra.botransportadora = _s then
  begin
    if not codigoexiste( _transportadora, codigo) then
    begin
      MessageDlg('Código da transportadora '+codigo+' inexistente.', mtWarning, [mbOk], 0);
      edtcdfornecedortransportadora.SetFocus;
    end;
  end
  else if not codigoexiste( _fornecedor, codigo) then
  begin
    MessageDlg('Código da transportadora '+codigo+' não encontrado no cadastro de '+_fornecedor+'.', mtWarning, [mbOk], 0);
    edtcdfornecedortransportadora.SetFocus;
  end;
end;

procedure TfrmOrdCompra.actGerarCompraExecute(Sender: TObject);
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  if cdsCDORDCOMPRA.asstring = '' then
  begin
    Exit;
  end;
  if (ordcompra.fornecedor.stfornecedor.bogerarinfo <> _s) or (ordcompra.fornecedor.stfornecedor.bogerarentrada <> _s) then
  begin
    messagedlg('Fornecedor está no status '+ordcompra.fornecedor.stfornecedor.nmstfornecedor+#13+
                'que não permite gerar nota compra.'#13'Altere o status do fornecedor para prosseguir.', mtinformation, [mbok], 0);
    abort;
  end;
  if ordcompra.ItOrdCompra.AlgumValorUnitarioZerado then
  begin
    messagedlg('Existe item com valor unitário zerado.', mtInformation, [mbOK], 0);
    Abort;
  end;
  {
  if ordcompra.fornecedor.dsnumero = '' then
  begin
    MessageDlg('Número do endereço do fornecedor não está prenchido.', mtInformation, [mbOK], 0);
    Abort;
  end;
  }
  if GerarCompra(ordcompra) then
  begin
    abrir(cdsCDORDCOMPRA.asinteger);
  end;
end;

procedure TfrmOrdCompra.actImprimirExecute(Sender: TObject);
begin
  btnimprimir.DropDown(false);
end;

procedure TfrmOrdCompra.Novo(cdpedidomaterial: Integer; cdfornecedor: LargeInt; cdtpordcompra: integer);
begin
  abrir(tordcompra.novo(cdpedidomaterial, cdfornecedor, cdtpordcompra));
end;

procedure TfrmOrdCompra.AlimentarORM(DataSet: TDataSet);
begin
  ordcompra.Select(dataset);
  ordcompra.fornecedor.select(cds.fieldbyname(_CDFORNECEDOR).AsLargeInt);
  ordcompra.fornecedor.stfornecedor.select(ordcompra.fornecedor.cdstfornecedor);
  ordcompra.ItOrdCompra.Ler(cdsdetail);
  ordcompra.OrdCompraAutpagto.Ler(cdsordcompraautpagto);
  ordcompra.tpordcompra.Select(ordcompra.cdtpordcompra);
  ordcompra.stordcompra.Select(ordcompra.cdstordcompra);
  ordcompra.condpagto.Select(ordcompra.cdcondpagto);
  ordcompra.condpagto.itcondpagto.Ler(ordcompra.cdcondpagto);
end;

procedure TfrmOrdCompra.ConfigurarFrete;
begin
  edtvlfrete.enabled                               := cds.fieldbyname(_bofreteitem).asstring <> _s;
  tbv.Bands[qform.get_index('Frete', tbv)].Visible := cds.fieldbyname(_bofreteitem).asstring = _s;
end;

procedure TfrmOrdCompra.ConfigurarTpFrete;
begin
  ckbBOFRETEITEM.visible                := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  lblcdtransportadora.visible           := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  edtcdfornecedortransportadora.visible := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  txtNMFORNECEDORTRANSPORTADORA.visible := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  lblvlfrete.visible                    := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  edtvlfrete.visible                    := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  lblpsfrete.visible                    := cds.fieldbyname(_cdtpfrete).asstring <> _9;
  edtpsfrete.visible                    := cds.fieldbyname(_cdtpfrete).asstring <> _9;
end;

procedure TfrmOrdCompra.ConfigurarDesconto;
begin
  edtvldesconto.enabled                               := cds.fieldbyname(_bodescontoitem).asstring <> _s;
  tbv.Bands[qform.get_index('Desconto', tbv)].Visible := cds.fieldbyname(_bodescontoitem).asstring = _s;
end;

procedure TfrmOrdCompra.ConfigurarEmpresa;
begin
  lblclfornecedor.Visible                                 := empresa.fornecedor.iqf.bo;
  txtnmclfornecedor.Visible                               := empresa.fornecedor.iqf.bo;
  tbv.Bands[qform.get_index('Centro Custo', tbv)].Visible := Empresa.financeiro.bocntcusto;
  tbv.Bands[qform.get_index('Plano Contas', tbv)].Visible := Empresa.financeiro.boplconta;
end;

procedure TfrmOrdCompra.AbrirTabelas;
begin
  cbxcdtpordcompra.Properties.ListSource            := abrir_tabela(_tpordcompra);
  cbxcdcondpagto.Properties.ListSource              := abrir_tabela(_condpagto + _e);
  cbxcdtpfrete.Properties.ListSource                := abrir_tabela(_tpfrete);
  cbxcdtpcobranca.Properties.ListSource             := abrir_tabela(_tpcobranca);
  cbxcdfuncionariocontato.Properties.ListSource     := abrir_tabela(_funcionario);
  cbxcdfuncionariosolicitante.Properties.ListSource := abrir_tabela(_funcionario);
  cbxCDFUNCIONARIOAPROVACAO.Properties.ListSource   := abrir_tabela(_funcionario);
  cbxcdtpaplicacao.Properties.ListSource            := abrir_tabela(_tpaplicacao);
end;

procedure TfrmOrdCompra.actAbrirFornecedorExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmOrdCompra.actAbrirTransportadoraExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmOrdCompra.edtcdfornecedortransportadoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedortransportadoraPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, shift);
  end;
end;

procedure TfrmOrdCompra.actAbrirProdutoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsdetail);
end;

procedure TfrmOrdCompra.FormDestroy(Sender: TObject);
begin
  freeandnil(ordcompra);
  freeandnil(registro);
end;

procedure TfrmOrdCompra.actfecharExecute(Sender: TObject);
begin
  close;
  frmmain.main.DestruirBotaoFormAtual(tbl, frmmain.tlbnew);
end;

procedure TfrmOrdCompra.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  actAbrirProduto.OnExecute(actAbrirProduto);
end;

procedure TfrmOrdCompra.DesativarOnValidate;
begin
  cdsDTENTREGA.OnValidate                  := nil;
  cdsvlfrete.onvalidate                    := nil;
  cdsvldesconto.onvalidate                 := nil;
  cdsdetailVLPECA.onValidate               := nil;
  cdsdetailQTPECA.onValidate               := nil;
  cdsdetailQTPESOUNITARIO.OnValidate       := nil;
  cdsdetailQTITEM.onValidate               := nil;
  cdsdetailVLUNITARIO.onValidate           := nil;
  cdsCDTPORDCOMPRA.onvalidate              := nil;
  cdsCDCONDPAGTO.onvalidate                := nil;
  cdsdetailCDDIGITADO.onvalidate           := nil;
  cdsCDFORNECEDOR.onvalidate               := nil;
  cdsCDFORNECEDORTRANSPORTADORA.onvalidate := nil;
  cdsdetailALICMS.onvalidate               := nil;
  cdsdetailALIPI.onvalidate                := nil;
  cdsdetailCDTPAPLICACAO.onvalidate        := nil;
  cdsCDITCONTFORNECEDOR.onvalidate         := nil;
  cdsdetailCDORDPRODUCAO.onvalidate        := nil;
  cdsdetailNUKMATUAL.onvalidate            := nil;
  cdsdetailNUKMFINAL.onvalidate            := nil;
  cdsdetailNUPLCONTA.onvalidate            := nil;
  cdsCDTRANSPORTADORA.onvalidate           := nil;
  cdsdetailNUCNTCUSTO.onvalidate           := nil;
  cdsdetailCDORCAMENTO.onvalidate          := nil;
  cdsBOFRETEITEM.onvalidate                := nil;
  cdsBOdescontoITEM.onvalidate             := nil;
  cdsCDTPFRETE.onvalidate                  := nil;
end;

procedure TfrmOrdCompra.edtcdfornecedortransportadoraPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  codigo : LargeInt;
begin
  if ordcompra.tpordcompra.botransportadora = _s then
  begin
    codigo := LocalizarTransportadora(true)
  end
  else
  begin
    codigo := LocalizarFornecedor(true);
  end;
  if codigo = 0 then
  begin
    exit;
  end;
  if ordcompra.tpordcompra.botransportadora = _s then
  begin
    cds.fieldbyname(_CDTRANSPORTADORA).AsLargeInt := codigo
  end
  else
  begin
    cds.fieldbyname(_CDFORNECEDORTRANSPORTADORA).AsLargeInt := codigo;
  end;
end;

procedure TfrmOrdCompra.cdsBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cds);
end;

procedure TfrmOrdCompra.cdsBODESCONTOITEMValidate(Sender: TField);
begin
  ConfigurarDesconto;
  GravartotaisClasse;
end;

procedure TfrmOrdCompra.cdsBOFRETEITEMValidate(Sender: TField);
begin
  ConfigurarFrete;
  GravartotaisClasse;
end;

procedure TfrmOrdCompra.cdsdetailBeforePost(DataSet: TDataSet);
begin
  if (Dataset.State <> dsedit) and (Dataset.state <> dsinsert) then
  begin
    exit;
  end;
  if (ordcompra.tpordcompra.bocntcustoobrigatorio = _s) and (dataset.FieldByName(_cdcntcusto).AsString = '') then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_centro_de_custo]), mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    dataset.FieldByName(_cdcntcusto).FocusControl;
    Abort;
  end;
  if cdsdetailCDDIGITADO.AsString = '' then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [__codigo+' '+_do+' '+_produto]), mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    cdsdetailCDDIGITADO.FocusControl;
    abort;
  end;
  if (cdsdetailNUKMATUAL.AsInteger > 0) and (cdsdetailNUKMFINAL.AsInteger = 0) then
  begin
    MessageDlg('Km final é um campo obrigatorio quando km atual estiver preenchido.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    cdsdetailNUKMFINAL.FocusControl;
    abort;
  end;
  if (cdsdetailNUKMFINAL.AsInteger > 0) and (cdsdetailNUKMATUAL.AsInteger = 0) then
  begin
    MessageDlg('Km atual é um campo obrigatorio quando km final estiver preenchido.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    cdsdetailNUKMATUAL.FocusControl;
    abort;
  end;
  if (cdsdetailNUKMFINAL.AsInteger > 0) and (cdsdetailNUKMATUAL.AsInteger > 0) and (cdsdetailNUKMATUAL.AsInteger > cdsdetailNUKMFINAL.AsInteger) then
  begin
    MessageDlg('Km atual não pode ser maior do que km final.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    cdsdetailNUKMATUAL.FocusControl;
    abort;
  end;
  if cdsdetailQTITEM.AsFloat = 0 then
  begin
    MessageDlg('Quantidade do item não pode ser igual a zero.', mtInformation, [mbOK], 0);
    pgc.ActivePage := tbsproduto;
    cdsdetailQTITEM.FocusControl;
    Abort;
  end;
  registro.set_update(DataSet);
end;

procedure TfrmOrdCompra.colDBBandedTableView1CDDIGITADOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEditProduto(tbl, cdsdetail, true);
end;

procedure TfrmOrdCompra.cdsNewRecord(DataSet: TDataSet);
begin
  cdsCDTPORDCOMPRA.asinteger:= registro.get_tipo_tabela_minumo;
  registro.NewRecord;
  cdsCDTPFRETE.AsString      := _9;
  cdsBOCERTIFICADO.AsString  := _N;
  cdsVLFRETE.AsCurrency      := 0;
  cdsVLTOTAL.AsCurrency      := 0;
  cdsDTEMISSAO.AsDateTime    := dtbanco;
  cdsDTENTREGA.OnValidate    := nil;
  cdsDTENTREGA.AsDateTime    := dtbanco;
  cdsDTENTREGA.OnValidate    := cdsDTENTREGAValidate;
  cdsCDSTORDCOMPRA.AsInteger := qregistro.Codigo_status_novo( tbl);
  setrecord(cdsCDTPORDCOMPRA.AsInteger);
end;

procedure TfrmOrdCompra.cdsNUCNTCUSTOValidate(Sender: TField);
begin
  tcntcusto.ValidarNucntcusto(sender.dataset,'',false);
end;

procedure TfrmOrdCompra.set_observacao;
begin
  if ordcompra.tpordcompra.boobservacaotpordcompra <> _s then
  begin
    Exit;
  end;
  if cdsDSOBSERVACAO.AsString = '' then
  begin
    cdsDSOBSERVACAO.AsString := ordcompra.tpordcompra.dsobservacao;
  end;
end;

procedure TfrmOrdCompra.cdsCDTPFRETEValidate(Sender: TField);
begin
  ConfigurarTpFrete;
end;

procedure TfrmOrdCompra.cdsCDTPORDCOMPRAValidate(Sender: TField);
begin
  if sender.isnull then
  begin
    exit;
  end;
  if not CodigoExiste( _tp+tbl, sender.asstring) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_tipo+' '+_ordem+' '+_compra)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  setrecord(sender.AsInteger);
  set_observacao;
end;

procedure TfrmOrdCompra.cdsCDCONDPAGTOValidate(Sender: TField);
begin
  if not ordcompra.condpagto.Select(Sender.Asinteger) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(__condicao+' '+_pagamento)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  ordcompra.condpagto.stcondpagto.Select(ordcompra.condpagto.cdstcondpagto);
  if ordcompra.condpagto.stcondpagto.bogerarpedido = _n then
  begin
    messagedlg('Condição de Pagamento está no status '+ordcompra.condpagto.stcondpagto.nmstcondpagto+#13+
                'que não permite ser inserido no '+Exibe+'.'#13+
                'Escolha outro código para prosseguir.', mtinformation, [mbok], 0);
    sender.FocusControl;
  end;
  ordcompra.cdcondpagto := sender.asinteger;
  ordcompra.condpagto.itcondpagto.Ler(ordcompra.cdcondpagto);
  ordcompra.Select(cds);
  ordcompra.gerarparcelas;
end;

procedure TfrmOrdCompra.cdsdetailQTITEMValidate(Sender: TField);
begin
  if cdsdetailQTITEM.AsFloat < 0 then
  begin
    MessageDlg('Quantidade do item não pode ser negativo.', mtInformation, [mbOK], 0);
    cdsdetailQTITEM.FocusControl;
    Abort;
  end;
  cdsdetailVLTOTAL.AsCurrency := cdsdetailQTITEM.AsCurrency * cdsdetailVLUNITARIO.ascurrency;
  cdsdetailVLPECA.OnValidate  := nil;
  if cdsdetailQTPECA.AsFloat = 0 then
  begin
    cdsdetailVLPECA.AsCurrency := 0
  end
  else
  begin
    cdsdetailVLPECA.AsCurrency := cdsdetailVLTOTAL.AsCurrency / cdsdetailQTPECA.AsFloat;
  end;
  cdsdetailVLPECA.OnValidate := cdsdetailVLPECAValidate;
  cdsdetailALICMSValidate(cdsdetailalicms);
  cdsdetailALIPIValidate(cdsdetailalipi);
end;

procedure TfrmOrdCompra.colDBBandedTableView1CDTPAPLICACAOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  cd: integer;
begin
  cd := ulocalizar.localizar(_tpaplicacao, True);
  if cd = 0 then
  begin
    exit;
  end;
  if (cdsdetail.State <> dsedit) and (cdsdetail.State = dsbrowse) then
  begin
    cdsdetail.Edit;
  end;
  cdsdetailCDTPAPLICACAO.AsInteger := cd;
end;

procedure TfrmOrdCompra.cdsdetailCDDIGITADOValidate(Sender: TField);
var
  produto : tproduto;
begin
  if sender.asstring = '' then
  begin
    Exit;
  end;
  produto := tproduto.create;
  try
    produto.cdproduto := produto.CodigoProdutoDigitado(sender.AsString, _boordcompra);
    if produto.cdproduto = 0 then
    begin
      abort;
    end;
    produto.Select(produto.cdproduto);
    produto.CheckDados;
    cdsdetailNMPRODUTO.asstring  := produto.nmproduto;
    cdsdetailCDPRODUTO.AsInteger := produto.cdproduto;
    if produto.nuplconta <> '' then
    begin
      cdsdetailNUPLCONTA.AsString := produto.nuplconta;
    end;
    if produto.nucntcusto <> '' then
    begin
      cdsdetailNUcntcusto.AsString := produto.nucntcusto;
    end;
  finally
    freeandnil(produto);
  end;
end;

procedure TfrmOrdCompra.cdsdetailNewRecord(DataSet: TDataSet);
begin
  cdsdetailCDITORDCOMPRA.AsInteger   := qgerar.GerarCodigo(_itordcompra);
  cdsdetailQTATENDIDA.AsFloat       := 0;
  cdsdetailQTITEM.AsFloat           := 1;
  cdsdetailVLUNITARIO.AsCurrency    := 0;
  cdsdetailVLICMSSUBTRIB.AsCurrency := 0;
  cdsdetailNUKMATUAL.AsInteger      := 0;
  cdsdetailNUKMFINAL.AsInteger      := 0;
  cdsdetailBOIPIBCICMS.AsString     := _N;
  cdsdetailDTPREVENTREGA.AsDateTime := cdsDTENTREGA.AsDateTime;
end;

procedure TfrmOrdCompra.exportarGradeExcel(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  exportarexcel( Key, sender);
end;

procedure TfrmOrdCompra.edtnucntcustoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtnucntcustoPropertiesButtonClick(sender, 0);
  end;
  nextcontrol(sender, key, shift);
end;

procedure TfrmOrdCompra.edtnucntcustoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  TCntcusto.edtnucntcustoPropertiesButtonClick(cds);
end;

procedure TfrmOrdCompra.edtnudiasExit(Sender: TObject);
begin
  if (dts.state = dsinsert) or (dts.State = dsedit) then
  begin
    cdsDTENTREGA.AsDateTime := cdsDTEMISSAO.AsDateTime + edtnudias.Value;
  end;
  colorExit(sender);
end;

procedure TfrmOrdCompra.edtdtentregaExit(Sender: TObject);
begin
  if (dts.state = dsinsert) or (dts.State = dsedit) then
  begin
    cdsNUDIAS.AsInteger := StrToInt(formatfloat(__integer, (edtdtentrega.Date - cdsDTEMISSAO.AsDateTime)));
  end;
  colorExit(sender);
end;

procedure TfrmOrdCompra.cdsCDFORNECEDORValidate(Sender: TField);
begin
  if not ordcompra.fornecedor.select(Sender.AsLargeInt) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  ordcompra.fornecedor.stfornecedor.select(ordcompra.fornecedor.cdstfornecedor);
  if ordcompra.fornecedor.stfornecedor.bogerarinfo <> _s then
  begin
    messagedlg('Fornecedor está no status '+ordcompra.fornecedor.stfornecedor.nmstfornecedor+#13'que não permite ser inserido no '+Exibe+'.', mtinformation, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
  ordcompra.fornecedor.clfornecedor.Select(ordcompra.fornecedor.cdclfornecedor);
  if (ordcompra.fornecedor.cdclfornecedor <> 0) and (ordcompra.fornecedor.clfornecedor.bocredenciado <> _s) then
  begin
    messagedlg('A classificação de IQF do fornecedor não permite gerar ordem de compra.', mtinformation, [mbok], 0);
    abort;
  end;
  cdsNMFORNECEDOR.AsString := ordcompra.fornecedor.nmfornecedor;
  txtnmfornecedor.Hint     := ordcompra.fornecedor.hint_rzsocial;
  atualizarContatofornecedor;
end;

procedure TfrmOrdCompra.cdsCDFORNECEDORTRANSPORTADORAValidate(Sender: TField);
begin
  if sender.IsNull then
  begin
    sender.dataset.fieldbyname(_NMFORNECEDOR+_TRANSPORTADORA).clear;
    txtNMFORNECEDORTRANSPORTADORA.Hint     := '';
    exit;
  end;
  if not ordcompra.fornecedortransportadora.select(sender.AsLargeInt) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  ordcompra.fornecedortransportadora.stfornecedor.select(ordcompra.fornecedortransportadora.cdstfornecedor);
  if ordcompra.fornecedortransportadora.stfornecedor.bogerarinfo <> _s then
  begin
    messagedlg('Transportadora está no status '+ordcompra.fornecedortransportadora.stfornecedor.nmstfornecedor+#13'que não permite ser inserido no '+Exibe+'.', mtinformation, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
  cdsNMFORNECEDORTRANSPORTADORA.AsString := ordcompra.fornecedortransportadora.nmfornecedor;
  txtNMFORNECEDORTRANSPORTADORA.Hint     := ordcompra.fornecedortransportadora.hint_rzsocial;
end;

procedure TfrmOrdCompra.cdsdetailAfterPost(DataSet: TDataSet);
begin
  gravartotaisClasse;
end;

procedure TfrmOrdCompra.cdsdetailALICMSValidate(Sender: TField);
begin
  if cdsdetailBOIPIBCICMS.AsString = _S then
  begin
    cdsdetailVLICMS.AsCurrency := (cdsdetailVLTOTAL.AsCurrency + cdsdetailVLIPI.AsCurrency) * cdsdetailALICMS.AsCurrency / 100
  end
  else
  begin
    cdsdetailVLICMS.AsCurrency := cdsdetailVLTOTAL.AsCurrency * cdsdetailALICMS.AsCurrency / 100;
  end;
end;

procedure TfrmOrdCompra.cdsdetailALIPIValidate(Sender: TField);
begin
  cdsdetailVLIPI.AsCurrency := cdsdetailVLTOTAL.AsCurrency * cdsdetailALIPI.AsCurrency / 100;
end;

procedure TfrmOrdCompra.cdsAfterScroll(DataSet: TDataSet);
begin
  AlimentarORM(DataSet);
  setrecord(cdsCDTPORDCOMPRA.AsInteger);
  actavaliacaoiqf.Visible := (ordcompra.tpordcompra.boiqf = _s) and empresa.fornecedor.IQF.bo and ((cdsCDSTORDCOMPRA.AsInteger = 2) or (cdsCDSTORDCOMPRA.AsInteger = 4));
  actavaliacaoiqf.Enabled := (ordcompra.tpordcompra.boiqf = _s) and empresa.fornecedor.iqf.bo and ((cdsCDSTORDCOMPRA.AsInteger = 2) or (cdsCDSTORDCOMPRA.AsInteger = 4));
  atualizarcontatofornecedor;
  actatendido.Enabled := (cdsCDSTORDCOMPRA.AsString = _1) or (cdsCDSTORDCOMPRA.AsString = _3);
  actatendido.Visible := actatendido.Enabled;
  actdeclinar.Enabled := cdsCDSTORDCOMPRA.AsString = _1;
  actdeclinar.Visible := actdeclinar.Enabled;
  actreabrir.Enabled  := (cdsCDSTORDCOMPRA.AsString = _4) or ((cdsCDSTORDCOMPRA.AsString = _2) and ordcompra.ordcompraNaoAtendidoCompletamente);
  actreabrir.Visible  := actreabrir.Enabled;
  travarOrdcompraAtendida;
  actaprovacao.Enabled := usuario.TpAprovacao.Existe_inteiro(_cdtpprocessointerno, 1) and (cdsCDSTORDCOMPRA.AsInteger in [1, 5]);
  pnl.Font.Color := ordcompra.stordcompra.nucor;
  actGerarCompra.Enabled := ordcompra.stordcompra.bogerarinfo = _S;
  actGerarCompra.Visible := actGerarCompra.Enabled;
  ConfigurarTpFrete;
  ConfigurarFrete;
  Configurardesconto;
  txtnmfornecedor.Hint   := ordcompra.fornecedor.hint_rzsocial;
end;

procedure TfrmOrdCompra.dspBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  registro.gerar_codigo(Sender, sds, SourceDS, DeltaDS, UpdateKind, Applied);
end;

procedure TfrmOrdCompra.colorEnter(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_enter;
end;

procedure TfrmOrdCompra.colorExit(Sender: TObject);
begin
  TcxCustomTextEdit(Sender).Style.Color := _color_exit;
end;

procedure TfrmOrdCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmOrdCompra.actimprimirModelo1Execute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(323, cdsCDORDCOMPRA.AsString);
end;

procedure TfrmOrdCompra.actimprimirmodelo2Execute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(313, cdsCDORDCOMPRA.AsString);
end;

procedure TfrmOrdCompra.actimprimirmodelo3Execute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(314, cdsCDORDCOMPRA.AsString);
end;

procedure TfrmOrdCompra.FormCreate(Sender: TObject);
begin
  ConfigurarEmpresa;
  ordcompra := TOrdCompra.create;
  tbl       := _ordcompra;
  exibe     := 'Ordem de Compra';
  artigoI   := 'a';
  AbrirTabelas;
  registro := tregistro.create(self,  tbl, exibe, artigoI, cds, dts, edtcodigo);
  GeraMenuRelatorio ('', btnimprimir, 26, cds, _ordcompra);
end;

procedure TfrmOrdCompra.GravartotaisClasse;
var
  recproduto, I: Integer;
begin
  cdsdetail.DisableControls;
  cdsdetail.AfterPost := nil;
  DesativarOnValidate;
  try
    recproduto   := cdsdetail.RecNo;
    ordcompra.select(cds);
    ordcompra.itordcompra.Ler(cdsdetail);
    ordcompra.OrdCompraAutpagto.Ler(cdsordcompraautpagto);
    ordcompra.gravartotais;
    for I := 0 to ordcompra.itordcompra.count - 1 do
    begin
      cdsdetail.RecNo := i + 1;
      cdsdetail.Edit;
      ordcompra.itordcompra.items[i].Atribuir(cdsdetail);
      cdsdetail.post;
    end;
    cdsdetail.RecNo := recproduto;
    ordcompra.Atribuir(cds);
  finally
    cdsdetail.EnableControls;
    cdsdetail.AfterPost := cdsdetailAfterPost;
    AtivarOnValidate;
  end;
end;

procedure TfrmOrdCompra.setrecord(cdtp: Integer);
begin
  if cdtp = 0 then
  begin
    exit;
  end;
  ordcompra.tpordcompra.Select(cdtp);
  if ordcompra.tpordcompra.botransportadora = _s then
  begin
    edtcdfornecedortransportadora.DataBinding.DataField := _cdtransportadora;
    txtNMFORNECEDORTRANSPORTADORA.DataField             := _nmtransportadora;
  end
  else
  begin
    edtcdfornecedortransportadora.DataBinding.DataField := _cdfornecedor+_transportadora;
    txtNMFORNECEDORTRANSPORTADORA.DataField             := _nmfornecedor+_transportadora;
  end;

  lblclfornecedor.Visible   := ordcompra.tpordcompra.boiqf = _s;
  txtnmclfornecedor.Visible := ordcompra.tpordcompra.boiqf = _s;

  tbvBOCERTIFICADO.Visible := ordcompra.tpordcompra.boitemcertificado = _s;
  ckbbocertificado.Visible := ordcompra.tpordcompra.bocertificado     = _s;
  gbxAprovacao.Visible     := ordcompra.tpordcompra.boaprovacao       = _s;
  tbvCDORDPRODUCAO.Visible := ordcompra.tpordcompra.boitpedido        = _s;
  tbvCDORCAMENTO.Visible   := ordcompra.tpordcompra.boitemorcamento   = _s;

  tbvNUCLFISCAL.Visible := ordcompra.tpordcompra.boitemnuclfiscal = _S;
  tbvnusticms.Visible := ordcompra.tpordcompra.boitemnusticms     = _S;
  //
  actimprimirModelo1.Visible := ordcompra.tpordcompra.bomodelo1 = _s;
  actimprimirModelo1.Enabled := ordcompra.tpordcompra.bomodelo1 = _s;
  actemailmodelo1.Visible    := ordcompra.tpordcompra.bomodelo1 = _s;
  actemailmodelo1.Enabled    := ordcompra.tpordcompra.bomodelo1 = _s;

  actimprimirModelo2.Visible := ordcompra.tpordcompra.bomodelo2 = _s;
  actimprimirModelo2.Enabled := ordcompra.tpordcompra.bomodelo2 = _s;
  actemailmodelo2.Visible    := ordcompra.tpordcompra.bomodelo2 = _s;
  actemailmodelo2.Enabled    := ordcompra.tpordcompra.bomodelo2 = _s;

  actimprimirModelo3.Visible := ordcompra.tpordcompra.bomodelo3 = _s;
  actimprimirModelo3.Enabled := ordcompra.tpordcompra.bomodelo3 = _s;
  actemailmodelo3.Visible    := ordcompra.tpordcompra.bomodelo3 = _s;
  actemailmodelo3.Enabled    := ordcompra.tpordcompra.bomodelo3 = _s;

  actimprimirModelo4.Visible := ordcompra.tpordcompra.bomodelo4 = _s;
  actimprimirModelo4.Enabled := ordcompra.tpordcompra.bomodelo4 = _s;
  actemailmodelo4.Visible    := ordcompra.tpordcompra.bomodelo4 = _s;
  actemailmodelo4.Enabled    := ordcompra.tpordcompra.bomodelo4 = _s;

  tbv.Bands[qform.get_index('KM'          , tbv)].Visible := ordcompra.tpordcompra.boitemkm           = _s;
  tbv.Bands[qform.get_index('Aplicação'   , tbv)].Visible := ordcompra.tpordcompra.botpaplicacaoitens = _s;

  edtdssolicitante.Visible            := ordcompra.tpordcompra.bosolicitantedigitar = _s;
  cbxcdfuncionariosolicitante.Visible := ordcompra.tpordcompra.bosolicitantedigitar <> _N;
  edtdslocal.Visible                  := ordcompra.tpordcompra.bolocaldigitar = _S;
  edtnucntcusto.Visible               := ordcompra.tpordcompra.bolocaldigitar = _N;
  txtnmcntcusto.Visible               := ordcompra.tpordcompra.bolocaldigitar = _N;
  edtdsaplicacao.Visible              := ordcompra.tpordcompra.boaplicacaodigitar = _s;
  cbxcdtpaplicacao.Visible            := ordcompra.tpordcompra.boaplicacaodigitar <> _s;

  tbvDSFORMULA.Visible                := ordcompra.tpordcompra.boitemdsformula = _s;
  tbvQTPECA.Visible                   := ordcompra.tpordcompra.boitemqtpeca = _s;
  tbvVLPECA.Visible                   := ordcompra.tpordcompra.boitemqtpeca = _s;
  tbvQTPESOUNITARIO.Visible           := ordcompra.tpordcompra.boitemqtpeca = _s;
  tbvDSOBSERVACAO.Visible             := ordcompra.tpordcompra.boitemdsobservacao = _s;

  actaprovacao.Visible := ordcompra.tpordcompra.boaprovacaofinanceiro = _s;
end;

procedure TfrmOrdCompra.edtcdfornecedorExit(Sender: TObject);
var
  codigo: string;
begin
  colorExit(sender);
  if edtcdfornecedor.Text = '' then
  begin
    exit;
  end;
  codigo := edtcdfornecedor.Text;
  if not codigoexiste( _fornecedor, codigo) then
  begin
    MessageDlg('Código da fornecedor '+codigo+' não encontrado no cadastro de '+_fornecedor+'.', mtWarning, [mbOk], 0);
    edtcdfornecedor.SetFocus;
  end;
end;

procedure TfrmOrdCompra.edtcdfornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = __KeySearch then
  begin
    edtcdfornecedorPropertiesButtonClick(sender, 0)
  end
  else
  begin
    nextcontrol(Sender, Key, Shift)
  end;
end;

procedure TfrmOrdCompra.edtcdfornecedorPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  QForm.edtcdfornecedorPropertiesButtonClick(self, cds);
end;

procedure TfrmOrdCompra.cdsdetailCDTPAPLICACAOValidate(Sender: TField);
begin
  if sender.isnull then
  begin
    sender.dataset.fieldbyname(_nmtpaplicacao).clear;
    exit;
  end;
  if not CodigoExiste( _tpaplicacao, sender.asstring) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_tipo+' '+__aplicacao)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  cdsdetailNMTPAPLICACAO.AsString := NomedoCodigo( _tpaplicacao, sender.AsString);
end;

procedure TfrmOrdCompra.nextcontrol(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
  end;
end;

procedure TfrmOrdCompra.txtcdpedidomaterialDblClick(Sender: TObject);
begin
  actabrirpedidomaterialExecute(actabrirpedidomaterial);
end;

procedure TfrmOrdCompra.txtnmfornecedorDblClick(Sender: TObject);
begin
  actabrirfornecedorExecute(actabrirfornecedor);
end;

procedure TfrmOrdCompra.actavaliacaoiqfExecute(Sender: TObject);
begin
  if NomedoCodigo( _fornecedor, cds.fieldbyname(_CDFORNECEDOR).AsString, _cd+_clfornecedor) = '' then
  begin
    MessageDlg('A classificação de IQF é um campo obrigatório para avaliar um fornecedor.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if AvaliarIQF(cdsCDORDCOMPRA.AsInteger) then
  begin
    Abrir(cdsCDORDCOMPRA.asinteger);
  end;
end;

procedure TfrmOrdCompra.actimprimirmodelo4Execute(Sender: TObject);
begin
  ImpimirRelatorioPadrao1(337, cdsCDORDCOMPRA.AsString);
end;

procedure TfrmOrdCompra.atualizarContatofornecedor;
begin
  cdsitcontfornecedor.Close;
  sdsitcontfornecedor.Close;
  if cds.fieldbyname(_CDFORNECEDOR).AsString = '' then
  begin
    Exit;
  end;
  sdsitcontfornecedor.ParamByName(_cdempresa).AsLargeint  := empresa.cdempresa;
  sdsitcontfornecedor.ParamByName(_cdfornecedor).AsString := cds.fieldbyname(_CDFORNECEDOR).AsString;
  cdsitcontfornecedor.Open;
end;

procedure TfrmOrdCompra.AtualizarOrdCompraAutpagto;
var
  i : Integer;
begin
  if cdsordcompraautpagto.RecordCount > 0 then
  begin
    cdsordcompraautpagto.First;
    while not cdsordcompraautpagto.Eof do
    begin
      cdsordcompraautpagto.Delete;
    end;
  end;
  for i := 0 to ordcompra.ordcompraautpagto.Count - 1 do
  begin
    cdsordcompraautpagto.Insert;
    cdsordcompraautpagto.FieldByName(_cdordcompraautpagto).AsInteger   := qgerar.GerarCodigo(_ordcompraautpagto);
    cdsordcompraautpagto.FieldByName(_cdordcompra).AsInteger          := ordcompra.ordcompraautpagto.Items[i].cdordcompra;
    cdsordcompraautpagto.FieldByName(_dtprorrogacao).AsDateTime       := ordcompra.ordcompraautpagto.Items[i].dtprorrogacao;
    cdsordcompraautpagto.FieldByName(_dtemissao).AsDateTime           := ordcompra.ordcompraautpagto.Items[i].dtemissao;
    cdsordcompraautpagto.FieldByName(_vlsaldo).AsCurrency             := ordcompra.ordcompraautpagto.Items[i].vlsaldo;
    cdsordcompraautpagto.FieldByName(_vlordcompraautpagto).AsCurrency := ordcompra.ordcompraautpagto.Items[i].vlordcompraautpagto;
    cdsordcompraautpagto.Post;
  end;
end;

procedure TfrmOrdCompra.cdsCDITCONTFORNECEDORValidate(Sender: TField);
begin
  cdsEMAIL.AsString := NomedoCodigo( _itcontfornecedor, cdsCDITCONTFORNECEDOR.AsString, _email);
end;

procedure TfrmOrdCompra.actemailmodelo4Execute(Sender: TObject);
var
  eventoemail : TEventoEmail;
begin
  eventoemail := teventoemail.create;
  try
    eventoemail.dstitulo  := ordcompra.tpordcompra.dstituloemail;
    eventoemail.dsassunto := ordcompra.tpordcompra.dsassuntoemail;
    ImpimirRelatorioPadrao1(337, cdsCDORDCOMPRA.AsString, '', _email, getemail, ordcompra.tpordcompra.emailcopia, eventoemail.TratarTitulo(cds), eventoemail.TratarAssunto(cds));
  finally
    eventoemail.Free;
  end;
end;

procedure TfrmOrdCompra.actemailExecute(Sender: TObject);
begin
  btnemail.DropDown(false);
end;

function TfrmOrdCompra.getemail: string;
begin
  result := cdsEMAIL.Text;
  if result = '' then
  begin
    result := NomedoCodigo( _fornecedor, cds.fieldbyname(_CDFORNECEDOR).AsString, _email);
  end;
end;

procedure TfrmOrdCompra.actemailmodelo1Execute(Sender: TObject);
var
  eventoemail : TEventoEmail;
begin
  eventoemail := teventoemail.create;
  try
    eventoemail.dstitulo  := ordcompra.tpordcompra.dstituloemail;
    eventoemail.dsassunto := ordcompra.tpordcompra.dsassuntoemail;
    ImpimirRelatorioPadrao1(323, cdsCDORDCOMPRA.AsString, '', _email, getemail, ordcompra.tpordcompra.emailcopia, eventoemail.TratarTitulo(cds), eventoemail.TratarAssunto(cds));
  finally
    eventoemail.Free;
  end;
end;

procedure TfrmOrdCompra.actemailmodelo2Execute(Sender: TObject);
var
  eventoemail : TEventoEmail;
begin
  eventoemail := teventoemail.create;
  try
    eventoemail.dstitulo  := ordcompra.tpordcompra.dstituloemail;
    eventoemail.dsassunto := ordcompra.tpordcompra.dsassuntoemail;
    ImpimirRelatorioPadrao1(313, cdsCDORDCOMPRA.AsString, '', _email, getemail, ordcompra.tpordcompra.emailcopia, eventoemail.TratarTitulo(cds), eventoemail.TratarAssunto(cds));
  finally
    eventoemail.Free;
  end;
end;

procedure TfrmOrdCompra.actemailmodelo3Execute(Sender: TObject);
var
  eventoemail : TEventoEmail;
begin
  eventoemail := teventoemail.create;
  try
    eventoemail.dstitulo  := ordcompra.tpordcompra.dstituloemail;
    eventoemail.dsassunto := ordcompra.tpordcompra.dsassuntoemail;
    ImpimirRelatorioPadrao1(314, cdsCDORDCOMPRA.AsString, '', _email, getemail, ordcompra.tpordcompra.emailcopia, eventoemail.TratarTitulo(cds), eventoemail.TratarAssunto(cds));
  finally
    eventoemail.Free;
  end;
end;

procedure TfrmOrdCompra.cdsordcompraautpagtoNewRecord(DataSet: TDataSet);
begin
  cdsordcompraautpagtoCDORDCOMPRAAUTPAGTO.AsInteger := qgerar.GerarCodigo( _ordcompra+_autpagto);
end;

procedure TfrmOrdCompra.cdsVLDESCONTOValidate(Sender: TField);
begin
  gravartotaisclasse;
end;

procedure TfrmOrdCompra.cdsVLFRETEValidate(Sender: TField);
begin
  gravartotaisclasse;
end;

procedure TfrmOrdCompra.cdsordcompraautpagtoBeforePost(DataSet: TDataSet);
begin
  registro.set_update(cdsordcompraautpagto);
end;

procedure TfrmOrdCompra.tbvQTPESOUNITARIOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  qtpeso : real;
  dsformula : string;
begin
  qtpeso    := cdsdetailQTPESOUNITARIO.AsFloat;
  dsformula := cdsdetailDSFORMULA.AsString;
  if CalcularPeso( cdsdetail.ReadOnly, cdsdetailCDPRODUTO.AsString, dsformula, qtpeso) and (not cdsdetail.ReadOnly) then
  begin
    if cdsdetail.State = dsbrowse then
    begin
      cdsdetail.Edit;
    end;
    cdsdetailQTPESOUNITARIO.AsFloat := qtpeso;
    cdsdetailDSFORMULA.AsString     := dsformula;
  end;
end;

procedure TfrmOrdCompra.cdsdetailQTPECAValidate(Sender: TField);
begin
  cdsdetailQTITEM.AsFloat := cdsdetailQTPESOUNITARIO.AsFloat * cdsdetailQTPECA.AsFloat;
end;

procedure TfrmOrdCompra.cdsdetailVLPECAValidate(Sender: TField);
begin
  cdsdetailVLTOTAL.AsCurrency := cdsdetailVLPECA.AsCurrency * cdsdetailQTPECA.AsFloat;
  cdsdetailVLUNITARIO.OnValidate := nil;
  if cdsdetailQTITEM.AsFloat = 0 then
  begin
    cdsdetailVLUNITARIO.AsCurrency := 0
  end
  else
  begin
    cdsdetailVLUNITARIO.AsCurrency := cdsdetailVLTOTAL.AsCurrency / cdsdetailQTITEM.AsFloat;
  end;
end;

procedure TfrmOrdCompra.cdsDTENTREGAValidate(Sender: TField);
begin
  ordcompra.Select(cds);
  ordcompra.gerarparcelas;
  AtualizarOrdCompraAutpagto;
end;

procedure TfrmOrdCompra.actcopiarExecute(Sender: TObject);
var
  codigo : integer;
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  ordcompra.cdordcompra := cdsCDordcompra.AsInteger;
  codigo                := ordcompra.copiar;
  if codigo <> 0 then
  begin
    Abrir(codigo);
  end;
end;

procedure TfrmOrdCompra.actatendidoExecute(Sender: TObject);
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  ExecutaSQL('update ordcompra set cdstordcompra=2 where cdordcompra='+cdsCDORDCOMPRA.AsString+' and cdempresa='+cds.FieldByName(_cdempresa).AsString);
  Abrir(cdsCDORDCOMPRA.asinteger);
end;

procedure TfrmOrdCompra.cbxcdcondpagtoEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_condpagto+_e);
end;

procedure TfrmOrdCompra.cbxcdtpordcompraEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_tpordcompra);
end;

procedure TfrmOrdCompra.cbxcdtpcobrancaEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_tpcobranca);
end;

procedure TfrmOrdCompra.cbxCDFUNCIONARIOCONTATOEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_funcionario);
end;

procedure TfrmOrdCompra.cbxcdtpaplicacaoEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_tpaplicacao);
end;

procedure TfrmOrdCompra.cbxcdfuncionariosolicitanteEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_funcionario);
end;

procedure TfrmOrdCompra.cbxCDFUNCIONARIOAPROVACAOEnter(Sender: TObject);
begin
  colorEnter(sender);
  abrir_tabela(_funcionario);
end;

procedure TfrmOrdCompra.grdconsultaDBTableView1DblClick(Sender: TObject);
begin
  actabrirentradaExecute(actabrirentrada);
end;

procedure TfrmOrdCompra.actabrirentradaExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsconsulta);
end;

procedure TfrmOrdCompra.actreabrirExecute(Sender: TObject);
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  if cds.fieldbyname(_cdordcompra).asstring <> edtcodigo.text then
  begin
    if messagedlg('No momento está aberto o registro '+cds.fieldbyname(_cdordcompra).asstring+#13'você gostaria de abrir registro '+edtcodigo.text+' para edição?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      if not registro.RegistroAbrir(strtoint(edtcodigo.text)) then
      begin
        registro.set_grade_item(self, false);
        exit;
      end;
    end
    else
    begin
      edtcodigo.Text := cds.fieldbyname(_cdordcompra).asstring;
      registro.set_grade_item(self, false);
      exit;
    end;
  end;
  if not edtcodigo.Visible then
  begin
    cds.Refresh;
  end
  else if not registro.RegistroAbrir(cds.fieldbyname(_cdordcompra).asinteger) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [cds.fieldbyname(_cdordcompra).asstring, qstring.maiuscula(_ordem+' '+_compra)]), mterror, [mbok], 0);
    exit;
  end;
  registro.set_readonly_dados(self, false);
  cds.edit;
  registro.set_grade_item(self, True);
  cdsCDSTORDCOMPRA.AsString := statusAtendimento;
  actSalvarExecute(actSalvar);
end;

function TfrmOrdCompra.statusAtendimento: string;
var
  c : TClientDataSet;
  boparcial : Boolean;
begin
  boparcial := False;
  c         := TClientDataSet.Create(nil);
  try
    c.CloneCursor(cdsdetail, true);
    c.First;
    while not c.Eof do
    begin
      if c.FieldByName(_qtatendida).AsFloat > 0 then
      begin
        boparcial := True;
      end;
      c.Next;
    end;
    if boparcial then
    begin
      result := _3
    end
    else
    begin
      result := _1;
    end;
  finally
    FreeAndNil(c);
  end;
end;

procedure TfrmOrdCompra.tbvCDORCAMENTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEdit(cdsdetail, _orcamento, _cdorcamento, false);
end;

procedure TfrmOrdCompra.tbvCDORDPRODUCAOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEdit(cdsdetail, _ordproducao, _cdordproducao, false);
end;

procedure TfrmOrdCompra.cdsdetailCDORCAMENTOValidate(Sender: TField);
var
  orcamento : Torcamento;
begin
  if sender.asstring = '' then
  begin
    exit;
  end;
  orcamento := torcamento.create;
  try
    if not orcamento.Select(sender.AsInteger) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(__orcamento)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
  finally
    FreeAndNil(orcamento);
  end;
end;

procedure TfrmOrdCompra.cdsdetailCDORDPRODUCAOValidate(Sender: TField);
var
  ordproducao : TOrdProducao;
begin
  if sender.asstring = '' then
  begin
    exit;
  end;
  if not CodigoExiste( _ordproducao, sender.asstring) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_ordem+' '+__producao)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  ordproducao := tordproducao.create;
  try
    ordproducao.Select(sender.AsInteger);
    if ordproducao.cdstordproducao = 4 then
    begin
      Exit;
    end;
    ordproducao.cdstordproducao := 4;
    aplicacao.con2.ExecuteDirect(ordproducao.Update(True));
    aplicacao.con2.ExecuteDirect(ordproducao.RegistrarMudancaStatus(True));
  finally
    FreeAndNil(ordproducao);
  end;
end;

procedure TfrmOrdCompra.actabrirorcamentoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsdetail);
end;

procedure TfrmOrdCompra.actabrirordproducaoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cdsdetail);
end;

procedure TfrmOrdCompra.actabrirpedidomaterialExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender), cds, cds);
end;

procedure TfrmOrdCompra.tbvCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cddigitado then
  begin
    actabrirprodutoExecute(actabrirproduto)
  end
  else if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cdorcamento then
  begin
    actabrirorcamentoExecute(actabrirorcamento)
  end
  else if LowerCase(TcxGridDBBandedColumn(ACellViewInfo.Item).DataBinding.FieldName) = _cdordproducao then
  begin
    actabrirordproducaoExecute(actabrirordproducao)
  end;
end;

procedure TfrmOrdCompra.tbvNUCNTCUSTOPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEdit(cdsdetail, _cntcusto, _nucntcusto, false);
end;

procedure TfrmOrdCompra.tbvNUPLCONTAPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  registro.ButtonEdit(cdsdetail, _plconta, _nuplconta, false);
end;

procedure TfrmOrdCompra.eventokeypress(Sender: TObject; var Key: Char);
begin
  QForm.KeyPressControl(key);
end;

procedure TfrmOrdCompra.actdeclinarExecute(Sender: TObject);
begin
  if empresa.get_bloqueado then
  begin
    exit;
  end;
  actEditarExecute(acteditar);
  cdsCDSTORDCOMPRA.AsString := _4;
  actSalvarExecute(actSalvar);
end;

procedure TfrmOrdCompra.lbltpordcompraDblClick(Sender: TObject);
begin
  actAbrirtpordcompra.onExecute(actAbrirtpordcompra);
end;

procedure TfrmOrdCompra.actabrirtpordcompraExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender),cds,cds);
end;

procedure TfrmOrdCompra.lblcondpagtoDblClick(Sender: TObject);
begin
  actAbrircondpagto.onExecute(actAbrircondpagto);
end;

procedure TfrmOrdCompra.actabrircondpagtoExecute(Sender: TObject);
begin
  frmMain.AbrirDireto(TAction(Sender),cds,cds);
end;

procedure TfrmOrdCompra.cdsdetailNUCNTCUSTOValidate(Sender: TField);
begin
  tcntcusto.validarnucntcusto(sender.dataset);
end;

procedure TfrmOrdCompra.cdsdetailNUKMATUALValidate(Sender: TField);
begin
  if Sender.AsInteger < 0 then
  begin
    MessageDlg('Km atual não pode ser negativo.', mtinformation, [mbOK], 0);
    sender.FocusControl;
    Abort;
  end;
end;

procedure TfrmOrdCompra.cdsdetailNUKMFINALValidate(Sender: TField);
begin
  if sender.AsInteger < 0 then
  begin
    MessageDlg('Km final não pode ser negativo.', mtinformation, [mbOK], 0);
    sender.FocusControl;
    Abort;
  end;
end;

procedure TfrmOrdCompra.cdsdetailNUPLCONTAValidate(Sender: TField);
begin
  tplconta.validarnuplconta(sender.dataset, _d);
end;

procedure TfrmOrdCompra.travarOrdcompraAtendida;
var
  botravar : Boolean;
begin
  botravar := False;
  cdsdetail.DisableControls;
  try
    cdsdetail.First;
    while not cdsdetail.Eof do
    begin
      botravar := cdsdetailQTATENDIDA.AsFloat >= cdsdetailQTITEM.AsFloat;
      if not botravar then
      begin
        Break;
      end;
      cdsdetail.Next;
    end;
    cdsdetail.First;
    if botravar then
    begin
      actEditar.Enabled := False;
      actExcluir.Enabled := False;
    end;
  finally
    cdsdetail.EnableControls;
  end;
end;

procedure TfrmOrdCompra.cdsCDTRANSPORTADORAValidate(Sender: TField);
var
  cdsttransportadora : integer;
begin
  if sender.isnull then
  begin
    sender.dataset.fieldbyname(_nmtransportadora).clear;
    exit;
  end;
  if not RegistroExiste(_transportadora, _cdtransportadora+'='+Sender.AsString) then
  begin
    MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_transportadora)]), mterror, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  cdsttransportadora := qregistro.InteirodoCodigo(_transportadora, sender.AsString, _cdsttransportadora);
  if not qregistro.BooleandoCodigo(_sttransportadora, cdsttransportadora, _bogerarinfo) then
  begin
    messagedlg('Transportadora está no status '+qregistro.NomedoCodigo(_sttransportadora, cdsttransportadora)+#13'que não permite ser inserido no '+Exibe+'.', mtinformation, [mbok], 0);
    sender.FocusControl;
    abort;
  end;
  cdsNMTRANSPORTADORA.AsString := NomedoCodigo(_transportadora, sender.AsString);
end;

procedure TfrmOrdCompra.actopcoesExecute(Sender: TObject);
begin
  btnopcoes.DropDown(false);
end;

procedure TfrmOrdCompra.actarquivoExecute(Sender: TObject);
begin
  dlgarquivo(tbl, cds.fieldbyname(_cdordcompra).AsString);
end;

procedure TfrmOrdCompra.actaprovacaoExecute(Sender: TObject);
begin
  if dlgOrdCompraAprovacao(cds.fieldbyname(_cdordcompra).AsInteger, usuario.cdusuario) then
  begin
    abrir(cds.fieldbyname(_cdordcompra).asinteger);
  end;
end;

end.
