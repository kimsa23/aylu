object dmMdfe: TdmMdfe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 509
  Width = 446
  object sds: TSQLDataSet
    CommandText = 
      'SELECT M.*'#13#10',FORNECEDOR.NMFORNECEDOR'#13#10',S.NMSTMDFE '#13#10'FROM MDFE M ' +
      #13#10'INNER JOIN STMDFE S ON S.CDSTMDFE=M.CDSTMDFE '#13#10'LEFT JOIN FORNE' +
      'CEDOR ON FORNECEDOR.CDEMPRESA=M.CDEMPRESA AND FORNECEDOR.CDFORNE' +
      'CEDOR=M.CDFORNECEDOR'#13#10'WHERE M.CDEMPRESA=:CDEMPRESA AND M.CDMDFE=' +
      ':CDMDFE'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 11
    object sdsCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDSERIE: TIntegerField
      FieldName = 'CDSERIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDUF: TIntegerField
      FieldName = 'CDUF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDMDFETPEMITENTE: TIntegerField
      FieldName = 'CDMDFETPEMITENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDMDFEMODALIDADE: TIntegerField
      FieldName = 'CDMDFEMODALIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDMDFEFORMAEMISSAO: TIntegerField
      FieldName = 'CDMDFEFORMAEMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDUFINICIO: TIntegerField
      FieldName = 'CDUFINICIO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsCDUFFIM: TIntegerField
      FieldName = 'CDUFFIM'
      ProviderFlags = [pfInUpdate]
    end
    object sdsCDUNIDADE: TIntegerField
      FieldName = 'CDUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDVEICULO: TIntegerField
      FieldName = 'CDVEICULO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsCDTPMDFE: TIntegerField
      FieldName = 'CDTPMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDSTMDFE: TIntegerField
      FieldName = 'CDSTMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNUMDFE: TIntegerField
      FieldName = 'NUMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNUCHAVE: TStringField
      FieldName = 'NUCHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sdsCDVERIFICADORCHAVE: TStringField
      FieldName = 'CDVERIFICADORCHAVE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sdsQTCTE: TIntegerField
      FieldName = 'QTCTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsQTNFE: TIntegerField
      FieldName = 'QTNFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsNURNTRC: TStringField
      FieldName = 'NURNTRC'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sdsCDCIOT: TStringField
      FieldName = 'CDCIOT'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object sdsNMSTMDFE: TStringField
      FieldName = 'NMSTMDFE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object sdsQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsNULOTE: TIntegerField
      FieldName = 'NULOTE'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUPROTOCOLOAUTORIZACAO: TStringField
      FieldName = 'NUPROTOCOLOAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdsDSXML: TBlobField
      FieldName = 'DSXML'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsTSPROTOCOLOAUTORIZACAO: TSQLTimeStampField
      FieldName = 'TSPROTOCOLOAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = [pfInUpdate]
      Size = 44
    end
    object sdsNURECIBONFE: TStringField
      FieldName = 'NURECIBONFE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdsDSCANCELAMENTO: TBlobField
      FieldName = 'DSCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsNUPROTOCOLOCANCELAMENTO: TStringField
      FieldName = 'NUPROTOCOLOCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdsDSXMLCANCEL: TBlobField
      FieldName = 'DSXMLCANCEL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsNUSEQEVENTO: TIntegerField
      FieldName = 'NUSEQEVENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUPROTOCOLOENCERRAMENTO: TStringField
      FieldName = 'NUPROTOCOLOENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdsDSXMLENCERRAMENTO: TBlobField
      FieldName = 'DSXMLENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsDTENCERRAMENTO: TDateField
      FieldName = 'DTENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDSOBSERVACAO: TBlobField
      FieldName = 'DSOBSERVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsTPTRANSP: TStringField
      FieldName = 'TPTRANSP'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sdsCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sdsCDMDFERESPSEG: TIntegerField
      FieldName = 'CDMDFERESPSEG'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNAPOL: TStringField
      FieldName = 'NAPOL'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNAVER: TStringField
      FieldName = 'NAVER'
    end
    object sdsNUCNPJCPF: TStringField
      FieldName = 'NUCNPJCPF'
    end
    object sdsNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 158
    Top = 11
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    BeforePost = cdsBeforePost
    AfterScroll = cdsAfterScroll
    OnNewRecord = cdsNewRecord
    Left = 186
    Top = 11
    object cdsCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDSERIE: TIntegerField
      FieldName = 'CDSERIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDUF: TIntegerField
      FieldName = 'CDUF'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDMDFETPEMITENTE: TIntegerField
      FieldName = 'CDMDFETPEMITENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsCDMDFETPEMITENTEValidate
    end
    object cdsCDMDFEMODALIDADE: TIntegerField
      FieldName = 'CDMDFEMODALIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDMDFEFORMAEMISSAO: TIntegerField
      FieldName = 'CDMDFEFORMAEMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDUFINICIO: TIntegerField
      FieldName = 'CDUFINICIO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsCDUFINICIOValidate
    end
    object cdsCDUFFIM: TIntegerField
      FieldName = 'CDUFFIM'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsCDUFFIMValidate
    end
    object cdsCDUNIDADE: TIntegerField
      FieldName = 'CDUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCDVEICULO: TIntegerField
      FieldName = 'CDVEICULO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCDTPMDFE: TIntegerField
      FieldName = 'CDTPMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsCDTPMDFEValidate
    end
    object cdsCDSTMDFE: TIntegerField
      FieldName = 'CDSTMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsCDSTMDFEValidate
    end
    object cdsTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNUMDFE: TIntegerField
      FieldName = 'NUMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNUCHAVE: TStringField
      FieldName = 'NUCHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsCDVERIFICADORCHAVE: TStringField
      FieldName = 'CDVERIFICADORCHAVE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsQTCTE: TIntegerField
      FieldName = 'QTCTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsQTNFE: TIntegerField
      FieldName = 'QTNFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsNURNTRC: TStringField
      FieldName = 'NURNTRC'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsCDCIOT: TStringField
      FieldName = 'CDCIOT'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdssdsmdfeufpercurso: TDataSetField
      FieldName = 'sdsmdfeufpercurso'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsmdfeveiculo: TDataSetField
      FieldName = 'sdsmdfeveiculo'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsmdfepedagio: TDataSetField
      FieldName = 'sdsmdfepedagio'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsmdfetransportadora: TDataSetField
      FieldName = 'sdsmdfetransportadora'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsmdfelacre: TDataSetField
      FieldName = 'sdsmdfelacre'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNMSTMDFE: TStringField
      FieldName = 'NMSTMDFE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdssdsmdfedescarregamento: TDataSetField
      FieldName = 'sdsmdfedescarregamento'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsmdfecarregamento: TDataSetField
      FieldName = 'sdsmdfecarregamento'
      ProviderFlags = [pfInUpdate]
    end
    object cdsQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNULOTE: TIntegerField
      FieldName = 'NULOTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUPROTOCOLOAUTORIZACAO: TStringField
      FieldName = 'NUPROTOCOLOAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsDSXML: TBlobField
      FieldName = 'DSXML'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsTSPROTOCOLOAUTORIZACAO: TSQLTimeStampField
      FieldName = 'TSPROTOCOLOAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = [pfInUpdate]
      Size = 44
    end
    object cdsNURECIBONFE: TStringField
      FieldName = 'NURECIBONFE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsDSCANCELAMENTO: TBlobField
      FieldName = 'DSCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNUPROTOCOLOCANCELAMENTO: TStringField
      FieldName = 'NUPROTOCOLOCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsDSXMLCANCEL: TBlobField
      FieldName = 'DSXMLCANCEL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNUSEQEVENTO: TIntegerField
      FieldName = 'NUSEQEVENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUPROTOCOLOENCERRAMENTO: TStringField
      FieldName = 'NUPROTOCOLOENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsDSXMLENCERRAMENTO: TBlobField
      FieldName = 'DSXMLENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsDTENCERRAMENTO: TDateField
      FieldName = 'DTENCERRAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDSOBSERVACAO: TBlobField
      FieldName = 'DSOBSERVACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTPTRANSP: TStringField
      FieldName = 'TPTRANSP'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsCDFORNECEDORValidate
    end
    object cdsCDMDFERESPSEG: TIntegerField
      FieldName = 'CDMDFERESPSEG'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNAPOL: TStringField
      FieldName = 'NAPOL'
    end
    object cdsNAVER: TStringField
      FieldName = 'NAVER'
    end
    object cdsNUCNPJCPF: TStringField
      FieldName = 'NUCNPJCPF'
    end
    object cdsNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
  end
  object dts: TDataSource
    DataSet = cds
    OnStateChange = dtsStateChange
    Left = 321
    Top = 11
  end
  object dts1: TDataSource
    DataSet = sds
    Left = 343
    Top = 11
  end
  object dtsmdfeufpercurso: TDataSource
    DataSet = cdsmdfeufpercurso
    Left = 321
    Top = 59
  end
  object cdsmdfeufpercurso: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfeufpercurso
    Params = <>
    BeforePost = cdsmdfeufpercursoBeforePost
    Left = 187
    Top = 59
    object cdsmdfeufpercursoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfeufpercursoCDUF: TIntegerField
      FieldName = 'CDUF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfeufpercursoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeufpercursoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sdsmdfeufpercurso: TSQLDataSet
    CommandText = 
      'SELECT * FROM MDFEUFPERCURSO WHERE CDEMPRESA=:CDEMPRESA AND CDMD' +
      'FE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 59
    object sdsmdfeufpercursoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfeufpercursoCDUF: TIntegerField
      FieldName = 'CDUF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfeufpercursoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeufpercursoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sdsmdfeveiculo: TSQLDataSet
    CommandText = 
      'SELECT M.*,V.NUPLACA '#13#10'FROM MDFEVEICULO M'#13#10'INNER JOIN VEICULO V ' +
      'ON V.CDEMPRESA=M.CDEMPRESA AND V.CDVEICULO=M.CDVEICULO'#13#10'WHERE M.' +
      'CDEMPRESA=:CDEMPRESA AND M.CDMDFE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 107
    object sdsmdfeveiculoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfeveiculoCDVEICULO: TIntegerField
      FieldName = 'CDVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfeveiculoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfeveiculoNUPLACA: TStringField
      FieldName = 'NUPLACA'
      ProviderFlags = []
      Required = True
      Size = 8
    end
    object sdsmdfeveiculoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sdsmdfepedagio: TSQLDataSet
    CommandText = 
      'SELECT M.* '#13#10',F.NMFORNECEDOR'#13#10',R.NMFORNECEDOR NMRESPONSAVEL'#13#10'FRO' +
      'M MDFEPEDAGIO M'#13#10'INNER JOIN FORNECEDOR F ON F.CDEMPRESA=M.CDEMPR' +
      'ESA AND F.CDFORNECEDOR=M.CDFORNECEDOR'#13#10'INNER JOIN FORNECEDOR R O' +
      'N R.CDEMPRESA=M.CDEMPRESA AND R.CDFORNECEDOR=M.CDRESPONSAVEL'#13#10'WH' +
      'ERE M.CDEMPRESA=:CDEMPRESA AND M.CDMDFE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 154
    object sdsmdfepedagioCDMDFEPEDAGIO: TIntegerField
      FieldName = 'CDMDFEPEDAGIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfepedagioCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioNUCOMPROVANTE: TStringField
      FieldName = 'NUCOMPROVANTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object sdsmdfepedagioNMRESPONSAVEL: TStringField
      FieldName = 'NMRESPONSAVEL'
      ProviderFlags = []
      Size = 100
    end
    object sdsmdfepedagioCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfepedagioCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfepedagioCDRESPONSAVEL: TLargeintField
      FieldName = 'CDRESPONSAVEL'
      ProviderFlags = [pfInUpdate]
    end
    object sdsmdfepedagioVVALEPED: TFMTBCDField
      FieldName = 'VVALEPED'
      ProviderFlags = [pfInUpdate]
      Size = 0
    end
  end
  object cdsmdfeveiculo: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfeveiculo
    Params = <>
    BeforePost = cdsmdfeveiculoBeforePost
    Left = 187
    Top = 107
    object cdsmdfeveiculoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfeveiculoCDVEICULO: TIntegerField
      FieldName = 'CDVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsmdfeveiculoCDVEICULOValidate
    end
    object cdsmdfeveiculoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfeveiculoNUPLACA: TStringField
      FieldName = 'NUPLACA'
      ProviderFlags = []
      Required = True
      Size = 8
    end
    object cdsmdfeveiculoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsmdfeveiculo: TDataSource
    DataSet = cdsmdfeveiculo
    Left = 321
    Top = 107
  end
  object dtsmdfepedagio: TDataSource
    DataSet = cdsmdfepedagio
    Left = 321
    Top = 154
  end
  object cdsmdfepedagio: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfepedagio
    Params = <>
    BeforePost = cdsmdfepedagioBeforePost
    Left = 187
    Top = 154
    object cdsmdfepedagioCDMDFEPEDAGIO: TIntegerField
      FieldName = 'CDMDFEPEDAGIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfepedagioCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioNUCOMPROVANTE: TStringField
      FieldName = 'NUCOMPROVANTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfepedagioNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsmdfepedagioNMRESPONSAVEL: TStringField
      FieldName = 'NMRESPONSAVEL'
      ProviderFlags = []
      Size = 100
    end
    object cdsmdfepedagioCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfepedagioCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsmdfepedagioCDFORNECEDORValidate
    end
    object cdsmdfepedagioCDRESPONSAVEL: TLargeintField
      FieldName = 'CDRESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsmdfepedagioCDRESPONSAVELValidate
    end
    object cdsmdfepedagioVVALEPED: TFMTBCDField
      FieldName = 'VVALEPED'
      ProviderFlags = [pfInUpdate]
      Size = 0
    end
  end
  object sdsmdfelacre: TSQLDataSet
    CommandText = 
      'SELECT * FROM MDFELACRE WHERE CDEMPRESA=:CDEMPRESA AND CDMDFE=:C' +
      'DMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 201
    object sdsmdfelacreCDMDFELACRE: TIntegerField
      FieldName = 'CDMDFELACRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfelacreCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfelacreNULACRE: TStringField
      FieldName = 'NULACRE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sdsmdfelacreCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsmdfelacre: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfelacre
    Params = <>
    BeforePost = cdsmdfelacreBeforePost
    Left = 187
    Top = 201
    object cdsmdfelacreCDMDFELACRE: TIntegerField
      FieldName = 'CDMDFELACRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfelacreCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfelacreNULACRE: TStringField
      FieldName = 'NULACRE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsmdfelacreCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsmdfelacre: TDataSource
    DataSet = cdsmdfelacre
    Left = 321
    Top = 201
  end
  object dtsmdfetransportadora: TDataSource
    DataSet = cdsmdfetransportadora
    Left = 321
    Top = 246
  end
  object cdsmdfetransportadora: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfetransportadora
    Params = <>
    BeforePost = cdsmdfetransportadoraBeforePost
    Left = 187
    Top = 246
    object cdsmdfetransportadoraCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfetransportadoraCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfetransportadoraNMTRANSPORTADORA: TStringField
      FieldName = 'NMTRANSPORTADORA'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsmdfetransportadoraNUCPF: TStringField
      FieldName = 'NUCPF'
      ProviderFlags = []
      Size = 15
    end
    object cdsmdfetransportadoraCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfetransportadoraCDTRANSPORTADORA: TLargeintField
      FieldName = 'CDTRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsmdfetransportadoraCDTRANSPORTADORAValidate
    end
  end
  object sdsmdfetransportadora: TSQLDataSet
    CommandText = 
      'SELECT M.*,T.NMTRANSPORTADORA,T.NUCPF'#13#10'FROM MDFETRANSPORTADORA M' +
      #13#10'INNER JOIN TRANSPORTADORA T ON T.CDEMPRESA=M.CDEMPRESA AND T.C' +
      'DTRANSPORTADORA=M.CDTRANSPORTADORA'#13#10'WHERE M.CDEMPRESA=:CDEMPRESA' +
      ' AND M.CDMDFE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 246
    object sdsmdfetransportadoraCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfetransportadoraCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfetransportadoraNMTRANSPORTADORA: TStringField
      FieldName = 'NMTRANSPORTADORA'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object sdsmdfetransportadoraNUCPF: TStringField
      FieldName = 'NUCPF'
      ProviderFlags = []
      Size = 15
    end
    object sdsmdfetransportadoraCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfetransportadoraCDTRANSPORTADORA: TLargeintField
      FieldName = 'CDTRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sdsmdfecarregamento: TSQLDataSet
    CommandText = 
      'SELECT * FROM MDFECARREGAMENTO WHERE CDEMPRESA=:CDEMPRESA AND CD' +
      'MDFE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 293
    object sdsmdfecarregamentoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecarregamentoCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecarregamentoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecarregamentoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsmdfecarregamento: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsmdfecarregamento
    Params = <>
    BeforePost = cdsmdfecarregamentoBeforePost
    Left = 187
    Top = 293
    object cdsmdfecarregamentoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfecarregamentoCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfecarregamentoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecarregamentoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsmdfecarregamento: TDataSource
    DataSet = cdsmdfecarregamento
    Left = 321
    Top = 293
  end
  object dtsmdfedescarregamento: TDataSource
    DataSet = cdsmdfedescarregamento
    Left = 321
    Top = 340
  end
  object dts4: TDataSource
    DataSet = sdsmdfedescarregamento
    Left = 349
    Top = 340
  end
  object dtsmdfecte: TDataSource
    DataSet = cdsmdfecte
    Left = 321
    Top = 386
  end
  object dtsmdfenfe: TDataSource
    DataSet = cdsmdfenfe
    Left = 321
    Top = 433
  end
  object cdsmdfenfe: TClientDataSet
    Aggregates = <>
    DataSetField = cdsmdfedescarregamentosdsmdfenfe
    Params = <>
    BeforePost = cdsmdfenfeBeforePost
    AfterPost = cdsmdfenfeAfterPost
    Left = 187
    Top = 434
    object cdsmdfenfeCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfenfeNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 44
    end
    object cdsmdfenfeCDMDFENFE: TIntegerField
      FieldName = 'CDMDFENFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfenfeCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfenfeINDREENTREGA: TStringField
      FieldName = 'INDREENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object cdsmdfecte: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'sum_vlcarga'
        Expression = 'SUM(VLCARGA)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'sum_qtcarga'
        Expression = 'SUM(QTCARGA)'
        Visible = False
      end>
    AggregatesActive = True
    DataSetField = cdsmdfedescarregamentosdsmdfecte
    Params = <>
    BeforePost = cdsmdfecteBeforePost
    AfterPost = cdsmdfecteAfterPost
    Left = 187
    Top = 386
    object cdsmdfecteCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfecteCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfecteCDCTE: TIntegerField
      FieldName = 'CDCTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsmdfecteCDCTEValidate
    end
    object cdsmdfecteCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfecteDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = []
    end
    object cdsmdfecteVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsmdfecteNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = []
      Size = 44
    end
    object cdsmdfecteQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsmdfecteCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfecteINDREENTREGA: TStringField
      FieldName = 'INDREENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object cdsmdfedescarregamento: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'sum_qtcte'
        Expression = 'SUM(QTCTE)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'sum_nfe'
        Expression = 'SUM(QTNFE)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'sum_vlcarga'
        Expression = 'SUM(VLCARGA)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'sum_qtcarga'
        Expression = 'SUM(QTCARGA)'
        Visible = False
      end>
    AggregatesActive = True
    DataSetField = cdssdsmdfedescarregamento
    Params = <>
    BeforePost = cdsmdfedescarregamentoBeforePost
    AfterPost = cdsmdfedescarregamentoAfterPost
    OnNewRecord = cdsmdfedescarregamentoNewRecord
    Left = 187
    Top = 340
    object cdsmdfedescarregamentoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfedescarregamentoCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsmdfedescarregamentoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentosdsmdfenfe: TDataSetField
      FieldName = 'sdsmdfenfe'
      ProviderFlags = [pfInUpdate]
    end
    object cdsmdfedescarregamentosdsmdfecte: TDataSetField
      FieldName = 'sdsmdfecte'
      ProviderFlags = [pfInUpdate]
    end
    object cdsmdfedescarregamentoQTCTE: TIntegerField
      FieldName = 'QTCTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoQTNFE: TIntegerField
      FieldName = 'QTNFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsmdfedescarregamentoVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsmdfedescarregamentoQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsmdfedescarregamentoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sdsmdfedescarregamento: TSQLDataSet
    CommandText = 
      'SELECT * FROM MDFEDESCARREGAMENTO WHERE CDEMPRESA=:CDEMPRESA AND' +
      ' CDMDFE=:CDMDFE'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 340
    object sdsmdfedescarregamentoCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfedescarregamentoCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfedescarregamentoCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoQTCTE: TIntegerField
      FieldName = 'QTCTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoQTNFE: TIntegerField
      FieldName = 'QTNFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfedescarregamentoVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsmdfedescarregamentoQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
    end
    object sdsmdfedescarregamentoCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object sdsmdfecte: TSQLDataSet
    CommandText = 
      'SELECT M.*'#13#10',C.DTEMISSAO'#13#10',C.NUCHAVENFE '#13#10'FROM MDFECTE M '#13#10'INNER' +
      ' JOIN CTE C ON C.CDEMPRESA=M.CDEMPRESA AND C.CDCTE=M.CDCTE '#13#10'WHE' +
      'RE M.CDEMPRESA=:CDEMPRESA AND M.CDMDFE=:CDMDFE AND M.CDMUNICIPIO' +
      '=:CDMUNICIPIO'
    DataSource = dts4
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CDMUNICIPIO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 59
    Top = 386
    object sdsmdfecteCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecteCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecteCDCTE: TIntegerField
      FieldName = 'CDCTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecteCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfecteDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = []
    end
    object sdsmdfecteVLCARGA: TFMTBCDField
      FieldName = 'VLCARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsmdfecteNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = []
      Size = 44
    end
    object sdsmdfecteQTCARGA: TFloatField
      FieldName = 'QTCARGA'
      ProviderFlags = [pfInUpdate]
    end
    object sdsmdfecteCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfecteINDREENTREGA: TStringField
      FieldName = 'INDREENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sdsmdfenfe: TSQLDataSet
    CommandText = 
      'SELECT * FROM MDFENFE WHERE CDEMPRESA=:CDEMPRESA AND CDMDFE=:CDM' +
      'DFE AND CDMUNICIPIO=:CDMUNICIPIO'
    DataSource = dts4
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDMDFE'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CDMUNICIPIO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 60
    Top = 433
    object sdsmdfenfeCDMDFE: TIntegerField
      FieldName = 'CDMDFE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeCDMUNICIPIO: TIntegerField
      FieldName = 'CDMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsmdfenfeNUCHAVENFE: TStringField
      FieldName = 'NUCHAVENFE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 44
    end
    object sdsmdfenfeCDMDFENFE: TIntegerField
      FieldName = 'CDMDFENFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfenfeCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsmdfenfeINDREENTREGA: TStringField
      FieldName = 'INDREENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
end
