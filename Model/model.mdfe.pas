unit model.mdfe;

interface

uses uConstantes,
  orm.empresa, ORM.Fornecedor,  ORM.Transportadora, ORM.Serie, orm.Veiculo,
  ORM.CTE, ORM.Mdfe,
  Rotina.Strings, Rotina.Registro, Rotina.DataHora, Rotina.Retornasql, Rotina.Rotinas,
  classe.gerar, classe.Registro,
  System.SysUtils, System.Classes, Vcl.Dialogs, System.UITypes,
  Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr;

type
  TdmMdfe = class(TDataModule)
    sds: TSQLDataSet;
    sdsCDMDFE: TIntegerField;
    sdsCDUSUARIOI: TIntegerField;
    sdsCDUSUARIOA: TIntegerField;
    sdsCDCOMPUTADORI: TIntegerField;
    sdsCDCOMPUTADORA: TIntegerField;
    sdsCDSERIE: TIntegerField;
    sdsCDUF: TIntegerField;
    sdsCDMDFETPEMITENTE: TIntegerField;
    sdsCDMDFEMODALIDADE: TIntegerField;
    sdsCDMDFEFORMAEMISSAO: TIntegerField;
    sdsCDUFINICIO: TIntegerField;
    sdsCDUFFIM: TIntegerField;
    sdsCDUNIDADE: TIntegerField;
    sdsCDVEICULO: TIntegerField;
    sdsCDTPMDFE: TIntegerField;
    sdsCDSTMDFE: TIntegerField;
    sdsTSINCLUSAO: TSQLTimeStampField;
    sdsTSALTERACAO: TSQLTimeStampField;
    sdsNUMDFE: TIntegerField;
    sdsDTEMISSAO: TDateField;
    sdsHREMISSAO: TTimeField;
    sdsNUCHAVE: TStringField;
    sdsCDVERIFICADORCHAVE: TStringField;
    sdsQTCTE: TIntegerField;
    sdsQTNFE: TIntegerField;
    sdsVLCARGA: TFMTBCDField;
    sdsNURNTRC: TStringField;
    sdsCDCIOT: TStringField;
    sdsNMSTMDFE: TStringField;
    sdsQTCARGA: TFloatField;
    sdsNULOTE: TIntegerField;
    sdsNUPROTOCOLOAUTORIZACAO: TStringField;
    sdsDSXML: TBlobField;
    sdsTSPROTOCOLOAUTORIZACAO: TSQLTimeStampField;
    sdsNUCHAVENFE: TStringField;
    sdsNURECIBONFE: TStringField;
    sdsDSCANCELAMENTO: TBlobField;
    sdsNUPROTOCOLOCANCELAMENTO: TStringField;
    sdsDSXMLCANCEL: TBlobField;
    sdsNUSEQEVENTO: TIntegerField;
    sdsNUPROTOCOLOENCERRAMENTO: TStringField;
    sdsDSXMLENCERRAMENTO: TBlobField;
    sdsDTENCERRAMENTO: TDateField;
    sdsCDEMPRESA: TLargeintField;
    sdsDSOBSERVACAO: TBlobField;
    sdsTPTRANSP: TStringField;
    sdsCDFORNECEDOR: TLargeintField;
    sdsCDMDFERESPSEG: TIntegerField;
    sdsNAPOL: TStringField;
    sdsNAVER: TStringField;
    sdsNUCNPJCPF: TStringField;
    sdsNMFORNECEDOR: TStringField;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    cdsCDMDFE: TIntegerField;
    cdsCDUSUARIOI: TIntegerField;
    cdsCDUSUARIOA: TIntegerField;
    cdsCDCOMPUTADORI: TIntegerField;
    cdsCDCOMPUTADORA: TIntegerField;
    cdsCDSERIE: TIntegerField;
    cdsCDUF: TIntegerField;
    cdsCDMDFETPEMITENTE: TIntegerField;
    cdsCDMDFEMODALIDADE: TIntegerField;
    cdsCDMDFEFORMAEMISSAO: TIntegerField;
    cdsCDUFINICIO: TIntegerField;
    cdsCDUFFIM: TIntegerField;
    cdsCDUNIDADE: TIntegerField;
    cdsCDVEICULO: TIntegerField;
    cdsCDTPMDFE: TIntegerField;
    cdsCDSTMDFE: TIntegerField;
    cdsTSINCLUSAO: TSQLTimeStampField;
    cdsTSALTERACAO: TSQLTimeStampField;
    cdsNUMDFE: TIntegerField;
    cdsDTEMISSAO: TDateField;
    cdsHREMISSAO: TTimeField;
    cdsNUCHAVE: TStringField;
    cdsCDVERIFICADORCHAVE: TStringField;
    cdsQTCTE: TIntegerField;
    cdsQTNFE: TIntegerField;
    cdsVLCARGA: TFMTBCDField;
    cdsNURNTRC: TStringField;
    cdsCDCIOT: TStringField;
    cdssdsmdfeufpercurso: TDataSetField;
    cdssdsmdfeveiculo: TDataSetField;
    cdssdsmdfepedagio: TDataSetField;
    cdssdsmdfetransportadora: TDataSetField;
    cdssdsmdfelacre: TDataSetField;
    cdsNMSTMDFE: TStringField;
    cdssdsmdfedescarregamento: TDataSetField;
    cdssdsmdfecarregamento: TDataSetField;
    cdsQTCARGA: TFloatField;
    cdsNULOTE: TIntegerField;
    cdsNUPROTOCOLOAUTORIZACAO: TStringField;
    cdsDSXML: TBlobField;
    cdsTSPROTOCOLOAUTORIZACAO: TSQLTimeStampField;
    cdsNUCHAVENFE: TStringField;
    cdsNURECIBONFE: TStringField;
    cdsDSCANCELAMENTO: TBlobField;
    cdsNUPROTOCOLOCANCELAMENTO: TStringField;
    cdsDSXMLCANCEL: TBlobField;
    cdsNUSEQEVENTO: TIntegerField;
    cdsNUPROTOCOLOENCERRAMENTO: TStringField;
    cdsDSXMLENCERRAMENTO: TBlobField;
    cdsDTENCERRAMENTO: TDateField;
    cdsCDEMPRESA: TLargeintField;
    cdsDSOBSERVACAO: TBlobField;
    cdsTPTRANSP: TStringField;
    cdsCDFORNECEDOR: TLargeintField;
    cdsCDMDFERESPSEG: TIntegerField;
    cdsNAPOL: TStringField;
    cdsNAVER: TStringField;
    cdsNUCNPJCPF: TStringField;
    cdsNMFORNECEDOR: TStringField;
    dts: TDataSource;
    dts1: TDataSource;
    dtsmdfeufpercurso: TDataSource;
    cdsmdfeufpercurso: TClientDataSet;
    cdsmdfeufpercursoCDMDFE: TIntegerField;
    cdsmdfeufpercursoCDUF: TIntegerField;
    cdsmdfeufpercursoCDUSUARIOI: TIntegerField;
    cdsmdfeufpercursoCDUSUARIOA: TIntegerField;
    cdsmdfeufpercursoCDCOMPUTADORI: TIntegerField;
    cdsmdfeufpercursoCDCOMPUTADORA: TIntegerField;
    cdsmdfeufpercursoTSINCLUSAO: TSQLTimeStampField;
    cdsmdfeufpercursoTSALTERACAO: TSQLTimeStampField;
    cdsmdfeufpercursoCDEMPRESA: TLargeintField;
    sdsmdfeufpercurso: TSQLDataSet;
    sdsmdfeufpercursoCDMDFE: TIntegerField;
    sdsmdfeufpercursoCDUF: TIntegerField;
    sdsmdfeufpercursoCDUSUARIOI: TIntegerField;
    sdsmdfeufpercursoCDUSUARIOA: TIntegerField;
    sdsmdfeufpercursoCDCOMPUTADORI: TIntegerField;
    sdsmdfeufpercursoCDCOMPUTADORA: TIntegerField;
    sdsmdfeufpercursoTSINCLUSAO: TSQLTimeStampField;
    sdsmdfeufpercursoTSALTERACAO: TSQLTimeStampField;
    sdsmdfeufpercursoCDEMPRESA: TLargeintField;
    sdsmdfeveiculo: TSQLDataSet;
    sdsmdfeveiculoCDMDFE: TIntegerField;
    sdsmdfeveiculoCDVEICULO: TIntegerField;
    sdsmdfeveiculoCDUSUARIOI: TIntegerField;
    sdsmdfeveiculoCDUSUARIOA: TIntegerField;
    sdsmdfeveiculoCDCOMPUTADORI: TIntegerField;
    sdsmdfeveiculoCDCOMPUTADORA: TIntegerField;
    sdsmdfeveiculoTSINCLUSAO: TSQLTimeStampField;
    sdsmdfeveiculoTSALTERACAO: TSQLTimeStampField;
    sdsmdfeveiculoNUPLACA: TStringField;
    sdsmdfeveiculoCDEMPRESA: TLargeintField;
    sdsmdfepedagio: TSQLDataSet;
    sdsmdfepedagioCDMDFEPEDAGIO: TIntegerField;
    sdsmdfepedagioCDMDFE: TIntegerField;
    sdsmdfepedagioCDUSUARIOI: TIntegerField;
    sdsmdfepedagioCDUSUARIOA: TIntegerField;
    sdsmdfepedagioCDCOMPUTADORI: TIntegerField;
    sdsmdfepedagioCDCOMPUTADORA: TIntegerField;
    sdsmdfepedagioTSINCLUSAO: TSQLTimeStampField;
    sdsmdfepedagioTSALTERACAO: TSQLTimeStampField;
    sdsmdfepedagioNUCOMPROVANTE: TStringField;
    sdsmdfepedagioNMFORNECEDOR: TStringField;
    sdsmdfepedagioNMRESPONSAVEL: TStringField;
    sdsmdfepedagioCDEMPRESA: TLargeintField;
    sdsmdfepedagioCDFORNECEDOR: TLargeintField;
    sdsmdfepedagioCDRESPONSAVEL: TLargeintField;
    sdsmdfepedagioVVALEPED: TFMTBCDField;
    cdsmdfeveiculo: TClientDataSet;
    cdsmdfeveiculoCDMDFE: TIntegerField;
    cdsmdfeveiculoCDVEICULO: TIntegerField;
    cdsmdfeveiculoCDUSUARIOI: TIntegerField;
    cdsmdfeveiculoCDUSUARIOA: TIntegerField;
    cdsmdfeveiculoCDCOMPUTADORI: TIntegerField;
    cdsmdfeveiculoCDCOMPUTADORA: TIntegerField;
    cdsmdfeveiculoTSINCLUSAO: TSQLTimeStampField;
    cdsmdfeveiculoTSALTERACAO: TSQLTimeStampField;
    cdsmdfeveiculoNUPLACA: TStringField;
    cdsmdfeveiculoCDEMPRESA: TLargeintField;
    dtsmdfeveiculo: TDataSource;
    dtsmdfepedagio: TDataSource;
    cdsmdfepedagio: TClientDataSet;
    cdsmdfepedagioCDMDFEPEDAGIO: TIntegerField;
    cdsmdfepedagioCDMDFE: TIntegerField;
    cdsmdfepedagioCDUSUARIOI: TIntegerField;
    cdsmdfepedagioCDUSUARIOA: TIntegerField;
    cdsmdfepedagioCDCOMPUTADORI: TIntegerField;
    cdsmdfepedagioCDCOMPUTADORA: TIntegerField;
    cdsmdfepedagioTSINCLUSAO: TSQLTimeStampField;
    cdsmdfepedagioTSALTERACAO: TSQLTimeStampField;
    cdsmdfepedagioNUCOMPROVANTE: TStringField;
    cdsmdfepedagioNMFORNECEDOR: TStringField;
    cdsmdfepedagioNMRESPONSAVEL: TStringField;
    cdsmdfepedagioCDEMPRESA: TLargeintField;
    cdsmdfepedagioCDFORNECEDOR: TLargeintField;
    cdsmdfepedagioCDRESPONSAVEL: TLargeintField;
    cdsmdfepedagioVVALEPED: TFMTBCDField;
    sdsmdfelacre: TSQLDataSet;
    sdsmdfelacreCDMDFELACRE: TIntegerField;
    sdsmdfelacreCDMDFE: TIntegerField;
    sdsmdfelacreCDUSUARIOI: TIntegerField;
    sdsmdfelacreCDUSUARIOA: TIntegerField;
    sdsmdfelacreCDCOMPUTADORI: TIntegerField;
    sdsmdfelacreCDCOMPUTADORA: TIntegerField;
    sdsmdfelacreTSINCLUSAO: TSQLTimeStampField;
    sdsmdfelacreTSALTERACAO: TSQLTimeStampField;
    sdsmdfelacreNULACRE: TStringField;
    sdsmdfelacreCDEMPRESA: TLargeintField;
    cdsmdfelacre: TClientDataSet;
    cdsmdfelacreCDMDFELACRE: TIntegerField;
    cdsmdfelacreCDMDFE: TIntegerField;
    cdsmdfelacreCDUSUARIOI: TIntegerField;
    cdsmdfelacreCDUSUARIOA: TIntegerField;
    cdsmdfelacreCDCOMPUTADORI: TIntegerField;
    cdsmdfelacreCDCOMPUTADORA: TIntegerField;
    cdsmdfelacreTSINCLUSAO: TSQLTimeStampField;
    cdsmdfelacreTSALTERACAO: TSQLTimeStampField;
    cdsmdfelacreNULACRE: TStringField;
    cdsmdfelacreCDEMPRESA: TLargeintField;
    dtsmdfelacre: TDataSource;
    dtsmdfetransportadora: TDataSource;
    cdsmdfetransportadora: TClientDataSet;
    cdsmdfetransportadoraCDMDFE: TIntegerField;
    cdsmdfetransportadoraCDUSUARIOI: TIntegerField;
    cdsmdfetransportadoraCDUSUARIOA: TIntegerField;
    cdsmdfetransportadoraCDCOMPUTADORI: TIntegerField;
    cdsmdfetransportadoraCDCOMPUTADORA: TIntegerField;
    cdsmdfetransportadoraTSINCLUSAO: TSQLTimeStampField;
    cdsmdfetransportadoraTSALTERACAO: TSQLTimeStampField;
    cdsmdfetransportadoraNMTRANSPORTADORA: TStringField;
    cdsmdfetransportadoraNUCPF: TStringField;
    cdsmdfetransportadoraCDEMPRESA: TLargeintField;
    cdsmdfetransportadoraCDTRANSPORTADORA: TLargeintField;
    sdsmdfetransportadora: TSQLDataSet;
    sdsmdfetransportadoraCDMDFE: TIntegerField;
    sdsmdfetransportadoraCDUSUARIOI: TIntegerField;
    sdsmdfetransportadoraCDUSUARIOA: TIntegerField;
    sdsmdfetransportadoraCDCOMPUTADORI: TIntegerField;
    sdsmdfetransportadoraCDCOMPUTADORA: TIntegerField;
    sdsmdfetransportadoraTSINCLUSAO: TSQLTimeStampField;
    sdsmdfetransportadoraTSALTERACAO: TSQLTimeStampField;
    sdsmdfetransportadoraNMTRANSPORTADORA: TStringField;
    sdsmdfetransportadoraNUCPF: TStringField;
    sdsmdfetransportadoraCDEMPRESA: TLargeintField;
    sdsmdfetransportadoraCDTRANSPORTADORA: TLargeintField;
    sdsmdfecarregamento: TSQLDataSet;
    sdsmdfecarregamentoCDMDFE: TIntegerField;
    sdsmdfecarregamentoCDMUNICIPIO: TIntegerField;
    sdsmdfecarregamentoCDUSUARIOI: TIntegerField;
    sdsmdfecarregamentoCDUSUARIOA: TIntegerField;
    sdsmdfecarregamentoCDCOMPUTADORI: TIntegerField;
    sdsmdfecarregamentoCDCOMPUTADORA: TIntegerField;
    sdsmdfecarregamentoTSINCLUSAO: TSQLTimeStampField;
    sdsmdfecarregamentoTSALTERACAO: TSQLTimeStampField;
    sdsmdfecarregamentoCDEMPRESA: TLargeintField;
    cdsmdfecarregamento: TClientDataSet;
    cdsmdfecarregamentoCDMDFE: TIntegerField;
    cdsmdfecarregamentoCDMUNICIPIO: TIntegerField;
    cdsmdfecarregamentoCDUSUARIOA: TIntegerField;
    cdsmdfecarregamentoCDUSUARIOI: TIntegerField;
    cdsmdfecarregamentoCDCOMPUTADORI: TIntegerField;
    cdsmdfecarregamentoCDCOMPUTADORA: TIntegerField;
    cdsmdfecarregamentoTSINCLUSAO: TSQLTimeStampField;
    cdsmdfecarregamentoTSALTERACAO: TSQLTimeStampField;
    cdsmdfecarregamentoCDEMPRESA: TLargeintField;
    dtsmdfecarregamento: TDataSource;
    dtsmdfedescarregamento: TDataSource;
    dts4: TDataSource;
    dtsmdfecte: TDataSource;
    dtsmdfenfe: TDataSource;
    cdsmdfenfe: TClientDataSet;
    cdsmdfenfeCDMDFE: TIntegerField;
    cdsmdfenfeCDMUNICIPIO: TIntegerField;
    cdsmdfenfeCDUSUARIOI: TIntegerField;
    cdsmdfenfeCDUSUARIOA: TIntegerField;
    cdsmdfenfeCDCOMPUTADORI: TIntegerField;
    cdsmdfenfeCDCOMPUTADORA: TIntegerField;
    cdsmdfenfeTSINCLUSAO: TSQLTimeStampField;
    cdsmdfenfeTSALTERACAO: TSQLTimeStampField;
    cdsmdfenfeNUCHAVENFE: TStringField;
    cdsmdfenfeCDMDFENFE: TIntegerField;
    cdsmdfenfeCDEMPRESA: TLargeintField;
    cdsmdfenfeINDREENTREGA: TStringField;
    cdsmdfecte: TClientDataSet;
    cdsmdfecteCDMDFE: TIntegerField;
    cdsmdfecteCDMUNICIPIO: TIntegerField;
    cdsmdfecteCDCTE: TIntegerField;
    cdsmdfecteCDUSUARIOI: TIntegerField;
    cdsmdfecteCDUSUARIOA: TIntegerField;
    cdsmdfecteCDCOMPUTADORI: TIntegerField;
    cdsmdfecteCDCOMPUTADORA: TIntegerField;
    cdsmdfecteTSINCLUSAO: TSQLTimeStampField;
    cdsmdfecteTSALTERACAO: TSQLTimeStampField;
    cdsmdfecteDTEMISSAO: TDateField;
    cdsmdfecteVLCARGA: TFMTBCDField;
    cdsmdfecteNUCHAVENFE: TStringField;
    cdsmdfecteQTCARGA: TFloatField;
    cdsmdfecteCDEMPRESA: TLargeintField;
    cdsmdfecteINDREENTREGA: TStringField;
    cdsmdfedescarregamento: TClientDataSet;
    cdsmdfedescarregamentoCDMDFE: TIntegerField;
    cdsmdfedescarregamentoCDMUNICIPIO: TIntegerField;
    cdsmdfedescarregamentoCDUSUARIOI: TIntegerField;
    cdsmdfedescarregamentoCDUSUARIOA: TIntegerField;
    cdsmdfedescarregamentoCDCOMPUTADORI: TIntegerField;
    cdsmdfedescarregamentoCDCOMPUTADORA: TIntegerField;
    cdsmdfedescarregamentoTSINCLUSAO: TSQLTimeStampField;
    cdsmdfedescarregamentoTSALTERACAO: TSQLTimeStampField;
    cdsmdfedescarregamentosdsmdfenfe: TDataSetField;
    cdsmdfedescarregamentosdsmdfecte: TDataSetField;
    cdsmdfedescarregamentoQTCTE: TIntegerField;
    cdsmdfedescarregamentoQTNFE: TIntegerField;
    cdsmdfedescarregamentoVLCARGA: TFMTBCDField;
    cdsmdfedescarregamentoQTCARGA: TFloatField;
    cdsmdfedescarregamentoCDEMPRESA: TLargeintField;
    sdsmdfedescarregamento: TSQLDataSet;
    sdsmdfedescarregamentoCDMDFE: TIntegerField;
    sdsmdfedescarregamentoCDMUNICIPIO: TIntegerField;
    sdsmdfedescarregamentoCDUSUARIOI: TIntegerField;
    sdsmdfedescarregamentoCDUSUARIOA: TIntegerField;
    sdsmdfedescarregamentoCDCOMPUTADORI: TIntegerField;
    sdsmdfedescarregamentoCDCOMPUTADORA: TIntegerField;
    sdsmdfedescarregamentoTSINCLUSAO: TSQLTimeStampField;
    sdsmdfedescarregamentoTSALTERACAO: TSQLTimeStampField;
    sdsmdfedescarregamentoQTCTE: TIntegerField;
    sdsmdfedescarregamentoQTNFE: TIntegerField;
    sdsmdfedescarregamentoVLCARGA: TFMTBCDField;
    sdsmdfedescarregamentoQTCARGA: TFloatField;
    sdsmdfedescarregamentoCDEMPRESA: TLargeintField;
    sdsmdfecte: TSQLDataSet;
    sdsmdfecteCDMDFE: TIntegerField;
    sdsmdfecteCDMUNICIPIO: TIntegerField;
    sdsmdfecteCDCTE: TIntegerField;
    sdsmdfecteCDUSUARIOI: TIntegerField;
    sdsmdfecteCDUSUARIOA: TIntegerField;
    sdsmdfecteCDCOMPUTADORI: TIntegerField;
    sdsmdfecteCDCOMPUTADORA: TIntegerField;
    sdsmdfecteTSINCLUSAO: TSQLTimeStampField;
    sdsmdfecteTSALTERACAO: TSQLTimeStampField;
    sdsmdfecteDTEMISSAO: TDateField;
    sdsmdfecteVLCARGA: TFMTBCDField;
    sdsmdfecteNUCHAVENFE: TStringField;
    sdsmdfecteQTCARGA: TFloatField;
    sdsmdfecteCDEMPRESA: TLargeintField;
    sdsmdfecteINDREENTREGA: TStringField;
    sdsmdfenfe: TSQLDataSet;
    sdsmdfenfeCDMDFE: TIntegerField;
    sdsmdfenfeCDMUNICIPIO: TIntegerField;
    sdsmdfenfeCDUSUARIOI: TIntegerField;
    sdsmdfenfeCDUSUARIOA: TIntegerField;
    sdsmdfenfeCDCOMPUTADORI: TIntegerField;
    sdsmdfenfeCDCOMPUTADORA: TIntegerField;
    sdsmdfenfeTSINCLUSAO: TSQLTimeStampField;
    sdsmdfenfeTSALTERACAO: TSQLTimeStampField;
    sdsmdfenfeNUCHAVENFE: TStringField;
    sdsmdfenfeCDMDFENFE: TIntegerField;
    sdsmdfenfeCDEMPRESA: TLargeintField;
    sdsmdfenfeINDREENTREGA: TStringField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure dtsStateChange(Sender: TObject);
    procedure cdsCDTPMDFEValidate(Sender: TField);
    procedure cdsmdfedescarregamentoNewRecord(DataSet: TDataSet);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsmdfeufpercursoBeforePost(DataSet: TDataSet);
    procedure cdsmdfeveiculoBeforePost(DataSet: TDataSet);
    procedure cdsmdfepedagioBeforePost(DataSet: TDataSet);
    procedure cdsmdfelacreBeforePost(DataSet: TDataSet);
    procedure cdsmdfetransportadoraBeforePost(DataSet: TDataSet);
    procedure cdsmdfecarregamentoBeforePost(DataSet: TDataSet);
    procedure cdsmdfedescarregamentoBeforePost(DataSet: TDataSet);
    procedure cdsmdfecteBeforePost(DataSet: TDataSet);
    procedure cdsmdfenfeBeforePost(DataSet: TDataSet);
    procedure cdsCDFORNECEDORValidate(Sender: TField);
    procedure cdsCDMDFETPEMITENTEValidate(Sender: TField);
    procedure cdsCDSTMDFEValidate(Sender: TField);
    procedure cdsCDUFINICIOValidate(Sender: TField);
    procedure cdsCDUFFIMValidate(Sender: TField);
    procedure cdsmdfecteAfterPost(DataSet: TDataSet);
    procedure cdsmdfenfeAfterPost(DataSet: TDataSet);
    procedure cdsmdfecteCDCTEValidate(Sender: TField);
    procedure cdsmdfedescarregamentoAfterPost(DataSet: TDataSet);
    procedure cdsmdfepedagioCDFORNECEDORValidate(Sender: TField);
    procedure cdsmdfepedagioCDRESPONSAVELValidate(Sender: TField);
    procedure cdsmdfetransportadoraCDTRANSPORTADORAValidate(Sender: TField);
    procedure cdsmdfeveiculoCDVEICULOValidate(Sender: TField);
    procedure cdsAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private { Private declarations }
  public { Public declarations }
    exibe : string;
    codigoinsercao : string;
    codigooriginal : string;
    cdserieoriginal : Integer;
    mdfe            : TMDFE;
    registro        : TRegistro;
    procedure setrecord(cdtpmdfe: integer);
  end;

var
  dmMdfe: TdmMdfe;

implementation

uses
  umdfe;

{$R *.dfm}

procedure TdmMdfe.cdsAfterScroll(DataSet: TDataSet);
begin
  mdfe.Select(cds);
  mdfe.mdfecarregamento.Ler(cdsmdfecarregamento);
  mdfe.mdfeufpercurso.Ler(cdsmdfeufpercurso);
  mdfe.mdfelacre.Ler(cdsmdfelacre);
  mdfe.mdfetransportadora.Ler(cdsmdfetransportadora);
  mdfe.mdfeveiculo.Ler(cdsmdfeveiculo);
  mdfe.mdfepedagio.Ler(cdsmdfepedagio);
  mdfe.mdfedescarregamento.Ler(cdsmdfedescarregamento, cdsmdfecte, cdsmdfenfe);

  frmmdfe.tbsnfe.TabVisible := cdsCDMDFETPEMITENTE.AsString = _2;
  frmmdfe.ACBrMDFe1.Manifestos.Clear;
  //registro.setStatus(_mdfe, cds);
  frmmdfe.actvalidar.Enabled      := mdfe.cdstmdfe in [1, 99];
  frmmdfe.actenviar.Enabled       := mdfe.cdstmdfe in [1, 99];
  frmmdfe.actcancelarmdfe.Enabled := mdfe.cdstmdfe = 2;
  frmmdfe.actencerrar.Enabled     := mdfe.cdstmdfe = 2;
  frmmdfe.actimportarxml.Enabled  := mdfe.cdstmdfe in [1, 99];
  frmmdfe.pnl.Caption             := exibe + ' ' + cdsnumdfe.asstring;
  if cdsnumdfe.asstring <> '' then
  begin
    frmmdfe.pnl.Caption := frmmdfe.pnl.caption + ' (' +nomedocodigo(_st+_mdfe, cdsCDSTMDFE.asstring)+')';
    if cdsnuchavenfe.asstring <> '' then
    begin
      frmmdfe.pnl.caption := frmmdfe.pnl.Caption + ' - Chave '+ qrotinas.getchave(cdsnuchavenfe.asstring);
    end;
  end;
  if not cdscdserie.IsNull then
  begin
    frmmdfe.pnl.Caption := frmmdfe.pnl.Caption + ' Série '+NomedoCodigo(_serie, cdscdserie.asstring);
  end;
end;

procedure TdmMdfe.cdsBeforePost(DataSet: TDataSet);
begin
  if frmmdfe.cbxcduf.Text = '' then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_uf]), mtInformation, [mbOK], 0);
    frmmdfe.cbxcduf.SetFocus;
    Abort;
  end;
  registro.set_update(cds);
end;

procedure TdmMdfe.cdsCDFORNECEDORValidate(Sender: TField);
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.create;
  try
    if not fornecedor.select(sender.AsLargeInt) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    fornecedor.stfornecedor.select(fornecedor.cdstfornecedor);
    if fornecedor.stfornecedor.bogerarinfo <> _S then
    begin
      messagedlg('Fornecedor está no status '+fornecedor.stfornecedor.nmstfornecedor+#13+
                  'que não permite ser inserido no '+Exibe+'.'#13+
                  'Escolha outro código para prosseguir.', mtinformation, [mbok], 0);
      sender.FocusControl;
      abort;
    end;
    cdsNMFORNECEDOR.AsString := fornecedor.nmfornecedor;
    frmmdfe.txtnmfornecedor.Hint     := fornecedor.hint_rzsocial;
  finally
    FreeAndNil(fornecedor);
  end;
end;

procedure TdmMdfe.cdsCDMDFETPEMITENTEValidate(Sender: TField);
begin
  frmmdfe.tbsnfe.TabVisible := Sender.AsString = _2;
end;

procedure TdmMdfe.cdsCDSTMDFEValidate(Sender: TField);
begin
  cdsNMSTMDFE.AsString := NomedoCodigo(_st+_mdfe, sender.AsString);
end;

procedure TdmMdfe.cdsCDTPMDFEValidate(Sender: TField);
begin
  if sender.AsString = '' then
  begin
    Exit;
  end;
  setrecord(Sender.AsInteger);
  if not qregistro.BooleandoCodigo(_serie, mdfe.tpmdfe.cdserie, _boativar) then
  begin
    MessageDlg('Série '+qregistro.NomedoCodigo(_serie, mdfe.tpmdfe.cdserie)+' desativada.', mtInformation, [mbOK], 0);
    Sender.FocusControl;
    Abort;
  end;
  if (cdscdserie.asstring <> '') and (cdscdserie.asinteger <> mdfe.tpmdfe.cdserie) then
  begin
    tserie.voltar_Numero_serie(cdsnumdfe.AsInteger-1, cdscdserie.asInteger);
    codigoinsercao := '';
  end;
  if codigoinsercao = '' then
  begin
    repeat
      if (codigoinsercao <> '') and (codigoinsercao = codigooriginal) and (mdfe.tpmdfe.cdserie=cdserieoriginal) then
      begin
        Break;
      end;
      codigoinsercao := inttostr(qgerar.GerarCodigo(_serie, IntToStr(mdfe.tpmdfe.cdserie), 0, _mdfe));
    until (mdfe.CodigoMDFE(codigoinsercao, '') = 0);
  end;
  cdsnumdfe.asstring     := codigoinsercao;
  frmmdfe.edtcodigo.text := codigoinsercao;
  frmmdfe.pnl.Caption    := exibe + ' ' + cdsnumdfe.asstring;
  if mdfe.tpmdfe.cdserie = 0 then
  begin
    MessageDlg('Série não está definida no tipo de MDFE.', mtInformation, [mbOK], 0);
    Sender.FocusControl;
    Abort;
  end;
  cdscdserie.AsInteger  := mdfe.tpmdfe.cdserie;
  if mdfe.tpmdfe.cdunidade <> 0 then
  begin
    cdsCDUNIDADE.AsInteger := mdfe.tpmdfe.cdunidade;
  end;
  if mdfe.tpmdfe.cdmdfetpemitente <> 0 then
  begin
    cdsCDMDFETPEMITENTE.AsInteger := mdfe.tpmdfe.cdmdfetpemitente;
  end;
  if mdfe.tpmdfe.cdmdfemodalidade <> 0 then
  begin
    cdsCDMDFEMODALIDADE.AsInteger := mdfe.tpmdfe.cdmdfemodalidade;
  end;
  if mdfe.tpmdfe.cdmdfeformaemissao <> 0 then
  begin
    cdsCDMDFEFORMAEMISSAO.AsInteger := mdfe.tpmdfe.cdmdfeformaemissao;
  end;
  if mdfe.tpmdfe.cduf <> 0 then
  begin
    cdsCDUF.AsInteger := mdfe.tpmdfe.cduf;
  end;
  if mdfe.tpmdfe.cdveiculo <> 0 then
  begin
    cdsCDVEICULO.AsInteger := mdfe.tpmdfe.cdveiculo;
  end;
end;

procedure TdmMdfe.cdsCDUFFIMValidate(Sender: TField);
begin
  cdsmdfedescarregamento.First;
  while not cdsmdfedescarregamento.Eof do
  begin
    cdsmdfedescarregamento.Delete;
  end;
end;

procedure TdmMdfe.cdsCDUFINICIOValidate(Sender: TField);
begin
  cdsmdfecarregamento.First;
  while not cdsmdfecarregamento.Eof do
  begin
    cdsmdfecarregamento.Delete;
  end;
end;

procedure TdmMdfe.cdsmdfecarregamentoBeforePost(DataSet: TDataSet);
begin
  if cdsmdfecarregamento.RecordCount = empresa.faturamento.mdfe.qtcarregamento then
  begin
    MessageDlg('Quantidade de carregamento não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtcarregamento)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfecarregamento);
end;

procedure TdmMdfe.cdsmdfecteAfterPost(DataSet: TDataSet);
begin
  cdsmdfedescarregamentoQTCTE.AsInteger    := cdsmdfecte.RecordCount;
  cdsmdfedescarregamentoVLCARGA.AsCurrency := cdsmdfecte.Aggregates[0].Value;
  cdsmdfedescarregamentoQTCARGA.AsCurrency := cdsmdfecte.Aggregates[1].Value;
  cdsmdfedescarregamento.Post;
end;

procedure TdmMdfe.cdsmdfecteBeforePost(DataSet: TDataSet);
begin
  if cdsmdfecte.RecordCount = empresa.faturamento.mdfe.qtcte then
  begin
    MessageDlg('Quantidade de CTE´s não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtcte)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfecte);
end;

procedure TdmMdfe.cdsmdfecteCDCTEValidate(Sender: TField);
var
  cte : TCte;
  procedure Adicionar_transportadora;
  var
    i : Integer;
  begin
    for i := 0 to cte.ctetransportadora.count - 1 do
    begin
      if not cdsmdfetransportadora.Locate(_cdtransportadora, cte.ctetransportadora.Items[i].cdtransportadora, []) then
      begin
        cdsmdfetransportadora.Insert;
        cdsmdfetransportadora.FieldByName(_CDTRANSPORTADORA).AsLargeInt := cte.ctetransportadora.Items[i].cdtransportadora;
        cdsmdfetransportadora.Post;
      end;
    end;
  end;
  procedure Adicionar_reboque;
  var
    i : Integer;
  begin
    for i := 0 to cte.ctetransportadora.Count - 1 do
    begin
      if cdsCDVEICULO.AsString = '' then
      begin
        cdsCDVEICULO.AsInteger := cte.ctetransportadora.Items[i].cdveiculo;
      end;
      if cdsCDVEICULO.AsInteger <> cte.ctetransportadora.Items[i].cdveiculo then
      begin
        MessageDlg('O veículo do CTE não é o mesmo do MDFE.', mtInformation, [mbOK], 0);
        sender.FocusControl;
        abort;
      end;
      if (cte.ctetransportadora.Items[i].cdveiculocarreta <> 0) and (not cdsmdfeveiculo.Locate(_cdveiculo, cte.ctetransportadora.Items[i].cdveiculocarreta, [])) then
      begin
        cdsmdfeveiculo.Insert;
        cdsmdfeveiculoCDVEICULO.AsInteger := cte.ctetransportadora.Items[i].cdveiculocarreta;
        cdsmdfeveiculo.Post;
      end;
      if (cte.ctetransportadora.Items[i].cdveiculocarreta2 <> 0) and (not cdsmdfeveiculo.Locate(_cdveiculo, cte.ctetransportadora.Items[i].cdveiculocarreta2, [])) then
      begin
        cdsmdfeveiculo.Insert;
        cdsmdfeveiculoCDVEICULO.AsInteger := cte.ctetransportadora.Items[i].cdveiculocarreta2;
        cdsmdfeveiculo.Post;
      end;
    end;
  end;
  procedure adicionar_municipio_carregamento;
  begin
    if not cdsmdfecarregamento.Locate(_cdmunicipio, cte.cdmunicipioinicio, []) then
    begin
      cdsmdfecarregamento.Insert;
      cdsmdfecarregamentoCDMUNICIPIO.AsInteger := cte.cdmunicipioinicio;
      cdsmdfecarregamento.Post;
    end;
  end;
begin
  if sender.AsString = '' then
  begin
    Exit;
  end;
  cte := TCte.create;
  try
    cte.Select(sender.AsInteger);
    cte.cteremetentenota.Ler(cte.cdcte);
    cte.ctetransportadora.Ler(cte.cdcte);
    cte.cteqtdcarga.Ler(cte.cdcte);
    if cte.cdcte = 0 then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_cte)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    if cte.cduftermino <> cdsCDUFFIM.AsInteger then
    begin
      MessageDlg('UF de término do CTE ('+qregistro.StringdoCodigo(_uf, cte.cduftermino, _sguf)+')'#13+
                 'diferente da UF do descarregamento ('+frmmdfe.cbxcduffim.Text+').', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    if cte.cdmunicipiotermino <> cdsmdfedescarregamentoCDMUNICIPIO.AsInteger then
    begin
      MessageDlg('Munícipio do CTE ('+qregistro.NomedoCodigo(_municipio, cte.cdmunicipiotermino)+')'#13'diferente do munícipio do descarregamento.', mtInformation, [mbOK], 0);
      Sender.FocusControl;
      Abort;
    end;
    if cdsCDUFINICIO.AsString = '' then
    begin
      cdsCDUFINICIO.AsInteger := cte.cdufinicio;
    end;
    adicionar_reboque;
    cdsmdfecteDTEMISSAO.AsDateTime := cte.dtemissao;
    cdsmdfecteVLCARGA.AsCurrency   := cte.vlmercadoria;
    cdsmdfecteQTCARGA.AsCurrency   := cte.getQtdcarga;
    cdsmdfectenuchavenfe.asstring  := cte.nuchavenfe;
    //adicionar_nfe;
    adicionar_transportadora;
    adicionar_municipio_carregamento;
  finally
    freeandnil(cte);
  end;
end;

procedure TdmMdfe.cdsmdfedescarregamentoAfterPost(DataSet: TDataSet);
begin
  cdsQTCTE.AsInteger    := cdsmdfedescarregamento.Aggregates[0].Value;
  cdsQTNFE.AsInteger    := cdsmdfedescarregamento.Aggregates[1].Value;
  cdsVLCARGA.AsCurrency := cdsmdfedescarregamento.Aggregates[2].Value;
  cdsQTCARGA.AsCurrency := cdsmdfedescarregamento.Aggregates[3].Value;
end;

procedure TdmMdfe.cdsmdfedescarregamentoBeforePost(DataSet: TDataSet);
begin
  if cdsmdfedescarregamento.RecordCount = empresa.faturamento.mdfe.qtdescarregamento then
  begin
    MessageDlg('Quantidade de descarregamento não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtdescarregamento)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfedescarregamento);
end;

procedure TdmMdfe.cdsmdfedescarregamentoNewRecord(DataSet: TDataSet);
begin
  if frmmdfe.cbxcduffim.Text = '' then
  begin
    MessageDlg('UF de Descarregamento não está preenchido.', mtInformation, [mbOK], 0);
    frmmdfe.cbxcduffim.SetFocus;
    abort;
  end;
  cdsmdfedescarregamentoQTCTE.AsInteger    := 0;
  cdsmdfedescarregamentoQTNFE.AsInteger    := 0;
  cdsmdfedescarregamentoVLCARGA.AsCurrency := 0;
  cdsmdfedescarregamentoQTCARGA.AsCurrency := 0;
end;

procedure TdmMdfe.cdsmdfelacreBeforePost(DataSet: TDataSet);
begin
  if cdsmdfelacreCDMDFELACRE.IsNull then
  begin
    cdsmdfelacreCDMDFELACRE.AsInteger := qgerar.GerarCodigo(_mdfe+_lacre);
  end;
  registro.set_update(cdsmdfelacre);
end;

procedure TdmMdfe.cdsmdfenfeAfterPost(DataSet: TDataSet);
begin
  cdsmdfedescarregamentoQTNFE.AsInteger := cdsmdfenfe.RecordCount;
end;

procedure TdmMdfe.cdsmdfenfeBeforePost(DataSet: TDataSet);
begin
  if cdsmdfenfe.RecordCount = empresa.faturamento.mdfe.qtnfe then
  begin
    MessageDlg('Quantidade de NFE´s não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtnfe)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if dataset.FieldByName(_cdmdfenfe).AsInteger = 0 then
  begin
    dataset.FieldByName(_cdmdfenfe).AsInteger := qgerar.GerarCodigo(_mdfenfe);
  end;
  registro.set_update(cdsmdfenfe);
end;

procedure TdmMdfe.cdsmdfepedagioBeforePost(DataSet: TDataSet);
begin
  if cdsmdfepedagio.FieldByName(_CDFORNECEDOR).IsNull then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [_Fornecedor]), mtInformation, [mbOK], 0);
    cdsmdfepedagio.FieldByName(_CDFORNECEDOR).FocusControl;
    Abort;
  end;
  if cdsmdfepedagioNUCOMPROVANTE.IsNull then
  begin
    MessageDlg(format(_msg_s_eh_um_campo_obrigatorio, [__numero+' '+_do+' '+_comprovante]), mtInformation, [mbOK], 0);
    cdsmdfepedagioNUCOMPROVANTE.FocusControl;
    Abort;
  end;
  if cdsmdfepedagioCDMDFEPEDAGIO.IsNull then
  begin
    cdsmdfepedagioCDMDFEPEDAGIO.AsInteger := qgerar.GerarCodigo(_mdfe+_pedagio);
  end;
  registro.set_update(cdsmdfepedagio);
end;

procedure TdmMdfe.cdsmdfepedagioCDFORNECEDORValidate(Sender: TField);
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.create;
  try
    if Sender.AsString = '' then
    begin
      cdsmdfepedagioNMFORNECEDOR.Clear;
      Exit;
    end;
    if not fornecedor.select(sender.AsLargeInt) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    if fornecedor.tppessoa <> _J then
    begin
      MessageDlg('Permitido somente fornecedor pessoa jurídica.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    cdsmdfepedagioNMFORNECEDOR.AsString := fornecedor.nmfornecedor;
  finally
    FreeAndNil(fornecedor);
  end;
end;

procedure TdmMdfe.cdsmdfepedagioCDRESPONSAVELValidate(Sender: TField);
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.create;
  try
    if Sender.AsString = '' then
    begin
      cdsmdfepedagioNMRESPONSAVEL.Clear;
      Exit;
    end;
    if not fornecedor.select(sender.AsLargeInt) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_fornecedor)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    if fornecedor.tppessoa <> _J then
    begin
      MessageDlg('Permitido somente fornecedor pessoa jurídica.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    cdsmdfepedagioNMRESPONSAVEL.AsString := fornecedor.nmfornecedor;
  finally
    FreeAndNil(fornecedor);
  end;
end;

procedure TdmMdfe.cdsmdfetransportadoraBeforePost(DataSet: TDataSet);
begin
  if cdsmdfetransportadora.RecordCount = empresa.faturamento.mdfe.qttransportadora then
  begin
    MessageDlg('Quantidade de condutores não pode mais do que '+inttostr(empresa.faturamento.mdfe.qttransportadora)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfetransportadora);
end;

procedure TdmMdfe.cdsmdfetransportadoraCDTRANSPORTADORAValidate(Sender: TField);
var
  transportadora : ttransportadora;
begin
  if Sender.AsString = '' then
  begin
    cdsmdfetransportadoraNMtransportadora.Clear;
    cdsmdfetransportadoraNUCPF.Clear;
    Exit;
  end;
  transportadora := ttransportadora.create;
  try
    if not transportadora.Select(sender.AsLargeInt) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(_transportadora)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    if transportadora.tppessoa = _j then
    begin
      MessageDlg('Transportadora deve ser pessoa física.', mtInformation, [mbOK], 0);
      Sender.FocusControl;
      Abort;
    end;
    if transportadora.nucpf = '' then
    begin
      MessageDlg('CPF não está preenchido no cadastro da transportadora.', mtInformation, [mbOK], 0);
      sender.FocusControl;
      Abort;
    end;
    cdsmdfetransportadoraNMtransportadora.AsString := transportadora.nmtransportadora;
    cdsmdfetransportadoraNUCPF.AsString := transportadora.nucpf;
  finally
    FreeAndNil(transportadora);
  end;
end;

procedure TdmMdfe.cdsmdfeufpercursoBeforePost(DataSet: TDataSet);
begin
  if cdsmdfeufpercurso.RecordCount = empresa.faturamento.mdfe.qtpercurso then
  begin
    MessageDlg('Quantidade de percurso não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtpercurso)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfeufpercurso);
end;

procedure TdmMdfe.cdsmdfeveiculoBeforePost(DataSet: TDataSet);
begin
  if cdsmdfeveiculo.RecordCount = empresa.faturamento.mdfe.qtreboque then
  begin
    MessageDlg('Quantidade de reboque não pode mais do que '+inttostr(empresa.faturamento.mdfe.qtreboque)+'.', mtInformation, [mbOK], 0);
    Abort;
  end;
  registro.set_update(cdsmdfeveiculo);
end;

procedure TdmMdfe.cdsmdfeveiculoCDVEICULOValidate(Sender: TField);
var
  veiculo : TVEiculo;
  transportadora : TTransportadora;
begin
  if Sender.AsString = '' then
  begin
    cdsmdfeveiculonuplaca.Clear;
    Exit;
  end;
  if Sender.AsString = cdsCDVEICULO.AsString then
  begin
    MessageDlg('Reboque não pode ser o mesmo veículo do MDFE.', mtinformation, [mbok], 0);
    Sender.FocusControl;
    Abort;
  end;
  veiculo := tveiculo.create;
  transportadora := TTransportadora.create;
  try
    if not veiculo.select(sender.AsInteger) then
    begin
      MessageDlg(Format(_msg_codigo_inexistente_na_tabela, [sender.AsString, qstring.maiuscula(__veiculo)]), mterror, [mbok], 0);
      Sender.FocusControl;
      Abort;
    end;
    transportadora.Select(veiculo.cdtransportadora);
    cdsmdfeveiculonuplaca.AsString := veiculo.nuplaca;
  finally
    FreeAndNil(veiculo);
    FreeAndNil(transportadora);
  end;
end;

procedure TdmMdfe.cdsNewRecord(DataSet: TDataSet);
begin
  codigoinsercao           := '';
  cdscdmdfe.AsInteger       := qgerar.GerarCodigo(_mdfe);
  frmmdfe.edtcodigo.Clear;
  cdsCDSTmdfe.AsInteger     := qregistro.Codigo_status_novo(_mdfe);
  cdsdtemissao.asdatetime  := DtBanco;
  cdsHREMISSAO.AsDateTime  := HrBanco;
  cdsQTCTE.AsInteger       := 0;
  cdsQTNFE.AsInteger       := 0;
  cdsQTCARGA.AsFloat       := 0;
  cdsVLCARGA.AsCurrency    := 0;
  cdsNUSEQEVENTO.AsInteger := 0;
  cdsCDMDFERESPSEG.AsInteger := 1;
  cdsCDTPMDFE.AsString     := RetornaSQLString('select first 1 cdtpmdfe from tpmdfe where cdempresa='+empresa.cdempresa.tostring+' order by cdtpmdfe');
  cdscdunidade.asstring    := qregistro.CodigodoNome(_unidade, empresa.faturamento.cte.nmunidade);
  cdsCDUF.AsInteger := empresa.endereco.cduf;
end;

procedure TdmMdfe.DataModuleCreate(Sender: TObject);
begin
  exibe := 'MDF-e';
  mdfe := orm.mdfe.TMDFE.create;
end;

procedure TdmMdfe.DataModuleDestroy(Sender: TObject);
begin
  freeandnil(registro);
  freeandnil(mdfe);
end;

procedure TdmMdfe.dtsStateChange(Sender: TObject);
begin
  frmmdfe.edtcodigo.Enabled := not ((dts.State = dsinsert) or (dts.State = dsedit));
end;

procedure TdmMdfe.setrecord(cdtpmdfe:integer);
begin
  if cdtpmdfe = 0 then
  begin
    exit;
  end;
  mdfe.tpmdfe.select(cdtpmdfe);
end;

end.
