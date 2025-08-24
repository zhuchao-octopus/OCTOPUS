object MergeBinFrm: TMergeBinFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Merge Bin File'
  ClientHeight = 653
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 17
  object LabeledEdit1: TLabeledEdit
    Left = 13
    Top = 32
    Width = 809
    Height = 25
    EditLabel.Width = 52
    EditLabel.Height = 17
    EditLabel.Caption = 'Bin File A'
    TabOrder = 0
    Text = ''
  end
  object LabeledEdit2: TLabeledEdit
    Left = 13
    Top = 78
    Width = 809
    Height = 25
    EditLabel.Width = 51
    EditLabel.Height = 17
    EditLabel.Caption = 'Bin File B'
    TabOrder = 1
    Text = ''
  end
  object Button1: TButton
    Left = 848
    Top = 31
    Width = 75
    Height = 30
    Caption = '...'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 848
    Top = 77
    Width = 75
    Height = 30
    Caption = '...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 224
    Width = 617
    Height = 30
    Caption = 'Start Merging The Bin Files'
    TabOrder = 4
    OnClick = Button3Click
  end
  object LabeledEdit3: TLabeledEdit
    Left = 13
    Top = 128
    Width = 809
    Height = 25
    EditLabel.Width = 70
    EditLabel.Height = 17
    EditLabel.Caption = 'Merged File'
    TabOrder = 5
    Text = ''
  end
  object Button4: TButton
    Left = 848
    Top = 127
    Width = 75
    Height = 30
    Caption = '...'
    TabOrder = 6
    OnClick = Button4Click
  end
  object LabeledEdit4: TLabeledEdit
    Left = 13
    Top = 176
    Width = 324
    Height = 25
    EditLabel.Width = 67
    EditLabel.Height = 17
    EditLabel.Caption = 'A/B OFFSET'
    TabOrder = 7
    Text = '0x00010000'
  end
  object Memo1: TMemo
    Left = 13
    Top = 272
    Width = 809
    Height = 281
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 8
  end
  object Button5: TButton
    Left = 848
    Top = 523
    Width = 75
    Height = 30
    Caption = 'Exit'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 848
    Top = 472
    Width = 75
    Height = 30
    Caption = 'Clear'
    TabOrder = 10
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 648
    Top = 224
    Width = 174
    Height = 30
    Caption = 'Read The Meta Infor'
    TabOrder = 11
    OnClick = Button7Click
  end
  object ComboBox1: TComboBox
    Left = 432
    Top = 176
    Width = 390
    Height = 25
    Style = csDropDownList
    TabOrder = 12
    OnDropDown = ComboBox1DropDown
  end
  object Button8: TButton
    Left = 343
    Top = 174
    Width = 75
    Height = 30
    Caption = 'Update'
    TabOrder = 13
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 610
    Width = 910
    Height = 30
    Caption = 'Start Upgrading'
    TabOrder = 14
    OnClick = Button9Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 565
    Width = 910
    Height = 30
    Step = 1
    TabOrder = 15
  end
  object SaveDialog1: TSaveDialog
    Left = 280
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 80
  end
end
