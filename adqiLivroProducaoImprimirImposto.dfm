object frmLivroProducaoImprimirImposto: TfrmLivroProducaoImprimirImposto
  Left = 573
  Top = 368
  ClientHeight = 54
  ClientWidth = 124
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dts: TDataSource
    Left = 28
  end
  object pip: TppBDEPipeline
    DataSource = dts
    UserName = 'pip'
    Left = 56
  end
  object rpt: TppReport
    AutoStop = False
    DataPipeline = pip
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\software\Diario.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 84
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'pip'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape101'
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 11377
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ppShape6: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape6'
        ParentWidth = True
        mmHeight = 10848
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object lblnmempresaNota: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblnmempresaNota'
        Border.Weight = 1.000000000000000000
        Caption = 'CIPALAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 529
        mmTop = 794
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2401'
        Border.Weight = 1.000000000000000000
        Caption = 'Comparativo IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5376
        mmLeft = 81492
        mmTop = 794
        mmWidth = 34798
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        Border.Weight = 1.000000000000000000
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 1852
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        Border.Weight = 1.000000000000000000
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 168275
        mmTop = 6350
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable101'
        Border.Weight = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 1852
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable5'
        Border.Weight = 1.000000000000000000
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 6350
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        Border.Weight = 1.000000000000000000
        Caption = 'Nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4106
        mmLeft = 529
        mmTop = 11642
        mmWidth = 7281
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label502'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Entrada Produ'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 11642
        mmWidth = 33602
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label18'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Saida Produ'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4106
        mmLeft = 66411
        mmTop = 11642
        mmWidth = 29591
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Entrada Fiscal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 108215
        mmTop = 11642
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label20'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Saida Fiscal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 11642
        mmWidth = 23813
        BandType = 0
        LayerName = Foreground
      end
      object lblmesperiodoNota: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblmesperiodo'
        Border.Weight = 1.000000000000000000
        Caption = 'lblmesperiodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 6615
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        OnGetText = ppDBText6GetText
        Border.Weight = 1.000000000000000000
        DataField = 'NUDOCUMENTO'
        DataPipeline = pip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4233
        mmLeft = 529
        mmTop = 265
        mmWidth = 20235
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText304'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAPRODUCAO'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 265
        mmWidth = 33073
        BandType = 4
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        Pen.Color = clSilver
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 4763
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4149
        mmLeft = 57150
        mmTop = 265
        mmWidth = 38989
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAFISCAL'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4233
        mmLeft = 98690
        mmTop = 529
        mmWidth = 37306
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAFISCAL'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4233
        mmLeft = 139700
        mmTop = 265
        mmWidth = 37306
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppShape7: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape7'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label22'
        Border.Weight = 1.000000000000000000
        Caption = 'Quipos Tecnologia - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 140759
        mmTop = 1852
        mmWidth = 29210
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable6'
        Border.Weight = 1.000000000000000000
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 1588
        mmWidth = 23019
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppShape8: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape8'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label23'
        Border.Weight = 1.000000000000000000
        Caption = 'Total Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 529
        mmWidth = 17727
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc5: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc5'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAPRODUCAO'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4022
        mmLeft = 11
        mmTop = 794
        mmWidth = 58462
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc6: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc6'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4022
        mmLeft = 43888
        mmTop = 794
        mmWidth = 52155
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc7: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc7'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAFISCAL'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4022
        mmLeft = 85842
        mmTop = 794
        mmWidth = 50419
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc8: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc8'
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pip
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pip'
        mmHeight = 4022
        mmLeft = 124852
        mmTop = 794
        mmWidth = 52155
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object rptmes: TppReport
    AutoStop = False
    DataPipeline = pipmes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\software\Diario.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 84
    Top = 28
    Version = '18.01'
    mmColumnWidth = 0
    DataPipelineName = 'pipmes'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppShape2: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape10'
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 11377
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape44'
        ParentWidth = True
        mmHeight = 10848
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
      end
      object lblnmempresaMes: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblnmempresaMes'
        Border.Weight = 1.000000000000000000
        Caption = 'CIPALAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 529
        mmTop = 794
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label240'
        Border.Weight = 1.000000000000000000
        Caption = 'Comparativo IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5376
        mmLeft = 81423
        mmTop = 794
        mmWidth = 34798
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label51'
        Border.Weight = 1.000000000000000000
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 1852
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label52'
        Border.Weight = 1.000000000000000000
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 168275
        mmTop = 6350
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable10'
        Border.Weight = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 1852
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable11'
        Border.Weight = 1.000000000000000000
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 6350
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label49'
        Border.Weight = 1.000000000000000000
        Caption = 'M'#234's'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4106
        mmLeft = 529
        mmTop = 11768
        mmWidth = 6308
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label50'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Entrada Produ'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 11642
        mmWidth = 33602
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label501'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Saida Produ'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4106
        mmLeft = 66411
        mmTop = 11642
        mmWidth = 29591
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Entrada Fiscal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 108215
        mmTop = 11642
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        Border.Weight = 1.000000000000000000
        Caption = 'IPI Saida Fiscal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 11642
        mmWidth = 23813
        BandType = 0
        LayerName = Foreground1
      end
      object lblmesperiodo: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblmesperiodo'
        Border.Weight = 1.000000000000000000
        Caption = 'lblmesperiodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67470
        mmTop = 6615
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText29'
        Border.Weight = 1.000000000000000000
        DataField = 'DTINICIO'
        DataPipeline = pipmes
        DisplayFormat = 'mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4233
        mmLeft = 529
        mmTop = 265
        mmWidth = 20235
        BandType = 4
        LayerName = Foreground1
      end
      object ppvlipientradaproducao: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText30'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAPRODUCAO'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4149
        mmLeft = 25665
        mmTop = 265
        mmWidth = 30427
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.Weight = 1.000000000000000000
        Pen.Color = clSilver
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 4763
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
      end
      object ppvlipisaidaproducao: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText301'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4149
        mmLeft = 57150
        mmTop = 265
        mmWidth = 38894
        BandType = 4
        LayerName = Foreground1
      end
      object ppvlipientradafiscal: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText302'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAFISCAL'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4149
        mmLeft = 98425
        mmTop = 529
        mmWidth = 37835
        BandType = 4
        LayerName = Foreground1
      end
      object ppvlipisaidafiscal: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText303'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAFISCAL'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4149
        mmLeft = 145257
        mmTop = 265
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppShape4: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape45'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label53'
        Border.Weight = 1.000000000000000000
        Caption = 'Quipos Tecnologia - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4057
        mmLeft = 140759
        mmTop = 1852
        mmWidth = 29210
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable12'
        Border.Weight = 1.000000000000000000
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 1588
        mmWidth = 23019
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape5: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label31'
        Border.Weight = 1.000000000000000000
        Caption = 'Total Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 529
        mmWidth = 17727
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc9'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAPRODUCAO'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 794
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc1'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4022
        mmLeft = 57150
        mmTop = 794
        mmWidth = 38894
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc3'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPIENTRADAFISCAL'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4022
        mmLeft = 98425
        mmTop = 794
        mmWidth = 37835
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc4: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc4'
        Border.Weight = 1.000000000000000000
        DataField = 'VLIPISAIDAPRODUCAO'
        DataPipeline = pipmes
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pipmes'
        mmHeight = 4022
        mmLeft = 145257
        mmTop = 794
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground1
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object pipmes: TppBDEPipeline
    DataSource = dtsmes
    UserName = 'pip1'
    Left = 56
    Top = 28
    object pipmesppField1: TppField
      FieldAlias = 'DTINICIO'
      FieldName = 'DTINICIO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 0
    end
    object pipmesppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIPISAIDAPRODUCAO'
      FieldName = 'VLIPISAIDAPRODUCAO'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pipmesppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIPIENTRADAPRODUCAO'
      FieldName = 'VLIPIENTRADAPRODUCAO'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pipmesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIPISAIDAFISCAL'
      FieldName = 'VLIPISAIDAFISCAL'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pipmesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLIPIENTRADAFISCAL'
      FieldName = 'VLIPIENTRADAFISCAL'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object dtsmes: TDataSource
    Left = 28
    Top = 28
  end
end
