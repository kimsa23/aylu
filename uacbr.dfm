object frmsetacbr: Tfrmsetacbr
  Left = 700
  Top = 224
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o'
  ClientHeight = 515
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 2
    Top = 76
    Width = 30
    Height = 13
    Caption = 'SMTP'
    Transparent = True
  end
  object Label5: TLabel
    Left = 2
    Top = 98
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
    Transparent = True
  end
  object Label27: TLabel
    Left = 2
    Top = 120
    Width = 38
    Height = 13
    Caption = 'Assunto'
    Transparent = True
  end
  object Label28: TLabel
    Left = 2
    Top = 151
    Width = 95
    Height = 13
    Caption = 'Mensagem do Email'
    Transparent = True
  end
  object trv: TTreeView
    Left = 0
    Top = 0
    Width = 132
    Height = 482
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnChange = trvChange
    Items.NodeData = {
      030A000000360000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010C4100720071007500690076006F007300200043005400450038
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
      0D4100720071007500690076006F00730020004D004400460045003600000000
      00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010C410072
      0071007500690076006F00730020004E00460045003400000000000000000000
      00FFFFFFFFFFFFFFFF000000000000000000000000010B430065007200740069
      00660069006300610064006F00280000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000000000000010545006D00610069006C0030000000000000
      0000000000FFFFFFFFFFFFFFFF00000000000000000000000001094700650072
      0061006C002000430054004500320000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000000000000010A47006500720061006C0020004D00440046
      004500300000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
      000000010947006500720061006C0020004E0046004500300000000000000000
      000000FFFFFFFFFFFFFFFF00000000000000000000000001094C006F0067006F
      006D006100720063006100320000000000000000000000FFFFFFFFFFFFFFFF00
      0000000000000000000000010A57006500620053006500720076006900630065
      00}
  end
  object ntb: TNotebook
    Left = 132
    Top = 0
    Width = 500
    Height = 482
    Align = alClient
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Arquivos CTE'
      object GroupBox3: TGroupBox
        Left = 0
        Top = 143
        Width = 500
        Height = 135
        Align = alTop
        Caption = 'Pasta de Arquivos'
        TabOrder = 0
        object Label21: TLabel
          Left = 3
          Top = 22
          Width = 20
          Height = 13
          Caption = 'CTe'
        end
        object SpeedButton5: TSpeedButton
          Left = 464
          Top = 17
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton5Click
        end
        object SpeedButton9: TSpeedButton
          Left = 464
          Top = 40
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton9Click
        end
        object Label25: TLabel
          Left = 3
          Top = 45
          Width = 53
          Height = 13
          Caption = 'Inutiliza'#231#227'o'
        end
        object SpeedButton11: TSpeedButton
          Left = 464
          Top = 63
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton11Click
        end
        object Label30: TLabel
          Left = 3
          Top = 68
          Width = 34
          Height = 13
          Caption = 'Evento'
        end
        object SpeedButton12: TSpeedButton
          Left = 464
          Top = 86
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton12Click
        end
        object SpeedButton13: TSpeedButton
          Left = 464
          Top = 112
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton13Click
        end
        object Label32: TLabel
          Left = 4
          Top = 115
          Width = 156
          Height = 13
          Caption = 'Diret'#243'rios com os XSD(Schemas)'
        end
        object edtPathCTE: TEdit
          Left = 163
          Top = 19
          Width = 298
          Height = 21
          TabOrder = 0
        end
        object edtPathInuCTE: TEdit
          Left = 163
          Top = 42
          Width = 298
          Height = 21
          TabOrder = 1
        end
        object edtPathEventoCTE: TEdit
          Left = 163
          Top = 65
          Width = 298
          Height = 21
          TabOrder = 2
        end
        object CheckBox1: TCheckBox
          Left = 4
          Top = 93
          Width = 141
          Height = 15
          Caption = 'Salvar Envio e Resposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtPathLogsCTE: TEdit
          Left = 163
          Top = 87
          Width = 298
          Height = 21
          TabOrder = 4
        end
        object edtPathSchemasCTE: TEdit
          Left = 163
          Top = 109
          Width = 298
          Height = 21
          TabOrder = 5
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 23
        Width = 500
        Height = 120
        Align = alTop
        Caption = 'Outras op'#231#245'es'
        TabOrder = 1
        object cbxSalvarArqsCTE: TCheckBox
          Left = 9
          Top = 17
          Width = 210
          Height = 17
          Caption = 'Salvar Arquivos em Pastas Separadas'
          TabOrder = 0
        end
        object cbxPastaMensalCTE: TCheckBox
          Left = 9
          Top = 33
          Width = 210
          Height = 17
          Caption = 'Criar Pastas Mensalmente'
          TabOrder = 1
        end
        object cbxAdicionaLiteralCTE: TCheckBox
          Left = 9
          Top = 49
          Width = 210
          Height = 17
          Caption = 'Adicionar Literal no nome das pastas'
          TabOrder = 2
        end
        object cbxEmissaoPathCTE: TCheckBox
          Left = 9
          Top = 65
          Width = 233
          Height = 17
          Caption = 'Salvar CTe pelo campo Data de Emiss'#227'o'
          TabOrder = 3
        end
        object cbxSepararPorCNPJCTE: TCheckBox
          Left = 9
          Top = 81
          Width = 233
          Height = 17
          Caption = 'Separar Arqs pelo CNPJ do Certificado'
          TabOrder = 4
        end
        object cbxSepararPorModeloCTE: TCheckBox
          Left = 9
          Top = 97
          Width = 251
          Height = 17
          Caption = 'Separar Arqs pelo Modelo do Documento'
          TabOrder = 5
        end
      end
      object cxLabel7: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Arquivos CTE'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Arquivos MDFE'
      object GroupBox5: TGroupBox
        Left = 0
        Top = 23
        Width = 500
        Height = 102
        Align = alTop
        Caption = 'Outras op'#231#245'es'
        TabOrder = 0
        object cbxSalvarArqsMDFE: TCheckBox
          Left = 9
          Top = 17
          Width = 210
          Height = 17
          Caption = 'Salvar Arquivos em Pastas Separadas'
          TabOrder = 0
        end
        object cbxPastaMensalMDFE: TCheckBox
          Left = 9
          Top = 33
          Width = 210
          Height = 17
          Caption = 'Criar Pastas Mensalmente'
          TabOrder = 1
        end
        object cbxAdicionaLiteralMDFE: TCheckBox
          Left = 9
          Top = 49
          Width = 210
          Height = 17
          Caption = 'Adicionar Literal no nome das pastas'
          TabOrder = 2
        end
        object cbxEmissaoPathMDFE: TCheckBox
          Left = 9
          Top = 65
          Width = 233
          Height = 17
          Caption = 'Salvar MDFe pelo campo Data de Emiss'#227'o'
          TabOrder = 3
        end
        object cbxSepararPorCNPJMDFE: TCheckBox
          Left = 9
          Top = 81
          Width = 233
          Height = 17
          Caption = 'Separar Arqs pelo CNPJ do Certificado'
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 125
        Width = 500
        Height = 113
        Align = alTop
        Caption = 'Pasta de Arquivos'
        TabOrder = 1
        object Label19: TLabel
          Left = 3
          Top = 22
          Width = 29
          Height = 13
          Caption = 'MDFe'
        end
        object SpeedButton2: TSpeedButton
          Left = 464
          Top = 17
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton2Click
        end
        object SpeedButton7: TSpeedButton
          Left = 464
          Top = 39
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton7Click
        end
        object Label24: TLabel
          Left = 3
          Top = 44
          Width = 34
          Height = 13
          Caption = 'Evento'
        end
        object SpeedButton4: TSpeedButton
          Left = 464
          Top = 61
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton4Click
        end
        object Label20: TLabel
          Left = 3
          Top = 91
          Width = 199
          Height = 13
          Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
        end
        object SpeedButton3: TSpeedButton
          Left = 464
          Top = 85
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = SpeedButton3Click
        end
        object edtPathMDFE: TEdit
          Left = 199
          Top = 19
          Width = 262
          Height = 21
          TabOrder = 0
        end
        object edtPathEventoMDFE: TEdit
          Left = 199
          Top = 41
          Width = 262
          Height = 21
          TabOrder = 1
        end
        object ckSalvarMDFE: TCheckBox
          Left = 3
          Top = 67
          Width = 199
          Height = 15
          Caption = 'Salvar Arquivos de Envio e Resposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtPathLogsMDFE: TEdit
          Left = 199
          Top = 64
          Width = 262
          Height = 21
          TabOrder = 3
        end
        object edtPathSchemasmdfe: TEdit
          Left = 199
          Top = 87
          Width = 262
          Height = 21
          TabOrder = 4
        end
      end
      object cxLabel10: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Arquivos MDFE'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Arquivos NFE'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 23
        Width = 500
        Height = 262
        Align = alTop
        TabOrder = 0
        object lblLOGS: TLabel
          Left = 9
          Top = 138
          Width = 23
          Height = 13
          Caption = 'Logs'
        end
        object sbtnPathSalvar: TSpeedButton
          Tag = 1
          Left = 464
          Top = 130
          Width = 23
          Height = 24
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbtnPathSalvarClick
        end
        object cbxSalvarArqs: TCheckBox
          Left = 9
          Top = 8
          Width = 210
          Height = 17
          Caption = 'Salvar Arquivos em Pastas Separadas'
          TabOrder = 0
          OnClick = cbxSalvarArqsClick
        end
        object cbxPastaMensal: TCheckBox
          Tag = 1
          Left = 9
          Top = 24
          Width = 210
          Height = 17
          Caption = 'Criar Pastas Mensalmente'
          TabOrder = 1
        end
        object cbxAdicionaLiteral: TCheckBox
          Tag = 1
          Left = 9
          Top = 40
          Width = 210
          Height = 17
          Caption = 'Adicionar Literal no nome das pastas'
          TabOrder = 2
        end
        object cbxEmissaoPathNFe: TCheckBox
          Tag = 1
          Left = 9
          Top = 56
          Width = 233
          Height = 17
          Caption = 'Salvar NFe pelo campo Data de Emiss'#227'o'
          TabOrder = 3
        end
        object cbxSalvaPathEvento: TCheckBox
          Tag = 1
          Left = 9
          Top = 72
          Width = 233
          Height = 17
          Caption = 'Salvar Arqs de Eventos'
          TabOrder = 4
        end
        object cbxSepararPorCNPJ: TCheckBox
          Tag = 1
          Left = 9
          Top = 88
          Width = 233
          Height = 17
          Caption = 'Separar Arqs pelo CNPJ do Certificado'
          TabOrder = 5
        end
        object cbxSepararPorModelo: TCheckBox
          Tag = 1
          Left = 9
          Top = 104
          Width = 251
          Height = 17
          Caption = 'Separar Arqs pelo Modelo do Documento'
          TabOrder = 6
        end
        object gbxnfearquivo: TGroupBox
          Left = 2
          Top = 153
          Width = 496
          Height = 107
          Align = alBottom
          Caption = 'Pasta de Arquivos'
          TabOrder = 7
          object Label35: TLabel
            Left = 3
            Top = 22
            Width = 20
            Height = 13
            Caption = 'NFe'
          end
          object sbPathNFe: TSpeedButton
            Tag = 1
            Left = 464
            Top = 12
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbPathNFeClick
          end
          object sbPathInu: TSpeedButton
            Tag = 1
            Left = 464
            Top = 35
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbPathInuClick
          end
          object Label40: TLabel
            Left = 3
            Top = 41
            Width = 53
            Height = 13
            Caption = 'Inutiliza'#231#227'o'
          end
          object Label41: TLabel
            Left = 3
            Top = 63
            Width = 29
            Height = 13
            Caption = 'DPEC'
          end
          object sbPathDPEC: TSpeedButton
            Tag = 1
            Left = 464
            Top = 57
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbPathDPECClick
          end
          object sbPathEvento: TSpeedButton
            Tag = 1
            Left = 464
            Top = 80
            Width = 23
            Height = 24
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = sbPathEventoClick
          end
          object Label47: TLabel
            Left = 3
            Top = 86
            Width = 144
            Height = 13
            Caption = 'Carta Corre'#231#227'o/Cancelamento'
          end
          object edtPathNFe: TEdit
            Tag = 1
            Left = 163
            Top = 15
            Width = 298
            Height = 21
            TabOrder = 0
          end
          object edtPathInu: TEdit
            Tag = 1
            Left = 163
            Top = 38
            Width = 298
            Height = 21
            TabOrder = 1
          end
          object edtPathDPEC: TEdit
            Tag = 1
            Left = 163
            Top = 60
            Width = 298
            Height = 21
            TabOrder = 2
          end
          object edtPathEvento: TEdit
            Tag = 1
            Left = 163
            Top = 83
            Width = 298
            Height = 21
            TabOrder = 3
          end
        end
        object ckSalvar: TCheckBox
          Tag = 1
          Left = 9
          Top = 120
          Width = 141
          Height = 15
          Caption = 'Salvar Envio e Resposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtPathLogs: TEdit
          Tag = 1
          Left = 163
          Top = 133
          Width = 298
          Height = 21
          TabOrder = 9
        end
      end
      object cxLabel6: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Arquivos NFE'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Certificado'
      object lblcaminho: TLabel
        Left = 4
        Top = 126
        Width = 41
        Height = 13
        Caption = 'Caminho'
        Transparent = True
      end
      object Label2: TLabel
        Left = 4
        Top = 149
        Width = 31
        Height = 13
        Caption = 'Senha'
        Transparent = True
      end
      object lblnumserie: TLabel
        Left = 4
        Top = 171
        Width = 54
        Height = 13
        Caption = 'N'#186' de S'#233'rie'
        Transparent = True
      end
      object lSSLLib: TLabel
        Left = 4
        Top = 37
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'SSLLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lCryptLib: TLabel
        Left = 7
        Top = 56
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'CryptLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lHttpLib: TLabel
        Left = 4
        Top = 81
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'HttpLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lXmlSign: TLabel
        Left = 6
        Top = 103
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'XMLSignLib'
        Color = clBtnFace
        ParentColor = False
      end
      object SpeedButton1: TSpeedButton
        Left = 470
        Top = 160
        Width = 23
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object sbtnGetCert: TcxButton
        Left = 445
        Top = 161
        Width = 23
        Height = 25
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        OptionsImage.NumGlyphs = 2
        TabOrder = 8
        OnClick = sbtnGetCertClick
      end
      object sbtnCaminhoCert: TcxButton
        Left = 445
        Top = 117
        Width = 23
        Height = 25
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        OptionsImage.NumGlyphs = 2
        TabOrder = 5
        OnClick = sbtnCaminhoCertClick
      end
      object edtNumSerie: TcxTextEdit
        Left = 69
        Top = 163
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 375
      end
      object edtSenha: TcxTextEdit
        Left = 69
        Top = 141
        Properties.EchoMode = eemPassword
        Properties.PasswordChar = '*'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 375
      end
      object edtCaminho: TcxTextEdit
        Left = 69
        Top = 118
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 375
      end
      object cbSSLLib: TComboBox
        Left = 69
        Top = 29
        Width = 375
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = cbSSLLibChange
      end
      object cbCryptLib: TComboBox
        Left = 69
        Top = 51
        Width = 375
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = cbCryptLibChange
      end
      object cbHttpLib: TComboBox
        Left = 69
        Top = 73
        Width = 375
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnChange = cbHttpLibChange
      end
      object cbXmlSignLib: TComboBox
        Left = 69
        Top = 95
        Width = 375
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnChange = cbXmlSignLibChange
      end
      object Button1: TButton
        Left = 5
        Top = 191
        Width = 76
        Height = 25
        Caption = 'Data Validade'
        TabOrder = 9
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 83
        Top = 191
        Width = 76
        Height = 25
        Caption = 'Subject Name'
        TabOrder = 10
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 161
        Top = 191
        Width = 48
        Height = 25
        Caption = 'CNPJ'
        TabOrder = 11
        OnClick = Button4Click
      end
      object Button10: TButton
        Left = 211
        Top = 191
        Width = 67
        Height = 25
        Caption = 'Issuer Name'
        TabOrder = 12
        OnClick = Button10Click
      end
      object cxLabel5: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Certificado'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Email'
      object Label4: TLabel
        Left = 6
        Top = 89
        Width = 30
        Height = 13
        Caption = 'SMTP'
        Transparent = True
      end
      object Label6: TLabel
        Left = 6
        Top = 111
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
        Transparent = True
      end
      object Label8: TLabel
        Left = 6
        Top = 136
        Width = 38
        Height = 13
        Caption = 'Assunto'
        Transparent = True
      end
      object Label9: TLabel
        Left = 255
        Top = 89
        Width = 25
        Height = 13
        Caption = 'Porta'
        Transparent = True
      end
      object Label10: TLabel
        Left = 255
        Top = 111
        Width = 31
        Height = 13
        Caption = 'Senha'
        Transparent = True
      end
      object Label11: TLabel
        Left = 6
        Top = 176
        Width = 95
        Height = 13
        Caption = 'Mensagem do Email'
        Transparent = True
      end
      object memEmailMsg: TcxMemo
        Left = 6
        Top = 287
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Height = 100
        Width = 491
      end
      object ckbEmailSSL: TcxCheckBox
        Left = 6
        Top = 155
        Caption = 'SMTP exige conex'#227'o segura'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Transparent = True
      end
      object edtEmailAssunto: TcxTextEdit
        Left = 46
        Top = 129
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 451
      end
      object edtSmtpPass: TcxTextEdit
        Left = 292
        Top = 105
        Properties.EchoMode = eemPassword
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 204
      end
      object edtSmtpUser: TcxTextEdit
        Left = 46
        Top = 105
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 204
      end
      object edtSmtpHost: TcxTextEdit
        Left = 46
        Top = 84
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 204
      end
      object edtSmtpPort: TcxTextEdit
        Left = 292
        Top = 83
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 204
      end
      object ckbenviarpdf: TcxCheckBox
        Left = 171
        Top = 155
        Caption = 'Enviar PDF'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Transparent = True
      end
      object rdgtpenvio: TcxRadioGroup
        Left = 6
        Top = 26
        Caption = 'Tipo Envio'
        Properties.Columns = 4
        Properties.Items = <
          item
            Caption = 'Outlook'
            Value = 0
          end
          item
            Caption = 'Gmail'
            Value = 1
          end
          item
            Caption = 'UOL'
            Value = '3'
          end
          item
            Caption = 'Hotmail/Live/Outlook'
            Value = '2'
          end
          item
            Caption = 'Outro'
            Value = '4'
          end>
        Properties.OnChange = rdgtpenvioPropertiesChange
        ItemIndex = 0
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 55
        Width = 491
      end
      object cxLabel1: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Email'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Geral CTE'
      object rgTipoDACTe: TRadioGroup
        Left = 0
        Top = 23
        Width = 500
        Height = 35
        Align = alTop
        Caption = 'DACTe'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Retrato'
          'Paisagem')
        TabOrder = 0
      end
      object rgFormaEmissao: TRadioGroup
        Left = 0
        Top = 58
        Width = 500
        Height = 60
        Align = alTop
        Caption = 'Forma de Emiss'#227'o'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '1 = Normal'
          '4 = EPEC'
          '5 = Conting. FSDA'
          '7 = SVC-RS'
          '8 = SVC-SP')
        TabOrder = 1
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Geral CTE'
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
      object rdgversaodfcte: TRadioGroup
        Left = 0
        Top = 118
        Width = 500
        Height = 38
        Align = alTop
        Caption = 'Vers'#227'o Documento Fiscal '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          '2.0'
          '3.0')
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Geral MDFE'
      object rgFormaEmissaoMDFE: TRadioGroup
        Left = 0
        Top = 23
        Width = 500
        Height = 31
        Align = alTop
        Caption = 'Forma de Emiss'#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Conting'#234'ncia')
        TabOrder = 0
      end
      object cxLabel8: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Geral MDFE'
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
      object rgTipoDAMDFe: TRadioGroup
        Left = 0
        Top = 54
        Width = 500
        Height = 31
        Align = alTop
        Caption = 'DAMDFe'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Retrato'
          'Paisagem')
        TabOrder = 2
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Geral NFE'
      object Label29: TLabel
        Left = 4
        Top = 92
        Width = 110
        Height = 13
        Caption = 'Forma de Emiss'#227'o NFE'
      end
      object Label31: TLabel
        Left = 4
        Top = 70
        Width = 68
        Height = 13
        Caption = 'Formato Alerta'
      end
      object Label1: TLabel
        Left = 4
        Top = 190
        Width = 123
        Height = 13
        Caption = 'Modelo Documento Fiscal'
      end
      object Label12: TLabel
        Left = 4
        Top = 212
        Width = 121
        Height = 13
        Caption = 'Vers'#227'o Documento Fiscal'
      end
      object Label33: TLabel
        Left = 4
        Top = 234
        Width = 75
        Height = 13
        Caption = 'IdToken/IdCSC'
      end
      object Label34: TLabel
        Left = 4
        Top = 278
        Width = 57
        Height = 13
        Caption = 'Token/CSC'
      end
      object lbldscontingencia: TLabel
        Left = 4
        Top = 114
        Width = 120
        Height = 13
        Caption = 'Justificativa Conting'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label42: TLabel
        Left = 4
        Top = 256
        Width = 156
        Height = 13
        Caption = 'Diret'#243'rios com os XSD(Schemas)'
      end
      object spPathSchemas: TSpeedButton
        Left = 477
        Top = 247
        Width = 23
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = spPathSchemasClick
      end
      object cbFormaEmissao: TComboBox
        Left = 210
        Top = 86
        Width = 286
        Height = 21
        TabOrder = 3
      end
      object cbVersaoDF: TComboBox
        Left = 210
        Top = 206
        Width = 286
        Height = 21
        TabOrder = 6
      end
      object cbModeloDF: TComboBox
        Left = 210
        Top = 184
        Width = 286
        Height = 21
        TabOrder = 5
      end
      object cbxAtualizarXML: TCheckBox
        Left = 210
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Atualizar XML'
        TabOrder = 0
      end
      object cbxExibirErroSchema: TCheckBox
        Left = 210
        Top = 47
        Width = 129
        Height = 17
        Caption = 'Exibir Erro Schema'
        TabOrder = 1
      end
      object edtFormatoAlerta: TEdit
        Left = 210
        Top = 64
        Width = 286
        Height = 21
        TabOrder = 2
      end
      object cbxRetirarAcentos: TCheckBox
        Left = 210
        Top = 294
        Width = 193
        Height = 17
        Caption = 'Retirar Acentos dos XMLs enviados'
        TabOrder = 10
      end
      object edtIdToken: TEdit
        Left = 210
        Top = 228
        Width = 286
        Height = 21
        TabOrder = 7
      end
      object edtToken: TEdit
        Left = 210
        Top = 272
        Width = 286
        Height = 21
        TabOrder = 9
      end
      object memdscontingencia: TcxMemo
        Left = 210
        Top = 108
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Height = 75
        Width = 286
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Geral NFE'
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
      object rgTipoDanfe: TRadioGroup
        Left = 210
        Top = 316
        Width = 286
        Height = 31
        Caption = 'DANFE'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Retrato'
          'Paisagem')
        TabOrder = 12
      end
      object ckbbovtottribitem: TcxCheckBox
        Left = 210
        Top = 348
        Caption = 'Exibir total tributos por '#237'tem na impress'#227'o'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        Transparent = True
      end
      object edtPathSchemas: TEdit
        Left = 210
        Top = 250
        Width = 264
        Height = 21
        TabOrder = 8
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Logomarca'
      object Label7: TLabel
        Left = 8
        Top = 31
        Width = 57
        Height = 13
        Caption = 'Logo Marca'
      end
      object sbtnLogoMarca: TSpeedButton
        Left = 470
        Top = 24
        Width = 23
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = sbtnLogoMarcaClick
      end
      object edtLogoMarca: TEdit
        Left = 75
        Top = 27
        Width = 393
        Height = 21
        TabOrder = 0
      end
      object cxLabel4: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Logomarca'
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
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'WebService'
      object Label13: TLabel
        Left = 4
        Top = 40
        Width = 121
        Height = 13
        Caption = 'Selecione UF de Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lTimeOut: TLabel
        Left = 4
        Top = 138
        Width = 40
        Height = 13
        Caption = 'TimeOut'
        Color = clBtnFace
        ParentColor = False
      end
      object Label14: TLabel
        Left = 4
        Top = 162
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'SSLType'
        Color = clBtnFace
        ParentColor = False
      end
      object gbProxy: TGroupBox
        Left = 0
        Top = 373
        Width = 500
        Height = 109
        Align = alBottom
        Caption = 'Proxy'
        TabOrder = 0
        object Label15: TLabel
          Left = 8
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label16: TLabel
          Left = 8
          Top = 38
          Width = 25
          Height = 13
          Caption = 'Porta'
        end
        object Label17: TLabel
          Left = 8
          Top = 62
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label18: TLabel
          Left = 8
          Top = 84
          Width = 31
          Height = 13
          Caption = 'Senha'
        end
        object edtProxyHost: TEdit
          Left = 136
          Top = 14
          Width = 353
          Height = 21
          TabOrder = 0
        end
        object edtProxyPorta: TEdit
          Left = 136
          Top = 36
          Width = 353
          Height = 21
          TabOrder = 1
        end
        object edtProxyUser: TEdit
          Left = 136
          Top = 58
          Width = 353
          Height = 21
          TabOrder = 2
        end
        object edtProxySenha: TEdit
          Left = 136
          Top = 80
          Width = 353
          Height = 21
          PasswordChar = '*'
          TabOrder = 3
        end
      end
      object gbxRetornoEnvio: TGroupBox
        Left = 0
        Top = 264
        Width = 500
        Height = 109
        Align = alBottom
        Caption = 'Retorno de Envio de NFe'
        TabOrder = 1
        object Label36: TLabel
          Left = 8
          Top = 56
          Width = 50
          Height = 13
          Caption = 'Tentativas'
        end
        object Label37: TLabel
          Left = 8
          Top = 78
          Width = 41
          Height = 13
          Caption = 'Intervalo'
        end
        object Label38: TLabel
          Left = 8
          Top = 34
          Width = 43
          Height = 13
          Hint = 
            'Aguardar quantos segundos para primeira consulta de retorno de e' +
            'nvio'
          Caption = 'Aguardar'
        end
        object cbxAjustarAut: TCheckBox
          Left = 136
          Top = 14
          Width = 234
          Height = 17
          Caption = 'Ajustar Automaticamente prop. "Aguardar"'
          TabOrder = 0
        end
        object edtTentativas: TEdit
          Left = 136
          Top = 53
          Width = 353
          Height = 21
          TabOrder = 2
        end
        object edtIntervalo: TEdit
          Left = 136
          Top = 75
          Width = 353
          Height = 21
          TabOrder = 3
        end
        object edtAguardar: TEdit
          Left = 136
          Top = 31
          Width = 353
          Height = 21
          Hint = 
            'Aguardar quantos segundos para primeira consulta de retorno de e' +
            'nvio'
          TabOrder = 1
        end
      end
      object cbxVisualizar: TCheckBox
        Left = 138
        Top = 95
        Width = 153
        Height = 17
        Caption = 'Visualizar Mensagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cbUF: TComboBox
        Left = 138
        Top = 29
        Width = 357
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 24
        ParentFont = False
        TabOrder = 3
        Text = 'SP'
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object rgTipoAmb: TRadioGroup
        Left = 138
        Top = 57
        Width = 357
        Height = 36
        Caption = 'Selecione o Ambiente de Destino'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 4
      end
      object cbxSalvarSOAP: TCheckBox
        Left = 138
        Top = 113
        Width = 147
        Height = 17
        Caption = 'Salvar envelope SOAP'
        TabOrder = 5
      end
      object seTimeOut: TSpinEdit
        Left = 138
        Top = 132
        Width = 357
        Height = 22
        Increment = 10
        MaxValue = 999999
        MinValue = 1000
        TabOrder = 6
        Value = 5000
      end
      object cbSSLType: TComboBox
        Left = 138
        Top = 156
        Width = 357
        Height = 21
        Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
        Style = csDropDownList
        TabOrder = 7
        OnChange = cbSSLTypeChange
      end
      object cxLabel3: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'WebService'
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 632
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnSalvarConfig: TcxButton
      Left = 238
      Top = 4
      Width = 75
      Height = 25
      Action = actsalvar
      LookAndFeel.NativeStyle = False
      TabOrder = 0
    end
    object btncancelar: TcxButton
      Left = 319
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      LookAndFeel.NativeStyle = False
      ModalResult = 2
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 592
    Top = 480
  end
  object act: TActionList
    Images = dtmmain.imlMain
    Left = 559
    Top = 480
    object actsalvar: TAction
      Caption = 'Salvar'
      ImageIndex = 2
      OnExecute = actsalvarExecute
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormaEmissao = teContingencia
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve200
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.TimeOut = 20000
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 509
    Top = 481
  end
end
