object frmdownload: Tfrmdownload
  Left = 347
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Download de Atualiza'#231#227'o'
  ClientHeight = 82
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    470
    82)
  PixelsPerInch = 96
  TextHeight = 13
  object bDownload: TBitBtn
    Left = 24
    Top = 8
    Width = 99
    Height = 26
    Caption = 'Download'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
      70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
      70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
      70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = bDownloadClick
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 41
    Width = 405
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object fACBrDownload: TACBrDownload
    SizeRecvBuffer = 0
    OnAfterDownload = fACBrDownloadAfterDownload
    OnHookStatus = HookStatus
    OnHookMonitor = HookMonitor
    Left = 430
    Top = 30
  end
end
