object frmPedidoBalcao: TfrmPedidoBalcao
  Left = 431
  Top = 96
  ClientHeight = 548
  ClientWidth = 1186
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TcxLabel
    Left = 0
    Top = 63
    Align = alTop
    Caption = 'Pedido Balc'#227'o'
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
  object gbxproduto: TGroupBox
    Left = 0
    Top = 86
    Width = 1186
    Height = 93
    Align = alTop
    Caption = '&Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblcodigo: TLabel
      Left = 4
      Top = 22
      Width = 68
      Height = 24
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 210
      Top = 22
      Width = 57
      Height = 24
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 704
      Top = 22
      Width = 109
      Height = 24
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtnmproduto: TEdit
      Left = 210
      Top = 48
      Width = 491
      Height = 32
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtnmprodutoChange
      OnEnter = edtnmprodutoEnter
      OnExit = edtnmprodutoExit
      OnKeyDown = edtnmprodutoKeyDown
    end
    object edtcddigitado: TcxButtonEdit
      Left = 3
      Top = 48
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edtcddigitadoPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyDown = edtcddigitadoKeyDown
      Width = 201
    end
    object edtqtitem: TcxCalcEdit
      Left = 704
      Top = 48
      EditValue = 0.000000000000000000
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnEnter = colorenter
      OnExit = colorexit
      OnKeyPress = edtqtitemKeyPress
      Width = 121
    end
  end
  object grd: TcxGrid
    Left = 0
    Top = 179
    Width = 1186
    Height = 269
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    object tbv: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
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
      DataController.DataSource = dts
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'QTITEM'
          Column = tbvQTITEM
        end
        item
          Format = 'R$,0.00;-R$,0.00'
          Kind = skSum
          FieldName = 'VLTOTAL'
          Column = tbvVLTOTAL
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tbvCDDIGITADO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CDDIGITADO'
        Width = 200
      end
      object tbvNMPRODUTO: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NMPRODUTO'
        Width = 490
      end
      object tbvQTITEM: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'QTITEM'
        Width = 120
      end
      object tbvVLUNITARIO: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'VLUNITARIO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 120
      end
      object tbvVLTOTAL: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'VLTOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 120
      end
    end
    object lvl: TcxGridLevel
      GridView = tbv
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 448
    Width = 1186
    Height = 100
    Align = alBottom
    TabOrder = 7
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 839
      Height = 98
      Align = alClient
      Caption = '&Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 4
        Top = 24
        Width = 68
        Height = 24
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 210
        Top = 24
        Width = 57
        Height = 24
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtnmcliente: TEdit
        Left = 210
        Top = 50
        Width = 491
        Height = 32
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = edtnmclienteChange
        OnEnter = edtnmprodutoEnter
        OnExit = edtnmprodutoExit
        OnKeyDown = nextcontrol
      end
      object edtcdcliente: TcxButtonEdit
        Left = 4
        Top = 50
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.OnButtonClick = edtcdclientePropertiesButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnEnter = colorenter
        OnExit = colorexit
        OnKeyDown = edtcdclienteKeyDown
        Width = 201
      end
    end
    object GroupBox3: TGroupBox
      Left = 840
      Top = 1
      Width = 345
      Height = 98
      Align = alRight
      Caption = '&Fechamento'
      TabOrder = 1
    end
  end
  object act: TActionList
    Images = dtmmain.imlMain
    OnExecute = actExecute
    Left = 728
    Top = 321
    object actNovo: TAction
      Caption = 'Novo'
      Hint = 'Novo'
      ImageIndex = 0
      ShortCut = 16462
    end
    object actAbrir: TAction
      Caption = 'Abrir'
      Hint = 'Abrir'
      ImageIndex = 1
      ShortCut = 16449
    end
    object actEditar: TAction
      Caption = 'Editar'
      Enabled = False
      Hint = 'Editar'
      ImageIndex = 7
      ShortCut = 16453
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      Enabled = False
      Hint = 'Salvar'
      ImageIndex = 2
      ShortCut = 16467
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
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      Enabled = False
      Hint = 'Cancelar'
      ImageIndex = 4
      ShortCut = 16474
    end
    object actPrimeiro: TAction
      Caption = 'Primeiro'
      Hint = 'Primeiro'
      ImageIndex = 8
      ShortCut = 16454
    end
    object actAnterior: TAction
      Caption = 'Anterior'
      Enabled = False
      Hint = 'Anterior'
      ImageIndex = 9
      ShortCut = 16468
    end
    object actProximo: TAction
      Caption = 'Pr'#243'ximo'
      Enabled = False
      Hint = 'Pr'#243'ximo'
      ImageIndex = 10
      ShortCut = 16464
    end
    object actUltimo: TAction
      Caption = #218'ltimo'
      Hint = #218'ltimo'
      ImageIndex = 11
      ShortCut = 16469
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
    object actgerarsaida: TAction
      Caption = 'Gerar Nota Fiscal'
      ImageIndex = 19
      OnExecute = actgerarsaidaExecute
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
    Left = 824
    Top = 240
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
          ItemName = 'dxBarLargeButton1'
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
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actgerarsaida
      Category = 0
    end
  end
  object pumimprimir: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <>
    UseOwnFont = False
    Left = 752
    Top = 237
  end
  object pumopcoes: TdxBarPopupMenu
    BarManager = bmg1
    ItemLinks = <>
    UseOwnFont = False
    Left = 688
    Top = 242
  end
  object mem: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 792
    Top = 414
    object memCDDIGITADO: TStringField
      FieldName = 'CDDIGITADO'
      Size = 30
    end
    object memNMPRODUTO: TStringField
      FieldName = 'NMPRODUTO'
      Size = 200
    end
    object memQTITEM: TFloatField
      FieldName = 'QTITEM'
    end
    object memVLUNITARIO: TCurrencyField
      FieldName = 'VLUNITARIO'
    end
    object memVLTOTAL: TCurrencyField
      FieldName = 'VLTOTAL'
    end
    object memcditpedido: TIntegerField
      FieldName = 'cditpedido'
    end
    object memCDPRODUTO: TIntegerField
      FieldName = 'CDPRODUTO'
    end
  end
  object dts: TDataSource
    DataSet = mem
    Left = 840
    Top = 414
  end
end
