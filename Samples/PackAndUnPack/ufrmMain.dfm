object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 341
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTester: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnTester'
    TabOrder = 0
    OnClick = btnTesterClick
  end
  object edtData: TEdit
    Left = 112
    Top = 18
    Width = 425
    Height = 21
    TabOrder = 1
    Text = 'msgPack?1f123Abcd<FE>?FM?/></f>F/></></f?>'
  end
  object mmoOutPut: TMemo
    Left = 8
    Top = 72
    Width = 537
    Height = 249
    TabOrder = 2
  end
  object btnDelete: TButton
    Left = 592
    Top = 72
    Width = 75
    Height = 25
    Caption = 'btnDelete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
end
