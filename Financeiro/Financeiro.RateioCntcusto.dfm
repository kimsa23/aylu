object frmRateiocntcusto: TfrmRateiocntcusto
  Left = 431
  Top = 96
  ClientHeight = 512
  ClientWidth = 1186
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
  object pnl: TcxLabel
    Left = 0
    Top = 63
    Align = alTop
    ParentFont = False
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object pnltop: TPanel
    Left = 0
    Top = 86
    Width = 1186
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 0
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object lblcdtpapontamentomanual: TLabel
      Left = 307
      Top = 0
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 65
      Top = 0
      Width = 28
      Height = 13
      Caption = 'Nome'
      Transparent = True
    end
    object edtcodigo: TcxTextEdit
      Left = 6
      Top = 14
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = edtCodigoEnter
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
      Width = 59
    end
    object cbxCDSTRATEIOcntcusto: TcxDBLookupComboBox
      Left = 307
      Top = 14
      DataBinding.DataField = 'CDSTRATEIOcntcusto'
      DataBinding.DataSource = dts
      Properties.DropDownWidth = 300
      Properties.KeyFieldNames = 'CDSTRATEIOcntcusto'
      Properties.ListColumns = <
        item
          FieldName = 'NMSTRATEIOcntcusto'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 200
    end
    object edtnome: TcxDBTextEdit
      Left = 65
      Top = 14
      DataBinding.DataField = 'NMRATEIOcntcusto'
      DataBinding.DataSource = dts
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 243
    end
  end
  object grd: TcxGrid
    Left = 0
    Top = 121
    Width = 1186
    Height = 391
    Align = alClient
    TabOrder = 2
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
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dtsdetail
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'PRRATEIO'
          Column = tbvPRRATEIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvNUcntcusto: TcxGridDBColumn
        Caption = 'Plano Contas'
        DataBinding.FieldName = 'NUcntcusto'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = tbvNUcntcustoPropertiesButtonClick
        Width = 206
      end
      object tbvNMcntcusto: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NMcntcusto'
        Options.Focusing = False
        Width = 450
      end
      object tbvPRRATEIO: TcxGridDBColumn
        Caption = '% Rateio'
        DataBinding.FieldName = 'PRRATEIO'
        PropertiesClassName = 'TcxCalcEditProperties'
      end
    end
    object lvl: TcxGridLevel
      GridView = tbv
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 592
    Top = 369
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
    object actopcoes: TAction
      Caption = 'Op'#231#245'es'
      ImageIndex = 134
      OnExecute = actopcoesExecute
    end
    object actabrirtpapontamentomanual: TAction
      Hint = 'tpapontamentomanual'
    end
    object actabrirfuncionario: TAction
      Hint = 'funcionario'
    end
    object actabrirtpequipamento: TAction
      Hint = 'tpequipamento'
    end
    object actaplicarcodigoordproducao: TAction
      Caption = 'Aplicar C'#243'digo da Ordem de Produ'#231#227'o'
    end
    object actabrirordproducao: TAction
      Hint = 'ordproducao'
    end
    object actremovercodigoordproducao: TAction
      Caption = 'Remover C'#243'digo de Ordem de Produ'#231#227'o'
    end
    object actinsertgride: TAction
      ShortCut = 16429
      OnExecute = actinsertgrideExecute
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
    Left = 560
    Top = 368
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
      Caption = 'contrato1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 25
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
          ItemName = 'btnimprimir'
        end
        item
          Visible = True
          ItemName = 'btnopcoes'
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
    object btnimprimir: TdxBarLargeButton
      Action = actImprimir
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pumimprimir
    end
    object btnopcoes: TdxBarLargeButton
      Action = actopcoes
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pumopcoes
    end
    object dxBarButton1: TdxBarButton
      Action = actaplicarcodigoordproducao
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actremovercodigoordproducao
      Category = 0
    end
  end
  object sds: TSQLDataSet
    CommandText = 
      'SELECT * FROM RATEIOcntcusto WHERE CDEMPRESA=:CDEMPRESA AND CDRA' +
      'TEIOcntcusto=:CDRATEIOcntcusto'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CDRATEIOcntcusto'
        ParamType = ptInput
      end>
    SQLConnection = dtmmain.sqlc
    Left = 632
    Top = 259
    object sdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDRATEIOcntcusto: TIntegerField
      FieldName = 'CDRATEIOcntcusto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDSTRATEIOcntcusto: TIntegerField
      FieldName = 'CDSTRATEIOcntcusto'
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
    object sdsNMRATEIOcntcusto: TStringField
      FieldName = 'NMRATEIOcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
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
  end
  object sdsdetail: TSQLDataSet
    CommandText = 
      'SELECT ITRATEIOcntcusto.*,cntcusto.NMcntcusto FROM ITRATEIOcntcu' +
      'sto INNER JOIN cntcusto ON cntcusto.CDEMPRESA=ITRATEIOcntcusto.C' +
      'DEMPRESA AND cntcusto.CDcntcusto=ITRATEIOcntcusto.CDcntcusto WHE' +
      'RE ITRATEIOcntcusto.CDEMPRESA=:CDEMPRESA AND ITRATEIOcntcusto.CD' +
      'RATEIOcntcusto=:CDRATEIOcntcusto'
    DataSource = dts1
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CDRATEIOcntcusto'
        ParamType = ptInput
      end>
    SQLConnection = dtmmain.sqlc
    Left = 634
    Top = 289
    object sdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsdetailCDITRATEIOcntcusto: TIntegerField
      FieldName = 'CDITRATEIOcntcusto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsdetailCDRATEIOcntcusto: TIntegerField
      FieldName = 'CDRATEIOcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sdsdetailCDcntcusto: TIntegerField
      FieldName = 'CDcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
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
    object sdsdetailNUcntcusto: TStringField
      FieldName = 'NUcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sdsdetailPRRATEIO: TFloatField
      FieldName = 'PRRATEIO'
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
    object sdsdetailNMcntcusto: TStringField
      FieldName = 'NMcntcusto'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspBeforeUpdateRecord
    Left = 664
    Top = 259
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    BeforePost = cdsBeforePost
    OnNewRecord = cdsNewRecord
    Left = 696
    Top = 259
    object cdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDRATEIOcntcusto: TIntegerField
      FieldName = 'CDRATEIOcntcusto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDSTRATEIOcntcusto: TIntegerField
      FieldName = 'CDSTRATEIOcntcusto'
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
    object cdsNMRATEIOcntcusto: TStringField
      FieldName = 'NMRATEIOcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
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
    object cdssdsdetail: TDataSetField
      FieldName = 'sdsdetail'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dts: TDataSource
    DataSet = cds
    Left = 728
    Top = 259
  end
  object dts1: TDataSource
    DataSet = sds
    Left = 760
    Top = 259
  end
  object cdsdetail: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsdetail
    Params = <>
    BeforePost = cdsdetailBeforePost
    OnNewRecord = cdsdetailNewRecord
    Left = 694
    Top = 288
    object cdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsdetailCDITRATEIOcntcusto: TIntegerField
      FieldName = 'CDITRATEIOcntcusto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsdetailCDRATEIOcntcusto: TIntegerField
      FieldName = 'CDRATEIOcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsdetailCDcntcusto: TIntegerField
      FieldName = 'CDcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
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
    object cdsdetailNUcntcusto: TStringField
      FieldName = 'NUcntcusto'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsdetailNUcntcustoValidate
      Size = 100
    end
    object cdsdetailPRRATEIO: TFloatField
      FieldName = 'PRRATEIO'
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
    object cdsdetailNMcntcusto: TStringField
      FieldName = 'NMcntcusto'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dtsdetail: TDataSource
    DataSet = cdsdetail
    Left = 723
    Top = 288
  end
  object pumimprimir: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <>
    UseOwnFont = False
    Left = 416
    Top = 357
  end
  object pumopcoes: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end>
    UseOwnFont = False
    Left = 416
    Top = 298
  end
end
