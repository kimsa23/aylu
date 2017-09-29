object frmplcontarateio: Tfrmplcontarateio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Rateio de Plano de Contas'
  ClientHeight = 336
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 4
    Top = 14
    Width = 62
    Height = 35
    Caption = 'Valor'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = 35
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object btnok: TcxButton
    Left = 211
    Top = 303
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 0
    OnClick = btnokClick
  end
  object btncancelar: TcxButton
    Left = 307
    Top = 304
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object grd: TcxGrid
    Left = 4
    Top = 63
    Width = 582
    Height = 234
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    object tbv: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dts
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'R$,0.00;-R$,0.00'
          Kind = skSum
          FieldName = 'VLTOTAL'
          Column = tbvVLTOTAL
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvNUPLCONTA: TcxGridDBColumn
        Caption = 'Plano de Contas'
        DataBinding.FieldName = 'NUPLCONTA'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = tbvNUPLCONTAPropertiesButtonClick
        Width = 120
      end
      object tbvNMPLCONTA: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NMPLCONTA'
        Options.Focusing = False
        Width = 325
      end
      object tbvVLTOTAL: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'VLTOTAL'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = 'R$,0.00;-R$,0.00'
      end
    end
    object lvl: TcxGridLevel
      GridView = tbv
    end
  end
  object edtvalor: TcxCurrencyEdit
    Left = 72
    Top = 7
    TabStop = False
    EditValue = 100.000000000000000000
    Enabled = False
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Color = clBtnFace
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -35
    Style.Font.Name = 'Arial Narrow'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.Color = clBtnFace
    StyleDisabled.TextColor = clBlue
    TabOrder = 3
    Width = 174
  end
  object act: TActionList
    Left = 528
    Top = 88
  end
  object qry: TFDQuery
    BeforePost = qryBeforePost
    OnNewRecord = qryNewRecord
    CachedUpdates = True
    Aggregates = <
      item
        Name = 'sumvltotal'
        Expression = 'sum(vltotal)'
        Active = True
      end>
    AggregatesActive = True
    Connection = dtmmain.confire
    SQL.Strings = (
      
        'SELECT PLCONTARATEIO.*,PLCONTA.NMPLCONTA FROM PLCONTARATEIO LEFT' +
        ' JOIN PLCONTA ON PLCONTA.CDEMPRESA=PLCONTARATEIO.CDEMPRESA AND P' +
        'LCONTA.CDPLCONTA=PLCONTARATEIO.CDPLCONTA')
    Left = 400
    Top = 24
    object qryCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      Origin = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCDPLCONTARATEIO: TIntegerField
      FieldName = 'CDPLCONTARATEIO'
      Origin = 'CDPLCONTARATEIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      Origin = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      Origin = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      Origin = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      Origin = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDPLCONTA: TIntegerField
      FieldName = 'CDPLCONTA'
      Origin = 'CDPLCONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDSAIDA: TIntegerField
      FieldName = 'CDSAIDA'
      Origin = 'CDSAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCDDUPLICATA: TIntegerField
      FieldName = 'CDDUPLICATA'
      Origin = 'CDDUPLICATA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCDENTRADA: TIntegerField
      FieldName = 'CDENTRADA'
      Origin = 'CDENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object qryCDAUTPAGTO: TIntegerField
      FieldName = 'CDAUTPAGTO'
      Origin = 'CDAUTPAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryVLTOTAL: TBCDField
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = qryVLTOTALValidate
      Precision = 18
      Size = 2
    end
    object qryTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      Origin = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      Origin = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryNUPLCONTA: TStringField
      FieldName = 'NUPLCONTA'
      Origin = 'NUPLCONTA'
      ProviderFlags = [pfInUpdate]
      OnValidate = qryNUPLCONTAValidate
      Size = 100
    end
    object qryNMPLCONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMPLCONTA'
      Origin = 'NMPLCONTA'
      ProviderFlags = []
      Size = 100
    end
  end
  object dts: TDataSource
    DataSet = qry
    Left = 440
    Top = 24
  end
end
