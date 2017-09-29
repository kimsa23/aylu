object frmCondPagto: TfrmCondPagto
  Left = 450
  Top = 179
  ClientHeight = 580
  ClientWidth = 951
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
  object pnl1: TPanel
    Left = 0
    Top = 59
    Width = 951
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 22
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object Label3: TLabel
      Left = 67
      Top = 22
      Width = 28
      Height = 13
      Caption = 'Nome'
      Transparent = True
    end
    object Label60: TLabel
      Left = 438
      Top = 22
      Width = 30
      Height = 13
      Caption = 'Status'
      Transparent = True
    end
    object Label2: TLabel
      Left = 309
      Top = 22
      Width = 59
      Height = 13
      Caption = 'Dia fora m'#234's'
      Transparent = True
    end
    object lblnucor: TLabel
      Left = 758
      Top = 22
      Width = 16
      Height = 13
      Caption = 'Cor'
      Transparent = True
    end
    object lblPRACRESCIMO: TLabel
      Left = 878
      Top = 22
      Width = 60
      Height = 13
      Caption = '% Acr'#233'scimo'
      Transparent = True
    end
    object Label4: TLabel
      Left = 372
      Top = 22
      Width = 56
      Height = 13
      Caption = 'N'#186' Parcelas'
      Transparent = True
    end
    object cbxcdstcondpagto: TcxDBLookupComboBox
      Left = 436
      Top = 36
      DataBinding.DataField = 'CDSTCONDPAGTO'
      DataBinding.DataSource = dts
      Properties.Alignment.Horz = taLeftJustify
      Properties.KeyFieldNames = 'CDSTCONDPAGTO'
      Properties.ListColumns = <
        item
          FieldName = 'NMSTCONDPAGTO'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnEnter = cbxcdstcondpagtoEnter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 152
    end
    object edtcodigo: TcxTextEdit
      Left = 4
      Top = 36
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = edtCodigoEnter
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
      Width = 63
    end
    object edtnome: TcxDBTextEdit
      Left = 67
      Top = 36
      DataBinding.DataField = 'NMCONDPAGTO'
      DataBinding.DataSource = dts
      Properties.CharCase = ecUpperCase
      Properties.OnChange = edtnomePropertiesChange
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 243
    end
    object pnl: TcxLabel
      Left = 0
      Top = 0
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
    object edtnudias: TcxDBSpinEdit
      Left = 309
      Top = 36
      DataBinding.DataField = 'NUDIAS'
      DataBinding.DataSource = dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 63
    end
    object ckbboentrada: TcxDBCheckBox
      Left = 586
      Top = 36
      Caption = 'Compra'
      DataBinding.DataField = 'BOENTRADA'
      DataBinding.DataSource = dts
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
    end
    object ckbbosaida: TcxDBCheckBox
      Left = 642
      Top = 36
      Caption = 'Nota Fiscal'
      DataBinding.DataField = 'BOSAIDA'
      DataBinding.DataSource = dts
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
    end
    object ckbbocte: TcxDBCheckBox
      Left = 716
      Top = 36
      Caption = 'CTE'
      DataBinding.DataField = 'BOCTE'
      DataBinding.DataSource = dts
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
    end
    object edtnucor: TdxDBColorEdit
      Left = 758
      Top = 36
      DataBinding.DataField = 'NUCOR'
      DataBinding.DataSource = dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 8
      Width = 121
    end
    object edtpracrescimo: TcxDBCalcEdit
      Left = 878
      Top = 36
      DataBinding.DataField = 'PRACRESCIMO'
      DataBinding.DataSource = dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      Width = 63
    end
    object edtnuparcela: TcxDBSpinEdit
      Left = 372
      Top = 36
      DataBinding.DataField = 'NUPARCELA'
      DataBinding.DataSource = dts
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 63
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 118
    Width = 951
    Height = 462
    Align = alClient
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object tbv: TcxGridDBTableView
      OnKeyDown = tbvKeyDown
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
      DataController.DataSource = dtsdetail
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost, dcoInsertOnNewItemRowFocusing]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.NavigatorHints = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvNUDIAS: TcxGridDBColumn
        Caption = 'Dias'
        DataBinding.FieldName = 'NUDIAS'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tbv
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 91
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
    Left = 64
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
      Caption = 'condpagto'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 21
      DockingStyle = dsTop
      FloatLeft = 392
      FloatTop = 299
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
          ItemName = 'dxbrlrgbtnimprimir'
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
  end
  object dts: TDataSource
    DataSet = qry
    Left = 67
    Top = 145
  end
  object dtsdetail: TDataSource
    DataSet = qrydetail
    Left = 63
    Top = 193
  end
  object qry: TFDQuery
    AfterOpen = qryAfterOpen
    BeforePost = qryBeforePost
    OnNewRecord = qryNewRecord
    CachedUpdates = True
    Connection = dtmmain.confire
    SchemaAdapter = sca
    SQL.Strings = (
      
        'SELECT * FROM CONDPAGTO WHERE CDEMPRESA=:CDEMPRESA AND CDCONDPAG' +
        'TO=:CDCONDPAGTO')
    Left = 10
    Top = 144
    ParamData = <
      item
        Name = 'CDEMPRESA'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDCONDPAGTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      Origin = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCDCONDPAGTO: TIntegerField
      FieldName = 'CDCONDPAGTO'
      Origin = 'CDCONDPAGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCDSTCONDPAGTO: TIntegerField
      FieldName = 'CDSTCONDPAGTO'
      Origin = 'CDSTCONDPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      Origin = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      Origin = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      Origin = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      Origin = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryNMCONDPAGTO: TStringField
      FieldName = 'NMCONDPAGTO'
      Origin = 'NMCONDPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qryNUDIAS: TIntegerField
      FieldName = 'NUDIAS'
      Origin = 'NUDIAS'
      ProviderFlags = [pfInUpdate]
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
    object qryBOENTRADA: TStringField
      FieldName = 'BOENTRADA'
      Origin = 'BOENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBOSAIDA: TStringField
      FieldName = 'BOSAIDA'
      Origin = 'BOSAIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBOCTE: TStringField
      FieldName = 'BOCTE'
      Origin = 'BOCTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryNUCOR: TIntegerField
      FieldName = 'NUCOR'
      Origin = 'NUCOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryPRACRESCIMO: TFloatField
      FieldName = 'PRACRESCIMO'
      Origin = 'PRACRESCIMO'
      ProviderFlags = [pfInUpdate]
    end
    object qryNUPARCELA: TIntegerField
      FieldName = 'NUPARCELA'
      Origin = 'NUPARCELA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qrydetail: TFDQuery
    BeforeInsert = qrydetailBeforeInsert
    BeforePost = qrydetailBeforePost
    OnNewRecord = qrydetailNewRecord
    CachedUpdates = True
    IndexFieldNames = 'CDEMPRESA;CDCONDPAGTO'
    MasterSource = dts
    MasterFields = 'CDEMPRESA;CDCONDPAGTO'
    Connection = dtmmain.confire
    SchemaAdapter = sca
    FetchOptions.AssignedValues = [evCache, evDetailOptimize, evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      
        'SELECT * FROM ITCONDPAGTO WHERE CDEMPRESA=:CDEMPRESA AND CDCONDP' +
        'AGTO=:CDCONDPAGTO')
    Left = 10
    Top = 192
    ParamData = <
      item
        Name = 'CDEMPRESA'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDCONDPAGTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrydetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      Origin = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrydetailCDITCONDPAGTO: TIntegerField
      FieldName = 'CDITCONDPAGTO'
      Origin = 'CDITCONDPAGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrydetailCDCONDPAGTO: TIntegerField
      FieldName = 'CDCONDPAGTO'
      Origin = 'CDCONDPAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      Origin = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      Origin = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      Origin = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      Origin = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailNUDIAS: TIntegerField
      FieldName = 'NUDIAS'
      Origin = 'NUDIAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      Origin = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qrydetailTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      Origin = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sca: TFDSchemaAdapter
    Left = 120
    Top = 152
  end
end
