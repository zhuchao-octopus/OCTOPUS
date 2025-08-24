object PageSetupFrm: TPageSetupFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Page Setup'
  ClientHeight = 292
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 496
    Height = 233
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Page Setting'
      object Label1: TLabel
        Left = 64
        Top = 40
        Width = 64
        Height = 17
        Caption = 'First Indent'
      end
      object Label2: TLabel
        Left = 64
        Top = 72
        Width = 61
        Height = 17
        Caption = 'Left Indent'
      end
      object Label3: TLabel
        Left = 64
        Top = 104
        Width = 70
        Height = 17
        Caption = 'Right Indent'
      end
      object Edit1: TEdit
        Left = 145
        Top = 37
        Width = 121
        Height = 25
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object Edit2: TEdit
        Left = 145
        Top = 69
        Width = 121
        Height = 25
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object Edit3: TEdit
        Left = 145
        Top = 101
        Width = 121
        Height = 25
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 2
        Text = '0'
      end
      object UpDown1: TUpDown
        Left = 266
        Top = 37
        Width = 16
        Height = 25
        Associate = Edit1
        Min = -100
        Max = 1000
        TabOrder = 3
        OnChanging = UpDown1Changing
      end
      object UpDown2: TUpDown
        Left = 266
        Top = 69
        Width = 16
        Height = 25
        Associate = Edit2
        Min = -100
        Max = 1000
        TabOrder = 4
        OnChanging = UpDown2Changing
      end
      object UpDown3: TUpDown
        Left = 266
        Top = 101
        Width = 16
        Height = 25
        Associate = Edit3
        Min = -100
        Max = 1000
        TabOrder = 5
        OnChanging = UpDown3Changing
      end
      object CheckBox1: TCheckBox
        Left = 304
        Top = 41
        Width = 169
        Height = 17
        Caption = 'Select All For First Indent'
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
  object Button1: TButton
    Left = 404
    Top = 250
    Width = 96
    Height = 34
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
end
