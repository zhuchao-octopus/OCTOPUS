object MergeBinFrm: TMergeBinFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Merging Bin File'
  ClientHeight = 685
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 927
    Height = 665
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Merging Bin File'
      object Button1: TButton
        Left = 836
        Top = 31
        Width = 75
        Height = 30
        Caption = '...'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 836
        Top = 77
        Width = 75
        Height = 30
        Caption = '...'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 836
        Top = 127
        Width = 75
        Height = 30
        Caption = '...'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button6: TButton
        Left = 836
        Top = 472
        Width = 75
        Height = 30
        Caption = 'Clear'
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button5: TButton
        Left = 836
        Top = 523
        Width = 75
        Height = 30
        Caption = 'Exit'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button9: TButton
        Left = 13
        Top = 598
        Width = 898
        Height = 30
        Caption = 'Start Upgrading'
        TabOrder = 5
        OnClick = Button9Click
      end
      object ProgressBar1: TProgressBar
        Left = 13
        Top = 565
        Width = 898
        Height = 28
        Step = 1
        TabOrder = 6
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
        TabOrder = 7
      end
      object Button7: TButton
        Left = 648
        Top = 224
        Width = 174
        Height = 30
        Caption = 'Read The Meta Infor'
        TabOrder = 8
        OnClick = Button7Click
      end
      object Button3: TButton
        Left = 13
        Top = 224
        Width = 617
        Height = 30
        Caption = 'Start Merging The Bin Files'
        TabOrder = 9
        OnClick = Button3Click
      end
      object ComboBox1: TComboBox
        Left = 432
        Top = 176
        Width = 390
        Height = 25
        Style = csDropDownList
        TabOrder = 10
        OnDropDown = ComboBox1DropDown
      end
      object Button8: TButton
        Left = 343
        Top = 174
        Width = 75
        Height = 30
        Caption = 'Update'
        TabOrder = 11
        OnClick = Button8Click
      end
      object LabeledEdit4: TLabeledEdit
        Left = 13
        Top = 176
        Width = 324
        Height = 25
        EditLabel.Width = 67
        EditLabel.Height = 17
        EditLabel.Caption = 'A/B OFFSET'
        TabOrder = 12
        Text = '0x00010000'
      end
      object LabeledEdit3: TLabeledEdit
        Left = 13
        Top = 128
        Width = 809
        Height = 25
        EditLabel.Width = 70
        EditLabel.Height = 17
        EditLabel.Caption = 'Merged File'
        TabOrder = 13
        Text = ''
      end
      object LabeledEdit1: TLabeledEdit
        Left = 13
        Top = 32
        Width = 809
        Height = 25
        EditLabel.Width = 52
        EditLabel.Height = 17
        EditLabel.Caption = 'Bin File A'
        TabOrder = 14
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
        TabOrder = 15
        Text = ''
      end
    end
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
