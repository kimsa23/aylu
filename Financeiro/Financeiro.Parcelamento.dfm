object frmparcelamento: Tfrmparcelamento
  Left = 679
  Top = 231
  ClientHeight = 753
  ClientWidth = 1391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 0
    Top = 63
    Width = 1391
    Height = 19
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
  end
  object pnl1: TPanel
    Left = 0
    Top = 82
    Width = 1391
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 33
      Height = 13
      Caption = '&C'#243'digo'
      Transparent = True
    end
    object Label2: TLabel
      Left = 76
      Top = 3
      Width = 39
      Height = 13
      Caption = 'Emiss'#227'o'
      Transparent = True
    end
    object lblcdfornecedor: TLabel
      Left = 180
      Top = 3
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      OnDblClick = lblcdfornecedorDblClick
    end
    object txtNMFORNECEDOR: TDBText
      Left = 300
      Top = 19
      Width = 216
      Height = 17
      DataField = 'NMFORNECEDOR'
      DataSource = dts
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
    object txtmmfornecedor2: TDBText
      Left = 642
      Top = 19
      Width = 216
      Height = 17
      DataField = 'NMFORNECEDOR2'
      DataSource = dts
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
    object lblcdfornecedor2: TLabel
      Left = 522
      Top = 3
      Width = 163
      Height = 13
      Caption = 'Transferir para o Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      OnDblClick = lblcdfornecedorDblClick
    end
    object edtdtemissao: TcxDBDateEdit
      Left = 76
      Top = 17
      DataBinding.DataField = 'DTEMISSAO'
      DataBinding.DataSource = dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 104
    end
    object edtcodigo: TcxTextEdit
      Left = 8
      Top = 17
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = edtCodigoEnter
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
      Width = 66
    end
    object edtCDFORNECEDOR: TcxDBButtonEdit
      Left = 180
      Top = 17
      DataBinding.DataField = 'CDFORNECEDOR'
      DataBinding.DataSource = dts
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtCDFORNECEDORPropertiesButtonClick
      Properties.OnEditValueChanged = edtCDFORNECEDORPropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = edtCDFORNECEDORKeyDown
      OnKeyPress = eventokeypress
      Width = 119
    end
    object edtcdfornecedor2: TcxDBButtonEdit
      Left = 522
      Top = 17
      DataBinding.DataField = 'CDFORNECEDOR2'
      DataBinding.DataSource = dts
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtcdfornecedor2PropertiesButtonClick
      Properties.OnEditValueChanged = edtcdfornecedor2PropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = edtcdfornecedor2KeyDown
      OnKeyPress = eventokeypress
      Width = 119
    end
  end
  object pgc: TcxPageControl
    Left = 0
    Top = 122
    Width = 1391
    Height = 631
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = tbstitulo
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 631
    ClientRectRight = 1391
    ClientRectTop = 24
    object tbstitulo: TcxTabSheet
      Caption = 'T'#237'tulos a Negociar'
      ImageIndex = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 358
        Width = 1391
        Height = 249
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object grdsaida: TcxGrid
          Left = 0
          Top = 18
          Width = 1391
          Height = 231
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object tbvsaida: TcxGridDBTableView
            OnKeyDown = exportarGradeExcel
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.PriorPage.Enabled = False
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.NextPage.Enabled = False
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Append.Enabled = False
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
            OnCellDblClick = tbvsaidaCellDblClick
            DataController.DataSource = dtssaida
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLAUTPAGTO'
                Column = tbvsaidaVLAUTPAGTO
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLCOMISSAO'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object tbvsaidaNUAUTPAGTO: TcxGridDBColumn
              Caption = 'Documento'
              DataBinding.FieldName = 'NUAUTPAGTO'
              PropertiesClassName = 'TcxTextEditProperties'
              Options.Focusing = False
              Styles.Content = dtmmain.cxStyle1
            end
            object tbvsaidaVLAUTPAGTO: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VLAUTPAGTO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            end
            object tbvsaidaDTVENCIMENTO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DTVENCIMENTO'
              PropertiesClassName = 'TcxDateEditProperties'
            end
            object tbvsaidaCDSTAUTPAGTO: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'CDSTAUTPAGTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'CDSTAUTPAGTO'
              Properties.ListColumns = <
                item
                  FieldName = 'NMSTAUTPAGTO'
                end>
              Properties.ListOptions.ShowHeader = False
              Options.Focusing = False
              Width = 98
            end
            object tbvsaidaCDTPCOBRANCA: TcxGridDBColumn
              Caption = 'Tipo Cobran'#231'a'
              DataBinding.FieldName = 'CDTPCOBRANCA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.DropDownWidth = 350
              Properties.KeyFieldNames = 'CDTPCOBRANCA'
              Properties.ListColumns = <
                item
                  FieldName = 'NMTPCOBRANCA'
                end>
              Properties.ListOptions.ShowHeader = False
              Width = 161
            end
            object tbvsaidaCDAUTPAGTO: TcxGridDBColumn
              DataBinding.FieldName = 'CDAUTPAGTO'
              Visible = False
              IsCaptionAssigned = True
            end
            object tbvsaidaNUCNTCUSTO: TcxGridDBColumn
              Caption = 'C'#243'd Centro Custo'
              DataBinding.FieldName = 'NUCNTCUSTO'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = tbvsaidaNUCNTCUSTOPropertiesButtonClick
              Width = 100
            end
            object tbvsaidaNMCNTCUSTO: TcxGridDBColumn
              Caption = 'Centro Custo'
              DataBinding.FieldName = 'NMCNTCUSTO'
              Options.Focusing = False
              Width = 200
            end
            object tbvsaidaNUPLCONTA: TcxGridDBColumn
              Caption = 'C'#243'd Plano Contas'
              DataBinding.FieldName = 'NUPLCONTA'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = tbvsaidaNUPLCONTAPropertiesButtonClick
              Width = 100
            end
            object tbvsaidaNMPLCONTA: TcxGridDBColumn
              Caption = 'Plano Contas'
              DataBinding.FieldName = 'NMPLCONTA'
              Options.Focusing = False
              Width = 200
            end
          end
          object lvlsaida: TcxGridLevel
            GridView = tbvsaida
          end
        end
        object cxLabel2: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'T'#237'tulos negociados'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1391
        Height = 350
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object pnl2: TPanel
          Left = 0
          Top = 298
          Width = 1391
          Height = 52
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object lbldesconto: TLabel
            Left = 4
            Top = 10
            Width = 46
            Height = 13
            Caption = 'Desconto'
            Transparent = True
          end
          object Label3: TLabel
            Left = 83
            Top = 10
            Width = 49
            Height = 13
            Caption = 'Acr'#233'scimo'
            Transparent = True
          end
          object lblnuplconta: TLabel
            Left = 162
            Top = 10
            Width = 63
            Height = 13
            Caption = 'Plano Contas'
            Transparent = True
          end
          object lblnucntcusto: TLabel
            Left = 422
            Top = 10
            Width = 61
            Height = 13
            Caption = 'Centro Custo'
            Transparent = True
          end
          object Label5: TLabel
            Left = 684
            Top = 10
            Width = 56
            Height = 13
            Caption = 'N'#186' Parcelas'
            Transparent = True
          end
          object Label7: TLabel
            Left = 744
            Top = 10
            Width = 78
            Height = 13
            Caption = 'Dia Vencimento '
            Transparent = True
          end
          object Label11: TLabel
            Left = 822
            Top = 10
            Width = 85
            Height = 13
            Caption = 'Tipo de Cobran'#231'a'
            Transparent = True
          end
          object Label4: TLabel
            Left = 1094
            Top = 15
            Width = 59
            Height = 35
            Caption = 'Total'
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
          object edtvldesconto: TcxDBCalcEdit
            Left = 4
            Top = 24
            DataBinding.DataField = 'VLDESCONTO'
            DataBinding.DataSource = dts
            Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            OnEnter = colorenter
            OnExit = colorexit
            OnKeyDown = nextcontrol
            Width = 80
          end
          object edtvlacrescimo: TcxDBCalcEdit
            Left = 83
            Top = 24
            DataBinding.DataField = 'VLACRESCIMO'
            DataBinding.DataSource = dts
            Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnEnter = colorenter
            OnExit = colorexit
            OnKeyDown = nextcontrol
            Width = 80
          end
          object edtnuplconta: TcxDBButtonEdit
            Left = 162
            Top = 24
            DataBinding.DataField = 'NUPLCONTA'
            DataBinding.DataSource = dts
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = edtnuplcontaPropertiesButtonClick
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            OnEnter = colorenter
            OnExit = colorexit
            OnKeyDown = edtnuplcontaKeyDown
            Width = 100
          end
          object txtnmplconta: TcxDBLabel
            Left = 260
            Top = 24
            DataBinding.DataField = 'NMPLCONTA'
            DataBinding.DataSource = dts
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
            Height = 21
            Width = 163
          end
          object edtnucntcusto: TcxDBButtonEdit
            Left = 422
            Top = 24
            DataBinding.DataField = 'NUCNTCUSTO'
            DataBinding.DataSource = dts
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = edtnucntcustoPropertiesButtonClick
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnEnter = colorenter
            OnExit = colorexit
            OnKeyDown = edtnucntcustoKeyDown
            Width = 100
          end
          object txtnmcntcusto: TcxDBLabel
            Left = 521
            Top = 25
            DataBinding.DataField = 'NMCNTCUSTO'
            DataBinding.DataSource = dts
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
            Height = 21
            Width = 163
          end
          object edtnuparcela: TcxDBSpinEdit
            Left = 684
            Top = 24
            DataBinding.DataField = 'NUPARCELA'
            DataBinding.DataSource = dts
            Properties.MinValue = 1.000000000000000000
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            OnEnter = colorenter
            OnExit = colorexit
            Width = 59
          end
          object edtnudiavencimento: TcxDBSpinEdit
            Left = 744
            Top = 24
            DataBinding.DataField = 'NUDIAVENCIMENTO'
            DataBinding.DataSource = dts
            Properties.MinValue = 1.000000000000000000
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            OnEnter = colorenter
            OnExit = colorexit
            Width = 78
          end
          object cbxcdtpcobranca: TcxDBLookupComboBox
            Left = 822
            Top = 25
            DataBinding.DataField = 'CDTPCOBRANCA'
            DataBinding.DataSource = dts
            Properties.KeyFieldNames = 'CDTPCOBRANCA'
            Properties.ListColumns = <
              item
                FieldName = 'NMTPCOBRANCA'
              end>
            Properties.ListOptions.ShowHeader = False
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            OnEnter = colorenter
            OnExit = colorexit
            OnKeyDown = nextcontrol
            Width = 193
          end
          object btngerar: TcxButton
            Left = 1017
            Top = 21
            Width = 75
            Height = 25
            Action = actgerar
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
            TabOrder = 9
          end
          object txtVLTOTAL: TcxDBLabel
            Left = 1165
            Top = 9
            AutoSize = True
            DataBinding.DataField = 'VLTOTAL'
            DataBinding.DataSource = dts
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlue
            Style.Font.Height = -35
            Style.Font.Name = 'Arial Narrow'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
        object grdentrada: TcxGrid
          Left = 0
          Top = 0
          Width = 1391
          Height = 298
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object tbventrada: TcxGridDBTableView
            OnKeyDown = tbventradaKeyDown
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
            OnCellDblClick = tbventradaCellDblClick
            DataController.DataSource = dtsentrada
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLCOMISSAO'
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLAUTPAGTO'
                Column = tbventradaVLAUTPAGTO
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLJUROS'
                Column = tbventradaVLJUROS
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                FieldName = 'VLTOTAL'
                Column = tbventradaVLTOTAL
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.FocusRect = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object tbventradaNUAUTPAGTO: TcxGridDBColumn
              Caption = 'Documento'
              DataBinding.FieldName = 'NUAUTPAGTO'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = tbventradaNUAUTPAGTOPropertiesButtonClick
              Styles.Content = dtmmain.cxStyle1
              Width = 108
            end
            object tbventradaVLAUTPAGTO: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VLAUTPAGTO'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Focusing = False
              Width = 100
            end
            object tbventradaDTEMISSAO: TcxGridDBColumn
              Caption = 'Emiss'#227'o'
              DataBinding.FieldName = 'DTEMISSAO'
              PropertiesClassName = 'TcxDateEditProperties'
              Options.Focusing = False
            end
            object tbventradaDTPRORROGACAO: TcxGridDBColumn
              Caption = 'Vencimento'
              DataBinding.FieldName = 'DTPRORROGACAO'
              PropertiesClassName = 'TcxDateEditProperties'
              Options.Focusing = False
              Width = 100
            end
            object tbventradaVLJUROS: TcxGridDBColumn
              Caption = 'Juros'
              DataBinding.FieldName = 'VLJUROS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Visible = False
              Options.Focusing = False
              Width = 100
            end
            object tbventradaVLTOTAL: TcxGridDBColumn
              Caption = 'Valor Atual'
              DataBinding.FieldName = 'VLTOTAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Focusing = False
              Width = 100
            end
          end
          object lvlentrada: TcxGridLevel
            GridView = tbventrada
          end
        end
      end
      object splcalculo: TcxSplitter
        Left = 0
        Top = 350
        Width = 1391
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salTop
        Control = Panel2
        ExplicitWidth = 8
      end
    end
    object tbsobservacao: TcxTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object memdsobservacao: TcxDBMemo
        Left = 0
        Top = 0
        Align = alClient
        DataBinding.DataField = 'DSOBSERVACAO'
        DataBinding.DataSource = dts
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = ''
        TabOrder = 0
        Height = 607
        Width = 1391
      end
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 70
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
    object actprocessar: TAction
      Tag = 2
      Caption = 'Processar'
      Enabled = False
      Hint = 'Processar'
      ImageIndex = 99
      ShortCut = 16455
      Visible = False
      OnExecute = actprocessarExecute
    end
    object actabrirautpagto: TAction
      Hint = 'autpagto'
      OnExecute = actabrirautpagtoExecute
    end
    object actabrirautpagtosaida: TAction
      Hint = 'autpagto'
      OnExecute = actabrirautpagtosaidaExecute
    end
    object actfechar: TAction
      Caption = 'Fechar'
      Hint = 'Fechar'
      ImageIndex = 133
      ShortCut = 16499
      OnExecute = actfecharExecute
    end
    object actdesfazer: TAction
      Caption = 'Desfazer'
      Enabled = False
      ImageIndex = 86
      Visible = False
      OnExecute = actdesfazerExecute
    end
    object actabrirfornecedor: TAction
      Hint = 'fornecedor'
      OnExecute = actabrirfornecedorExecute
    end
    object actgerar: TAction
      Tag = 3
      Caption = 'Gerar'
      OnExecute = actgerarExecute
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
    Left = 42
    DockControlHeights = (
      0
      0
      63
      0)
    object dxbrManager1Bar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'reinspecao'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 25
      DockingStyle = dsTop
      FloatLeft = 240
      FloatTop = 96
      FloatClientWidth = 62
      FloatClientHeight = 494
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
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end
        item
          Visible = True
          ItemName = 'btnimprimir'
        end
        item
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
      Caption = 'menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 235
      FloatTop = 192
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
          ItemName = 'btnimprimir'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
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
    object btnimprimir: TdxBarLargeButton
      Action = actImprimir
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pum
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
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actprocessar
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actdesfazer
      Category = 0
    end
  end
  object sds: TSQLDataSet
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dtmmain.sqlc
    Left = 634
    Top = 152
    object sdsCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
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
    object sdsVLDESCONTO: TFMTBCDField
      FieldName = 'VLDESCONTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsVLJUROS: TFMTBCDField
      FieldName = 'VLJUROS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsVLACRESCIMO: TFMTBCDField
      FieldName = 'VLACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsCDSTPARCELAMENTO: TIntegerField
      FieldName = 'CDSTPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsVLENTRADA: TFMTBCDField
      FieldName = 'VLENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsVLSAIDA: TFMTBCDField
      FieldName = 'VLSAIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdsDSOBSERVACAO: TBlobField
      FieldName = 'DSOBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
    object sdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsCDFORNECEDOR2: TLargeintField
      FieldName = 'CDFORNECEDOR2'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNMFORNECEDOR2: TStringField
      FieldName = 'NMFORNECEDOR2'
      ProviderFlags = []
      Size = 100
    end
    object sdsCDCNTCUSTO: TIntegerField
      FieldName = 'CDCNTCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUCNTCUSTO: TStringField
      FieldName = 'NUCNTCUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdsNMCNTCUSTO: TStringField
      FieldName = 'NMCNTCUSTO'
      ProviderFlags = []
      Size = 100
    end
    object sdsCDPLCONTA: TIntegerField
      FieldName = 'CDPLCONTA'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUPLCONTA: TStringField
      FieldName = 'NUPLCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdsNMPLCONTA: TStringField
      FieldName = 'NMPLCONTA'
      ProviderFlags = []
      Size = 100
    end
    object sdsCDTPCOBRANCA: TIntegerField
      FieldName = 'CDTPCOBRANCA'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUPARCELA: TIntegerField
      FieldName = 'NUPARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object sdsNUDIAVENCIMENTO: TIntegerField
      FieldName = 'NUDIAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdsVLTOTAL: TFMTBCDField
      FieldName = 'VLTOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspBeforeUpdateRecord
    Left = 662
    Top = 152
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    ReadOnly = True
    BeforePost = cdsBeforePost
    AfterScroll = cdsAfterScroll
    OnNewRecord = cdsNewRecord
    Left = 712
    Top = 152
    object cdsCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
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
    object cdsVLENTRADA: TFMTBCDField
      FieldName = 'VLENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsVLSAIDA: TFMTBCDField
      FieldName = 'VLSAIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsVLDESCONTO: TFMTBCDField
      FieldName = 'VLDESCONTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsVLJUROS: TFMTBCDField
      FieldName = 'VLJUROS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsVLACRESCIMO: TFMTBCDField
      FieldName = 'VLACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsCDSTPARCELAMENTO: TIntegerField
      FieldName = 'CDSTPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssdssaida: TDataSetField
      FieldName = 'sdssaida'
      ProviderFlags = [pfInUpdate]
    end
    object cdssdsentrada: TDataSetField
      FieldName = 'sdsentrada'
      ProviderFlags = [pfInUpdate]
    end
    object cdsDSOBSERVACAO: TBlobField
      FieldName = 'DSOBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDFORNECEDOR: TLargeintField
      FieldName = 'CDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsCDFORNECEDORValidate
    end
    object cdsCDFORNECEDOR2: TLargeintField
      FieldName = 'CDFORNECEDOR2'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsCDFORNECEDOR2Validate
    end
    object cdsNMFORNECEDOR2: TStringField
      FieldName = 'NMFORNECEDOR2'
      ProviderFlags = []
      Size = 100
    end
    object cdsCDCNTCUSTO: TIntegerField
      FieldName = 'CDCNTCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUCNTCUSTO: TStringField
      FieldName = 'NUCNTCUSTO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsNUCNTCUSTOValidate
      Size = 100
    end
    object cdsNMCNTCUSTO: TStringField
      FieldName = 'NMCNTCUSTO'
      ProviderFlags = []
      Size = 100
    end
    object cdsCDPLCONTA: TIntegerField
      FieldName = 'CDPLCONTA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUPLCONTA: TStringField
      FieldName = 'NUPLCONTA'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsNUPLCONTAValidate
      Size = 100
    end
    object cdsNMPLCONTA: TStringField
      FieldName = 'NMPLCONTA'
      ProviderFlags = []
      Size = 100
    end
    object cdsCDTPCOBRANCA: TIntegerField
      FieldName = 'CDTPCOBRANCA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUPARCELA: TIntegerField
      FieldName = 'NUPARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNUDIAVENCIMENTO: TIntegerField
      FieldName = 'NUDIAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVLTOTAL: TFMTBCDField
      FieldName = 'VLTOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '$ ###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object dts: TDataSource
    DataSet = cds
    OnStateChange = dtsStateChange
    Left = 783
    Top = 152
  end
  object dts1: TDataSource
    DataSet = sds
    Left = 831
    Top = 156
  end
  object sdssaida: TSQLDataSet
    DataSource = dts1
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmmain.sqlc
    Left = 633
    Top = 237
    object sdssaidaCDPARCELAMENTOSAIDA: TIntegerField
      FieldName = 'CDPARCELAMENTOSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdssaidaCDAUTPAGTO: TIntegerField
      FieldName = 'CDAUTPAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdssaidaCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaVLAUTPAGTO: TFMTBCDField
      FieldName = 'VLAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object sdssaidaTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaNUAUTPAGTO: TStringField
      FieldName = 'NUAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdssaidaDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdssaidaCDSTAUTPAGTO: TIntegerField
      FieldName = 'CDSTAUTPAGTO'
      ProviderFlags = []
    end
    object sdssaidaCDTPCOBRANCA: TIntegerField
      FieldName = 'CDTPCOBRANCA'
      ProviderFlags = [pfInUpdate]
    end
    object sdssaidaCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdssaidaCDCNTCUSTO: TIntegerField
      FieldName = 'CDCNTCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object sdssaidaNUCNTCUSTO: TStringField
      FieldName = 'NUCNTCUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdssaidaNMCNTCUSTO: TStringField
      FieldName = 'NMCNTCUSTO'
      ProviderFlags = []
      Size = 100
    end
    object sdssaidaCDPLCONTA: TIntegerField
      FieldName = 'CDPLCONTA'
      ProviderFlags = [pfInUpdate]
    end
    object sdssaidaNUPLCONTA: TStringField
      FieldName = 'NUPLCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdssaidaNMPLCONTA: TStringField
      FieldName = 'NMPLCONTA'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdssaida: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdssaida
    Params = <>
    ReadOnly = True
    BeforePost = cdssaidaBeforePost
    OnNewRecord = cdssaidaNewRecord
    Left = 712
    Top = 237
    object cdssaidaCDPARCELAMENTOSAIDA: TIntegerField
      FieldName = 'CDPARCELAMENTOSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdssaidaCDAUTPAGTO: TIntegerField
      FieldName = 'CDAUTPAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdssaidaCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaVLAUTPAGTO: TFMTBCDField
      FieldName = 'VLAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object cdssaidaTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaNUAUTPAGTO: TStringField
      FieldName = 'NUAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdssaidaDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdssaidaCDSTAUTPAGTO: TIntegerField
      FieldName = 'CDSTAUTPAGTO'
      ProviderFlags = []
    end
    object cdssaidaCDTPCOBRANCA: TIntegerField
      FieldName = 'CDTPCOBRANCA'
      ProviderFlags = [pfInUpdate]
    end
    object cdssaidaCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdssaidaCDCNTCUSTO: TIntegerField
      FieldName = 'CDCNTCUSTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdssaidaNUCNTCUSTO: TStringField
      FieldName = 'NUCNTCUSTO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdssaidaNUCNTCUSTOValidate
      Size = 100
    end
    object cdssaidaNMCNTCUSTO: TStringField
      FieldName = 'NMCNTCUSTO'
      ProviderFlags = []
      Size = 100
    end
    object cdssaidaCDPLCONTA: TIntegerField
      FieldName = 'CDPLCONTA'
      ProviderFlags = [pfInUpdate]
    end
    object cdssaidaNUPLCONTA: TStringField
      FieldName = 'NUPLCONTA'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdssaidaNUPLCONTAValidate
      Size = 100
    end
    object cdssaidaNMPLCONTA: TStringField
      FieldName = 'NMPLCONTA'
      ProviderFlags = []
      Size = 100
    end
  end
  object dtssaida: TDataSource
    DataSet = cdssaida
    Left = 786
    Top = 237
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 57
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      TextColor = clBlue
    end
  end
  object pum: TdxBarPopupMenu
    BarManager = bmg1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemLinks = <>
    UseOwnFont = True
    Left = 768
    Top = 94
  end
  object sdsentrada: TSQLDataSet
    DataSource = dts1
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dtmmain.sqlc
    Left = 632
    Top = 193
    object sdsentradaCDPARCELAMENTOENTRADA: TIntegerField
      FieldName = 'CDPARCELAMENTOENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsentradaCDAUTPAGTO: TIntegerField
      FieldName = 'CDAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaVLAUTPAGTO: TFMTBCDField
      FieldName = 'VLAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object sdsentradaVLJUROS: TFMTBCDField
      FieldName = 'VLJUROS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object sdsentradaTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsentradaNUAUTPAGTO: TStringField
      FieldName = 'NUAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sdsentradaVLTOTAL: TFMTBCDField
      FieldName = 'VLTOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object sdsentradaDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = []
    end
    object sdsentradaDTPRORROGACAO: TDateField
      FieldName = 'DTPRORROGACAO'
      ProviderFlags = []
    end
    object sdsentradaCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsentrada: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsentrada
    Params = <>
    BeforePost = cdsentradaBeforePost
    OnNewRecord = cdsentradaNewRecord
    Left = 712
    Top = 193
    object cdsentradaCDPARCELAMENTOENTRADA: TIntegerField
      FieldName = 'CDPARCELAMENTOENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsentradaCDAUTPAGTO: TIntegerField
      FieldName = 'CDAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsentradaCDAUTPAGTOValidate
    end
    object cdsentradaCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaCDPARCELAMENTO: TIntegerField
      FieldName = 'CDPARCELAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaVLAUTPAGTO: TFMTBCDField
      FieldName = 'VLAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsentradaVLJUROS: TFMTBCDField
      FieldName = 'VLJUROS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsentradaTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsentradaNUAUTPAGTO: TStringField
      FieldName = 'NUAUTPAGTO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsentradaNUAUTPAGTOValidate
      Size = 15
    end
    object cdsentradaVLTOTAL: TFMTBCDField
      FieldName = 'VLTOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsentradaDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      ProviderFlags = []
    end
    object cdsentradaDTPRORROGACAO: TDateField
      FieldName = 'DTPRORROGACAO'
      ProviderFlags = []
    end
    object cdsentradaCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsentrada: TDataSource
    DataSet = cdsentrada
    Left = 784
    Top = 195
  end
end
