object frmconsultaProdutoImprimirFichaMovimentacao: TfrmconsultaProdutoImprimirFichaMovimentacao
  Left = 589
  Top = 291
  ClientHeight = 145
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbd1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 19
    Top = 56
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42577.355135034690000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42577.355171620400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 51
    Top = 56
    Datasets = <
      item
        DataSet = dbd1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'vNMEmpresa'
        Value = #39#39
      end>
    Style = <>
    object DataPage1: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 17.000325940000000000
        Top = 200.315090000000000000
        Width = 745.701269000000000000
        DataSet = dbd1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line1: TfrxLineView
          Top = 17.000325940000010000
          Width = 746.003631400000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object DBText708: TfrxMemoView
          Width = 56.692913385826770000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."DOC"]')
          ParentFont = False
        end
        object DBText67: TfrxMemoView
          Left = 115.999099680000000000
          Width = 64.781144200000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DTEMISSAO"]')
          ParentFont = False
        end
        object DBText72: TfrxMemoView
          Left = 181.001668450000000000
          Width = 23.780802760000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."ES"]')
          ParentFont = False
        end
        object DBText79: TfrxMemoView
          Left = 205.002328080000000000
          Width = 35.557818240000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."TD"]')
          ParentFont = False
        end
        object DBText83: TfrxMemoView
          Left = 241.001730450000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QUANT"]')
          ParentFont = False
        end
        object DBText101: TfrxMemoView
          Left = 337.001792450000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VT"]')
          ParentFont = False
        end
        object DBText102: TfrxMemoView
          Left = 431.002483080000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."SALDOQTDE"]')
          ParentFont = False
        end
        object DBText103: TfrxMemoView
          Left = 546.002242390000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."SALDOVALOR"]')
          ParentFont = False
        end
        object DBText104: TfrxMemoView
          Left = 653.000736690000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CUSTOM"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 1.001575450000000000
          Top = 17.000325940000010000
          Width = 746.003631400000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.001296010000000000
        Top = 120.944960000000000000
        Width = 745.701269000000000000
        Condition = 'frxDBDataset1."CDPRODUTO"'
        object Shape103: TfrxShapeView
          Top = 39.000970070000010000
          Width = 745.701269000000000000
          Height = 17.000325940000000000
        end
        object Shape10: TfrxShapeView
          Top = 20.999068680000010000
          Width = 745.701269000000000000
          Height = 17.000325940000000000
        end
        object Shape102: TfrxShapeView
          Width = 745.701269000000000000
          Height = 20.999068680000000000
        end
        object DBText68: TfrxMemoView
          Left = 49.001606450000000000
          Top = 1.999371370000006000
          Width = 78.999736060000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CDPRODUTO"]')
          ParentFont = False
        end
        object DBText69: TfrxMemoView
          Left = 185.000434440000000000
          Top = 1.999371370000006000
          Width = 222.002033140000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMPRODUTO"]')
          ParentFont = False
        end
        object DBText70: TfrxMemoView
          Left = 556.002878770000000000
          Top = 1.999371370000006000
          Width = 32.999076430000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."UNIDADE"]')
          ParentFont = False
        end
        object Label80: TfrxMemoView
          Top = 20.999068680000010000
          Width = 56.692913385826770000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Doc')
          ParentFont = False
        end
        object Label81: TfrxMemoView
          Left = 113.999728310000000000
          Top = 20.999068680000010000
          Width = 64.781144200000000000
          Height = 15.518750180000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
        end
        object Label107: TfrxMemoView
          Left = 180.000093000000000000
          Top = 20.999068680000010000
          Width = 23.780802760000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'E/S')
          ParentFont = False
        end
        object Label108: TfrxMemoView
          Left = 204.000752630000000000
          Top = 22.000644130000000000
          Width = 35.557818240000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Label82: TfrxMemoView
          Left = 240.000155000000000000
          Top = 20.999068680000010000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Label116: TfrxMemoView
          Left = 334.000845630000000000
          Top = 20.999068680000010000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Label109: TfrxMemoView
          Left = 431.002483080000000000
          Top = 22.000644130000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo QTDE')
          ParentFont = False
        end
        object Label117: TfrxMemoView
          Left = 544.002871020000000000
          Top = 22.000644130000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Valor')
          ParentFont = False
        end
        object Label119: TfrxMemoView
          Left = 653.000736690000000000
          Top = 22.000644130000000000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo M'#233'dio')
          ParentFont = False
        end
        object Label802: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000006000
          Width = 44.798769090000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
        end
        object Label120: TfrxMemoView
          Left = 135.998827990000000000
          Top = 1.999371370000006000
          Width = 49.999402370000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Label1201: TfrxMemoView
          Left = 411.001210320000000000
          Top = 1.999371370000006000
          Width = 142.000721630000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Unidade de Estoque Atual:')
          ParentFont = False
        end
        object DBText107: TfrxMemoView
          Left = 653.000736690000000000
          Top = 39.000970070000010000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTCUSTOM"]')
          ParentFont = False
        end
        object DBText106: TfrxMemoView
          Left = 544.002871020000000000
          Top = 39.000970070000010000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTSALDOV"]')
          ParentFont = False
        end
        object DBText105: TfrxMemoView
          Left = 431.002483080000000000
          Top = 39.000970070000010000
          Width = 90.999743810000000000
          Height = 15.998750490000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QTSALDOANT"]')
          ParentFont = False
        end
        object Label803: TfrxMemoView
          Top = 39.000970070000010000
          Width = 90.001947890000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Saldo Anterior:')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 41.219554180000000000
        Top = 18.897650000000000000
        Width = 745.701269000000000000
        object Shape44: TfrxShapeView
          Top = 0.219212739999999700
          Width = 745.701269000000000000
          Height = 41.000341440000000000
        end
        object lblnmempresacadcliente: TfrxMemoView
          Left = 1.920001240000000000
          Top = 3.220159559999999000
          Width = 102.999751560000000000
          Height = 20.160013020000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[vNMEmpresa]')
          ParentFont = False
        end
        object Label240: TfrxMemoView
          Left = 132.098353030000000000
          Top = 10.219849120000000000
          Width = 402.433015810000000000
          Height = 20.160013020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ficha de Movimenta'#231#227'o')
          ParentFont = False
        end
        object Label61: TfrxMemoView
          Left = 611.002599330000000000
          Top = 5.219530930000001000
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
        object Label62: TfrxMemoView
          Left = 610.001023880000000000
          Top = 22.219856870000000000
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
        object SystemVariable101: TfrxMemoView
          Left = 647.002622580000000000
          Top = 5.219530930000001000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            '[Date]')
        end
        object SystemVariable14: TfrxMemoView
          Left = 647.002622580000000000
          Top = 22.219856870000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            '[Time]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 24.000015500000000000
        Top = 279.685220000000000000
        Width = 745.701269000000000000
        object Shape22: TfrxShapeView
          Width = 745.701269000000000000
          Height = 24.000015500000000000
        end
        object Label64: TfrxMemoView
          Left = 508.002847770000000000
          Top = 3.998742740000012000
          Width = 112.800072850000000000
          Height = 15.681269970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'Quipos Tecnologia - ')
          ParentFont = False
        end
        object SystemVariable15: TfrxMemoView
          Left = 625.001978450000000000
          Top = 3.998742740000012000
          Width = 87.001001070000000000
          Height = 15.000954570000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'Page [Page#] of [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
end
