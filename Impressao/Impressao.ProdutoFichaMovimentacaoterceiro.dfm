object frmconsultaProdutoImprimirFichaMovimentacao1: TfrmconsultaProdutoImprimirFichaMovimentacao1
  Left = 511
  Top = 274
  ClientHeight = 218
  ClientWidth = 597
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
    Left = 43
    Top = 72
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42577.355299236100000000
    ReportOptions.Name = 'Report'
    ReportOptions.LastChange = 42577.355339224500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 75
    Top = 72
    Datasets = <
      item
        DataSet = dbd1
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
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 6.350000000000000000
      RightMargin = 6.350000000000000000
      TopMargin = 6.350000000000000000
      BottomMargin = 6.350000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.999697310000000000
        Top = 200.315090000000000000
        Width = 745.701269000000000000
        DataSet = dbd1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line1: TfrxLineView
          Top = 17.000325940000000000
          Width = 746.003631400000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object DBText708: TfrxMemoView
          Left = 3.000946820000000000
          Width = 48.000031000000000000
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
            '[frxDBDataset1."NUDOCUMENTO"]')
          ParentFont = False
        end
        object DBText67: TfrxMemoView
          Left = 68.999099680000000000
          Width = 61.001614200000000000
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
          Left = 145.001668450000000000
          Width = 20.001272760000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."TPENTSAI"]')
          ParentFont = False
        end
        object DBText79: TfrxMemoView
          Left = 191.002328080000000000
          Width = 27.998758240000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NMREDUZIDO"]')
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
            '[frxDBDataset1."QTITEM"]')
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
            '[frxDBDataset1."QTSALDO"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 1.001575450000000000
          Top = 17.000325940000000000
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
          Top = 39.000970070000000000
          Width = 745.701269000000000000
          Height = 17.000325940000000000
        end
        object Shape10: TfrxShapeView
          Top = 20.999068680000000000
          Width = 745.701269000000000000
          Height = 17.000325940000000000
        end
        object Shape102: TfrxShapeView
          Width = 745.701269000000000000
          Height = 20.999068680000000000
        end
        object DBText68: TfrxMemoView
          Left = 49.001606450000000000
          Top = 1.999371370000000000
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
          Top = 1.999371370000000000
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
          Top = 1.999371370000000000
          Width = 58.718778080000000000
          Height = 15.681269970000000000
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."nmunidade"]')
          ParentFont = False
        end
        object Label80: TfrxMemoView
          Left = 3.000946820000000000
          Top = 20.999068680000000000
          Width = 48.000031000000000000
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
          Left = 66.999728310000000000
          Top = 20.999068680000000000
          Width = 61.001614200000000000
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
          Left = 144.000093000000000000
          Top = 20.999068680000000000
          Width = 20.001272760000000000
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
          Left = 190.000752630000000000
          Top = 22.000644130000000000
          Width = 27.998758240000000000
          Height = 15.998750490000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TD')
          ParentFont = False
        end
        object Label82: TfrxMemoView
          Left = 263.799855410000000000
          Top = 20.999068680000000000
          Width = 67.200043400000000000
          Height = 15.518750180000000000
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
        object Label109: TfrxMemoView
          Left = 449.363439820000000000
          Top = 22.000644130000000000
          Width = 72.638787070000000000
          Height = 15.518750180000000000
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
        object Label802: TfrxMemoView
          Left = 1.999371370000000000
          Top = 1.999371370000000000
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
          Top = 1.999371370000000000
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
          Top = 1.999371370000000000
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
        object DBText105: TfrxMemoView
          Left = 385.682138850000000000
          Top = 39.000970070000000000
          Width = 136.320088040000000000
          Height = 15.518750180000000000
          DataField = 'QTSALDOANTERIOR'
          DataSet = frmreferenciacruzada.pip
          DataSetName = 'pip'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[pip."QTSALDOANTERIOR"]')
          ParentFont = False
        end
        object Label803: TfrxMemoView
          Top = 39.000970070000000000
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
        Height = 41.000341440000000000
        Top = 18.897650000000000000
        Width = 745.701269000000000000
        object Shape44: TfrxShapeView
          Width = 745.701269000000000000
          Height = 41.000341440000000000
        end
        object lblnmempresacadcliente: TfrxMemoView
          Left = 1.920001240000000000
          Top = 3.000946820000000000
          Width = 102.999751560000000000
          Height = 20.160013020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label240: TfrxMemoView
          Left = 177.452713030000000000
          Top = 10.000636380000000000
          Width = 292.826645810000000000
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
          Top = 5.000318190000000000
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
          Top = 22.000644130000000000
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
          Top = 5.000318190000000000
          Width = 65.000356940000000000
          Height = 15.000954570000000000
          Memo.UTF8W = (
            '[Date]')
        end
        object SystemVariable14: TfrxMemoView
          Left = 647.002622580000000000
          Top = 22.000644130000000000
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
          Top = 3.998742740000000000
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
          Top = 3.998742740000000000
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
