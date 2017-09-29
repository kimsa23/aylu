object frmImportacao: TfrmImportacao
  Left = 475
  Top = 175
  ClientHeight = 570
  ClientWidth = 1023
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
    Top = 67
    Width = 1023
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
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 86
    Width = 1023
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object Label3: TLabel
      Left = 68
      Top = 0
      Width = 28
      Height = 13
      Caption = 'Nome'
      Transparent = True
    end
    object Label2: TLabel
      Left = 311
      Top = 0
      Width = 33
      Height = 13
      Caption = 'Tabela'
      Transparent = True
    end
    object lblcdtpimportacao: TLabel
      Left = 640
      Top = 0
      Width = 21
      Height = 13
      Caption = 'Tipo'
      Transparent = True
    end
    object edtcodigo: TcxTextEdit
      Left = 4
      Top = 13
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnEnter = edtcodigoEnter
      OnKeyDown = edtcodigoKeyDown
      OnKeyPress = edtcodigoKeyPress
      Width = 63
    end
    object edtnome: TcxDBTextEdit
      Left = 68
      Top = 13
      DataBinding.DataField = 'NMIMPORTACAO'
      DataBinding.DataSource = dts
      Properties.CharCase = ecUpperCase
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
    object edtNMTABELA: TcxDBTextEdit
      Left = 311
      Top = 13
      DataBinding.DataField = 'NMTABELA'
      DataBinding.DataSource = dts
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = nextcontrol
      Width = 243
    end
    object cbxcdtpimportacao: TcxDBLookupComboBox
      Left = 640
      Top = 13
      DataBinding.DataField = 'CDTPIMPORTACAO'
      DataBinding.DataSource = dts
      Properties.KeyFieldNames = 'CDTPIMPORTACAO'
      Properties.ListColumns = <
        item
          FieldName = 'NMTPIMPORTACAO'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnEnter = colorenter
      OnExit = colorexit
      Width = 230
    end
    object btnbuscarcampos: TButton
      Left = 556
      Top = 14
      Width = 83
      Height = 20
      Action = actbuscarcampos
      TabOrder = 3
    end
  end
  object grd: TcxGrid
    Left = 0
    Top = 127
    Width = 1023
    Height = 443
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    object tbv: TcxGridDBTableView
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
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvNMCAMPO: TcxGridDBColumn
        Caption = 'Campo'
        DataBinding.FieldName = 'NMCAMPO'
        Width = 200
      end
      object tbvNMCELULA: TcxGridDBColumn
        Caption = 'C'#233'lula'
        DataBinding.FieldName = 'NMCELULA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 50
      end
      object tbvVLPADRAO: TcxGridDBColumn
        Caption = 'Valor Padr'#227'o'
        DataBinding.FieldName = 'VLPADRAO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 200
      end
      object tbvNMTABELA2: TcxGridDBColumn
        Caption = 'Tabela Auxiliar'
        DataBinding.FieldName = 'NMTABELA2'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 200
      end
      object tbvNMCAMPO2: TcxGridDBColumn
        Caption = 'Campo auxiliar'
        DataBinding.FieldName = 'NMCAMPO2'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        Width = 200
      end
    end
    object lvl: TcxGridLevel
      GridView = tbv
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 536
    Top = 406
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
      Caption = '329 - Imprimir'
      Enabled = False
      Hint = 'Imprimir'
      ImageIndex = 3
      ShortCut = 16457
    end
    object actimprimirboleto: TAction
      Caption = 'Imprimir Boleto'
      ImageIndex = 3
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
    object actgerarremessa: TAction
      Caption = 'Gerar Remessa'
      ImageIndex = 12
    end
    object actfiltrar: TAction
      Caption = 'Filtrar'
      ImageIndex = 13
    end
    object actadicionarnota: TAction
      Caption = 'Adicionar Nota'
      ImageIndex = 19
    end
    object actadicionarfaturamento: TAction
      Caption = 'Adicionar Faturamento'
      ImageIndex = 128
    end
    object actabrirduplicata: TAction
      Hint = 'duplicata'
    end
    object actabrircliente: TAction
      Hint = 'cliente'
    end
    object actdebitoautomatico: TAction
      Caption = 'D'#233'bito Autom'#225'tico'
    end
    object actbuscarcampos: TAction
      Tag = 3
      Caption = 'Buscar Campos'
      Enabled = False
      Visible = False
      OnExecute = actbuscarcamposExecute
    end
    object actimportar: TAction
      Tag = 2
      Caption = 'Importar'
      Enabled = False
      Visible = False
      OnExecute = actimportarExecute
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
    Left = 532
    Top = 302
    DockControlHeights = (
      0
      0
      67
      0)
    object dxbrManager1Bar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'cobranca'
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
          ItemName = 'dxBarLargeButton1'
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
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actimportar
      Category = 0
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    BeforePost = cdsBeforePost
    AfterScroll = cdsAfterScroll
    OnNewRecord = cdsNewRecord
    Left = 418
    Top = 310
    object cdssdsdetail: TDataSetField
      FieldName = 'sdsdetail'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDIMPORTACAO: TIntegerField
      FieldName = 'CDIMPORTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCDTPIMPORTACAO: TIntegerField
      FieldName = 'CDTPIMPORTACAO'
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
    object cdsNMIMPORTACAO: TStringField
      FieldName = 'NMIMPORTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsNMTABELA: TStringField
      FieldName = 'NMTABELA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dts: TDataSource
    DataSet = cds
    Left = 446
    Top = 310
  end
  object sds: TSQLDataSet
    CommandText = 
      'SELECT * FROM IMPORTACAO WHERE CDEMPRESA=:CDEMPRESA AND CDIMPORT' +
      'ACAO=:CDIMPORTACAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CDIMPORTACAO'
        ParamType = ptInput
      end>
    SQLConnection = dtmmain.sqlc
    Left = 360
    Top = 310
    object sdsCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDIMPORTACAO: TIntegerField
      FieldName = 'CDIMPORTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCDTPIMPORTACAO: TIntegerField
      FieldName = 'CDTPIMPORTACAO'
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
    object sdsNMIMPORTACAO: TStringField
      FieldName = 'NMIMPORTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sdsNMTABELA: TStringField
      FieldName = 'NMTABELA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspBeforeUpdateRecord
    Left = 389
    Top = 310
  end
  object sdsdetail: TSQLDataSet
    CommandText = 
      'SELECT * FROM ITIMPORTACAO WHERE CDEMPRESA=:CDEMPRESA AND CDIMPO' +
      'RTACAO=:CDIMPORTACAO'
    DataSource = dts1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftLargeint
        Name = 'CDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CDIMPORTACAO'
        ParamType = ptInput
      end>
    SQLConnection = dtmmain.sqlc
    Left = 359
    Top = 338
    object sdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsdetailCDITIMPORTACAO: TIntegerField
      FieldName = 'CDITIMPORTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsdetailCDIMPORTACAO: TIntegerField
      FieldName = 'CDIMPORTACAO'
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
    object sdsdetailNMCAMPO: TStringField
      FieldName = 'NMCAMPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sdsdetailNMCELULA: TStringField
      FieldName = 'NMCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sdsdetailVLPADRAO: TStringField
      FieldName = 'VLPADRAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdsdetailNMTABELA2: TStringField
      FieldName = 'NMTABELA2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sdsdetailNMCAMPO2: TStringField
      FieldName = 'NMCAMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsdetail: TClientDataSet
    Aggregates = <>
    DataSetField = cdssdsdetail
    Params = <>
    BeforePost = cdsdetailBeforePost
    OnNewRecord = cdsdetailNewRecord
    Left = 416
    Top = 338
    object cdsdetailCDEMPRESA: TLargeintField
      FieldName = 'CDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsdetailCDITIMPORTACAO: TIntegerField
      FieldName = 'CDITIMPORTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsdetailCDIMPORTACAO: TIntegerField
      FieldName = 'CDIMPORTACAO'
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
    object cdsdetailNMCAMPO: TStringField
      FieldName = 'NMCAMPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsdetailNMCELULA: TStringField
      FieldName = 'NMCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsdetailVLPADRAO: TStringField
      FieldName = 'VLPADRAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsdetailNMTABELA2: TStringField
      FieldName = 'NMTABELA2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsdetailNMCAMPO2: TStringField
      FieldName = 'NMCAMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dtsdetail: TDataSource
    DataSet = cdsdetail
    Left = 444
    Top = 338
  end
  object dts1: TDataSource
    DataSet = sds
    Left = 475
    Top = 310
  end
end
