object MainForm: TMainForm
  Left = 443
  Top = 298
  Caption = 'Cryptogram tools'
  ClientHeight = 440
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edSource: TMemo
    Left = 167
    Top = 0
    Width = 550
    Height = 161
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object btnResolve: TButton
    Left = 576
    Top = 168
    Width = 141
    Height = 32
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Resolve'
    TabOrder = 1
    OnClick = btnResolveClick
  end
  object edResult: TMemo
    Left = 167
    Top = 206
    Width = 550
    Height = 233
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object lbAlphabet: TListBox
    Left = 0
    Top = 0
    Width = 161
    Height = 440
    Align = alLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    ScrollWidth = 159
    TabOrder = 3
    OnDblClick = lbAlphabetDblClick
  end
  object edKey: TEdit
    Left = 167
    Top = 168
    Width = 401
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'notes frcypgamxlidh'
  end
end
