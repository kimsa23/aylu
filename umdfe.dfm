object frmmdfe: Tfrmmdfe
  Left = 503
  Top = 170
  ClientHeight = 649
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnltop: TPanel
    Left = 0
    Top = 82
    Width = 1126
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbltpmdfe: TLabel
      Left = 2
      Top = 1
      Width = 26
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
    end
    object lblcodigo: TLabel
      Left = 147
      Top = 1
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object lbldtemissao: TLabel
      Left = 216
      Top = 1
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblhremissao: TLabel
      Left = 301
      Top = 1
      Width = 65
      Height = 13
      Caption = 'Hora Emiss'#227'o'
      Transparent = True
    end
    object lblcduf: TLabel
      Left = 387
      Top = 1
      Width = 14
      Height = 13
      Caption = 'UF'
      Transparent = True
    end
    object lblCDMDFETPEMITENTE: TLabel
      Left = 475
      Top = 1
      Width = 80
      Height = 13
      Caption = 'Tipo de Emitente'
      Transparent = True
    end
    object lblcdmdfemodalidade: TLabel
      Left = 668
      Top = 1
      Width = 55
      Height = 13
      Caption = 'Modalidade'
      Transparent = True
    end
    object lblcdmdfeformaemissao: TLabel
      Left = 758
      Top = 1
      Width = 86
      Height = 13
      Caption = 'Forma de Emiss'#227'o'
      Transparent = True
    end
    object lblcdstmdfe: TLabel
      Left = 857
      Top = 1
      Width = 30
      Height = 13
      Caption = 'Status'
      Transparent = True
    end
    object lblveiculo: TLabel
      Left = 2
      Top = 37
      Width = 45
      Height = 13
      Caption = 'Ve'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      OnDblClick = lblveiculoDblClick
    end
    object lbl3: TLabel
      Left = 147
      Top = 37
      Width = 25
      Height = 13
      Caption = 'CIOT'
      Transparent = True
    end
    object lbl1: TLabel
      Left = 301
      Top = 37
      Width = 83
      Height = 13
      Caption = 'UF Carregamento'
      Transparent = True
    end
    object lbl2: TLabel
      Left = 387
      Top = 37
      Width = 89
      Height = 13
      Caption = 'UF Descarremento'
      Transparent = True
    end
    object Label1: TLabel
      Left = 475
      Top = 35
      Width = 105
      Height = 13
      Caption = 'Tipo de Trasportadora'
      Transparent = True
    end
    object cbxcdtpmdfe: TcxDBLookupComboBox
      Left = 1
      Top = 15
      DataBinding.DataField = 'CDTPMDFE'
      DataBinding.DataSource = dmMdfe.dts
      Properties.DropDownWidth = 400
      Properties.KeyFieldNames = 'CDTPMDFE'
      Properties.ListColumns = <
        item
          FieldName = 'NMTPMDFE'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = colorenter
      OnExit = colorexit
      Width = 145
    end
    object edtcodigo: TcxTextEdit
      Left = 147
      Top = 15
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnEnter = colorenter
      OnExit = edtcodigoExit
      OnKeyDown = edtcodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
      Width = 66
    end
    object edtdtemissao: TcxDBDateEdit
      Left = 216
      Top = 15
      DataBinding.DataField = 'DTEMISSAO'
      DataBinding.DataSource = dmMdfe.dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 84
    end
    object edthremissao: TcxDBTimeEdit
      Left = 301
      Top = 15
      DataBinding.DataField = 'HREMISSAO'
      DataBinding.DataSource = dmMdfe.dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 87
    end
    object cbxcduf: TcxDBLookupComboBox
      Left = 387
      Top = 15
      DataBinding.DataField = 'CDUF'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDUF'
      Properties.ListColumns = <
        item
          FieldName = 'SGUF'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnEnter = colorenter
      OnExit = colorexit
      Width = 89
    end
    object cbxCDMDFETPEMITENTE: TcxDBLookupComboBox
      Left = 475
      Top = 15
      DataBinding.DataField = 'CDMDFETPEMITENTE'
      DataBinding.DataSource = dmMdfe.dts
      Properties.DropDownWidth = 265
      Properties.KeyFieldNames = 'CDMDFETPEMITENTE'
      Properties.ListColumns = <
        item
          FieldName = 'NMMDFETPEMITENTE'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      OnEnter = colorenter
      OnExit = colorexit
      Width = 194
    end
    object cbxCDMDFEMODALIDADE: TcxDBLookupComboBox
      Left = 668
      Top = 15
      DataBinding.DataField = 'CDMDFEMODALIDADE'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDMDFEMODALIDADE'
      Properties.ListColumns = <
        item
          FieldName = 'NMMDFEMODALIDADE'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      OnEnter = colorenter
      OnExit = colorexit
      Width = 90
    end
    object cbxCDMDFEFORMAEMISSAO: TcxDBLookupComboBox
      Left = 758
      Top = 15
      DataBinding.DataField = 'CDMDFEFORMAEMISSAO'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDMDFEFORMAEMISSAO'
      Properties.ListColumns = <
        item
          FieldName = 'NMMDFEFORMAEMISSAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      OnEnter = colorenter
      OnExit = colorexit
      Width = 100
    end
    object txtnmstmdfe: TcxDBLabel
      Left = 858
      Top = 15
      DataBinding.DataField = 'NMSTMDFE'
      DataBinding.DataSource = dmMdfe.dts
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
      Height = 21
      Width = 121
    end
    object edtcdveiculo: TcxDBButtonEdit
      Left = 1
      Top = 49
      DataBinding.DataField = 'CDVEICULO'
      DataBinding.DataSource = dmMdfe.dts
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtcdveiculoPropertiesButtonClick
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = edtcdveiculoKeyDown
      Width = 145
    end
    object edtcdciot: TcxDBTextEdit
      Left = 147
      Top = 49
      DataBinding.DataField = 'CDCIOT'
      DataBinding.DataSource = dmMdfe.dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 10
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 154
    end
    object cbxcdufinicio: TcxDBLookupComboBox
      Left = 301
      Top = 49
      DataBinding.DataField = 'CDUFINICIO'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDUF'
      Properties.ListColumns = <
        item
          FieldName = 'SGUF'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 11
      OnEnter = colorenter
      OnExit = colorexit
      Width = 87
    end
    object cbxcduffim: TcxDBLookupComboBox
      Left = 387
      Top = 49
      DataBinding.DataField = 'CDUFFIM'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDUF'
      Properties.ListColumns = <
        item
          FieldName = 'SGUF'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 12
      OnEnter = colorenter
      OnExit = colorexit
      Width = 89
    end
    object cbxtptransp: TcxDBLookupComboBox
      Left = 475
      Top = 49
      DataBinding.DataField = 'TPTRANSP'
      DataBinding.DataSource = dmMdfe.dts
      Properties.DropDownWidth = 265
      Properties.KeyFieldNames = 'TPTRANSP'
      Properties.ListColumns = <
        item
          FieldName = 'TPTRANSP'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 13
      OnEnter = colorenter
      OnExit = colorexit
      Width = 194
    end
  end
  object pnl: TcxLabel
    Left = 0
    Top = 59
    Align = alTop
    ParentFont = False
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object gbx1: TcxGroupBox
    Left = 0
    Top = 586
    Align = alBottom
    Caption = 'Totais de Fornecimento'
    TabOrder = 2
    Height = 63
    Width = 1126
    object Label2: TLabel
      Left = 6
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Quantidade cte'
      Transparent = True
    end
    object lbl4: TLabel
      Left = 251
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Quantidade nfe'
      Transparent = True
    end
    object Label3: TLabel
      Left = 251
      Top = 36
      Width = 40
      Height = 13
      Caption = 'Unidade'
      Transparent = True
    end
    object Label4: TLabel
      Left = 6
      Top = 36
      Width = 102
      Height = 13
      Caption = 'Valor total mercadoria'
      Transparent = True
    end
    object Label5: TLabel
      Left = 454
      Top = 36
      Width = 52
      Height = 13
      Caption = 'Peso Bruto'
      Transparent = True
    end
    object txt1: TcxDBLabel
      Left = 128
      Top = 13
      DataBinding.DataField = 'QTCTE'
      DataBinding.DataSource = dmMdfe.dts
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
      Height = 21
      Width = 121
    end
    object txt2: TcxDBLabel
      Left = 328
      Top = 13
      DataBinding.DataField = 'QTNFE'
      DataBinding.DataSource = dmMdfe.dts
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
      Height = 21
      Width = 121
    end
    object edtvlcarga: TcxDBCalcEdit
      Left = 128
      Top = 32
      DataBinding.DataField = 'VLCARGA'
      DataBinding.DataSource = dmMdfe.dts
      Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 121
    end
    object cbxcdunidade: TcxDBLookupComboBox
      Left = 328
      Top = 32
      DataBinding.DataField = 'CDUNIDADE'
      DataBinding.DataSource = dmMdfe.dts
      Properties.KeyFieldNames = 'CDUNIDADE'
      Properties.ListColumns = <
        item
          FieldName = 'NMUNIDADE'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 121
    end
    object edtqtcarga: TcxDBCalcEdit
      Left = 551
      Top = 32
      DataBinding.DataField = 'QTCARGA'
      DataBinding.DataSource = dmMdfe.dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 121
    end
  end
  object pgc: TcxPageControl
    Left = 0
    Top = 157
    Width = 1126
    Height = 429
    Align = alClient
    TabOrder = 7
    Properties.ActivePage = tbscarregamento
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dtmmain.imlMain
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 429
    ClientRectRight = 1126
    ClientRectTop = 25
    object tbscarregamento: TcxTabSheet
      Caption = 'Local de Carregamento'
      object grdmdfecarregamento: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfecarregamento: TcxGridDBTableView
          OnKeyDown = tbvmdfecarregamentoKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          DataController.DataSource = dmMdfe.dtsmdfecarregamento
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tbvmdfecarregamentoCDMUNICIPIO: TcxGridDBColumn
            Caption = 'Munic'#237'pio'
            DataBinding.FieldName = 'CDMUNICIPIO'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'CDMUNICIPIO'
            Properties.ListColumns = <
              item
                FieldName = 'NMMUNICIPIO'
              end>
            Properties.ListOptions.ShowHeader = False
            Width = 247
          end
        end
        object lvlmdfecarregamento: TcxGridLevel
          GridView = tbvmdfecarregamento
        end
      end
    end
    object tbspercurso: TcxTabSheet
      Caption = 'UF'#180's do Percurso'
      object grdmdfeufpercurso: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfeufpercurso: TcxGridDBTableView
          OnKeyDown = tbvmdfeufpercursoKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          DataController.DataSource = dmMdfe.dtsmdfeufpercurso
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tbvmdfeufpercursoCDUF: TcxGridDBColumn
            Caption = 'UF'
            DataBinding.FieldName = 'CDUF'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'CDUF'
            Properties.ListColumns = <
              item
                FieldName = 'SGUF'
              end>
            Properties.ListOptions.ShowHeader = False
          end
        end
        object lvlmdfeufpercurso: TcxGridLevel
          GridView = tbvmdfeufpercurso
        end
      end
    end
    object tbsdocumento: TcxTabSheet
      Caption = 'Informa'#231#245'es dos documentos'
      object grdmdfedescarregamento: TcxGrid
        Left = 0
        Top = 17
        Width = 1126
        Height = 186
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfedescarregamento: TcxGridDBTableView
          OnKeyDown = tbvmdfedescarregamentoKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          DataController.DataSource = dmMdfe.dtsmdfedescarregamento
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'QTCTE'
              Column = tbvmdfedescarregamentoQTCTE
            end
            item
              Kind = skSum
              FieldName = 'QTNFE'
              Column = tbvmdfedescarregamentoQTNFE
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
              FieldName = 'VLCARGA'
              Column = tbvmdfedescarregamentoVLCARGA
            end
            item
              Kind = skSum
              FieldName = 'QTCARGA'
              Column = tbvmdfedescarregamentoQTCARGA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object tbvmdfedescarregamentoCDMUNICIPIO: TcxGridDBColumn
            Caption = 'Munic'#237'pio'
            DataBinding.FieldName = 'CDMUNICIPIO'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'CDMUNICIPIO'
            Properties.ListColumns = <
              item
                FieldName = 'NMMUNICIPIO'
              end>
            Properties.ListOptions.ShowHeader = False
            Width = 423
          end
          object tbvmdfedescarregamentoQTCTE: TcxGridDBColumn
            Caption = 'Qt CTE'
            DataBinding.FieldName = 'QTCTE'
            Options.Focusing = False
          end
          object tbvmdfedescarregamentoQTNFE: TcxGridDBColumn
            Caption = 'Qt NFE'
            DataBinding.FieldName = 'QTNFE'
            Options.Focusing = False
          end
          object tbvmdfedescarregamentoVLCARGA: TcxGridDBColumn
            Caption = 'Valor Carga'
            DataBinding.FieldName = 'VLCARGA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
          end
          object tbvmdfedescarregamentoQTCARGA: TcxGridDBColumn
            Caption = 'Carga'
            DataBinding.FieldName = 'QTCARGA'
          end
        end
        object lvlmdfedescarregamento: TcxGridLevel
          GridView = tbvmdfedescarregamento
        end
      end
      object pgcdocumento: TcxPageControl
        Left = 0
        Top = 211
        Width = 1126
        Height = 193
        Align = alBottom
        TabOrder = 1
        Properties.ActivePage = tbscte
        Properties.CustomButtons.Buttons = <>
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 193
        ClientRectRight = 1126
        ClientRectTop = 24
        object tbscte: TcxTabSheet
          Caption = 'CT-e'#39's'
          ImageIndex = 0
          object grdmdfecte: TcxGrid
            Left = 0
            Top = 0
            Width = 1126
            Height = 169
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            object tbvmdfecte: TcxGridDBTableView
              OnKeyDown = tbvmdfecteKeyDown
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.PriorPage.Enabled = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.NextPage.Enabled = False
              Navigator.Buttons.NextPage.Visible = False
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
              OnCellDblClick = tbvmdfecteCellDblClick
              OnEditKeyDown = tbvmdfecteEditKeyDown
              DataController.DataSource = dmMdfe.dtsmdfecte
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'R$ ,0.00;-R$ ,0.00'
                  Kind = skSum
                  FieldName = 'VLCARGA'
                  Column = tbvmdfecteVLCARGA
                end
                item
                  Kind = skSum
                  FieldName = 'QTCARGA'
                  Column = tbvmdfecteQTCARGA
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object tbvmdfecteCDCTE: TcxGridDBColumn
                Caption = 'C'#243'digo CTE'
                DataBinding.FieldName = 'CDCTE'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = grdmdfecteDBTableView1CDCTEPropertiesButtonClick
                Styles.Content = dtmmain.cxStyle1
                Width = 95
              end
              object tbvmdfecteDTEMISSAO: TcxGridDBColumn
                Caption = 'DT Emiss'#227'o'
                DataBinding.FieldName = 'DTEMISSAO'
                Options.Focusing = False
                Width = 100
              end
              object tbvmdfecteVLCARGA: TcxGridDBColumn
                Caption = 'Valor Mercadoria'
                DataBinding.FieldName = 'VLCARGA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Width = 111
              end
              object tbvmdfecteQTCARGA: TcxGridDBColumn
                Caption = 'Carga'
                DataBinding.FieldName = 'QTCARGA'
                Width = 104
              end
              object tbvmdfecteNUCHAVENFE: TcxGridDBColumn
                Caption = 'Chave'
                DataBinding.FieldName = 'NUCHAVENFE'
                Width = 455
              end
              object tbvmdfecteINDREENTREGA: TcxGridDBColumn
                Caption = 'Indicador Reentrega'
                DataBinding.FieldName = 'INDREENTREGA'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Width = 120
              end
            end
            object lvlmdfecte: TcxGridLevel
              GridView = tbvmdfecte
            end
          end
        end
        object tbsnfe: TcxTabSheet
          Caption = 'NF-e'#39's'
          ImageIndex = 1
          object grdmdfenfe: TcxGrid
            Left = 0
            Top = 0
            Width = 1126
            Height = 169
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            object tbvmdfenfe: TcxGridDBTableView
              OnKeyDown = tbvmdfenfeKeyDown
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.PriorPage.Enabled = False
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.NextPage.Enabled = False
              Navigator.Buttons.NextPage.Visible = False
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Append.Enabled = False
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = True
              Navigator.Buttons.Post.Visible = True
              Navigator.Buttons.Cancel.Visible = True
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
              DataController.DataSource = dmMdfe.dtsmdfenfe
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsView.GroupByBox = False
              object tbvmdfenfeNUCHAVENFE: TcxGridDBColumn
                Caption = 'Chave'
                DataBinding.FieldName = 'NUCHAVENFE'
                Width = 569
              end
              object tbvmdfenfeINDREENTREGA: TcxGridDBColumn
                Caption = 'Indicador de Reentrega'
                DataBinding.FieldName = 'INDREENTREGA'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                Width = 120
              end
            end
            object lvlmdfenfe: TcxGridLevel
              GridView = tbvmdfenfe
            end
          end
        end
      end
      object spl1: TcxSplitter
        Left = 0
        Top = 203
        Width = 1126
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salBottom
        Control = pgcdocumento
      end
      object cxLabel1: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Munic'#237'pio de Descarregamento'
        ParentFont = False
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    object tbsinfoadic: TcxTabSheet
      Caption = 'Lacres'
      object lblnmstdocumento: TLabel
        Left = 187
        Top = 6
        Width = 191
        Height = 15
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object grdmdfelacre: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfelacre: TcxGridDBTableView
          OnKeyDown = tbvmdfelacreKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          DataController.DataSource = dmMdfe.dtsmdfelacre
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tbvmdfelacreNULACRE: TcxGridDBColumn
            Caption = 'N'#250'mero Lacre'
            DataBinding.FieldName = 'NULACRE'
          end
        end
        object lvlmdfelacre: TcxGridLevel
          GridView = tbvmdfelacre
        end
      end
    end
    object tbstransportadora: TcxTabSheet
      Caption = 'Condutor'
      object grdmdfetransportadora: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfetransportadora: TcxGridDBTableView
          OnKeyDown = tbvmdfetransportadoraKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          OnCellDblClick = tbvmdfetransportadoraCellDblClick
          OnEditKeyDown = tbvmdfetransportadoraEditKeyDown
          DataController.DataSource = dmMdfe.dtsmdfetransportadora
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tbvmdfetransportadoraCDTRANSPORTADORA: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CDTRANSPORTADORA'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = grdmdfetransportadoraDBTableView1CDTRANSPORTADORAPropertiesButtonClick
            Styles.Content = dtmmain.cxStyle1
            Width = 139
          end
          object tbvmdfetransportadoraNMTRANSPORTADORA: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NMTRANSPORTADORA'
            Options.Focusing = False
          end
          object tbvmdfetransportadoraNUCPF: TcxGridDBColumn
            Caption = 'CPF'
            DataBinding.FieldName = 'NUCPF'
            Options.Focusing = False
          end
        end
        object lvlmdfetransportadora: TcxGridLevel
          GridView = tbvmdfetransportadora
        end
      end
    end
    object tbsreboque: TcxTabSheet
      Caption = 'Reboque'
      object grdmdfeveiculo: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfeveiculo: TcxGridDBTableView
          OnKeyDown = tbvmdfeveiculoKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Refresh.Enabled = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          OnCellDblClick = tbvmdfeveiculoCellDblClick
          OnEditKeyDown = tbvmdfeveiculoEditKeyDown
          DataController.DataSource = dmMdfe.dtsmdfeveiculo
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tbvmdfeveiculoCDVEICULO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CDVEICULO'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = grdmdfeveiculoDBTableView1CDVEICULOPropertiesButtonClick
            Styles.Content = dtmmain.cxStyle1
            Width = 75
          end
          object tbvmdfeveiculoNUPLACA: TcxGridDBColumn
            Caption = 'Placa'
            DataBinding.FieldName = 'NUPLACA'
            Options.Focusing = False
            Width = 106
          end
        end
        object lvlmdfeveiculo: TcxGridLevel
          GridView = tbvmdfeveiculo
        end
      end
    end
    object tbspedagio: TcxTabSheet
      Caption = 'Vale Ped'#225'gio'
      object grdmdfepedagio: TcxGrid
        Left = 0
        Top = 0
        Width = 1126
        Height = 404
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object tbvmdfepedagio: TcxGridDBTableView
          OnKeyDown = tbvmdfepedagioKeyDown
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Enabled = False
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.NextPage.Enabled = False
          Navigator.Buttons.NextPage.Visible = False
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
          OnCellDblClick = tbvmdfepedagioCellDblClick
          OnEditKeyDown = tbvmdfepedagioEditKeyDown
          DataController.DataSource = dmMdfe.dtsmdfepedagio
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'R$,0.00;-R$,0.00'
              Kind = skSum
              FieldName = 'VVALEPED'
              Column = tbvmdfepedagioVVALEPED
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object tbvmdfepedagioCDFORNECEDOR: TcxGridDBColumn
            Caption = 'C'#243'd Fornecedor'
            DataBinding.FieldName = 'CDFORNECEDOR'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = grdmdfepedagioDBTableView1CDFORNECEDORPropertiesButtonClick
            Styles.Content = dtmmain.cxStyle1
          end
          object tbvmdfepedagioNMFORNECEDOR: TcxGridDBColumn
            Caption = 'Nome Fornecedor'
            DataBinding.FieldName = 'NMFORNECEDOR'
            Options.Focusing = False
            Width = 230
          end
          object tbvmdfepedagioNUCOMPROVANTE: TcxGridDBColumn
            Caption = 'Comprovante'
            DataBinding.FieldName = 'NUCOMPROVANTE'
          end
          object tbvmdfepedagioCDRESPONSAVEL: TcxGridDBColumn
            Caption = 'C'#243'd Respons'#225'vel'
            DataBinding.FieldName = 'CDRESPONSAVEL'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = grdmdfepedagioDBTableView1CDRESPONSAVELPropertiesButtonClick
            Styles.Content = dtmmain.cxStyle1
          end
          object tbvmdfepedagioNMRESPONSAVEL: TcxGridDBColumn
            Caption = 'Nome Respons'#225'vel'
            DataBinding.FieldName = 'NMRESPONSAVEL'
            Options.Focusing = False
            Width = 300
          end
          object tbvmdfepedagioVVALEPED: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VVALEPED'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = 'R$,0.00;-R$,0.00'
          end
        end
        object lvlmdfepedagio: TcxGridLevel
          GridView = tbvmdfepedagio
        end
      end
    end
    object tbsObservacao: TcxTabSheet
      Caption = 'Observa'#231#227'o'
      object memdsobservacao: TcxDBMemo
        Left = 0
        Top = 0
        Align = alClient
        DataBinding.DataField = 'DSOBSERVACAO'
        DataBinding.DataSource = dmMdfe.dts
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = colorenter
        OnExit = colorexit
        Height = 404
        Width = 1126
      end
    end
    object tbsseguradora: TcxTabSheet
      Caption = 'Seguradora'
      object txtnmfornecedor: TDBText
        Left = 325
        Top = 27
        Width = 207
        Height = 17
        DataField = 'NMFORNECEDOR'
        DataSource = dmMdfe.dts
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        ParentShowHint = False
        Transparent = True
        ShowHint = True
      end
      object Label13: TLabel
        Left = 69
        Top = 26
        Width = 55
        Height = 13
        Caption = 'Seguradora'
        Transparent = True
      end
      object lblnuapolice: TLabel
        Left = 89
        Top = 48
        Width = 35
        Height = 13
        Caption = 'Apolice'
        Transparent = True
      end
      object Label6: TLabel
        Left = 72
        Top = 71
        Width = 52
        Height = 13
        Caption = 'Averba'#231#227'o'
        Transparent = True
      end
      object Label7: TLabel
        Left = 2
        Top = 6
        Width = 122
        Height = 13
        Caption = 'Respons'#225'vel pelo Seguro'
        Transparent = True
      end
      object Label8: TLabel
        Left = 325
        Top = 6
        Width = 132
        Height = 13
        Caption = 'CNPJ/CPF do Respons'#225'vel'
        Transparent = True
      end
      object edtcdfornecedor: TcxDBButtonEdit
        Left = 127
        Top = 23
        DataBinding.DataField = 'CDFORNECEDOR'
        DataBinding.DataSource = dmMdfe.dts
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edtcdfornecedorPropertiesButtonClick
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        OnEnter = colorenter
        OnExit = colorexit
        OnKeyDown = edtcdfornecedorKeyDown
        OnKeyPress = edtcdfornecedorKeyPress
        Width = 194
      end
      object edtNAPOL: TcxDBTextEdit
        Left = 127
        Top = 44
        DataBinding.DataField = 'NAPOL'
        DataBinding.DataSource = dmMdfe.dts
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 3
        OnEnter = colorenter
        OnExit = colorexit
        OnKeyDown = nextcontrol
        Width = 194
      end
      object edtnuaver: TcxDBTextEdit
        Left = 127
        Top = 65
        DataBinding.DataField = 'NAVER'
        DataBinding.DataSource = dmMdfe.dts
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 4
        OnEnter = colorenter
        OnExit = colorexit
        OnKeyDown = nextcontrol
        Width = 194
      end
      object cbxCDMDFERESPSEG: TcxDBLookupComboBox
        Left = 128
        Top = 2
        DataBinding.DataField = 'CDMDFERESPSEG'
        DataBinding.DataSource = dmMdfe.dts
        Properties.DropDownWidth = 265
        Properties.KeyFieldNames = 'CDMDFERESPSEG'
        Properties.ListColumns = <
          item
            FieldName = 'NMMDFERESPSEG'
          end>
        Properties.ListOptions.ShowHeader = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = colorenter
        OnExit = colorexit
        Width = 194
      end
      object edtnucnpjcpf: TcxDBTextEdit
        Left = 462
        Top = 2
        DataBinding.DataField = 'NUCNPJCPF'
        DataBinding.DataSource = dmMdfe.dts
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 1
        OnEnter = colorenter
        OnExit = colorexit
        OnKeyDown = nextcontrol
        Width = 194
      end
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 514
    Top = 301
    object actNovo: TAction
      Caption = 'Novo'
      Hint = 'Novo'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = actNovoExecute
    end
    object actAbrir: TAction
      Caption = 'Abrir'
      Hint = 'Abrir'
      ImageIndex = 1
      ShortCut = 16449
      OnExecute = actAbrirExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      Enabled = False
      Hint = 'Editar'
      ImageIndex = 7
      ShortCut = 16453
      OnExecute = actEditarExecute
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      Enabled = False
      Hint = 'Salvar'
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = actSalvarExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      Enabled = False
      Hint = 'Imprimir'
      ImageIndex = 3
      ShortCut = 16457
      OnExecute = actImprimirExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      Enabled = False
      Hint = 'Excluir'
      ImageIndex = 5
      ShortCut = 16472
      OnExecute = actExcluirExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      Enabled = False
      Hint = 'Cancelar'
      ImageIndex = 4
      ShortCut = 16474
      OnExecute = actCancelarExecute
    end
    object actPrimeiro: TAction
      Caption = 'Primeiro'
      Hint = 'Primeiro'
      ImageIndex = 8
      ShortCut = 16454
      OnExecute = actPrimeiroExecute
    end
    object actAnterior: TAction
      Caption = 'Anterior'
      Enabled = False
      Hint = 'Anterior'
      ImageIndex = 9
      ShortCut = 16468
      OnExecute = actAnteriorExecute
    end
    object actProximo: TAction
      Caption = 'Pr'#243'ximo'
      Enabled = False
      Hint = 'Pr'#243'ximo'
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = actProximoExecute
    end
    object actUltimo: TAction
      Caption = #218'ltimo'
      Hint = #218'ltimo'
      ImageIndex = 11
      ShortCut = 16469
      OnExecute = actUltimoExecute
    end
    object actfechar: TAction
      Caption = 'Fechar'
      Hint = 'Fechar'
      ImageIndex = 133
      ShortCut = 16499
      OnExecute = actfecharExecute
    end
    object actnfe: TAction
      Caption = 'Gerar txt'
      Enabled = False
      Hint = 'Gerar txt para nota fiscal eletr'#244'nica'
      ImageIndex = 134
      Visible = False
      OnExecute = actnfeExecute
    end
    object actnfemenu: TAction
      Caption = 'MDFE'
      ImageIndex = 134
      OnExecute = actnfemenuExecute
    end
    object actopcoes: TAction
      Caption = 'Op'#231#245'es'
      ImageIndex = 134
      OnExecute = actopcoesExecute
    end
    object actabrircte: TAction
      Hint = 'cte'
      OnExecute = actabrircteExecute
    end
    object actabrirfornecedor: TAction
      Hint = 'fornecedor'
      OnExecute = actabrirfornecedorExecute
    end
    object actabrirresponsavel: TAction
      Hint = 'fornecedor'
      OnExecute = actabrirresponsavelExecute
    end
    object actabrirtransportadora: TAction
      Hint = 'transportadora'
      OnExecute = actabrirtransportadoraExecute
    end
    object actabrirveiculo: TAction
      Hint = 'veiculo'
      OnExecute = actabrirveiculoExecute
    end
    object actstatus: TAction
      Caption = 'Status Servi'#231'o'
      OnExecute = actstatusExecute
    end
    object actconfigurar: TAction
      Caption = 'Configurar'
      OnExecute = actconfigurarExecute
    end
    object actvalidar: TAction
      Caption = 'Validar'
      Enabled = False
      ImageIndex = 149
      OnExecute = actvalidarExecute
    end
    object actenviar: TAction
      Caption = 'Enviar'
      Enabled = False
      ImageIndex = 148
      OnExecute = actenviarExecute
    end
    object actabrirveiculo2: TAction
      Hint = 'veiculo'
      OnExecute = actabrirveiculo2Execute
    end
    object actcancelarmdfe: TAction
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 142
      OnExecute = actcancelarmdfeExecute
    end
    object actencerrar: TAction
      Caption = 'Encerrar'
      Enabled = False
      ImageIndex = 164
      OnExecute = actencerrarExecute
    end
    object actexportarxml: TAction
      Caption = 'Exportar XML'
      ImageIndex = 134
      OnExecute = actexportarxmlExecute
    end
    object actgerarpdf: TAction
      Caption = 'Gerar PDF'
      ImageIndex = 145
      OnExecute = actgerarpdfExecute
    end
    object actenviaremail: TAction
      Caption = 'Enviar email'
      ImageIndex = 146
      OnExecute = actenviaremailExecute
    end
    object actenviaremailremetente: TAction
      Caption = 'Enviar email para remetente(s)'
      ImageIndex = 146
      OnExecute = actenviaremailremetenteExecute
    end
    object actconsultar: TAction
      Caption = 'Consultar'
      ImageIndex = 151
      OnExecute = actconsultarExecute
    end
    object actImportarXML: TAction
      Caption = 'Importar XML'
      OnExecute = actImportarXMLExecute
    end
    object actmdfeautxml: TAction
      Caption = 'Autoriza'#231#227'o XML'
      OnExecute = actmdfeautxmlExecute
    end
  end
  object bmg1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dtmmain.imlMain
    ImageOptions.LargeImages = dtmmain.imlMain
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 517
    Top = 253
    DockControlHeights = (
      0
      0
      59
      0)
    object dxbrManager1Bar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'saida'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 21
      DockingStyle = dsTop
      FloatLeft = 369
      FloatTop = 161
      FloatClientWidth = 62
      FloatClientHeight = 456
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnNovo'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnAbrir'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnEditar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnsalvar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtncancelar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnexcluir'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnprimeiro'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnanterior'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnproximo'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnultimo'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnimprimir'
        end
        item
          Visible = True
          ItemName = 'btnmdfe'
        end
        item
          Visible = True
          ItemName = 'btnopcoes'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbrlrgbtnfechar'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrManager1Bar1: TdxBar
      BorderStyle = bbsNone
      Caption = 'menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 27
      FloatTop = 131
      FloatClientWidth = 55
      FloatClientHeight = 21
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrsbtmRegistro'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxbrsbtmRegistro: TdxBarSubItem
      Caption = '&Registro'
      Category = 0
      MergeOrder = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrlrgbtnNovo'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnAbrir'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnEditar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnsalvar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtncancelar'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnexcluir'
        end
        item
          Visible = True
          ItemName = 'dxbrsprtr1'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnprimeiro'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnanterior'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnproximo'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnultimo'
        end
        item
          Visible = True
          ItemName = 'dxbrsprtr2'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnimprimir'
        end
        item
          Visible = True
          ItemName = 'btnmdfe'
        end
        item
          Visible = True
          ItemName = 'btnopcoes'
        end
        item
          Visible = True
          ItemName = 'dxbrsprtr3'
        end
        item
          Visible = True
          ItemName = 'dxbrlrgbtnfechar'
        end>
    end
    object dxbrlrgbtnNovo: TdxBarLargeButton
      Action = actNovo
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnEditar: TdxBarLargeButton
      Action = actEditar
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnAbrir: TdxBarLargeButton
      Action = actAbrir
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnsalvar: TdxBarLargeButton
      Action = actSalvar
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtncancelar: TdxBarLargeButton
      Action = actCancelar
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnexcluir: TdxBarLargeButton
      Action = actExcluir
      Category = 0
      AutoGrayScale = False
    end
    object dxbrsprtr1: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxbrlrgbtnprimeiro: TdxBarLargeButton
      Action = actPrimeiro
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnanterior: TdxBarLargeButton
      Action = actAnterior
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnproximo: TdxBarLargeButton
      Action = actProximo
      Category = 0
      AutoGrayScale = False
    end
    object dxbrlrgbtnultimo: TdxBarLargeButton
      Action = actUltimo
      Category = 0
      AutoGrayScale = False
    end
    object dxbrsprtr2: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxbrlrgbtnimprimir: TdxBarLargeButton
      Action = actImprimir
      Category = 0
      AutoGrayScale = False
    end
    object dxbrsprtr3: TdxBarSeparator
      Category = 0
      Visible = ivAlways
      ShowCaption = False
    end
    object dxbrlrgbtnfechar: TdxBarLargeButton
      Action = actfechar
      Category = 0
      AutoGrayScale = False
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Cancelar'
      Category = 0
      Enabled = False
      Hint = 'Cancelar Nota Fiscal'
      Visible = ivAlways
      ImageIndex = 142
    end
    object dxBarButton15: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Visible = ivAlways
      ImageIndex = 3
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton16: TdxBarButton
      Caption = 'Exportar xml'
      Category = 0
      Enabled = False
      Visible = ivAlways
      ImageIndex = 134
      PaintStyle = psCaptionGlyph
    end
    object btnmdfe: TdxBarLargeButton
      Action = actnfemenu
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pumnfe
      SyncImageIndex = False
      ImageIndex = -1
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actconfigurar
      Category = 0
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = actstatus
      Category = 0
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = actenviar
      Category = 0
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = actconsultar
      Category = 0
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Action = actgerarpdf
      Category = 0
    end
    object dxBarLargeButton14: TdxBarLargeButton
      Caption = 'Visualizar'
      Category = 0
      Enabled = False
      Hint = 'Visualizar'
      Visible = ivAlways
      LargeImageIndex = 125
    end
    object dxBarLargeButton15: TdxBarLargeButton
      Action = actcancelarmdfe
      Category = 0
    end
    object dxBarLargeButton18: TdxBarLargeButton
      Action = actexportarxml
      Category = 0
    end
    object dxBarLargeButton19: TdxBarLargeButton
      Caption = 'Imprimir'
      Category = 0
      Visible = ivAlways
      LargeImageIndex = 3
    end
    object dxBarLargeButton22: TdxBarLargeButton
      Action = actvalidar
      Category = 0
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = actenviaremail
      Category = 0
    end
    object btnopcoes: TdxBarLargeButton
      Action = actopcoes
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pumopcoes
    end
    object dxBarButton2: TdxBarButton
      Action = actencerrar
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = actenviaremailremetente
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actImportarXML
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = actmdfeautxml
      Category = 0
    end
  end
  object pumnfe: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarLargeButton22'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton5'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton15'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton18'
      end
      item
        Visible = True
        ItemName = 'dxBarButton4'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton11'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton7'
      end
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton6'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarLargeButton4'
      end>
    UseOwnFont = False
    Left = 519
    Top = 206
  end
  object ACBrMDFe1: TACBrMDFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libWinCrypt
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 510
    Top = 397
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 512
    Top = 346
  end
  object pumopcoes: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton5'
      end>
    UseOwnFont = False
    Left = 432
    Top = 206
  end
end
