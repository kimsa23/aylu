object frmLivroProducaoImprimir: TfrmLivroProducaoImprimir
  Left = 577
  Top = 247
  ClientHeight = 306
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dtslivro: TDataSource
    Left = 28
  end
  object dtsempresa: TDataSource
    Left = 28
    Top = 66
  end
  object dtsmovproducao: TDataSource
    Left = 37
    Top = 145
  end
  object dbdmovproducao: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 123
    Top = 144
  end
  object frxmovproducao: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42950.608462615710000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42950.608502777800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 210
    Top = 144
    Datasets = <
      item
        DataSet = dbdmovproducao
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 289.380000000000000000
      PaperSize = 119
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      ColumnWidth = 265.612800000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 66.999728310000000000
        Top = 18.897650000000000000
        Width = 745.701269000000000000
        object Shape99: TfrxShapeView
          Width = 747.001427320000000000
          Height = 66.999728310000000000
        end
        object Label176: TfrxMemoView
          Left = 224.001404510000000000
          Top = 3.998742740000001000
          Width = 298.000822380000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RESUMO DA MOVIMENTA'#199#195'O DA PRODU'#199#195'O')
          ParentFont = False
        end
        object Label182: TfrxMemoView
          Left = 5.000318190000000000
          Top = 32.999076430000000000
          Width = 109.999441120000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'M'#234's de refer'#234'ncia:')
        end
        object lblnmempresa: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999999000
          Width = 102.999751560000000000
          Height = 20.001272760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SystemVariable5: TfrxMemoView
          Left = 676.002956270000000000
          Top = 24.000015500000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            '[Time]')
        end
        object SystemVariable101: TfrxMemoView
          Left = 676.002956270000000000
          Top = 6.999689560000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
        end
        object Label184: TfrxMemoView
          Left = 640.002933020000000000
          Top = 6.999689560000000000
          Width = 29.000333690000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object Label185: TfrxMemoView
          Left = 639.001357570000000000
          Top = 24.000015500000000000
          Width = 30.001909140000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object lblmesperiodo: TfrxMemoView
          Left = 114.999759310000000000
          Top = 32.999076430000000000
          Width = 90.878798850000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'lblmesperiodo')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 109.606370000000000000
        Width = 745.701269000000000000
        DataSet = dbdmovproducao
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object DBText84: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999996000
          Width = 42.999712810000000000
          Height = 13.598748940000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CDBITOLA"]')
          ParentFont = False
        end
        object DBText85: TfrxMemoView
          Left = 58.998463300000000000
          Top = 3.000946819999996000
          Width = 191.002328080000000000
          Height = 13.598748940000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMBITOLA"]')
          ParentFont = False
        end
        object Line168: TfrxLineView
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line169: TfrxLineView
          Top = 17.000325940000000000
          Width = 747.001427320000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line170: TfrxLineView
          Left = 741.003313210000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line171: TfrxLineView
          Left = 53.000349190000000000
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line172: TfrxLineView
          Left = 287.002390080000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line173: TfrxLineView
          Left = 378.002133890000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line174: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line175: TfrxLineView
          Left = 596.001644760000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line176: TfrxLineView
          Left = 668.001691260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object qtentproprio: TfrxMemoView
          Left = 385.001823450000000000
          Top = 3.000946819999996000
          Width = 104.001327010000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object qtitemsaida: TfrxMemoView
          Left = 497.000635940000000000
          Top = 3.000946819999996000
          Width = 94.998486550000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object qtitementrada: TfrxMemoView
          Left = 600.000387500000000000
          Top = 3.000946819999996000
          Width = 63.998781490000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMENTRADA"]')
          ParentFont = False
        end
        object qtestoque: TfrxMemoView
          Left = 674.003584900000000000
          Top = 3.000946819999996000
          Width = 66.999728310000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object qtentproprio1: TfrxMemoView
          Left = 291.001132820000000000
          Top = 3.000946819999996000
          Width = 82.998478800000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 20.999068680000000000
        Top = 151.181200000000000000
        Width = 745.701269000000000000
        object Shape100: TfrxShapeView
          Width = 747.001427320000000000
          Height = 20.999068680000000000
        end
        object Label183: TfrxMemoView
          Left = 551.002560580000000000
          Top = 3.000946819999996000
          Width = 188.999177180000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Quipos Tecnologia em Software')
        end
        object SystemVariable1: TfrxMemoView
          Left = 3.998742740000000000
          Top = 3.000946819999996000
          Width = 82.000682880000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Page [Page#] of [TotalPages#]')
        end
      end
      object Foreground2: TfrxReportSummary
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 340.157700000000000000
        Width = 745.701269000000000000
        object Shape110: TfrxShapeView
          Width = 747.001427320000000000
          Height = 20.001272760000000000
        end
        object Label195: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000006000
          Width = 68.999099680000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Total Geral')
          ParentFont = False
        end
        object lbltotqtestoque: TfrxMemoView
          Left = 672.000434000000000000
          Top = 3.000946820000024000
          Width = 68.999099680000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object Line182: TfrxLineView
          Left = 668.001691260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtitementrada: TfrxMemoView
          Left = 604.002909770000000000
          Top = 3.000946820000024000
          Width = 61.999410120000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMENTRADA"]')
          ParentFont = False
        end
        object Line1801: TfrxLineView
          Left = 596.001644760000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtitemsaida: TfrxMemoView
          Left = 498.002211390000000000
          Top = 3.000946820000024000
          Width = 94.998486550000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object Line184: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtentproprio: TfrxMemoView
          Left = 385.999619370000000000
          Top = 3.000946820000024000
          Width = 102.999751560000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object Line185: TfrxLineView
          Left = 378.002133890000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line186: TfrxLineView
          Left = 287.002390080000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtentproprio2: TfrxMemoView
          Left = 291.001132820000000000
          Top = 3.000946820000024000
          Width = 82.998478800000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 41.000341440000000000
        Top = 196.535560000000000000
        Width = 745.701269000000000000
        object Shape108: TfrxShapeView
          Left = 668.001691260000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape107: TfrxShapeView
          Left = 596.001644760000000000
          Top = 20.001272760000010000
          Width = 73.001621950000000000
          Height = 20.999068680000000000
        end
        object Shape106: TfrxShapeView
          Left = 493.999689120000000000
          Top = 20.001272760000010000
          Width = 102.999751560000000000
          Height = 20.999068680000000000
        end
        object Shape105: TfrxShapeView
          Left = 378.002133890000000000
          Top = 20.001272760000010000
          Width = 116.999130680000000000
          Height = 20.999068680000000000
        end
        object Shape104: TfrxShapeView
          Left = 286.000814630000000000
          Top = 20.001272760000010000
          Width = 92.999115180000000000
          Height = 20.999068680000000000
        end
        object Shape103: TfrxShapeView
          Left = 53.000349190000000000
          Top = 20.001272760000010000
          Width = 234.999836810000000000
          Height = 20.999068680000000000
        end
        object Shape1001: TfrxShapeView
          Width = 747.001427320000000000
          Height = 20.999068680000000000
        end
        object Label186: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999996000
          Width = 52.478774050000000000
          Height = 15.201269660000000000
          Memo.UTF8W = (
            'GRUPO:')
        end
        object DBText83: TfrxMemoView
          Left = 60.000038750000000000
          Top = 3.000946819999996000
          Width = 305.000511940000000000
          Height = 15.000954570000000000
          DataSetName = 'pipmovproducao'
          Memo.UTF8W = (
            '[frxDBDataset1."NMGRUPO"]')
        end
        object Label188: TfrxMemoView
          Left = 61.999410120000000000
          Top = 22.998440050000000000
          Width = 46.000659630000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Produto')
        end
        object Label189: TfrxMemoView
          Left = 289.999557370000000000
          Top = 22.998440050000000000
          Width = 84.000054250000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Saldo Anterior')
        end
        object Label190: TfrxMemoView
          Left = 384.000248000000000000
          Top = 22.998440050000000000
          Width = 104.001327010000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Produ'#231#227'o no M'#234's')
        end
        object Label1901: TfrxMemoView
          Left = 500.001582760000000000
          Top = 22.998440050000000000
          Width = 92.001319260000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Vendas no M'#234's')
        end
        object Label192: TfrxMemoView
          Left = 601.999758870000000000
          Top = 22.998440050000000000
          Width = 61.999410120000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Devolu'#231#227'o')
        end
        object Label193: TfrxMemoView
          Left = 674.003584900000000000
          Top = 22.998440050000000000
          Width = 66.081302520000000000
          Height = 15.201269660000000000
          Memo.UTF8W = (
            'Saldo Final')
        end
        object Shape102: TfrxShapeView
          Top = 20.001272760000010000
          Width = 54.001924640000000000
          Height = 20.999068680000000000
        end
        object Label187: TfrxMemoView
          Left = 5.000318190000000000
          Top = 22.998440050000000000
          Width = 44.001288260000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'C'#243'd')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 260.787570000000000000
        Width = 745.701269000000000000
        object Shape1002: TfrxShapeView
          Width = 747.001427320000000000
          Height = 20.001272760000000000
        end
        object lblmesperiodo1: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000006000
          Width = 31.838760720000000000
          Height = 15.518750180000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Line177: TfrxLineView
          Left = 287.002390080000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line178: TfrxLineView
          Left = 378.002133890000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line179: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line180: TfrxLineView
          Left = 596.001644760000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line181: TfrxLineView
          Left = 668.001691260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lblsumQTENTPROPRIO: TfrxMemoView
          Left = 385.999619370000000000
          Top = 3.000946820000024000
          Width = 102.999751560000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object lblsumQTITEMSAIDA: TfrxMemoView
          Left = 498.002211390000000000
          Top = 3.000946820000024000
          Width = 94.998486550000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object lblsumQTITEMENTRADA: TfrxMemoView
          Left = 601.999758870000000000
          Top = 3.000946820000024000
          Width = 61.999410120000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMENTRADA"]')
          ParentFont = False
        end
        object lblsumQTESTOQUE: TfrxMemoView
          Left = 673.002009450000000000
          Top = 3.000946820000024000
          Width = 68.999099680000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object lblsumQTENTPROPRIO2: TfrxMemoView
          Left = 291.001132820000000000
          Top = 3.000946820000024000
          Width = 82.998478800000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
      end
    end
  end
  object frx1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42950.588128888900000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42950.588173125000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 290
    Top = 144
    Datasets = <
      item
        DataSet = dbdmovproducao
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 289.380000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 119
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      ColumnWidth = 265.612800000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 51.000977820000000000
        Top = 18.897650000000000000
        Width = 1045.720360400000000000
        object Shape99: TfrxShapeView
          Width = 1045.720360400000000000
          Height = 51.000977820000000000
        end
        object Label176: TfrxMemoView
          Left = 351.001171570000000000
          Top = 1.999371369999999000
          Width = 296.001451010000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RESUMO DA MOVIMENTA'#199#195'O DA PRODU'#199#195'O')
          ParentFont = False
        end
        object Label182: TfrxMemoView
          Left = 5.000318190000000000
          Top = 32.999076430000000000
          Width = 109.999441120000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'M'#234's de refer'#234'ncia:')
        end
        object lblnmempresa: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999999000
          Width = 102.999751560000000000
          Height = 20.001272760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SystemVariable5: TfrxMemoView
          Left = 975.001574570000000000
          Top = 24.000015500000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            '[Time]')
        end
        object SystemVariable101: TfrxMemoView
          Left = 975.001574570000000000
          Top = 6.999689560000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
        end
        object Label184: TfrxMemoView
          Left = 939.001551320000000000
          Top = 6.999689560000000000
          Width = 29.000333690000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object Label185: TfrxMemoView
          Left = 938.003755400000000000
          Top = 24.000015500000000000
          Width = 30.001909140000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object lblmesperiodo: TfrxMemoView
          Left = 114.999759310000000000
          Top = 32.999076430000000000
          Width = 90.878798850000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'lblmesperiodo')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 158.740260000000000000
        Width = 1045.720360400000000000
        DataSet = dbdmovproducao
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object DBText84: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999996000
          Width = 42.999712810000000000
          Height = 13.598748940000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CDBITOLA"]')
          ParentFont = False
        end
        object DBText85: TfrxMemoView
          Left = 58.998463300000000000
          Top = 3.000946819999996000
          Width = 267.001117320000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMBITOLA"]')
          ParentFont = False
        end
        object Line168: TfrxLineView
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line169: TfrxLineView
          Top = 17.000325940000010000
          Width = 1045.720360400000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line170: TfrxLineView
          Left = 1039.370750000000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line171: TfrxLineView
          Left = 53.000349190000000000
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line172: TfrxLineView
          Left = 324.000209250000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line173: TfrxLineView
          Left = 416.001528510000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line174: TfrxLineView
          Left = 811.003988340000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line175: TfrxLineView
          Left = 889.002148950000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line176: TfrxLineView
          Left = 967.004089090000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object qtentproprio: TfrxMemoView
          Left = 733.002048200000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object qtitemsaida: TfrxMemoView
          Left = 811.003988340000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object qtitementrada: TfrxMemoView
          Left = 889.002148950000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVVENDA"]')
          ParentFont = False
        end
        object qtestoque: TfrxMemoView
          Left = 967.004089090000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object qtentproprio1: TfrxMemoView
          Left = 329.000527440000000000
          Top = 3.000946819999996000
          Width = 92.999115180000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
        object qtentproprio2: TfrxMemoView
          Left = 655.000108060000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCOMPRA"]')
          ParentFont = False
        end
        object DBText21: TfrxMemoView
          Left = 577.001947450000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVCOMPRA"]')
          ParentFont = False
        end
        object DBText22: TfrxMemoView
          Left = 499.000007310000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCONSUMO"]')
          ParentFont = False
        end
        object DBText23: TfrxMemoView
          Left = 421.001846700000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTBAIXA"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 416.001528510000000000
          Top = 1.999371370000006000
          Height = 18.001901390000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line53: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line56: TfrxLineView
          Left = 572.001629260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line59: TfrxLineView
          Left = 650.003569400000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line62: TfrxLineView
          Left = 728.001730010000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 20.999068680000000000
        Top = 241.889920000000000000
        Width = 1045.720360400000000000
        object Shape100: TfrxShapeView
          Width = 1045.720360400000000000
          Height = 20.999068680000000000
        end
        object Label183: TfrxMemoView
          Left = 851.002754330000000000
          Top = 1.999371370000006000
          Width = 188.999177180000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Quipos Tecnologia em Software')
        end
        object SystemVariable1: TfrxMemoView
          Left = 3.998742740000000000
          Top = 3.000946819999996000
          Width = 82.000682880000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Page [Page#] of [TotalPages#]')
        end
      end
      object Foreground5: TfrxReportSummary
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 325.039580000000000000
        Width = 1045.720360400000000000
        object Shape110: TfrxShapeView
          Width = 1045.720360400000000000
          Height = 20.001272760000000000
        end
        object Label195: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000006000
          Width = 68.999099680000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Total Geral')
          ParentFont = False
        end
        object lbltotqtestoque: TfrxMemoView
          Left = 967.004089090000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object Line182: TfrxLineView
          Left = 967.004089090000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtitementrada: TfrxMemoView
          Left = 889.002148950000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVVENDA"]')
          ParentFont = False
        end
        object Line1801: TfrxLineView
          Left = 889.002148950000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtitemsaida: TfrxMemoView
          Left = 811.003988340000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object Line184: TfrxLineView
          Left = 811.003988340000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtentproprio: TfrxMemoView
          Left = 733.002048200000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object Line185: TfrxLineView
          Left = 416.001528510000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line186: TfrxLineView
          Left = 324.000209250000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lbltotqtentproprio2: TfrxMemoView
          Left = 329.000527440000000000
          Top = 3.000946820000024000
          Width = 92.999115180000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
        object lbltotqtentproprio1: TfrxMemoView
          Left = 655.000108060000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCOMPRA"]')
          ParentFont = False
        end
        object DBCalc16: TfrxMemoView
          Left = 577.001947450000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVCOMPRA"]')
          ParentFont = False
        end
        object DBCalc18: TfrxMemoView
          Left = 499.000007310000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCONSUMO"]')
          ParentFont = False
        end
        object DBCalc20: TfrxMemoView
          Left = 421.001846700000000000
          Top = 3.000946820000024000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTBAIXA"]')
          ParentFont = False
        end
        object Line52: TfrxLineView
          Left = 416.001528510000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line58: TfrxLineView
          Left = 572.001629260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line61: TfrxLineView
          Left = 650.003569400000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line64: TfrxLineView
          Left = 728.001730010000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 41.000341440000000000
        Top = 94.488250000000000000
        Width = 1045.720360400000000000
        object Shape108: TfrxShapeView
          Left = 966.803774000000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape107: TfrxShapeView
          Left = 577.001947450000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape106: TfrxShapeView
          Left = 499.000007310000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape105: TfrxShapeView
          Left = 421.001846700000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape104: TfrxShapeView
          Left = 329.000527440000000000
          Top = 20.001272760000010000
          Width = 92.999115180000000000
          Height = 20.999068680000000000
        end
        object Shape103: TfrxShapeView
          Left = 53.000349190000000000
          Top = 20.001272760000010000
          Width = 277.001753700000000000
          Height = 20.999068680000000000
        end
        object Shape1001: TfrxShapeView
          Width = 1045.720360400000000000
          Height = 20.999068680000000000
        end
        object Label186: TfrxMemoView
          Left = 5.000318190000000000
          Top = 3.000946819999996000
          Width = 52.478774050000000000
          Height = 15.201269660000000000
          Memo.UTF8W = (
            'GRUPO:')
        end
        object DBText83: TfrxMemoView
          Left = 60.000038750000000000
          Top = 3.000946819999996000
          Width = 305.000511940000000000
          Height = 15.000954570000000000
          DataSetName = 'pipmovproducao'
          Memo.UTF8W = (
            '[frxDBDataset1."NMGRUPO"]')
        end
        object Label188: TfrxMemoView
          Left = 61.999410120000000000
          Top = 22.998440050000000000
          Width = 46.000659630000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'Produto')
        end
        object Label189: TfrxMemoView
          Left = 333.978168450000000000
          Top = 22.998440050000000000
          Width = 83.040053630000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo Anterior')
        end
        object Label193: TfrxMemoView
          Left = 967.004089090000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo Final')
        end
        object Shape102: TfrxShapeView
          Top = 20.001272760000010000
          Width = 54.001924640000000000
          Height = 20.999068680000000000
        end
        object Label187: TfrxMemoView
          Left = 5.000318190000000000
          Top = 22.998440050000000000
          Width = 44.001288260000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            'C'#243'd')
        end
        object Shape46: TfrxShapeView
          Left = 889.002148950000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape47: TfrxShapeView
          Left = 811.003988340000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape48: TfrxShapeView
          Left = 733.002048200000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Shape49: TfrxShapeView
          Left = 655.000108060000000000
          Top = 20.001272760000010000
          Width = 78.999736060000000000
          Height = 20.999068680000000000
        end
        object Label192: TfrxMemoView
          Left = 889.002148950000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Dev Venda')
        end
        object Label1901: TfrxMemoView
          Left = 811.003988340000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Vendas')
        end
        object Label190: TfrxMemoView
          Left = 733.002048200000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Produ'#231#227'o')
        end
        object Label1902: TfrxMemoView
          Left = 655.000108060000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.201269660000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Compra')
        end
        object Label72: TfrxMemoView
          Left = 577.001947450000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.000954570000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Dev Compra')
        end
        object Label73: TfrxMemoView
          Left = 499.000007310000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.000954570000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Consumo')
        end
        object Label74: TfrxMemoView
          Left = 421.001846700000000000
          Top = 22.998440050000000000
          Width = 78.999736060000000000
          Height = 15.000954570000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Baixa')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 20.001272760000000000
        Top = 200.315090000000000000
        Width = 1045.720360400000000000
        object Shape1002: TfrxShapeView
          Width = 1045.720360400000000000
          Height = 20.001272760000000000
        end
        object lblmesperiodo1: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000006000
          Width = 31.838760720000000000
          Height = 15.518750180000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Line177: TfrxLineView
          Left = 324.000209250000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line178: TfrxLineView
          Left = 416.001528510000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line179: TfrxLineView
          Left = 811.003988340000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line180: TfrxLineView
          Left = 889.002148950000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line181: TfrxLineView
          Left = 967.004089090000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object lblsumQTENTPROPRIO: TfrxMemoView
          Left = 733.002048200000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTENTPROPRIO"]')
          ParentFont = False
        end
        object lblsumQTITEMSAIDA: TfrxMemoView
          Left = 811.003988340000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTITEMSAIDA"]')
          ParentFont = False
        end
        object lblsumQTITEMENTRADA: TfrxMemoView
          Left = 889.002148950000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVVENDA"]')
          ParentFont = False
        end
        object lblsumQTESTOQUE: TfrxMemoView
          Left = 967.004089090000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUE"]')
          ParentFont = False
        end
        object lblsumQTENTPROPRIO2: TfrxMemoView
          Left = 329.000527440000000000
          Top = 3.000946819999996000
          Width = 92.999115180000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTESTOQUEANTERIOR"]')
          ParentFont = False
        end
        object lblsumQTENTPROPRIO1: TfrxMemoView
          Left = 655.000108060000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCOMPRA"]')
          ParentFont = False
        end
        object DBCalc15: TfrxMemoView
          Left = 577.001947450000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTDVCOMPRA"]')
          ParentFont = False
        end
        object DBCalc17: TfrxMemoView
          Left = 499.000007310000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCONSUMO"]')
          ParentFont = False
        end
        object DBCalc19: TfrxMemoView
          Left = 421.001846700000000000
          Top = 3.000946819999996000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataSetName = 'pipmovproducao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTBAIXA"]')
          ParentFont = False
        end
        object Line51: TfrxLineView
          Left = 416.001528510000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line54: TfrxLineView
          Left = 493.999689120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line57: TfrxLineView
          Left = 572.001629260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line60: TfrxLineView
          Left = 650.003569400000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line601: TfrxLineView
          Left = 728.001730010000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
    end
  end
  object dbdempresa: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 115
    Top = 72
  end
  object frxTermoAbertura: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42950.588713402800000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42950.588747280100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 202
    Top = 72
    Datasets = <
      item
        DataSet = dbdempresa
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 420.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 8
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Top = 18.897650000000000000
        Width = 1539.402569000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 1054.001310630000000000
        Top = 41.574830000000000000
        Width = 1539.402569000000000000
        DataSet = dbdempresa
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object lblnmmunicipio: TfrxMemoView
          Left = 603.001334320000000000
          Top = 769.002071450000000000
          Width = 99.840064480000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TfrxMemoView
          Left = 1354.005283910000000000
          Top = 181.999487620000000000
          Width = 44.001288260000000000
          Height = 18.001901390000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Folha:')
          ParentFont = False
        end
        object Label38: TfrxMemoView
          Left = 407.002467580000000000
          Top = 228.000147250000000000
          Width = 725.000783190000000000
          Height = 25.001590950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LIVRO REGISTRO CONTROLE DA PRODU'#199#195'O E DO ESTOQUE - RCPE')
          ParentFont = False
        end
        object Label39: TfrxMemoView
          Left = 675.001380820000000000
          Top = 264.000170500000000000
          Width = 188.999177180000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'MODELO P3')
          ParentFont = False
        end
        object Label40: TfrxMemoView
          Left = 622.001031630000000000
          Top = 300.000193750000000000
          Width = 195.998866740000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#218'MERO DE ORDEM: ')
          ParentFont = False
        end
        object lbltermo: TfrxMemoView
          Left = 649.001993950000000000
          Top = 361.001807950000000000
          Width = 240.000155000000000000
          Height = 25.001590950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'TERMO DE ABERTURA')
          ParentFont = False
        end
        object Label42: TfrxMemoView
          Left = 420.582318870000000000
          Top = 424.002793519999900000
          Width = 162.001994390000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cont'#233'm este Livro')
          ParentFont = False
        end
        object Label43: TfrxMemoView
          Left = 466.000930880000000000
          Top = 447.001233569999900000
          Width = 536.001606010000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'por sistema de processamento de dados, do n'#250'mero 0001 ao ')
          ParentFont = False
        end
        object Label44: TfrxMemoView
          Left = 485.000628190000000000
          Top = 469.999673619999900000
          Width = 568.002886520000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'e servir'#225' para o lan'#231'amento das opera'#231#245'es pr'#243'prias do')
          ParentFont = False
        end
        object Label45: TfrxMemoView
          Left = 538.000977380000000000
          Top = 493.001893199999900000
          Width = 462.002188140000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'estabelecimento do contribuinte abaixo identificado:')
          ParentFont = False
        end
        object Label46: TfrxMemoView
          Left = 433.001854450000000000
          Top = 552.000356499999900000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'NOME............')
          ParentFont = False
        end
        object Label47: TfrxMemoView
          Left = 433.001854450000000000
          Top = 573.003204710000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O........')
          ParentFont = False
        end
        object Label48: TfrxMemoView
          Left = 433.001854450000000000
          Top = 595.000069310000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'BAIRRO..........')
          ParentFont = False
        end
        object Label49: TfrxMemoView
          Left = 433.001854450000000000
          Top = 616.002917520000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'CEP.............')
          ParentFont = False
        end
        object Label50: TfrxMemoView
          Left = 433.001854450000000000
          Top = 637.001986200000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'MUNIC'#205'PIO.......')
          ParentFont = False
        end
        object Label51: TfrxMemoView
          Left = 433.001854450000000000
          Top = 658.001054880000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'UF..............')
          ParentFont = False
        end
        object Label52: TfrxMemoView
          Left = 433.001854450000000000
          Top = 680.001699009999900000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'INSCR. ESTADUAL.')
          ParentFont = False
        end
        object Label53: TfrxMemoView
          Left = 433.001854450000000000
          Top = 702.002343140000000000
          Width = 181.001691700000000000
          Height = 20.999068680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ............')
          ParentFont = False
        end
        object DBText1: TfrxMemoView
          Left = 622.001031630000000000
          Top = 552.000356499999900000
          Width = 149.438836670000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."RZSOCIAL"]')
          ParentFont = False
        end
        object DBText6: TfrxMemoView
          Left = 622.001031630000000000
          Top = 595.000069310000000000
          Width = 72.638787070000010000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMBAIRRO"]')
          ParentFont = False
        end
        object DBText7: TfrxMemoView
          Left = 622.001031630000000000
          Top = 616.002917520000000000
          Width = 89.438797920000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUCEP"]')
          ParentFont = False
        end
        object municipio: TfrxMemoView
          Left = 622.001031630000000000
          Top = 637.001986200000000000
          Width = 98.721323600000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."MUNICIPIO"]')
          ParentFont = False
        end
        object DBText3: TfrxMemoView
          Left = 622.001031630000000000
          Top = 658.001054880000000000
          Width = 135.201347160000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMUF"]')
          ParentFont = False
        end
        object DBText101: TfrxMemoView
          Left = 622.001031630000000000
          Top = 680.001699010000000000
          Width = 145.761353980000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUINSCEST"]')
          ParentFont = False
        end
        object DBText4: TfrxMemoView
          Left = 622.001031630000000000
          Top = 702.002343140000000000
          Width = 167.678848450000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUCNPJ"]')
          ParentFont = False
        end
        object lblresponsavelabertura: TfrxMemoView
          Left = 738.920792180000000000
          Top = 849.003382960000000000
          Width = 4.161262530000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
        end
        object Line18: TfrxLineView
          Left = 397.999627120000000000
          Top = 831.001481570000000000
          Width = 686.003592650000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Label56: TfrxMemoView
          Left = 661.002001700000000000
          Top = 424.002793520000000000
          Width = 457.999665870000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'folhas numeradas autom'#225'ticamente e seguidamente ')
          ParentFont = False
        end
        object pplblnupaginas: TfrxMemoView
          Left = 585.003212460000000000
          Top = 424.002793520000000000
          Width = 72.000046500000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'pplblnupaginas')
          ParentFont = False
        end
        object lblnuordem: TfrxMemoView
          Left = 831.001481570000000000
          Top = 300.000193750000000000
          Width = 85.001629700000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '001')
          ParentFont = False
        end
        object pplblnupaginas1: TfrxMemoView
          Left = 1006.001279630000000000
          Top = 447.001233569999900000
          Width = 66.001932390000000000
          Height = 22.000644130000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '0100')
          ParentFont = False
        end
        object lblfolha1: TfrxMemoView
          Left = 1418.004065400000000000
          Top = 181.999487620000000000
          Width = 34.998447800000000000
          Height = 18.001901390000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0001')
          ParentFont = False
        end
        object nmresponsavel: TfrxMemoView
          Left = 627.001349820000000000
          Top = 729.003305460000000000
          Width = 65.000356940000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMRESPONSAVEL"]')
          ParentFont = False
        end
        object LBLENDERECO: TfrxMemoView
          Left = 622.001031630000000000
          Top = 573.003204710000000000
          Width = 4.161262530000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblresponsavelabertura1: TfrxMemoView
          Left = 397.999627120000000000
          Top = 873.003398460000000000
          Width = 686.003592650000000000
          Height = 21.600013950000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
        end
        object nmresponsavel1: TfrxMemoView
          Left = 627.001349820000000000
          Top = 750.002374140000000000
          Width = 65.000356940000000000
          Height = 21.600013950000000000
          DataSetName = 'pipempresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUCPF"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Top = 1118.740880000000000000
        Width = 1539.402569000000000000
      end
    end
  end
  object dbdlivro: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 115
    Top = 8
  end
  object frxlivroimprimir: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42950.588397048600000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42950.588423298600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 202
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 289.380000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 119
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      ColumnWidth = 567.802560000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 164.001365760000000000
        Top = 18.897650000000000000
        Width = 1045.720360400000000000
        object Shape23: TfrxShapeView
          Left = 284.001443260000000000
          Top = 145.999464370000000000
          Width = 171.998851240000000000
          Height = 18.001901390000000000
        end
        object Shape24: TfrxShapeView
          Left = 243.001101820000000000
          Top = 145.001668450000000000
          Width = 215.002343580000000000
          Height = 18.999697310000000000
        end
        object Shape37: TfrxShapeView
          Left = 284.999239180000000000
          Top = 145.001668450000000000
          Width = 97.999433370000000000
          Height = 18.999697310000000000
        end
        object Shape21: TfrxShapeView
          Left = 8.995281400000000000
          Top = 145.001668450000000000
          Width = 234.999836810000000000
          Height = 18.999697310000000000
        end
        object Shape5: TfrxShapeView
          Left = 841.002117950000000000
          Top = 17.000325940000000000
          Width = 190.000752630000000000
          Height = 20.001272760000000000
        end
        object Shape4: TfrxShapeView
          Left = 8.999060930000000000
          Top = 17.000325940000000000
          Width = 835.004003840000000000
          Height = 20.001272760000000000
        end
        object Label1: TfrxMemoView
          Left = 8.999060930000000000
          Top = 1.999371369999999000
          Width = 1022.003809650000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'LIVRO REGISTRO CONTROLE DA PRODU'#199#195'O E DO ESTOQUE - RCPE')
          ParentFont = False
        end
        object Label2: TfrxMemoView
          Left = 12.000007750000000000
          Top = 20.999068680000000000
          Width = 341.000535190000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'REGISTRO DE CONTROLE DA PRODU'#199#195'O E DO ESTOQUE')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 842.003693400000000000
          Top = 36.000023250000000000
          Width = 188.999177180000000000
          Height = 77.000364690000000000
        end
        object Label3: TfrxMemoView
          Left = 848.001807510000000000
          Top = 20.001272760000000000
          Width = 174.002002140000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '(a) C'#243'digo de Entradas e Saidas')
          ParentFont = False
        end
        object Label4: TfrxMemoView
          Left = 849.003382960000000000
          Top = 41.000341440000000000
          Width = 166.665934410000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '1 - No Pr'#243'prio Estabelecimento')
          ParentFont = False
        end
        object Label5: TfrxMemoView
          Left = 849.003382960000000000
          Top = 56.999091930000010000
          Width = 160.667820300000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '2 - Em Outro Estabelecimento')
          ParentFont = False
        end
        object Label6: TfrxMemoView
          Left = 850.001178880000000000
          Top = 73.001621950000000000
          Width = 63.998781490000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '3 - Diversas')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 8.999060930000000000
          Top = 36.000023250000000000
          Width = 835.004003840000000000
          Height = 77.000364690000000000
        end
        object Label7: TfrxMemoView
          Left = 15.998750490000000000
          Top = 41.000341440000000000
          Width = 60.000038750000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'EMPRESA:')
          ParentFont = False
        end
        object DBText3: TfrxMemoView
          Left = 78.999736060000000000
          Top = 41.000341440000000000
          Width = 476.001567260000000000
          Height = 13.999379120000000000
          DataField = 'RZSOCIAL'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."RZSOCIAL"]')
          ParentFont = False
        end
        object Label8: TfrxMemoView
          Left = 15.998750490000000000
          Top = 58.998463300000000000
          Width = 60.000038750000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'INSC. EST:')
          ParentFont = False
        end
        object DBText4: TfrxMemoView
          Left = 78.999736060000000000
          Top = 58.998463300000000000
          Width = 193.999495370000000000
          Height = 13.999379120000000000
          DataField = 'NUINSCEST'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."NUINSCEST"]')
          ParentFont = False
        end
        object Label9: TfrxMemoView
          Left = 277.001753700000000000
          Top = 58.998463300000000000
          Width = 32.001280510000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ:')
          ParentFont = False
        end
        object DBText5: TfrxMemoView
          Left = 313.999572870000000000
          Top = 58.998463300000000000
          Width = 234.999836810000000000
          Height = 13.999379120000000000
          DataField = 'NUCNPJ'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."NUCNPJ"]')
          ParentFont = False
        end
        object Label10: TfrxMemoView
          Left = 27.000962320000000000
          Top = 77.000364690000000000
          Width = 49.001606450000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'FOLHA:')
          ParentFont = False
        end
        object Label11: TfrxMemoView
          Left = 277.001753700000000000
          Top = 77.000364690000000000
          Width = 142.000721630000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'M'#202'S OU PER'#205'ODO / ANO:')
          ParentFont = False
        end
        object DBText9: TfrxMemoView
          Left = 428.001536260000000000
          Top = 77.000364690000000000
          Width = 61.999410120000000000
          Height = 13.999379120000000000
          DataField = 'DTINICIO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."DTINICIO"]')
          ParentFont = False
        end
        object Label12: TfrxMemoView
          Left = 13.001583200000000000
          Top = 94.000690630000000000
          Width = 63.000985570000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'PRODUTO:')
          ParentFont = False
        end
        object DBText10: TfrxMemoView
          Left = 78.999736060000000000
          Top = 94.000690630000000000
          Width = 192.000124000000000000
          Height = 13.999379120000000000
          DataField = 'NMPRODUTO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."NMPRODUTO"]')
          ParentFont = False
        end
        object Label13: TfrxMemoView
          Left = 277.001753700000000000
          Top = 94.000690630000000000
          Width = 61.999410120000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UNIDADE:')
          ParentFont = False
        end
        object DBText11: TfrxMemoView
          Left = 342.002110640000000000
          Top = 94.000690630000000000
          Width = 207.998874490000000000
          Height = 13.999379120000000000
          DataField = 'NMUNIDADE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."NMUNIDADE"]')
          ParentFont = False
        end
        object Label14: TfrxMemoView
          Left = 557.000674690000000000
          Top = 94.000690630000000000
          Width = 144.801353360000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CLASSIFICA'#199#195'O FISCAL:')
          ParentFont = False
        end
        object DBText15: TfrxMemoView
          Left = 705.003289960000000000
          Top = 94.000690630000000000
          Width = 99.998804740000000000
          Height = 13.999379120000000000
          DataField = 'NMCLFISCAL'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."NMCLFISCAL"]')
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 8.999060930000000000
          Top = 111.998812490000000000
          Width = 1022.003809650000000000
          Height = 18.001901390000000000
        end
        object Shape1: TfrxShapeView
          Left = 8.999060930000000000
          Top = 111.998812490000000000
          Width = 234.999836810000000000
          Height = 18.001901390000000000
        end
        object Label15: TfrxMemoView
          Left = 12.000007750000000000
          Top = 114.001963390000000000
          Width = 228.000147250000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTO')
          ParentFont = False
        end
        object Shape7: TfrxShapeView
          Left = 243.001101820000000000
          Top = 111.998812490000000000
          Width = 212.999192680000000000
          Height = 18.001901390000000000
        end
        object Label16: TfrxMemoView
          Left = 245.000473190000000000
          Top = 114.001963390000000000
          Width = 207.998874490000000000
          Height = 14.078749250000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LAN'#199'AMENTO')
          ParentFont = False
        end
        object Shape9: TfrxShapeView
          Left = 455.002498580000000000
          Top = 111.998812490000000000
          Width = 389.000566190000000000
          Height = 18.001901390000000000
        end
        object Label17: TfrxMemoView
          Left = 459.001241320000000000
          Top = 114.001963390000000000
          Width = 382.000876630000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ENTRADAS E SA'#205'DAS')
          ParentFont = False
        end
        object Shape10: TfrxShapeView
          Left = 8.999060930000000000
          Top = 128.999138430000000000
          Width = 1022.003809650000000000
          Height = 18.001901390000000000
        end
        object Shape11: TfrxShapeView
          Left = 8.995281400000000000
          Top = 128.999138430000000000
          Width = 234.999836810000000000
          Height = 18.001901390000000000
        end
        object Shape12: TfrxShapeView
          Left = 243.001101820000000000
          Top = 128.999138430000000000
          Width = 212.999192680000000000
          Height = 18.001901390000000000
        end
        object Shape13: TfrxShapeView
          Left = 455.002498580000000000
          Top = 128.999138430000000000
          Width = 356.001489760000000000
          Height = 18.001901390000000000
        end
        object Shape14: TfrxShapeView
          Left = 63.000985570000000000
          Top = 128.999138430000000000
          Width = 65.000356940000000000
          Height = 18.001901390000000000
        end
        object Label18: TfrxMemoView
          Left = 66.001932390000000000
          Top = 130.998509800000000000
          Width = 58.000667380000000000
          Height = 14.078749250000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'S'#201'RIE')
          ParentFont = False
        end
        object Shape16: TfrxShapeView
          Left = 284.999239180000000000
          Top = 128.999138430000000000
          Width = 171.001055320000000000
          Height = 18.001901390000000000
        end
        object Label19: TfrxMemoView
          Left = 288.000186000000000000
          Top = 130.998509800000000000
          Width = 164.001365760000000000
          Height = 13.999379120000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CODIFICA'#199#195'O')
          ParentFont = False
        end
        object Shape17: TfrxShapeView
          Left = 486.999999560000000000
          Top = 128.999138430000000000
          Width = 56.001296010000000000
          Height = 18.001901390000000000
        end
        object Shape18: TfrxShapeView
          Left = 610.001023880000000000
          Top = 128.999138430000000000
          Width = 73.001621950000000000
          Height = 18.001901390000000000
        end
        object Shape19: TfrxShapeView
          Left = 761.000806440000000000
          Top = 128.999138430000000000
          Width = 82.998478800000000000
          Height = 18.001901390000000000
        end
        object Label20: TfrxMemoView
          Left = 17.344263170000000000
          Top = 147.998835740000000000
          Width = 37.334197340000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Esp'#233'cie')
          ParentFont = False
        end
        object Label23: TfrxMemoView
          Left = 202.669737190000000000
          Top = 147.998835740000000000
          Width = 22.665841410000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Label24: TfrxMemoView
          Left = 255.337487740000000000
          Top = 147.998835740000000000
          Width = 17.332924580000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dia')
          ParentFont = False
        end
        object Label25: TfrxMemoView
          Left = 298.499720340000000000
          Top = 147.998835740000000000
          Width = 25.999386870000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Livro')
          ParentFont = False
        end
        object Label26: TfrxMemoView
          Left = 402.837425520000000000
          Top = 147.998835740000000000
          Width = 31.332303700000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Fiscal')
          ParentFont = False
        end
        object Shape26: TfrxShapeView
          Left = 455.002498580000000000
          Top = 145.999464370000000000
          Width = 356.001489760000000000
          Height = 18.001901390000000000
        end
        object Shape27: TfrxShapeView
          Left = 486.999999560000000000
          Top = 145.999464370000000000
          Width = 56.001296010000000000
          Height = 18.001901390000000000
        end
        object Shape28: TfrxShapeView
          Left = 610.001023880000000000
          Top = 145.999464370000000000
          Width = 73.001621950000000000
          Height = 18.001901390000000000
        end
        object Shape29: TfrxShapeView
          Left = 761.000806440000000000
          Top = 145.999464370000000000
          Width = 82.998478800000000000
          Height = 18.001901390000000000
        end
        object Label27: TfrxMemoView
          Left = 457.999665870000000000
          Top = 147.998835740000000000
          Width = 25.999386870000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'E/S')
          ParentFont = False
        end
        object Label28: TfrxMemoView
          Left = 495.209138720000000000
          Top = 147.998835740000000000
          Width = 39.998765990000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'd (a)')
          ParentFont = False
        end
        object Label29: TfrxMemoView
          Left = 559.000046060000000000
          Top = 147.998835740000000000
          Width = 36.000023250000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Label30: TfrxMemoView
          Left = 631.000092560000000000
          Top = 147.998835740000000000
          Width = 27.998758240000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Label32: TfrxMemoView
          Left = 711.001404070000000000
          Top = 147.998835740000000000
          Width = 14.668355930000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'IPI')
          ParentFont = False
        end
        object Label33: TfrxMemoView
          Left = 784.003026020000000000
          Top = 147.998835740000000000
          Width = 44.001288260000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque')
          ParentFont = False
        end
        object Shape30: TfrxShapeView
          Left = 843.001489320000000000
          Top = 145.999464370000000000
          Width = 188.001381260000000000
          Height = 18.001901390000000000
        end
        object Label34: TfrxMemoView
          Left = 885.173485060000000000
          Top = 147.998835740000000000
          Width = 70.665872410000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Observa'#231#245'es')
          ParentFont = False
        end
        object Shape15: TfrxShapeView
          Left = 126.999767060000000000
          Top = 128.999138430000000000
          Width = 58.998463300000000000
          Height = 18.001901390000000000
        end
        object Shape8: TfrxShapeView
          Left = 126.999767060000000000
          Top = 145.999464370000000000
          Width = 58.998463300000000000
          Height = 18.001901390000000000
        end
        object Label22: TfrxMemoView
          Left = 137.333002080000000000
          Top = 147.998835740000000000
          Width = 39.333568710000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Shape20: TfrxShapeView
          Left = 63.000985570000000000
          Top = 145.999464370000000000
          Width = 65.000356940000000000
          Height = 18.001901390000000000
        end
        object Label21: TfrxMemoView
          Left = 80.001311510000000000
          Top = 147.998835740000000000
          Width = 18.667098670000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Sub')
          ParentFont = False
        end
        object Label35: TfrxMemoView
          Left = 78.999736060000000000
          Top = 77.000364690000000000
          Width = 7.358744910000000000
          Height = 15.201269660000000000
          Memo.UTF8W = (
            '2')
        end
        object Label36: TfrxMemoView
          Left = 493.001893200000000000
          Top = 77.000364690000000000
          Width = 8.481265320000000000
          Height = 14.078749250000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'A')
          ParentFont = False
        end
        object DBText2: TfrxMemoView
          Left = 504.000325500000000000
          Top = 77.000364690000000000
          Width = 56.001296010000000000
          Height = 13.999379120000000000
          DataField = 'DTTERMINO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."DTTERMINO"]')
          ParentFont = False
        end
        object Shape22: TfrxShapeView
          Left = 337.001792450000000000
          Top = 145.999464370000000000
          Width = 46.000659630000000000
          Height = 18.001901390000000000
        end
        object Label37: TfrxMemoView
          Left = 344.999277930000000000
          Top = 147.998835740000000000
          Width = 30.001909140000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Folha')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.000644130000000000
        Top = 204.094620000000000000
        Width = 1045.720360400000000000
        DataSetName = 'piplivr'
        RowCount = 0
        object Line1: TfrxLineView
          Left = 8.999060930000000000
          Width = 1021.002234200000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object pTPEspecia: TfrxMemoView
          Left = 12.000007750000000000
          Top = 3.000946819999996000
          Width = 49.999402370000000000
          Height = 13.999379120000000000
          DataField = 'DSESPECIE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DSESPECIE"]')
          ParentFont = False
        end
        object pNUSerie: TfrxMemoView
          Left = 66.999728310000000000
          Top = 3.000946819999996000
          Width = 56.001296010000000000
          Height = 13.999379120000000000
          DataField = 'DSSUBSERIE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DSSUBSERIE"]')
          ParentFont = False
        end
        object pNUDocumento: TfrxMemoView
          Left = 130.000713880000000000
          Top = 3.000946819999996000
          Width = 54.001924640000000000
          Height = 13.999379120000000000
          DataField = 'NUDOCUMENTO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUDOCUMENTO"]')
          ParentFont = False
        end
        object pDTDocumento: TfrxMemoView
          Left = 188.001381260000000000
          Top = 3.000946819999996000
          Width = 51.998773740000000000
          Height = 13.999379120000000000
          DataField = 'DTSAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DTSAIDA"]')
          ParentFont = False
        end
        object pDiaLancamento: TfrxMemoView
          Left = 246.999844560000000000
          Top = 3.000946819999996000
          Width = 36.000023250000000000
          Height = 13.999379120000000000
          DataField = 'NUDIA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUDIA"]')
          ParentFont = False
        end
        object pNUContabil: TfrxMemoView
          Left = 289.001761450000000000
          Top = 3.000946819999996000
          Width = 46.000659630000000000
          Height = 13.999379120000000000
          DataField = 'NULIVRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NULIVRO"]')
          ParentFont = False
        end
        object pNUFiscal: TfrxMemoView
          Left = 385.001823450000000000
          Top = 3.000946819999996000
          Width = 66.999728310000000000
          Height = 13.999379120000000000
          DataField = 'NUFISCAL'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUFISCAL"]')
          ParentFont = False
        end
        object pTPRegistro: TfrxMemoView
          Left = 459.001241320000000000
          Top = 3.000946819999996000
          Width = 24.000015500000000000
          Height = 13.999379120000000000
          DataField = 'TPENTSAI'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."TPENTSAI"]')
          ParentFont = False
        end
        object pCDENTSAI: TfrxMemoView
          Left = 489.003150460000000000
          Top = 3.000946819999996000
          Width = 49.999402370000000000
          Height = 13.999379120000000000
          DataField = 'CDENTSAI'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."CDENTSAI"]')
          ParentFont = False
        end
        object pQTItem: TfrxMemoView
          Left = 545.000666940000000000
          Top = 3.000946819999996000
          Width = 61.999410120000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMENTRADA_1'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMENTRADA_1"]')
          ParentFont = False
        end
        object pVLBaseIPI: TfrxMemoView
          Left = 613.001970700000000000
          Top = 3.000946819999996000
          Width = 66.999728310000000000
          Height = 13.999379120000000000
          DataField = 'VLBASEIPIENTRADA_1'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPIENTRADA_1"]')
          ParentFont = False
        end
        object pVLIPI: TfrxMemoView
          Left = 685.002017200000000000
          Top = 3.000946819999996000
          Width = 73.999417870000000000
          Height = 13.999379120000000000
          DataField = 'VLIPIENTRADA_1'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPIENTRADA_1"]')
          ParentFont = False
        end
        object pQTEstoque: TfrxMemoView
          Left = 764.001753260000000000
          Top = 3.000946819999996000
          Width = 77.000364690000000000
          Height = 13.999379120000000000
          DataField = 'QTESTOQUE_1'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTESTOQUE_1"]')
          ParentFont = False
        end
        object DBText1: TfrxMemoView
          Left = 850.001178880000000000
          Top = 3.000946819999996000
          Width = 181.001691700000000000
          Height = 13.999379120000000000
          DataField = 'OBSERVACAO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[piplivro."OBSERVACAO"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 8.999060930000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 1030.001295130000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 63.000985570000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 126.999767060000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 185.000434440000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 284.999239180000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 382.000876630000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 455.002498580000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line101: TfrxLineView
          Left = 486.999999560000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 541.999720120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 610.001023880000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 682.001070380000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 761.000806440000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 843.001489320000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 243.001101820000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 337.001792450000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object pNUContabil1: TfrxMemoView
          Left = 340.002739270000000000
          Top = 3.000946819999996000
          Width = 39.000970070000000000
          Height = 13.999379120000000000
          DataField = 'NUFOLHA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUFOLHA"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Top = 249.448980000000000000
        Width = 1045.720360400000000000
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 61.001614200000000000
        Top = 309.921460000000000000
        Width = 1045.720360400000000000
        object Line21: TfrxLineView
          Left = 610.001023880000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 682.001070380000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 761.000806440000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label78: TfrxMemoView
          Left = 449.325644520000000000
          Top = 3.000946820000024000
          Width = 83.678794200000000000
          Height = 14.400009300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Entradas')
          ParentFont = False
        end
        object DBText25: TfrxMemoView
          Left = 613.999766620000000000
          Top = 3.000946820000024000
          Width = 66.001932390000000000
          Height = 13.999379120000000000
          DataField = 'VLBASEIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPIENTRADA"]')
          ParentFont = False
        end
        object DBText26: TfrxMemoView
          Left = 685.002017200000000000
          Top = 3.000946820000024000
          Width = 73.999417870000000000
          Height = 13.999379120000000000
          DataField = 'VLIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPIENTRADA"]')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 541.999720120000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText27: TfrxMemoView
          Left = 545.000666940000000000
          Top = 3.000946820000024000
          Width = 63.000985570000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMENTRADA"]')
          ParentFont = False
        end
        object Shape25: TfrxShapeView
          Left = 8.999060930000000000
          Top = 20.001272760000010000
          Width = 1022.003809650000000000
          Height = 20.999068680000000000
        end
        object Line26: TfrxLineView
          Left = 610.001023880000000000
          Top = 20.001272760000010000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 682.001070380000000000
          Top = 20.999068679999990000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 761.000806440000000000
          Top = 20.001272760000010000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label79: TfrxMemoView
          Left = 461.964392840000000000
          Top = 24.000015500000020000
          Width = 71.040045880000000000
          Height = 14.400009300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Saidas')
          ParentFont = False
        end
        object DBText29: TfrxMemoView
          Left = 613.999766620000000000
          Top = 24.000015500000020000
          Width = 66.001932390000000000
          Height = 13.999379120000000000
          DataField = 'VLBASEIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPISAIDA"]')
          ParentFont = False
        end
        object DBText30: TfrxMemoView
          Left = 685.002017200000000000
          Top = 24.000015500000020000
          Width = 73.999417870000000000
          Height = 13.999379120000000000
          DataField = 'VLIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPISAIDA"]')
          ParentFont = False
        end
        object Line29: TfrxLineView
          Left = 541.999720120000000000
          Top = 20.001272760000010000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText31: TfrxMemoView
          Left = 545.000666940000000000
          Top = 24.000015500000020000
          Width = 63.000985570000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMSAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMSAIDA"]')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 8.999060930000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line201: TfrxLineView
          Left = 1030.001295130000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label31: TfrxMemoView
          Left = 18.999697310000000000
          Top = 3.000946820000024000
          Width = 39.840025730000000000
          Height = 14.400009300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Shape31: TfrxShapeView
          Left = 8.999060930000000000
          Top = 39.998765989999980000
          Width = 1022.003809650000000000
          Height = 20.999068680000000000
        end
        object Line31: TfrxLineView
          Left = 843.001489320000000000
          Height = 61.001614200000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 761.000806440000000000
          Top = 39.998765989999980000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label80: TfrxMemoView
          Left = 485.480628500000000000
          Top = 44.001288260000030000
          Width = 47.520030690000000000
          Height = 14.400009300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Estoque')
          ParentFont = False
        end
        object DBText24: TfrxMemoView
          Left = 764.001753260000000000
          Top = 44.001288260000030000
          Width = 77.000364690000000000
          Height = 13.598748940000000000
          DataField = 'QTESTOQUE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTESTOQUE"]')
          ParentFont = False
        end
      end
    end
  end
  object frxLivroImprimirA3: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42950.592920370400000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42950.593085000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 293
    Top = 10
    Datasets = <>
    Variables = <>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 420.000000000000000000
      PaperHeight = 289.380000000000000000
      PaperSize = 119
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      ColumnWidth = 265.612800000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 27.000962320000000000
        Top = 18.897650000000000000
        Width = 1539.402569000000000000
        object Shape120: TfrxShapeView
          Left = 51.998773740000000000
          Top = 3.998742740000001000
          Width = 1427.003126330000000000
          Height = 24.000015500000000000
        end
        object Label1: TfrxMemoView
          Left = 527.002545080000000000
          Top = 6.001893639999999000
          Width = 412.002785770000000000
          Height = 18.001901390000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'REGISTRO DE CONTROLE DA PRODU'#199#195'O DE ESTOQUE')
          ParentFont = False
        end
        object pplblnupaginaA3: TfrxMemoView
          Left = 1379.003095330000000000
          Top = 8.001265010000001000
          Width = 85.001629700000000000
          Height = 15.998750490000000000
          HAlign = haRight
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 20.999068680000000000
        Top = 68.031540000000010000
        Width = 1539.402569000000000000
        DataSetName = 'piplivr'
        RowCount = 0
        object Line265: TfrxLineView
          Left = 51.998773740000000000
          Width = 1427.003126330000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object pTPEspecia2: TfrxMemoView
          Left = 54.999720560000000000
          Top = 3.000946819999996000
          Width = 44.999084180000000000
          Height = 13.999379120000000000
          DataField = 'DSESPECIE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DSESPECIE"]')
          ParentFont = False
        end
        object pNUSerie1: TfrxMemoView
          Left = 104.001327010000000000
          Top = 3.000946819999996000
          Width = 34.000651880000000000
          Height = 13.999379120000000000
          DataField = 'DSSUBSERIE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DSSUBSERIE"]')
          ParentFont = False
        end
        object pNUDocumento1: TfrxMemoView
          Left = 142.000721630000000000
          Top = 3.000946819999996000
          Width = 53.000349190000000000
          Height = 13.999379120000000000
          DataField = 'NUDOCUMENTO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUDOCUMENTO"]')
          ParentFont = False
        end
        object pDTDocumento1: TfrxMemoView
          Left = 234.002040890000000000
          Top = 3.000946819999996000
          Width = 25.999386870000000000
          Height = 13.999379120000000000
          DataField = 'NUMES'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUMES"]')
          ParentFont = False
        end
        object pDiaLancamento1: TfrxMemoView
          Left = 200.001389010000000000
          Top = 3.000946819999996000
          Width = 29.000333690000000000
          Height = 13.999379120000000000
          DataField = 'NUDIA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUDIA"]')
          ParentFont = False
        end
        object pNUContabil2: TfrxMemoView
          Left = 303.998936490000000000
          Top = 3.000946819999996000
          Width = 30.999705060000000000
          Height = 13.999379120000000000
          DataField = 'NULIVRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NULIVRO"]')
          ParentFont = False
        end
        object pNUFiscal2: TfrxMemoView
          Left = 444.000286750000000000
          Top = 3.000946819999996000
          Width = 42.001916890000000000
          Height = 13.999379120000000000
          DataField = 'NUFISCAL'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUFISCAL"]')
          ParentFont = False
        end
        object pTPRegistro1: TfrxMemoView
          Left = 392.001513010000000000
          Top = 3.000946819999996000
          Width = 46.998455550000000000
          Height = 13.999379120000000000
          DataField = 'DSCONTABIL'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."DSCONTABIL"]')
          ParentFont = False
        end
        object pCDCLFiscal3: TfrxMemoView
          Left = 558.002250140000000000
          Top = 3.000946819999996000
          Width = 58.000667380000000000
          Height = 13.999379120000000000
          DataField = 'QTENTOUTRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTENTOUTRO"]')
          ParentFont = False
        end
        object pQTItem2: TfrxMemoView
          Left = 623.002607080000000000
          Top = 3.000946819999996000
          Width = 78.001940140000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMENTRADA"]')
          ParentFont = False
        end
        object pVLBaseIPI2: TfrxMemoView
          Left = 707.002661330000000000
          Top = 3.998742739999997000
          Width = 73.001621950000000000
          Height = 13.001583200000000000
          DataField = 'VLBASEIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPIENTRADA"]')
          ParentFont = False
        end
        object Line48: TfrxLineView
          Left = 51.998773740000000000
          Height = 20.999068680000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 102.001955640000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 138.999774810000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line1: TfrxLineView
          Left = 231.001094070000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 301.001769200000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 440.999339930000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line105: TfrxLineView
          Left = 389.000566190000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line55: TfrxLineView
          Left = 553.999727870000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 620.001660260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 703.000139060000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 197.000442190000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 337.001792450000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText58: TfrxMemoView
          Left = 340.002739270000000000
          Top = 3.000946819999996000
          Width = 46.000659630000000000
          Height = 13.999379120000000000
          DataField = 'NUFOLHA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUFOLHA"]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 489.003150460000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText59: TfrxMemoView
          Left = 492.000317750000000000
          Top = 3.000946819999996000
          Width = 58.000667380000000000
          Height = 13.999379120000000000
          DataField = 'QTENTPROPRIO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTENTPROPRIO"]')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 262.000799130000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText63: TfrxMemoView
          Left = 265.001745950000000000
          Top = 3.000946819999996000
          Width = 34.000651880000000000
          Height = 13.999379120000000000
          DataField = 'TPENTSAI'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."TPENTSAI"]')
          ParentFont = False
        end
        object DBText114: TfrxMemoView
          Left = 789.003344210000000000
          Top = 3.000946819999996000
          Width = 77.000364690000000000
          Height = 13.598748940000000000
          DataField = 'VLIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPIENTRADA"]')
          ParentFont = False
        end
        object DBText115: TfrxMemoView
          Left = 941.000922690000000000
          Top = 3.000946819999996000
          Width = 61.001614200000000000
          Height = 13.999379120000000000
          DataField = 'QTSAIOUTRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTSAIOUTRO"]')
          ParentFont = False
        end
        object DBText116: TfrxMemoView
          Left = 1008.004430530000000000
          Top = 3.000946819999996000
          Width = 84.000054250000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMSAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMSAIDA"]')
          ParentFont = False
        end
        object DBText117: TfrxMemoView
          Left = 1098.002598890000000000
          Top = 3.998742739999997000
          Width = 70.998471050000000000
          Height = 13.001583200000000000
          DataField = 'VLBASEIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPISAIDA"]')
          ParentFont = False
        end
        object Line254: TfrxLineView
          Left = 785.000821940000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line255: TfrxLineView
          Left = 869.000876190000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line256: TfrxLineView
          Left = 937.002179950000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line257: TfrxLineView
          Left = 1004.001908260000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line801: TfrxLineView
          Left = 1094.003856150000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line260: TfrxLineView
          Left = 1172.002016760000000000
          Height = 20.999068680000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText601: TfrxMemoView
          Left = 872.001823010000000000
          Top = 3.000946819999996000
          Width = 61.001614200000000000
          Height = 13.999379120000000000
          DataField = 'QTSAIPROPRIO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTSAIPROPRIO"]')
          ParentFont = False
        end
        object DBText119: TfrxMemoView
          Left = 1176.004539030000000000
          Top = 3.000946819999996000
          Width = 73.001621950000000000
          Height = 13.598748940000000000
          DataField = 'VLIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPISAIDA"]')
          ParentFont = False
        end
        object Line703: TfrxLineView
          Left = 1251.001752820000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText120: TfrxMemoView
          Left = 1255.004275090000000000
          Top = 3.000946819999996000
          Width = 104.001327010000000000
          Height = 13.598748940000000000
          DataField = 'QTESTOQUE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTESTOQUE"]')
          ParentFont = False
        end
        object Line263: TfrxLineView
          Left = 1363.004344840000000000
          Height = 20.001272760000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBText121: TfrxMemoView
          Left = 1367.003087580000000000
          Top = 3.000946819999996000
          Width = 108.000069750000000000
          Height = 13.598748940000000000
          DataField = 'OBSERVACAO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."OBSERVACAO"]')
          ParentFont = False
        end
        object Line264: TfrxLineView
          Left = 1478.004104150000000000
          Height = 20.999068680000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Top = 113.385900000000000000
        Width = 1539.402569000000000000
      end
      object Group1: TfrxReportSummary
        FillType = ftBrush
        Height = 42.999712810000000000
        Top = 321.260050000000000000
        Width = 1539.402569000000000000
        object Label177: TfrxMemoView
          Left = 66.001932390000000000
          Top = 6.001893639999991000
          Width = 44.001288260000000000
          Height = 13.598748940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAIS')
          ParentFont = False
        end
        object DBCalc1: TfrxMemoView
          Left = 622.001031630000000000
          Top = 5.000318189999973000
          Width = 80.001311510000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMENTRADA"]')
          ParentFont = False
        end
        object DBCalc2: TfrxMemoView
          Left = 705.003289960000000000
          Top = 5.000318189999973000
          Width = 78.999736060000000000
          Height = 13.999379120000000000
          DataField = 'VLBASEIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPIENTRADA"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 703.000139060000000000
          Height = 22.998440050000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBCalc3: TfrxMemoView
          Left = 492.000317750000000000
          Top = 5.000318189999973000
          Width = 60.000038750000000000
          Height = 12.000007750000000000
          DataField = 'QTENTPROPRIO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTENTPROPRIO"]')
          ParentFont = False
        end
        object DBCalc4: TfrxMemoView
          Left = 558.002250140000000000
          Top = 5.000318189999973000
          Width = 56.999091930000000000
          Height = 13.001583200000000000
          DataField = 'QTENTOUTRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTENTOUTRO"]')
          ParentFont = False
        end
        object Line14: TfrxLineView
          Left = 489.003150460000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 553.999727870000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 620.001660260000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 51.998773740000000000
          Top = 20.001272760000010000
          Width = 732.000472750000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 51.998773740000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBCalc29: TfrxMemoView
          Left = 1008.004430530000000000
          Top = 5.000318189999973000
          Width = 82.998478800000000000
          Height = 13.999379120000000000
          DataField = 'QTITEMSAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTITEMSAIDA"]')
          ParentFont = False
        end
        object DBCalc30: TfrxMemoView
          Left = 1096.003227520000000000
          Top = 5.000318189999973000
          Width = 73.999417870000000000
          Height = 13.999379120000000000
          DataField = 'VLBASEIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLBASEIPISAIDA"]')
          ParentFont = False
        end
        object Line269: TfrxLineView
          Left = 1094.003856150000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line270: TfrxLineView
          Left = 1172.002016760000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBCalc31: TfrxMemoView
          Left = 1174.001388130000000000
          Top = 5.000318189999973000
          Width = 75.998789240000000000
          Height = 13.999379120000000000
          DataField = 'VLIPISAIDA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPISAIDA"]')
          ParentFont = False
        end
        object Line271: TfrxLineView
          Left = 1251.001752820000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line272: TfrxLineView
          Left = 1004.001908260000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line273: TfrxLineView
          Left = 785.000821940000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line1002: TfrxLineView
          Left = 787.000193310000000000
          Top = 20.001272760000010000
          Width = 692.001706760000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line275: TfrxLineView
          Left = 1478.004104150000000000
          Height = 24.000015500000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBCalc32: TfrxMemoView
          Left = 787.000193310000000000
          Top = 5.000318189999973000
          Width = 80.999107430000000000
          Height = 13.999379120000000000
          DataField = 'VLIPIENTRADA'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."VLIPIENTRADA"]')
          ParentFont = False
        end
        object Line279: TfrxLineView
          Left = 869.000876190000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DBCalc33: TfrxMemoView
          Left = 941.000922690000000000
          Top = 5.000318189999973000
          Width = 61.001614200000000000
          Height = 13.999379120000000000
          DataField = 'QTSAIOUTRO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTSAIOUTRO"]')
          ParentFont = False
        end
        object DBCalc101: TfrxMemoView
          Left = 873.003398460000000000
          Top = 5.000318189999973000
          Width = 58.998463300000000000
          Height = 13.999379120000000000
          DataField = 'QTSAIPROPRIO'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[piplivro."QTSAIPROPRIO"]')
          ParentFont = False
        end
        object Line280: TfrxLineView
          Left = 936.000604500000000000
          Height = 25.001590950000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 101.000380190000000000
        Top = 136.063080000000000000
        Width = 1539.402569000000000000
        object Shape141: TfrxShapeView
          Left = 51.998773740000000000
          Width = 1427.003126330000000000
          Height = 39.998765990000000000
        end
        object Label2: TfrxMemoView
          Left = 711.001404070000000000
          Top = 3.998742740000012000
          Width = 66.999728310000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UNIDADE')
          ParentFont = False
        end
        object Line40: TfrxLineView
          Left = 702.002343140000000000
          Top = 1.001575449999990000
          Height = 39.000970070000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label3: TfrxMemoView
          Left = 63.000985570000000000
          Top = 13.999379119999990000
          Width = 63.998781490000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODUTO')
          ParentFont = False
        end
        object Line41: TfrxLineView
          Left = 138.999774810000000000
          Top = 1.001575449999990000
          Height = 39.000970070000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label4: TfrxMemoView
          Left = 56.001296010000000000
          Top = 42.001916889999990000
          Width = 205.001707200000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTO')
          ParentFont = False
        end
        object Label5: TfrxMemoView
          Left = 265.999541870000000000
          Top = 42.001916889999990000
          Width = 222.002033140000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LANCAMENTO')
          ParentFont = False
        end
        object Label6: TfrxMemoView
          Left = 493.999689120000000000
          Top = 42.001916889999990000
          Width = 284.999239180000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ENTRADAS')
          ParentFont = False
        end
        object Line42: TfrxLineView
          Left = 262.000799130000000000
          Top = 39.000970069999990000
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          Left = 489.003150460000000000
          Top = 39.998765990000010000
          Height = 18.001901390000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape3: TfrxShapeView
          Left = 51.998773740000000000
          Top = 56.999091929999990000
          Width = 63.000985570000000000
          Height = 44.001288260000000000
        end
        object Shape4: TfrxShapeView
          Left = 102.001955640000000000
          Top = 56.999091929999990000
          Width = 56.001296010000000000
          Height = 44.001288260000000000
        end
        object Shape5: TfrxShapeView
          Left = 138.999774810000000000
          Top = 56.999091929999990000
          Width = 58.998463300000000000
          Height = 44.001288260000000000
        end
        object Shape6: TfrxShapeView
          Left = 197.000442190000000000
          Top = 56.999091929999990000
          Width = 66.001932390000000000
          Height = 20.001272760000000000
        end
        object Label7: TfrxMemoView
          Left = 198.999813560000000000
          Top = 60.000038749999990000
          Width = 61.999410120000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
        end
        object Shape7: TfrxShapeView
          Left = 197.000442190000000000
          Top = 74.997213789999990000
          Width = 34.998447800000000000
          Height = 25.999386870000000000
        end
        object Shape601: TfrxShapeView
          Left = 231.001094070000000000
          Top = 74.997213789999990000
          Width = 32.001280510000000000
          Height = 25.999386870000000000
        end
        object Label1101: TfrxMemoView
          Left = 200.001389010000000000
          Top = 80.001311510000000000
          Width = 27.998758240000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DIA')
          ParentFont = False
        end
        object Label1102: TfrxMemoView
          Left = 231.998889990000000000
          Top = 80.001311510000000000
          Width = 29.000333690000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'M'#202'S')
          ParentFont = False
        end
        object Label8: TfrxMemoView
          Left = 54.001924640000000000
          Top = 72.000046500000000000
          Width = 46.000659630000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESP'#201'CIE')
          ParentFont = False
        end
        object Label9: TfrxMemoView
          Left = 104.001327010000000000
          Top = 60.000038749999990000
          Width = 34.000651880000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'S'#201'RIE')
          ParentFont = False
        end
        object Label10: TfrxMemoView
          Left = 104.001327010000000000
          Top = 73.001621949999990000
          Width = 34.000651880000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'E SUB-')
          ParentFont = False
        end
        object Label11: TfrxMemoView
          Left = 104.001327010000000000
          Top = 85.999425620000010000
          Width = 34.000651880000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'S'#201'RIE')
          ParentFont = False
        end
        object Label12: TfrxMemoView
          Left = 142.000721630000000000
          Top = 73.001621949999990000
          Width = 53.000349190000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#218'MERO')
          ParentFont = False
        end
        object Shape8: TfrxShapeView
          Left = 262.000799130000000000
          Top = 56.999091929999990000
          Width = 149.000411190000000000
          Height = 20.001272760000000000
        end
        object Shape9: TfrxShapeView
          Left = 389.000566190000000000
          Top = 56.999091929999990000
          Width = 102.001955640000000000
          Height = 20.001272760000000000
        end
        object Shape10: TfrxShapeView
          Left = 703.000139060000000000
          Top = 56.999091929999990000
          Width = 82.998478800000000000
          Height = 44.001288260000000000
        end
        object Label13: TfrxMemoView
          Left = 707.002661330000000000
          Top = 72.000046500000000000
          Width = 75.998789240000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Shape11: TfrxShapeView
          Left = 619.000084810000000000
          Top = 56.999091929999990000
          Width = 85.001629700000000000
          Height = 20.001272760000000000
        end
        object Label14: TfrxMemoView
          Left = 622.001031630000000000
          Top = 60.000038749999990000
          Width = 80.001311510000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DIVERSAS')
          ParentFont = False
        end
        object Shape12: TfrxShapeView
          Left = 619.000084810000000000
          Top = 74.997213789999990000
          Width = 85.001629700000000000
          Height = 25.999386870000000000
        end
        object Label15: TfrxMemoView
          Left = 622.001031630000000000
          Top = 80.999107430000010000
          Width = 80.001311510000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Shape13: TfrxShapeView
          Left = 489.003150460000000000
          Top = 56.999091929999990000
          Width = 132.000085250000000000
          Height = 20.001272760000000000
        end
        object Label1202: TfrxMemoView
          Left = 492.000317750000000000
          Top = 60.000038749999990000
          Width = 125.000395690000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODU'#199#195'O (QUANT.)')
          ParentFont = False
        end
        object Label1203: TfrxMemoView
          Left = 265.999541870000000000
          Top = 60.000038749999990000
          Width = 121.999448870000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'REGISTROS FISCAIS')
          ParentFont = False
        end
        object Shape14: TfrxShapeView
          Left = 262.000799130000000000
          Top = 74.997213789999990000
          Width = 54.999720560000000000
          Height = 25.999386870000000000
        end
        object Label16: TfrxMemoView
          Left = 265.001745950000000000
          Top = 80.999107430000010000
          Width = 34.000651880000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RE/RS')
          ParentFont = False
        end
        object Shape15: TfrxShapeView
          Left = 301.001769200000000000
          Top = 74.997213789999990000
          Width = 66.001932390000000000
          Height = 25.999386870000000000
        end
        object Label17: TfrxMemoView
          Left = 303.998936490000000000
          Top = 80.999107430000010000
          Width = 30.999705060000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#218'M.')
          ParentFont = False
        end
        object Shape16: TfrxShapeView
          Left = 337.001792450000000000
          Top = 74.997213789999990000
          Width = 53.000349190000000000
          Height = 25.999386870000000000
        end
        object Label18: TfrxMemoView
          Left = 340.002739270000000000
          Top = 80.999107430000010000
          Width = 46.998455550000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FOLHAS')
          ParentFont = False
        end
        object Shape701: TfrxShapeView
          Left = 389.000566190000000000
          Top = 74.997213789999990000
          Width = 54.001924640000000000
          Height = 25.999386870000000000
        end
        object Label19: TfrxMemoView
          Left = 392.999308930000000000
          Top = 80.999107430000010000
          Width = 44.999084180000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CONT'#193'B.')
          ParentFont = False
        end
        object Shape17: TfrxShapeView
          Left = 440.999339930000000000
          Top = 74.997213789999990000
          Width = 49.999402370000000000
          Height = 25.999386870000000000
        end
        object Label20: TfrxMemoView
          Left = 444.000286750000000000
          Top = 80.999107430000010000
          Width = 42.999712810000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FISCAL')
          ParentFont = False
        end
        object Shape18: TfrxShapeView
          Left = 489.003150460000000000
          Top = 74.997213789999990000
          Width = 66.001932390000000000
          Height = 25.999386870000000000
        end
        object Shape19: TfrxShapeView
          Left = 553.999727870000000000
          Top = 74.997213789999990000
          Width = 66.999728310000000000
          Height = 25.999386870000000000
        end
        object Label21: TfrxMemoView
          Left = 492.000317750000000000
          Top = 77.000364690000000000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NO PR'#211'P.')
          ParentFont = False
        end
        object Label1302: TfrxMemoView
          Left = 557.000674690000000000
          Top = 77.000364690000000000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EM OUTRO')
          ParentFont = False
        end
        object Label22: TfrxMemoView
          Left = 557.000674690000000000
          Top = 87.998796989999990000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTABELEC.')
          ParentFont = False
        end
        object Label1303: TfrxMemoView
          Left = 492.000317750000000000
          Top = 87.998796989999990000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTABELEC.')
          ParentFont = False
        end
        object Label23: TfrxMemoView
          Left = 392.999308930000000000
          Top = 60.000038749999990000
          Width = 94.000690630000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CODIFICA'#199#195'O')
          ParentFont = False
        end
        object DBText41: TfrxMemoView
          Left = 142.000721630000000000
          Top = 13.001583200000000000
          Width = 553.001931950000000000
          Height = 15.998750490000000000
          DataField = 'NMPRODUTO'
          DataSetName = 'piplivro'
          Memo.UTF8W = (
            '[piplivro."NMPRODUTO"]')
        end
        object DBText1: TfrxMemoView
          Left = 710.003608150000000000
          Top = 22.000644130000010000
          Width = 68.001303760000000000
          Height = 13.999379120000000000
          DataField = 'NMUNIDADE'
          DataSetName = 'piplivro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NMUNIDADE"]')
          ParentFont = False
        end
        object Label24: TfrxMemoView
          Left = 707.002661330000000000
          Top = 84.000054250000000000
          Width = 75.998789240000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Label242: TfrxMemoView
          Left = 877.002141200000000000
          Top = 42.001916889999990000
          Width = 371.002444330000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SAIDAS')
          ParentFont = False
        end
        object Line248: TfrxLineView
          Left = 869.000876190000000000
          Top = 39.998765990000010000
          Height = 18.001901390000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape143: TfrxShapeView
          Left = 1094.003856150000000000
          Top = 56.999091929999990000
          Width = 78.999736060000000000
          Height = 44.001288260000000000
        end
        object Label243: TfrxMemoView
          Left = 1098.002598890000000000
          Top = 72.000046500000000000
          Width = 70.998471050000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Shape144: TfrxShapeView
          Left = 1004.001908260000000000
          Top = 56.999091929999990000
          Width = 90.999743810000000000
          Height = 20.001272760000000000
        end
        object Label244: TfrxMemoView
          Left = 1008.004430530000000000
          Top = 60.000038749999990000
          Width = 84.000054250000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DIVERSAS')
          ParentFont = False
        end
        object Shape145: TfrxShapeView
          Left = 1004.001908260000000000
          Top = 74.997213789999990000
          Width = 90.999743810000000000
          Height = 25.999386870000000000
        end
        object Label245: TfrxMemoView
          Left = 1008.004430530000000000
          Top = 80.999107430000010000
          Width = 84.000054250000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANTIDAE')
          ParentFont = False
        end
        object Shape146: TfrxShapeView
          Left = 869.000876190000000000
          Top = 56.999091929999990000
          Width = 135.998827990000000000
          Height = 20.001272760000000000
        end
        object Label246: TfrxMemoView
          Left = 872.001823010000000000
          Top = 60.000038749999990000
          Width = 128.999138430000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VENDAS (QUANTIDADE)')
          ParentFont = False
        end
        object Shape147: TfrxShapeView
          Left = 869.000876190000000000
          Top = 74.997213789999990000
          Width = 104.001327010000000000
          Height = 25.999386870000000000
        end
        object Shape148: TfrxShapeView
          Left = 937.002179950000000000
          Top = 74.997213789999990000
          Width = 68.001303760000000000
          Height = 25.999386870000000000
        end
        object Label247: TfrxMemoView
          Left = 872.001823010000000000
          Top = 77.000364690000000000
          Width = 61.999410120000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NO PR'#211'P.')
          ParentFont = False
        end
        object Label248: TfrxMemoView
          Left = 940.003126770000000000
          Top = 77.000364690000000000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EM OUTRO')
          ParentFont = False
        end
        object Label249: TfrxMemoView
          Left = 940.003126770000000000
          Top = 87.998796989999990000
          Width = 61.001614200000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTABELEC.')
          ParentFont = False
        end
        object Label250: TfrxMemoView
          Left = 872.001823010000000000
          Top = 87.998796989999990000
          Width = 61.999410120000000000
          Height = 10.998432300000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTABELEC.')
          ParentFont = False
        end
        object Shape149: TfrxShapeView
          Left = 785.000821940000000000
          Top = 56.999091929999990000
          Width = 85.001629700000000000
          Height = 44.001288260000000000
        end
        object Label251: TfrxMemoView
          Left = 788.001768760000000000
          Top = 73.001621949999990000
          Width = 78.001940140000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'IPI')
          ParentFont = False
        end
        object Line252: TfrxLineView
          Left = 1251.001752820000000000
          Top = 39.000970069999990000
          Height = 18.001901390000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape150: TfrxShapeView
          Left = 1172.002016760000000000
          Top = 56.999091929999990000
          Width = 80.999107430000000000
          Height = 44.001288260000000000
        end
        object Label252: TfrxMemoView
          Left = 1175.002963580000000000
          Top = 73.001621949999990000
          Width = 73.999417870000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'IPI')
          ParentFont = False
        end
        object Label253: TfrxMemoView
          Left = 790.001140130000000000
          Top = 10.000636380000000000
          Width = 553.001931950000000000
          Height = 15.998750490000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CLASSIFICA'#199#195'O FISCAL')
          ParentFont = False
        end
        object Shape151: TfrxShapeView
          Left = 1251.001752820000000000
          Top = 56.999091929999990000
          Width = 113.000387940000000000
          Height = 44.001288260000000000
        end
        object Label254: TfrxMemoView
          Left = 1257.003646460000000000
          Top = 73.001621949999990000
          Width = 99.998804740000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTOQUE QUANT.')
          ParentFont = False
        end
        object Shape152: TfrxShapeView
          Left = 1363.004344840000000000
          Top = 56.999091929999990000
          Width = 116.001334760000000000
          Height = 44.001288260000000000
        end
        object Label255: TfrxMemoView
          Left = 1367.003087580000000000
          Top = 73.001621949999990000
          Width = 108.000069750000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
        object DBText113: TfrxMemoView
          Left = 1366.005291660000000000
          Top = 10.000636380000000000
          Width = 108.000069750000000000
          Height = 15.998750490000000000
          DataField = 'NUCLFISCAL'
          DataSetName = 'piplivro'
          HAlign = haCenter
          Memo.UTF8W = (
            '[piplivro."NUCLFISCAL"]')
        end
        object Line301: TfrxLineView
          Left = 1362.002769390000000000
          Height = 39.998765990000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Label901: TfrxMemoView
          Left = 788.001768760000000000
          Top = 85.001629700000000000
          Width = 78.001940140000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Label258: TfrxMemoView
          Left = 1175.002963580000000000
          Top = 85.001629700000000000
          Width = 73.999417870000000000
          Height = 13.001583200000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 51.998773740000000000
          Top = 39.000970069999990000
          Height = 18.999697310000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line166: TfrxLineView
          Left = 785.000821940000000000
          Height = 39.998765990000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 1478.004104150000000000
          Top = 39.000970069999990000
          Height = 18.001901390000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 260.787570000000000000
        Width = 1539.402569000000000000
      end
    end
  end
end
