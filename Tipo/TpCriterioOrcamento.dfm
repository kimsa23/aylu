object frmtpcriterioorcamento: Tfrmtpcriterioorcamento
  Left = 512
  Top = 170
  ClientHeight = 571
  ClientWidth = 1036
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
    Width = 1036
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
      DataBinding.DataField = 'NMTPCRITERIOORCAMENTO'
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
    object ckbboentrada: TcxDBCheckBox
      Left = 315
      Top = 36
      Caption = 'Ativado'
      DataBinding.DataField = 'BOATIVO'
      DataBinding.DataSource = dts
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 118
    Width = 1036
    Height = 453
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
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvCDTPRESPOSTA: TcxGridDBColumn
        Caption = 'Tipo Resposta'
        DataBinding.FieldName = 'CDTPRESPOSTA'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownWidth = 300
        Properties.KeyFieldNames = 'CDTPRESPOSTA'
        Properties.ListColumns = <
          item
            FieldName = 'NMTPRESPOSTA'
          end>
        Properties.ListOptions.ShowHeader = False
        Width = 100
      end
      object tbvNMITTPCRITERIOORCAMENTO: TcxGridDBColumn
        Caption = 'Resposta'
        DataBinding.FieldName = 'NMITTPCRITERIOORCAMENTO'
        Width = 500
      end
      object tbvBOVALOR: TcxGridDBColumn
        Caption = 'Valor Obrigat'#243'rio'
        DataBinding.FieldName = 'BOVALOR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Width = 90
      end
      object tbvBODATA: TcxGridDBColumn
        Caption = 'Data Obrigat'#243'rio'
        DataBinding.FieldName = 'BODATA'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Width = 90
      end
      object tbvBOATIVAR: TcxGridDBColumn
        Caption = 'Ativado'
        DataBinding.FieldName = 'BOATIVAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Width = 57
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tbv
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 695
    Top = 190
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
    Left = 696
    Top = 144
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
  object sds: TSQLDataSet
    CommandText = 
      'SELECT * '#13#10'FROM TPCRITERIOORCAMENTO WHERE CDEMPRESA=:CDEMPRESA A' +
      'ND CDTPCRITERIOORCAMENTO=:CDTPCRITERIOORCAMENTO'
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
        Name = 'CDTPCRITERIOORCAMENTO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 697
    Top = 236
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
    object sdsCDTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNMTPCRITERIOORCAMENTO: TStringField
      FieldName = 'NMTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sdsBOATIVO: TStringField
      FieldName = 'BOATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspBeforeUpdateRecord
    Left = 725
    Top = 236
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    BeforePost = cdsBeforePost
    OnNewRecord = cdsNewRecord
    Left = 753
    Top = 236
    object cdssdsdetail: TDataSetField
      FieldName = 'sdsdetail'
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
    object cdsCDTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNMTPCRITERIOORCAMENTO: TStringField
      FieldName = 'NMTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsBOATIVO: TStringField
      FieldName = 'BOATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dts: TDataSource
    DataSet = cds
    OnStateChange = dtsStateChange
    Left = 799
    Top = 236
  end
  object dts1: TDataSource
    DataSet = sds
    Left = 827
    Top = 236
  end
  object sdsdetail: TSQLDataSet
    CommandText = 
      'SELECT * FROM ITTPCRITERIOORCAMENTO WHERE CDEMPRESA=:CDEMPRESA A' +
      'ND CDTPCRITERIOORCAMENTO=:CDTPCRITERIOORCAMENTO'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFMTBcd
        Name = 'CDEMPRESA'
        ParamType = ptInput
        Size = 34
      end
      item
        DataType = ftInteger
        Name = 'CDTPCRITERIOORCAMENTO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dtmmain.sqlc
    Left = 699
    Top = 281
    object sdsdetailCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDITTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDITTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsdetailCDTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDTPRESPOSTA: TIntegerField
      FieldName = 'CDTPRESPOSTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailNMITTPCRITERIOORCAMENTO: TStringField
      FieldName = 'NMITTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sdsdetailBOVALOR: TStringField
      FieldName = 'BOVALOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsdetailBODATA: TStringField
      FieldName = 'BODATA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsdetailBOATIVAR: TStringField
      FieldName = 'BOATIVAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsdetail: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsdetail
    Params = <>
    ReadOnly = True
    BeforePost = cdsdetailBeforePost
    OnNewRecord = cdsdetailNewRecord
    Left = 755
    Top = 281
    object cdsdetailCDUSUARIOI: TIntegerField
      FieldName = 'CDUSUARIOI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDUSUARIOA: TIntegerField
      FieldName = 'CDUSUARIOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDCOMPUTADORI: TIntegerField
      FieldName = 'CDCOMPUTADORI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDCOMPUTADORA: TIntegerField
      FieldName = 'CDCOMPUTADORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailTSINCLUSAO: TSQLTimeStampField
      FieldName = 'TSINCLUSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailTSALTERACAO: TSQLTimeStampField
      FieldName = 'TSALTERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDITTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDITTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsdetailCDTPCRITERIOORCAMENTO: TIntegerField
      FieldName = 'CDTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDTPRESPOSTA: TIntegerField
      FieldName = 'CDTPRESPOSTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailNMITTPCRITERIOORCAMENTO: TStringField
      DisplayLabel = 'NMTPITCRITERIOORCAMENTO'
      FieldName = 'NMITTPCRITERIOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsdetailBOVALOR: TStringField
      FieldName = 'BOVALOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsdetailBODATA: TStringField
      FieldName = 'BODATA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsdetailBOATIVAR: TStringField
      FieldName = 'BOATIVAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsdetail: TDataSource
    DataSet = cdsdetail
    Left = 801
    Top = 281
  end
end
