object MainOctopusDebuggingDevelopmentForm: TMainOctopusDebuggingDevelopmentForm
  Left = 174
  Top = 107
  Caption = 'Octopus Usart Debugging and Development Assistant'
  ClientHeight = 630
  ClientWidth = 1131
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  Menu = MainMenu
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 17
  object Splitter1: TSplitter
    Left = 698
    Top = 66
    Height = 531
    Align = alRight
    OnMoved = Splitter1Moved
    ExplicitLeft = 1202
    ExplicitTop = -169
    ExplicitHeight = 706
  end
  object StandardToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1131
    Height = 33
    AutoSize = True
    BorderWidth = 2
    ButtonHeight = 25
    Color = clBtnFace
    Images = ToolbarImages
    Indent = 4
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Transparent = False
    Wrapable = False
    object FileNewButton: TToolButton
      Left = 4
      Top = 0
      Action = FileNewCmd
    end
    object OpenButton: TToolButton
      Left = 27
      Top = 0
      Action = FileOpenCmd
    end
    object SaveButton: TToolButton
      Left = 50
      Top = 0
      Action = FileSaveCmd
    end
    object PrintButton: TToolButton
      Left = 73
      Top = 0
      Action = FilePrintCmd
    end
    object ToolButton5: TToolButton
      Left = 96
      Top = 0
      Width = 8
      ImageIndex = 3
      Style = tbsDivider
    end
    object CutButton: TToolButton
      Left = 104
      Top = 0
      Action = EditCutCmd
    end
    object CopyButton: TToolButton
      Left = 127
      Top = 0
      Action = EditCopyCmd
    end
    object PasteButton: TToolButton
      Left = 150
      Top = 0
      Action = EditPasteCmd
    end
    object UndoButton: TToolButton
      Left = 173
      Top = 0
      Action = EditUndoCmd
    end
    object ToolButton7: TToolButton
      Left = 196
      Top = 0
      Width = 8
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ComBoBoxFontName: TComboBox
      Left = 204
      Top = 0
      Width = 173
      Height = 25
      Hint = 'Font Name|Select font name'
      Ctl3D = False
      DropDownCount = 30
      ParentCtl3D = False
      TabOrder = 0
      OnChange = ComBoBoxFontNameChange
    end
    object ToolButton8: TToolButton
      Left = 377
      Top = 0
      Width = 8
      ImageIndex = 8
      Style = tbsSeparator
    end
    object FontSize: TEdit
      Left = 385
      Top = 0
      Width = 250
      Height = 25
      Hint = 'Font Size|Select font size'
      NumbersOnly = True
      TabOrder = 1
      Text = '14'
      OnChange = FontSizeChange
    end
    object UpDown1: TUpDown
      Left = 635
      Top = 0
      Width = 16
      Height = 25
      Associate = FontSize
      Position = 14
      TabOrder = 2
    end
    object BoldButton: TToolButton
      Left = 667
      Top = 0
      Action = FormatRichEditBoldCmd
      Style = tbsCheck
    end
    object ItalicButton: TToolButton
      Left = 690
      Top = 0
      Action = FormatRichEditItalicCmd
      Style = tbsCheck
    end
    object UnderlineButton: TToolButton
      Left = 713
      Top = 0
      Action = FormatRichEditUnderlineCmd
      Style = tbsCheck
    end
    object StrikeoutButton: TToolButton
      Left = 736
      Top = 0
      Action = FormatRichEditStrikeOutCmd
    end
    object ToolButton1: TToolButton
      Left = 759
      Top = 0
      Width = 8
      ImageIndex = 12
      Style = tbsDivider
    end
    object LeftAlign: TToolButton
      Left = 767
      Top = 0
      Action = FormatRichEditAlignLeftCmd
      Grouped = True
      Style = tbsCheck
    end
    object CenterAlign: TToolButton
      Tag = 2
      Left = 790
      Top = 0
      Action = FormatRichEditAlignCenterCmd
      Grouped = True
      Style = tbsCheck
    end
    object RightAlign: TToolButton
      Tag = 1
      Left = 813
      Top = 0
      Action = FormatRichEditAlignRightCmd
      Grouped = True
      Style = tbsCheck
    end
    object ToolButton2: TToolButton
      Left = 836
      Top = 0
      Width = 8
      ImageIndex = 15
      Style = tbsDivider
    end
    object BulletsButton: TToolButton
      Left = 844
      Top = 0
      Action = FormatRichEditBulletsCmd
      Style = tbsCheck
    end
    object ToolButton4: TToolButton
      Left = 867
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object SupersciptButton: TToolButton
      Left = 875
      Top = 0
      Action = SuperscriptCmd
    end
    object SubscriptButton: TToolButton
      Left = 898
      Top = 0
      Action = SubscriptCmd
    end
    object ToolButton3: TToolButton
      Left = 921
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object FGColorBox: TColorBox
      Left = 929
      Top = 0
      Width = 180
      Height = 25
      Hint = 'Foreground color'
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbIncludeNone, cbIncludeDefault, cbPrettyNames]
      DropDownCount = 30
      ItemHeight = 19
      TabOrder = 3
      OnChange = FGColorBoxChange
    end
    object ToolButton6: TToolButton
      Left = 1109
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object BGColorBox: TColorBox
      Left = 1117
      Top = 0
      Width = 180
      Height = 25
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbIncludeNone, cbIncludeDefault, cbPrettyNames]
      DropDownCount = 30
      ItemHeight = 19
      TabOrder = 4
      OnChange = BGColorBoxChange
    end
  end
  object StandardToolBar2: TToolBar
    Left = 0
    Top = 33
    Width = 1131
    Height = 33
    AutoSize = True
    BorderWidth = 2
    ButtonHeight = 25
    Color = clBtnFace
    Images = ToolbarImages
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Transparent = False
    Wrapable = False
    object ToolButton9: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      Style = tbsDivider
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 0
      Width = 136
      Height = 25
      Hint = 'Port baud rate'
      Margins.Left = 30
      Style = csDropDownList
      DropDownCount = 20
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ToolButton10: TToolButton
      Left = 144
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ComboBox2: TComboBox
      Left = 152
      Top = 0
      Width = 222
      Height = 25
      Hint = 'Receiving mode'
      Style = csDropDownList
      DropDownCount = 20
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ToolButton11: TToolButton
      Left = 374
      Top = 0
      Width = 15
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToggleSwitchDeviceOnOff: TToggleSwitch
      AlignWithMargins = True
      Left = 389
      Top = 0
      Width = 50
      Height = 25
      Hint = 'On off switch for device'
      ShowStateCaption = False
      SwitchHeight = 25
      TabOrder = 2
      OnClick = ToggleSwitchDeviceOnOffClick
    end
    object ToolButton15: TToolButton
      Left = 439
      Top = 0
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 447
      Top = 0
      Hint = 'Settings of device'
      Caption = 'ToolButton16'
      ImageIndex = 29
      OnClick = ToolButton16Click
    end
    object ToolButton14: TToolButton
      Left = 470
      Top = 0
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 21
      Style = tbsSeparator
    end
    object ToolButton19: TToolButton
      Left = 478
      Top = 0
      Hint = 'Quick terminal '
      Caption = 'ToolButton19'
      ImageIndex = 30
      OnClick = ToolButton19Click
    end
    object ToolButton17: TToolButton
      Left = 501
      Top = 0
      Width = 8
      Caption = 'ToolButton17'
      ImageIndex = 30
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 509
      Top = 0
      Hint = 'Clear content'
      Caption = ' ToolButton12 '
      ImageIndex = 23
      OnClick = ToolButton12Click
    end
    object ToolButton13: TToolButton
      Left = 532
      Top = 0
      Hint = 'Close and remove current page'
      Caption = '&Close'
      ImageIndex = 20
      Visible = False
      OnClick = ToolButton13Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 66
    Width = 698
    Height = 531
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 698
      Height = 531
      Align = alClient
      PopupMenu = PopupMenu1
      TabHeight = 30
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = PageControl1Change
    end
  end
  object SV_R: TSplitView
    Left = 701
    Top = 66
    Width = 430
    Height = 531
    AnimationStep = 60
    OpenedWidth = 430
    ParentDoubleBuffered = True
    Placement = svpRight
    TabOrder = 3
    OnClosed = SV_RClosed
    OnOpened = SV_ROpened
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 430
      Height = 531
      ActivePage = TabSheet_ProtocolData
      Align = alClient
      TabHeight = 30
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = PageControl2Change
      object TabSheet_SendingData: TTabSheet
        AlignWithMargins = True
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Block Data '
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 420
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Panel25: TPanel
            Left = 0
            Top = 194
            Width = 420
            Height = 297
            Align = alClient
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 420
              Height = 221
              Align = alClient
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Memo2: TMemo
                Left = 0
                Top = 0
                Width = 420
                Height = 221
                Align = alClient
                BevelOuter = bvRaised
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ScrollBars = ssVertical
                ShowHint = False
                TabOrder = 0
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 221
              Width = 420
              Height = 76
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 1
              object Button102: TButton
                Left = 0
                Top = 4
                Width = 75
                Height = 34
                Caption = 'Clear'
                TabOrder = 0
                OnClick = Button102Click
              end
              object Button103: TButton
                Left = 77
                Top = 4
                Width = 147
                Height = 34
                Caption = 'Send as text '
                TabOrder = 1
                OnClick = Button103Click
              end
              object Button105: TButton
                Left = 0
                Top = 40
                Width = 313
                Height = 34
                Caption = 'Format the hex data '
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = Button105Click
              end
              object Button104: TButton
                Left = 226
                Top = 4
                Width = 87
                Height = 34
                Caption = 'Send as bytes'
                TabOrder = 3
                OnClick = Button104Click
              end
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 420
            Height = 194
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 1
            object Memo1: TMemo
              Left = 0
              Top = 0
              Width = 420
              Height = 122
              Align = alTop
              BevelOuter = bvRaised
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Button100: TButton
              Left = 0
              Top = 126
              Width = 313
              Height = 34
              Caption = 'Convert the above string to the hex bytecode '
              TabOrder = 1
              OnClick = Button100Click
            end
            object Button101: TButton
              Left = 0
              Top = 160
              Width = 313
              Height = 34
              Caption = 'Convert the following hex byte code to string '
              TabOrder = 2
              OnClick = Button101Click
            end
          end
        end
      end
      object TabSheet_BatchData: TTabSheet
        AlignWithMargins = True
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Batch Data'
        ImageIndex = 1
        object Panel200: TPanel
          Left = 0
          Top = 0
          Width = 420
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object StringGrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 420
            Height = 451
            Hint = 'Click to send data'
            Align = alClient
            BorderStyle = bsNone
            ColCount = 6
            Ctl3D = True
            DefaultColWidth = 50
            DefaultRowHeight = 27
            FixedCols = 2
            RowCount = 1000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goAlwaysShowEditor, goFixedColClick, goFixedRowClick, goFixedRowDefAlign]
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnDrawCell = StringGrid1DrawCell
            OnFixedCellClick = StringGrid1FixedCellClick
            OnKeyPress = StringGrid1KeyPress
            OnMouseDown = StringGrid1MouseDown
            OnMouseUp = StringGrid1MouseUp
            OnMouseWheelDown = StringGrid1MouseWheelDown
            OnMouseWheelUp = StringGrid1MouseWheelUp
            OnSelectCell = StringGrid1SelectCell
            OnSetEditText = StringGrid1SetEditText
            ColWidths = (
              50
              33
              202
              41
              50
              186)
            RowHeights = (
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27
              27)
          end
          object Panel201: TPanel
            Left = 0
            Top = 451
            Width = 420
            Height = 40
            Align = alBottom
            Alignment = taLeftJustify
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object Button201: TButton
              Left = 102
              Top = 3
              Width = 226
              Height = 34
              Caption = 'Circular sending of selected content '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Button201Click
            end
            object Button200: TButton
              Left = 0
              Top = 3
              Width = 100
              Height = 34
              Caption = ' Loop stop'
              TabOrder = 1
              OnClick = Button200Click
            end
          end
        end
      end
      object TabSheet_ProtocolData: TTabSheet
        AlignWithMargins = True
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Protocol Data'
        ImageIndex = 2
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 420
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Memo3: TMemo
            AlignWithMargins = True
            Left = 1
            Top = 120
            Width = 418
            Height = 297
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object Panel16: TPanel
            Left = 0
            Top = 418
            Width = 420
            Height = 73
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Button301: TButton
              Left = 79
              Top = 0
              Width = 235
              Height = 34
              Caption = 'Send as text'
              TabOrder = 0
              OnClick = Button301Click
            end
            object Button300: TButton
              Left = 2
              Top = 0
              Width = 75
              Height = 34
              Caption = 'Clear'
              TabOrder = 1
              OnClick = Button300Click
            end
            object Button302: TButton
              Left = 2
              Top = 35
              Width = 311
              Height = 36
              Caption = 'Send file ( *.bin  *.hex )'
              TabOrder = 2
              OnClick = Button302Click
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 420
            Height = 119
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label003: TLabel
              Left = 2
              Top = 96
              Width = 59
              Height = 17
              Caption = 'Operation'
            end
            object Label002: TLabel
              Left = 2
              Top = 65
              Width = 64
              Height = 17
              Caption = 'Read Bytes'
            end
            object Label001: TLabel
              Left = 2
              Top = 35
              Width = 48
              Height = 17
              Caption = 'Address'
            end
            object Label000: TLabel
              Left = 2
              Top = 5
              Width = 53
              Height = 17
              Caption = 'Protocol '
            end
            object ComboBox304: TComboBox
              AlignWithMargins = True
              Left = 74
              Top = 91
              Width = 237
              Height = 25
              Style = csDropDownList
              ItemIndex = 1
              TabOrder = 0
              Text = 'Write'
              Items.Strings = (
                'Read'
                'Write'
                'Test Connection')
            end
            object ComboBox301: TComboBox
              AlignWithMargins = True
              Left = 74
              Top = 0
              Width = 237
              Height = 25
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 1
              Text = 'Octopus'
              Items.Strings = (
                'Octopus'
                'I2C'
                'SPI'
                'RS232'
                'RS485'
                'RS422'
                'CAN'
                'IRDA'
                'ZigBee'
                'Wireless'
                'ModBus')
            end
            object ComboBox302: TComboBox
              AlignWithMargins = True
              Left = 74
              Top = 30
              Width = 237
              Height = 25
              TabOrder = 2
              Text = '0x08000000'
              Items.Strings = (
                '0x08000000'
                '0x08002000')
            end
            object ComboBox303: TComboBox
              AlignWithMargins = True
              Left = 74
              Top = 60
              Width = 237
              Height = 25
              TabOrder = 3
              Text = '1'
            end
          end
        end
      end
    end
  end
  object StatusPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 599
    Width = 1125
    Height = 28
    Margins.Top = 2
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object StatusBar1: TStatusBar
      Left = 0
      Top = 0
      Width = 1125
      Height = 28
      Margins.Top = 5
      Align = alClient
      Panels = <
        item
          Width = 150
        end
        item
          Text = 'http://www.1234998.top'
          Width = 150
        end
        item
          Width = 50
        end>
      ParentColor = True
      ParentFont = True
      UseSystemFont = False
      OnMouseEnter = StatusBar1MouseEnter
      OnDrawPanel = StatusBar1DrawPanel
    end
  end
  object MainMenu: TMainMenu
    Images = ToolbarImages
    Left = 488
    Top = 212
    object FileMenu: TMenuItem
      Caption = '&File'
      object FileNewItem: TMenuItem
        Action = FileNewCmd
      end
      object FileOpenItem: TMenuItem
        Action = FileOpenCmd
      end
      object FileSaveItem: TMenuItem
        Action = FileSaveCmd
      end
      object FileSaveAsItem: TMenuItem
        Action = FileSaveAsCmd
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SettingItem1: TMenuItem
        Caption = 'Settings...'
        ImageIndex = 22
        OnClick = SettingItem1Click
      end
      object FilePrintItem: TMenuItem
        Action = FilePrintCmd
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Action = FileExitCmd
      end
    end
    object EditMenu: TMenuItem
      Caption = '&Edit'
      object EditUndoItem: TMenuItem
        Action = EditUndoCmd
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object EditCutItem: TMenuItem
        Action = EditCutCmd
      end
      object EditCopyItem: TMenuItem
        Action = EditCopyCmd
      end
      object EditPasteItem: TMenuItem
        Action = EditPasteCmd
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Search1: TMenuItem
        Caption = '&Search...'
        OnClick = Search1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object EditFontItem: TMenuItem
        Caption = '&Font Setting...'
        Enabled = False
        OnClick = SelectFont
      end
    end
    object RichEditMenu: TMenuItem
      Caption = '&Format'
      OnClick = RichEditMenuClick
      object RichEditTransparentItem: TMenuItem
        Caption = '&Transparent RichEdit'
        OnClick = RichEditTransparentItemClick
      end
      object RichEditWordWrapItem: TMenuItem
        Caption = '&Word Wrap'
        OnClick = RichEditWordWrapItemClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object RichEditBoldItem: TMenuItem
        Action = FormatRichEditBoldCmd
        AutoCheck = True
      end
      object RichEditItalicItem: TMenuItem
        Action = FormatRichEditItalicCmd
        AutoCheck = True
      end
      object RichEditUnderlineItem: TMenuItem
        Action = FormatRichEditUnderlineCmd
        AutoCheck = True
      end
      object RichEditStrikeoutItem: TMenuItem
        Action = FormatRichEditStrikeOutCmd
        AutoCheck = True
      end
      object RichEditSuperscriptItem: TMenuItem
        Action = SuperscriptCmd
      end
      object RichEditSubscriptItem: TMenuItem
        Action = SubscriptCmd
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object RichEditAlignLeftItem: TMenuItem
        Action = FormatRichEditAlignLeftCmd
        AutoCheck = True
      end
      object RichEditAlignCenterItem: TMenuItem
        Action = FormatRichEditAlignCenterCmd
        AutoCheck = True
        Caption = 'Align &Center'
      end
      object RichEditAlignRightItem: TMenuItem
        Action = FormatRichEditAlignRightCmd
        AutoCheck = True
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object RichEditBulletsItem: TMenuItem
        Action = FormatRichEditBulletsCmd
        AutoCheck = True
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object PageSetting1: TMenuItem
        Caption = 'Page Setup...'
        OnClick = PageSetting1Click
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object HexModeItem: TMenuItem
        Caption = '&Hexadecimal Mode'
        OnClick = HexModeItemClick
      end
    end
    object ViewMenu: TMenuItem
      Caption = '&View'
      OnClick = ViewMenuClick
      object FormatToolBarMenuItem1: TMenuItem
        Caption = 'Standard Format Toolbar'
        OnClick = FormatToolBarMenuItem1Click
      end
      object FormatToolBarMenuItem2: TMenuItem
        Caption = 'Standard Serial Port  Toolbar'
        OnClick = FormatToolBarMenuItem2Click
      end
      object RightOperationPanel1: TMenuItem
        Caption = 'Right Operation Panel'
        OnClick = RightOperationPanel1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object LptatpMenuItem: TMenuItem
        Caption = 'Left Page Tabs At Top Position'
        OnClick = LptatpMenuItemClick
      end
      object LptabpMenuItem: TMenuItem
        Caption = 'Left Page Tabs At Bottom Position'
        OnClick = LptabpMenuItemClick
      end
      object LptalpMenuItem: TMenuItem
        Caption = 'Left Page Tabs At Left Position'
        OnClick = LptalpMenuItemClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object RptatpMenuItem: TMenuItem
        Caption = 'Right Page Tabs At Top Position'
        OnClick = RptatpMenuItemClick
      end
      object RptabpMenuItem: TMenuItem
        Caption = 'Right Page Tabs At Bottom Position'
        OnClick = RptabpMenuItemClick
      end
      object RptarpMenuItem: TMenuItem
        Caption = 'Right Page Tabs At Right Position'
        OnClick = RptarpMenuItemClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object TopLevelMenuItem: TMenuItem
        Caption = 'This Window Is Always Kept At The Top Level '
        OnClick = TopLevelMenuItemClick
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object QuickTerminalCommandsItem: TMenuItem
        Caption = 'Quick Terminal Commands'
        OnClick = QuickTerminalCommandsItemClick
      end
      object QuickTextEditingModeItem: TMenuItem
        Caption = 'Quick Text Editing Mode'
        OnClick = QuickTextEditingModeItemClick
      end
    end
    object Encoding1: TMenuItem
      Caption = '&Encoding'
      OnClick = Encoding1Click
      object DefaultItem: TMenuItem
        Caption = 'Default'
        OnClick = DefaultItemClick
      end
      object ASCIIItem: TMenuItem
        Caption = 'ASCII Encoding'
        OnClick = ASCIIItemClick
      end
      object ANSIItem: TMenuItem
        Caption = 'ANSI Encoding'
        OnClick = ANSIItemClick
      end
      object UTF7EncodingItem: TMenuItem
        Caption = 'UTF7 Encoding'
        OnClick = UTF7EncodingItemClick
      end
      object UTF8EncodingItem: TMenuItem
        Caption = 'UTF8 Encoding'
        OnClick = UTF8EncodingItemClick
      end
      object UnicodeEncodingItem: TMenuItem
        Caption = 'Unicode Encoding'
        OnClick = UnicodeEncodingItemClick
      end
      object BigEndianUnicodeEncodingItem: TMenuItem
        Caption = 'BigEndian Unicode Encoding'
        OnClick = BigEndianUnicodeEncodingItemClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object ConverttoAnsi1: TMenuItem
        Caption = 'Convert to ANSI'
        OnClick = ConverttoAnsi1Click
      end
      object ConverttoUTF81: TMenuItem
        Caption = 'Convert to UTF-8'
        OnClick = ConverttoUTF81Click
      end
      object ConverttoUTF82: TMenuItem
        Caption = 'Convert to UTF-8-BOM'
        OnClick = ConverttoUTF82Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object CharacteSets1: TMenuItem
        Caption = 'Character Sets'
        OnClick = CharacteSets1Click
      end
    end
    object ToolsMenu: TMenuItem
      Caption = '&Tools'
      object ScreenshotTool1: TMenuItem
        Caption = 'Screenshot'
        ImageIndex = 25
        OnClick = ScreenshotTool1Click
      end
      object ScreenshotTool2: TMenuItem
        Caption = 'Screenshot Tool ...'
        OnClick = ScreenshotTool2Click
      end
      object DataEncryption1: TMenuItem
        Caption = 'Data Encryption ...'
        OnClick = DataEncryption1Click
      end
      object CRC1: TMenuItem
        Caption = 'CRC Tool ...'
        OnClick = CRC1Click
      end
      object MergeBinFile1: TMenuItem
        Caption = 'Merge Bin File ...'
        OnClick = MergeBinFile1Click
      end
      object MachineLearningOfNeuralNetworks1: TMenuItem
        Caption = 'Machine Learning Of Neural Networks '
      end
    end
    object SkinsMenu: TMenuItem
      Caption = '&Skins'
      OnClick = SkinsMenuClick
    end
    object COMMenu: TMenuItem
      Caption = '&USART'
      OnClick = COMMenuClick
    end
    object HelpMenu: TMenuItem
      Caption = '&Help'
      OnClick = HelpMenuClick
      object WelcomeAndHelp1: TMenuItem
        Caption = '&Welcome And Help'
        OnClick = WelcomeAndHelp1Click
      end
      object HelpAboutItem: TMenuItem
        Caption = '&About Octopus'
        Hint = 'Show program information'
        OnClick = HelpAbout
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object SettingItem2: TMenuItem
        Caption = 'Settings...'
        ImageIndex = 29
        OnClick = SettingItem2Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object EnglishMenuItem: TMenuItem
        Caption = 'English'
        OnClick = EnglishMenuItemClick
      end
      object ChineseMenuItem: TMenuItem
        Caption = #20013#25991#31616#20307
        OnClick = ChineseMenuItemClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object DownloadUpdate1: TMenuItem
        Caption = 'Download Update'
        ImageIndex = 26
        OnClick = DownloadUpdate1Click
      end
      object ProblemFeedback1: TMenuItem
        Caption = 'Problem Feedback'
        ImageIndex = 27
        OnClick = ProblemFeedback1Click
      end
    end
  end
  object FontDialog: TFontDialog
    OnShow = FontDialogShow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #26032#23435#20307
    Font.Style = []
    Left = 328
    Top = 280
  end
  object ToolbarImages: TImageList
    Left = 408
    Top = 212
    Bitmap = {
      494C01011F003000040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF148CFBFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8EDD236E1AB2FFCE1AB31FA00000000E4B447DFE1AB30FBE1AB
      2FFCE1AB2FFCE1AB2FFCE1AB30FBE5B74DD70086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF6F385FFF7B53
      69FF0086FFFFC385A9FF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6560A01A0B03FF1A0B03FF1A0B03FF281A11EFC5C2C0400000
      0000000000000000000000000000000000000000000000000000F5E4BD4F0000
      0000FEFEFE01EFD29086E1AA2DFFE1AA2DFFFEFDFA05E2AE38F1E1AA2DFFE1AA
      2DFFE8C063BDE1AA2DFFE1AA2DFFE2AE38F10086FFFFC582AEFF0086FFFF0086
      FFFF0086FFFF0086FFFF784E69FF4783C8FF0086FFFF0086FFFF0086FFFF754E
      6AFF724B65FFB87DA3FF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2E0
      DF201A0B03FF362922DFE2E0DF2000000000000000009A93906F1A0B03FF3529
      21DF0000000000000000000000000000000000000000F2DAA46EE1AA2DFFE3B1
      3FE8E1AA2DFEE1AA2DFFE1AA2DFFE1AA2DFFFAF2DE27E2AE37F2E1AA2DFFE1AA
      2DFFFCF8EE14E1AA2DFFE1AA2DFFE2AE38F10086FFFFBB82A6FF0086FFFF0086
      FFFF0086FFFF0086FFFFAB77A2FF0086FFFF0086FFFF804B73FF4C79B7FF0086
      FFFFAF7DA7FFBC84ABFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1F0EF101A0B
      03FFE2E0DF200000000000000000000000000000000000000000000000003628
      22DF352921DF00000000000000000000000000000000EDCC8199E1AA2DFFE1AA
      2DFFE1AA2DFFE6B952D2F0D5987DEDCD8594FAF3E223E2AE37F2E1AA2DFFE1AA
      2DFFEBC775A7E1AA2DFFE1AA2DFFE2AF39F00086FFFFBE80ACFF3490ECFF6247
      5BFF0086FFFF2890F4FFAF7CA5FF0086FFFF0086FFFF825372FF855277FF0086
      FFFF9E698DFFBF80AEFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A0B03FF9992
      8F700000000000000000000000000000000000000000F0F0EF10000000000000
      00001A0B03FFE2E0DF20000000000000000000000000FCF8EF13E1AA2DFFE1AA
      2DFFF8ECD03800000000000000000000000000000000E2AE37F2E1AA2DFFE1AA
      2DFFE1AA2DFFE1AA2DFFE1AA2DFFE3B13FE90086FFFFBE8FB0FF826482FF6635
      5EFF0086FFFF6B4B61FFC58EB8FF3F8DE1FF0086FFFF6A3E5FFF68385CFF0086
      FFFFA16991FFD29EC2FF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A0B03FF0000
      0000000000000000000000000000000000006E6560A01A0B03FFF0F0EF100000
      0000A9A3A060281A12EF000000000000000000000000EBC673A9E1AA2DFFF0D5
      987D00000000FEFEFD02F1D79D76F7E9C84200000000FEFEFE01E2AF39F0FCF7
      EB18FDFBF50BF8ECD137E7BB57CBFEFEFD020086FFFF0086FFFFB988ACFF7947
      6DFF623055FF0086FFFFBE92B7FFE2A8D1FF865677FFA06C91FFC28EB3FFAD76
      9EFFC38EB7FF378FE9FF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A0B03FF1A0B03FF00000000000000000000
      0000000000001A0B03FF0000000000000000E1AC32F8E1AA2DFFE1AA2DFFFEFC
      F90700000000E4B344E2E1AA2DFFE1AA2DFFF5E4BD4F00000000E4B548DEFAF3
      E12400000000F5E4BD4FE9C36BB3000000000086FFFF0086FFFF0086FFFFC69E
      BBFF9D6B95FFA2668EFFA0678EFFC08CB5FFB985ADFFBA85ADFFC28BB4FF9A64
      8CFFBB8AAAFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A0B03FFE2E0DF2000000000000000000000
      0000000000001A0B03FF0000000000000000E1AA2DFFE1AA2DFFE1AA2DFF0000
      000000000000E1AA2DFFE1AA2DFFE1AA2DFFECCB809A00000000F8EDD236E1AA
      2DFEE9C165BAE1AA2DFFFCF7EB18000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFFC184AFFFB182A9FFC185B2FFB580A9FFBE8FB6FFBC82ACFFC993
      BBFFB689A3FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A0B03FFE2E0DF2000000000000000000000
      0000E2E0DF201A0B03FF0000000000000000EDCE8593E2AD34F6E1AA2DFFFCF7
      EB1800000000EDCE8791E1AA2DFFE1AA2DFFFCF8EE1400000000F6E7C447FDFB
      F60AF7E9C941FEFDFA0600000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFA07696FFFFF7FFFF9B6691FFAA7FA1FFB28FA7FFB780
      AAFF68435AFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A0B03FF1A0B
      03FF281A11EF0000000000000000362822DFF0F0EF1000000000000000000000
      0000352821DF7D757090000000000000000000000000F0D69A7AE1AA2DFFE7BD
      5DC40000000000000000FEFDFA05FEFEFE0100000000FDFBF60AE1AA2DFFE1AC
      32F8FEFEFE010000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFAE7CA4FFC692BBFFC690BBFFBA85B0FFC18DB5FFBF8E
      B4FFBB83ADFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099928F701A0B03FF281A
      11EFA8A39F60000000000000000000000000000000000000000000000000D4D1
      CF301A0B03FF00000000000000000000000000000000FDFBF50BE1AA2DFFE1AA
      2DFFEBC774A8FEFEFE010000000000000000FBF5E71CE2AD35F5E1AA2DFFE5B7
      4DD7000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFC18EB6FFBA82AFFFBA84AFFFBA82ADFFBB83AEFFB681
      AAFFC08AB4FF2A90F4FF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000453833CFA9A3A060281A
      12EF281A11EF000000000000000000000000000000000000000099938F701A0B
      03FFE2E0DF2000000000000000000000000000000000E4B447DFE1AA2DFFE1AA
      2DFFE1AA2DFFE1AA2DFFE3AF3BEEE1AC33F7E1AA2DFFE1AA2DFFE1AA2DFFE1AA
      2DFFF6E6C24A0000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFB380A9FFBB84AEFFBE89B4FFBC86B1FFCA94BFFFBD8B
      B3FFB888B2FF6D485BFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006E6560A01A0B03FF1A0B03FF453831CF281A11EF1A0B03FF1A0B03FFE2E0
      DF200000000000000000000000000000000000000000FCF8ED15E1AA2DFFEFD3
      9383E7BC59C9E1AA2DFFE1AA2DFFE1AA2DFFE1AB2FFCF0D69B79E4B242E5E7BB
      57CB000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFCB98BEFFB27DA8FFBD88B3FFC08EB8FFC495BCFFC597
      BCFFE0AFD8FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2CFCF308C848080A8A39F6000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFDFA060000
      000000000000F4E2B856E1AA2DFFE1AA2DFF0000000000000000FEFEFE01FEFE
      FE01000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFFC894BDFFC69BC0FFCF9FC5FFC999BFFFC597
      BBFF515682FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF5E71DEDCC8199EDCD85940000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF4788D2FF108BFDFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FA9768E3FF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFEDDCF490000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF000000000000000000000000F0F0
      EF1000000000000000000000000000000000000000000000000000000000E2E0
      DF20000000000000000000000000000000000000000000000000000000006156
      52AF352821DF352821DF352821DF352821DF352821DF352821DF352821DF3528
      21DF9A93906F0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFA984FFFF8B58FFFFFFFFFFFFFFFFFFFF8C59FFFF8B58FFFFA076FFFFFF
      FFFFFFFBF9FFFF8B58FFFF8B58FFFF8B58FF00000000F1F0EF101A0B03FF1A0B
      03FFF0F0EF100000000000000000000000000000000000000000000000003628
      22DF1A0B03FF453831CF0000000000000000000000008C8581801A0B03FF5248
      42BF8C8480808C8480808C8480808C8480808C8480808C8480808C8480807D75
      71901A0B03FF1A0B03FF00000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFA881FFFF8B58FFFFFFFFFFFFFFFFFFFFFDFCFFFF8B58FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF8B58FFFF8B58FFFF8B58FF000000001A0B03FF99928F700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A0B03FF8C85818000000000F1F0EF101A0B03FFF0F0EF100000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000362822DF352921DF000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00EAC68300000000000000
      000000000000FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8D5BFFFF8B58FFFFB290FFFFBC9FFFFF9364FFFFFFFFFFFF8B58FFFFC7
      AFFFFF9F74FFFF8B58FFFF8B58FFFF8B58FFC5C2C0401A0B03FF000000000000
      00000000000000000000000000008C858180C5C2C04000000000000000000000
      000000000000E2E0DF201A0B03FF000000006E6560A0524842BF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001A0B03FF000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000DCA13200FDF9F200EDCD93000000
      000000000000FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFA881FFFF8B58FFFF8B58FFFF8B58FFFFC9B2FFFFCFBAFFFFA57DFFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF8C848080524842BF000000000000
      00000000000000000000615652AF1A0B03FF1A0B03FF8C858180000000000000
      000000000000000000001A0B03FF00000000453833CF8C848080000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001A0B03FF000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000F5E3C200E1AE4E00FFFFFF000000
      000000000000FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8D5BFFFF8B58FFFF8B58FFFF986AFFFFD3C0FFFF8B58FFFFF1ECFFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFE2E0DF201A0B03FF000000000000
      000000000000000000001A0B03FF524842BF7D7571901A0B03FF000000000000
      000000000000C5C2C0401A0B03FF000000008C8480801A0B03FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1F0EF101A0B03FF000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000D8941500E1AD4D00EED29C000000
      000000000000FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFA881FFFF8B58FFFF8B58FFFFFAF8FFFF8B58FFFF8B58FFFF8B58FFFFFD
      FCFFFF8B58FFFF8B58FFFF8B58FFFF8B58FF000000001A0B03FF453831CF0000
      0000000000000000000000000000524842BF8C84808000000000000000000000
      0000E2E0DF201A0B03FFC5C2C04000000000000000001A0B03FF7D7571900000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A0B03FF7E76728F000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8D5BFFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8D5BFFFF8B58FFFF8B58FFFF8B58FF0000000000000000362822DF1A0B
      03FF000000000000000000000000524842BF8C84808000000000000000007E75
      70901A0B03FF99928F70000000000000000000000000F0F0EF101A0B03FF1A0B
      03FF000000000000000000000000000000000000000000000000000000005248
      42BF1A0B03FF7066619F00000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFB18FFFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000001A0B
      03FF000000000000000000000000000000000000000000000000000000003628
      22DF99928F700000000000000000000000000000000000000000000000001A0B
      03FF000000000000000000000000000000000000000000000000000000003628
      22DF7D7570900000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFFB1
      8FFFFFCBB4FFFFB18FFFFF8D5BFFFFA881FFFF8D5BFFFFA881FFFF8D5BFFFFA8
      81FFFFA984FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000003628
      22DF7066619F0000000000000000000000000000000000000000000000001A0B
      03FF000000000000000000000000000000000000000000000000000000001A0B
      03FF999391700000000000000000000000000000000000000000000000001A0B
      03FFF0F0EF100000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFFB18FFFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000000000
      00001A0B03FF8C858180000000000000000000000000000000001A0B03FF7066
      619F00000000000000000000000000000000000000000000000000000000E2E0
      DF201A0B03FFE2E0DF2000000000000000000000000000000000352821DF281A
      12EF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000000000
      0000000000001A0B03FF1A0B03FF281A11EF1A0B03FF1A0B03FF7E76728F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C84807F1A0B03FF352821DF9A93906F7D7571901A0B03FF1A0B03FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FF0000000000000000000000000000
      00000000000000000000F0F0EF10A8A39F60C5C1BF4000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007066619F281A12EF453831CFB6B2AF50000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B58FFFF8B
      58FFFF8B58FFFF8B58FFFF8B58FFFA9768E30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBD4D160B2A19BCF9F8A83FFA5908AEEC1B4B19FF8F7F7100000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFCFFFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFFFDFFFAFFFFFF
      FFFFDDCED2FFF9EFF3FFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FF00FFFF0000008000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFC2
      BE90A8918AFFA69089FFA48E87FFA28C85FFA18B84FF9F8983FF9D8780FE9B86
      7FFFF8F7F710000000000000000000000000FDFFFEFFFFFAFFFFFEFAFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F9FFFFFAFDFFFFFEFDFFF5E5EDFF6F385FFF7B53
      69FFFDFEFFFFC385A9FFFEFEFEFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFC0C0C000C0C0C00000FFFF000080
      8000008080000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9A49DDFAC95
      8EFFAB948CFEA9928BFFA7908AFFA58F88FFA48E87FFA18B84FF9F8A83FF9E88
      81FE9C8780FFEBE8E7300000000000000000FDFCFDFFC582AEFFFFFDFDFFFCFF
      FFFFFFFEFFFFFDFEFEFF784E69FF927F8DFFFDFAFBFFFFFAFFFFFFFDFFFF754E
      6AFF724B65FFB87DA3FFFEFFFDFFFEFFFEFFD47800FFD47800FFFAEEDFFFD478
      00FFD47800FFEFCDA0FFFFFFFFFFFFFFFFFFFFFFFFFFFDF7EFFFDF9A40FFD478
      00FFD47800FFD47800FFD47800FFD47800FF00000000C0C0C000C0C0C000C0C0
      C00000FFFF0000FFFF0000008000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCA8A2DFB19A93FFAF98
      91FFAE9790FEAC958EFFAA948CFEA8918BFFA69089FFA58E87FEA38D86FFA18B
      84FF9F8A83FF9E8780FEF8F7F71000000000FFF6FEFFBB82A6FFF8F9FAFFFFFA
      FFFFFBFEFFFFFFFCFFFFAB77A2FFFFFAFFFFFCFEFEFF804B73FF866F80FFFFFA
      FDFFAF7DA7FFBC84ABFFFFFDFEFFFEFFFEFFD47800FFD47800FFFFFFFFFFDC92
      30FFFFFFFFFFECC38FFFD47800FFD47800FFD47800FFD68010FFFDF7EFFFFAEE
      DFFFD47800FFD47800FFD47800FFD47800FF000000000000000000FFFF0000FF
      FF00008080000000800000000000800000008080000080800000808000008000
      000000000000000000000000000000000000F5F2F120B69E97FFB49D96FFB29B
      94FFB5A09AFFAF9891FEAD968FFFAC958DFEA9928BFFA7918AFFAA968FFFA48E
      87FFA18C85FFA08A83FE9E8982FF00000000FFFEFFFFBE80ACFFC5ABB8FF6247
      5BFFFBFEFEFFD0B9C4FFAF7CA5FFFDFCFFFFFDFFFEFF825372FF855277FFF7FE
      FBFF9E698DFFBF80AEFFFFFEFFFFFEFFFFFFD47800FFD47800FFFFFFFFFFFFFF
      FFFFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFEFCC
      9FFFFAEEDFFFD47800FFD47800FFD47800FF0000000000000000C0C0C00000FF
      FF00008080000000800000800000808000008080000080800000808080008080
      800080000000000000000000000000000000BFA7A1EFB9A09AFFB79F98FFB69E
      97FEFBF9F8FFFAF8F8FFAF9891FFAE9790FEAC968FFFBAA7A2FFFFFFFFFFAB97
      91FFA48E87FFA28C86FFA18A83FEF8F7F710FCFFFFFFBE8FB0FF826482FF6635
      5EFFF2F3F4FF6B4B61FFC58EB8FFB399A9FFF8FBF8FF6A3E5FFF68385CFFFFFC
      FFFFA16991FFD29EC2FFFBFCFCFFFDFFFFFFD47800FFD47800FFFFFFFFFFFFFF
      FFFFFFFFFFFFFAEEDFFFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFFDF7EFFFDF9A40FFD47800FFD47800FF000000000000000000FFFF0000FF
      FF00008080000000800080808000808080008080800000800000008000008080
      800080800000000000000000000000000000BDA59EFFBCA39CFFBAA29BFFB8A0
      99FFB79F98FEFBF9F8FFFBF8F8FFB19A93FEBEABA5FFFFFFFFFFBBA8A3FFA993
      8CFFA7918AFFA58F88FFA48E87FFC5B6B29FFCFFFFFFFFFBFFFFB988ACFF7947
      6DFF623055FFF9E3F2FFBE92B7FFE2A8D1FF865677FFA06C91FFC28EB3FFAD76
      9EFFC38EB7FFBAA5B3FFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD98920FFFFFFFFFFD47800FFD47800FF00000000000000000000000000FF
      FF0000FFFF0000808000C0C0C000808080000080000000800000008000008080
      800080800000000000000000000000000000C1A8A1FEBFA69FFFBDA49DFFBCA3
      9DFEB9A19AFFB8A099FEFBF9F8FFFBF8F8FFFFFFFFFFBEACA6FFAE9790FFAC95
      8DFEAA948DFFA8928BFFA79189FEAB9590EEFFFFFFFFFCFEFCFFFFFBFCFFC69E
      BBFF9D6B95FFA2668EFFA0678EFFC08CB5FFB985ADFFBA85ADFFC28BB4FF9A64
      8CFFBB8AAAFFF8F7F6FFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFFFFFFFFFD47800FFD47800FF000000000000000000000000C0C0
      C00000FFFF0000808000C0C0C000808080008080800000800000808080000080
      000000800000000000000000000000000000C3AAA3FFC1A8A1FFBFA7A0FFBEA6
      9FFEBCA39DFFBAA29BFFC6B2ADFFFFFFFFFFFBF8F8FFB39C95FEB19992FFAF98
      91FEAD968FFFAC958EFFAA938CFFA8918AFEFFFFFFFFFFFFFFFFFFFFFFFFFAFE
      FDFFFFF6FFFFC184AFFFB182A9FFC185B2FFB580A9FFBE8FB6FFBC82ACFFC993
      BBFFB689A3FFFFFFFFFFFFFFFFFFFFFFFFFFD47800FFDF9A40FFE4AA60FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FF000000000000000000000000C0C0
      C00000FFFF000080800000008000808080008080800080808000008000000080
      000080000000000000000000000000000000C6ADA6FFC4ABA4FFC2A9A2FFC0A8
      A1FFBFA69FFFC9B6B0FFFFFFFFFFC6B2ADFFFBF9F8FFFBF8F8FFB39C95FFB29B
      94FEB09992FFAE9790FFAC968FFFBAA8A1CFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFFFFFFFFF5FFFFA07696FFFFF7FFFF9B6691FFAA7FA1FFB28FA7FFB780
      AAFF68435AFFFFFFFEFFFFFFFFFFFFFFFFFFD47800FFDF9940FFF7E6CFFFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FF0000000000000000000000000000
      000000FFFF0000FFFF0000808000808080008080800080808000008000000000
      000000000000000000000000000000000000C8AFA8FFC7AEA6FFC5ACA5FFC4AB
      A4FECDB9B3FFFFFFFFFFCAB6B0FFBCA39CFFBBA39CFEFBF9F8FFFBF9F8FFB59D
      96FFB39B94FFB19A93FFAF9891FFE0D7D460FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFBFFFFAE7CA4FFC692BBFFC690BBFFBA85B0FFC18DB5FFBF8E
      B4FFBB83ADFFFBFCFCFFFFFFFFFFFFFFFFFFD47800FFD47800FFFFFFFFFFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFFFFFFFFFFFFF
      FFFFFFFFFFFFFAEEDFFFD47800FFD47800FF0000000000000000000000000000
      0000C0C0C00000FFFF0000808000000000000080000000800000008000000000
      000000FFFF00000000000000000000000000DFCECB9FCAB0A9FFC9AFA8FEC7AE
      A7FEFBFAFAFFCEBAB4FFC1A8A1FFBFA7A0FEBEA59EFEBBA39CFFFBF9F9FFBCA5
      9FFFB59E97FFB49C95FFB29A94FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8E6F3FFC18EB6FFBA82AFFFBA84AFFFBA82ADFFBB83AEFFB681
      AAFFC08AB4FFCEB8C7FFFEFEFEFFFFFFFFFFD47800FFD47800FFEFCD9FFFF4DD
      BFFFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFFFFFFFFFFFFFFFFFD47800FFD47800FF0000000000000000000000000000
      000000000000C0C0C00000FFFF00000080000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000000000000CDB3ACFFCBB1AAFFC9B0
      A9FFC7AEA7FFC5ACA5FFC4ABA4FEC1A8A1FFC0A8A0FEBEA69FFFBCA49DFFBAA2
      9BFFB8A09AFFB79F98FFD6C8C48F00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFAFFFFB380A9FFBB84AEFFBE89B4FFBC86B1FFCA94BFFFBD8B
      B3FFB888B2FF6D485BFFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFFDF7
      EFFFF4DDBFFFD47800FFD47800FFD47800FFD47800FFD47800FFD98920FFFFFF
      FFFFDC9130FFFFFFFFFFD47800FFD47800FF0000000000000000000000000000
      00000000000000FFFF0000FFFF000080800000008000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000000000000F8F5F420CDB4ACFFCCB2
      ABFFCAB1A9FFC8AFA7FFC6ADA6FFC5ACA5FFC2A9A2FFC1A8A1FFBFA69FFFBEA5
      9EFEBBA39CFFC2ACA8DF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFFFFFFF6F9F9FFCB98BEFFB27DA8FFBD88B3FFC08EB8FFC495BCFFC597
      BCFFE0AFD8FFFFF7FFFFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFF2D5AFFFFFFFFFFFF7E6CFFFE9BB80FFEFCC9FFFFFFFFFFFFFFFFFFFD989
      20FFD47800FFFFFFFFFFD47800FFD47800FF00FFFF0000808000008080000080
      8000008080000080800000FFFF00008080000080800000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000F8F5F420CFB5
      AEFFCDB4ACFECBB2ABFFC9B0A8FFC7AEA7FFC5ACA5FFC4ABA4FFC2A9A2FFC0A8
      A1FEC7B1ABDF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFFF1FEFFC894BDFFC69BC0FFCF9FC5FFC999BFFFC597
      BBFF69475CFFFAFFFFFFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFDF9940FFE9BB80FFE7B370FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FF00FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00C0C0C00000FFFF000080800000000000000000000000
      00000000000000FFFF0000FFFF00C0C0C0000000000000000000000000000000
      0000E3D5D090CEB4ADFFCCB2ABFFCBB1AAFEC8AFA8FFC6ADA6FFC5ACA5FFF6F3
      F22000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFCFDFFF5E8F4FFA38A98FFE9D2E1FFFFFD
      FFFFFAFFFDFFFFFEFFFFFFFFFFFFFFFFFFFFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD47800FFD478
      00FFD47800FFD47800FFD47800FFD47800FFC0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9FF0000
      00FF000000FF000000FF4D4D4DFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D
      1DFF000000FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00808080007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF212121FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFF000000FF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF8D8D8DFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000777777007777770077777700777777007777770077777700777777008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
      00FFFBFBFBFFFFFFFFFFFFFFFFFFFDFDFDFF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00FFFBFBFBFFFFFFFFFFFFFFFFFFFDFDFDFF000000FFFFFFFFFFC7C7C7FF0000
      00FFC6C6C6FF000000FF8E8E8EFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0B0B
      0BFF060606FFFFFFFFFFFFFFFFFF090909FF080808FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B
      0BFF060606FFFFFFFFFFFFFFFFFF090909FF080808FFFFFFFFFFFFFFFFFF3131
      31FF000000FF313131FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00808080007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF595959FF5C5C5CFF000000FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF595959FF5C5C5CFF000000FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000777777007777770077777700777777007777770077777700777777008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9FF0000
      00FF000000FF000000FF4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFF000000FF5D5D5DFF5F5F5FFF000000FFFDFDFDFFFFFFFFFFFFFFFFFF1D1D
      1DFF000000FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFF000000FF5D5D5DFF5F5F5FFF000000FFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00808080007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0808
      08FF090909FFFFFFFFFFFFFFFFFF0C0C0CFF050505FFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FF212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0808
      08FF090909FFFFFFFFFFFFFFFFFF0C0C0CFF050505FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFF000000FF0000
      00FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFF000000FF8D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000
      00FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000777777007777770077777700777777007777770077777700777777008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF0000
      00FFC6C6C6FF000000FF8E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3131
      31FF000000FF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00808080007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      7700777777007777770080808000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300A4A0A000777777005F5F5F005F5F5F0080808000B2B2B200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2
      B2005F5F5F005555550055555500555555005555550055555500555555008080
      8000F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC663300CC663300CC66
      3300FFFFFF007777770077777700777777007777770077777700777777007777
      770077777700777777007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686005555
      5500555555005555550055555500555555005555550055555500555555005555
      55005555550066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F1006666
      6600555555005F5F5F00A4A0A000CCCCCC00C0C0C00096969600555555005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3E3E300C0C0C000C0C0C000DDDDDD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC
      CC0096969600EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00999999005555
      55005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100868686005555550055555500555555005555550077777700E3E3
      E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC005555
      550055555500DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000777777007777
      77007777770077777700777777007777770080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00868686005555550096969600E3E3E300EAEAEA00C0C0C000666666006666
      6600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B2005555
      550055555500DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDD
      DD005555550080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0005555
      5500C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300A4A0A0005F5F5F005555
      550066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F1F100B2B2B200777777005555550055555500555555005555
      5500C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC663300CC663300CC66
      3300FFFFFF007777770077777700777777007777770077777700777777007777
      770077777700777777007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF0055555500555555005555
      5500555555005555550055555500555555005555550055555500555555005555
      5500555555005555550055555500FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000777777007777
      77007777770077777700777777007777770080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1
      F10066666600555555005555550066666600A4A0A000DDDDDD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0005555550055555500A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2
      B2005555550055555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0005555550055555500DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700FFFFFF0080808000777777007777
      77007777770077777700777777007777770080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00055555500B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1
      F100666666005555550066666600B2B2B200CCCCCC00C0C0C000777777005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC663300CC663300CC66
      3300FFFFFF007777770077777700777777007777770077777700777777007777
      770077777700777777007777770077777700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCCCC005F5F5F0055555500555555005555550055555500555555005555
      550099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CCCC
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000777777007777
      7700777777007777770077777700777777007777770077777700777777007777
      77007777770080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3E3E30096969600666666005F5F5F006666660086868600CCCC
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDDDDD00B2B2B20096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC00A4A0A0008080
      8000808080008080800080808000FFFFFF007777770077777700777777007777
      77007777770077777700FFFFFF00FFFFFF00EAEAEA00CC996600CC996600CC99
      6600CC999900CC999900CC999900CC999900CC996600CC996600CC996600CC99
      6600CC996600DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300CC993300CC99
      330099663300996633009966330099663300CC993300CC993300CC993300CC99
      3300CC993300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      5500555555005555550055555500555555005F5F5F0077777700A4A0A000EAEA
      EA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F1005F5F5F005F5F5F00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300996633009966
      66009966660099663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC993300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      55005555550096969600B2B2B200B2B2B200A4A0A00080808000555555006666
      6600E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00868686005555550086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300996633009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300CC993300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00969696005555
      550096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000555555005F5F5F00F1F1F100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00D6E7E7003366CC003366
      CC00F1F1F100C0C0C000FFFFFF00FFFFFF00F0CAA600CC993300996633007777
      7700777777007777770077777700777777007777770077777700777777009966
      6600CC663300CC999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0005555
      550080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F1F1005F5F5F0055555500C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00D6E7E7003366CC003366CC00EAEA
      EA00FFFFFF00F8F8F800FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC663300999933009999330099993300999933009999
      33009999330099993300DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686005555
      5500A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00868686005555550086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000EAEAEA003366CC003333CC003333CC003333
      CC003333CC003333CC003333CC003333CC00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC6633009999330099CC9900CCCC9900C0DCC000C0DC
      C000C0DCC000C0DCC00099CC6600FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      55005555550080808000868686008686860086868600666666005F5F5F009696
      9600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000555555005F5F5F00F1F1F100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000EAEAEA003366CC003333CC003333CC003333
      CC003333CC003333CC003333CC003333CC00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC66330099993300D7D7D700DDDDDD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099CC6600FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500808080008686860086868600808080005F5F5F0096969600EAEA
      EA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F1005F5F5F0055555500CBCBCB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00D6E7E7003366CC003366CC00EAEA
      EA00FFFFFF00F8F8F800FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC66330099993300DDDDDD00EAEAEA00F8F8F800F8F8
      F800F8F8F800F1F1F10099CC6600FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00E3E3E3005F5F5F006666
      6600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080005555550096969600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00D6E7E7003366CC003366
      CC00F1F1F100C0C0C000FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC993300CC996600CC9966009999660099CC660099993300999933009999
      33009999330099993300CCCC9900FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686005555
      5500CBCBCB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200555555005F5F5F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CC66
      3300CC993300CC999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      550055555500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666005555
      5500CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EAEAEA005F5F5F0055555500CCCCCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00F1F1F100CCCCCC00EAEAEA00CCCC9900CC663300CC66
      3300CC993300FFECCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      55005555550096969600B2B2B200B2B2B200A4A0A00077777700555555007777
      7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080005555550099999900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
      8000808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0077777700FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00CCCCCC005555550099999900F0CAA600CC663300CC66
      3300FFCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005555
      5500555555005555550055555500555555005F5F5F0077777700B2B2B200F1F1
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0005555550066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7D7D700B2B2B2008686
      8600808080008080800080808000FFFFFF007777770077777700777777007777
      77007777770077777700FFFFFF00FFFFFF00F8F8F800F0CAA600F0CAA600F0CA
      A600DDDDDD00FFFFFF00EAEAEA00A4A0A000D7D7D700EAEAEA00F0CAA600DDDD
      DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDDDDD00B2B2B20096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00CC996600CC99
      3300CC996600CC999900EAEAEA00FFFFFF00FFFFFF00F1F1F100CC999900CC99
      3300CC993300CC996600EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0096969600808080008080800080808000808080008080
      800080808000808080008080800096969600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00969696008080800080808000808080008080
      800080808000808080008080800096969600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC996600CC663300F0CA
      A600F0CAA600CC663300CC993300EAEAEA00FFFFFF00CC996600CC663300F0CA
      A600F0CAA600CC663300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000CC663300CC663300CC663300CC66
      3300CC663300CC663300CC996600F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCC9900CC663300CC996600FFFFFF00FFFFFF00CC663300CC996600FFFF
      FF00FFFFFF00F0CAA600CC663300CCCC9900F0CAA600CC663300F0CAA600FFFF
      FF00FFFFFF00CC996600CC663300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00CC663300CC663300CC663300CC66
      3300CC663300CC663300FFFFFF008080800066CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000CC663300CC663300CC663300CC66
      3300CC663300CC663300CC663300CC996600F8F8F800FFFFFF00FFFFFF00FFFF
      FF00E3E3E300CC663300CC663300F1F1F100FFFFFF00CC996600CC663300EAEA
      EA00FFFFFF00EAEAEA00CC663300CC996600CC996600CC663300EAEAEA00FFFF
      FF00EAEAEA00CC663300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000CC663300CC663300CC663300CC99
      6600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC993300CC663300F0CAA600FFFFFF00FFCCCC00CC663300CC99
      3300F0CAA600CC996600CC663300CC663300CC663300CC663300CC996600F0CA
      A600CC996600CC663300D7D7D700FFFFFF00C0C0C000B2B2B200B2B2B200B2B2
      B200B2B2B200FFFFFF0080808000FFFFFF00CC663300CC663300CC663300CC66
      3300CC663300CC663300FFFFFF008080800066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080808000CC663300CC663300CC996600CC66
      3300CC996600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC996600CC663300CC999900FFFFFF00FFFFFF00F0CAA600CC99
      6600CC663300CC663300CC996600CC663300CC663300CC996600CC996600CC66
      3300CC996600F0CAA600FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008686
      860080808000808080008080800080808000CC663300CC663300EAEAEA00CC99
      6600CC663300CC996600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0CAA600CC663300CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D7D7D700CC999900CC999900CCCC9900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00CC996600CC99
      6600CC996600FFFFFF0080808000FFFFFF00CC663300CC663300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00DDDDDD0086868600D7D7D700CC663300CC663300FFFFFF00EAEA
      EA00CC996600CC663300CC996600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DDDDDD00CC663300CC993300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D7D70080808000808080008080800077777700C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008686
      86008080800080808000808080008080800066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      8000DDDDDD0086868600DDDDDD00FFFFFF00CC996600CC663300FFFFFF00FFFF
      FF00EAEAEA00CC993300CC663300CC996600F1F1F100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0CAA600CC663300CC996600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAEAEA00808080008080800096969600969696008080800080808000DDDD
      DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00CC996600CC99
      6600CC996600FFFFFF0080808000FFFFFF00CC663300CC663300FFFFFF008080
      8000FFFFFF00DDDDDD0086868600D7D7D70066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF008080
      800086868600DDDDDD00FFFFFF00FFFFFF00F8F8F800CC996600FFFFFF00FFFF
      FF00FFFFFF00EAEAEA00CC993300CC663300CC993300F0CAA600FFFFFF00FFFF
      FF00E3E3E300CC996600CC663300CC999900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00969696008080800086868600EAEAEA00EAEAEA0086868600808080008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000DDDDDD0086868600DDDDDD00FFFFFF0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00FFFFFF00969696008080800080808000808080008686
      8600E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAEAEA00CC996600CC663300CC663300CC663300CC99
      3300CC663300CC663300CC993300F1F1F100FFFFFF00FFFFFF00FFFFFF00CCCC
      CC008080800080808000D7D7D700FFFFFF00FFFFFF00CCCCCC00808080008080
      8000C0C0C000FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00CC996600CC99
      6600FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800086868600DDDDDD00FFFFFF00FFFFFF0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0099CCFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8F800CCCC9900CC663300CC663300CC66
      3300CC663300CC996600EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF008686
      860080808000A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A0A0008080
      800086868600FFFFFF00FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0096969600808080008080800080808000808080008686
      8600E3E3E300FFFFFF00FFFFFF00FFFFFF0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800DDDDDD00DDDD
      DD00F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD008080
      800086868600F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F1008686
      860080808000DDDDDD00FFFFFF00FFFFFF00B2B2B200FFFFFF00CC996600CC99
      6600FFFFFF00E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B2008080
      8000D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC
      CC0080808000B2B2B200FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B200E3E3E300B2B2B200E3E3E300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066CCCC0066CCCC00F0FBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0066CCCC0066CC
      CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0096969600B2B2
      B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A4A0A00096969600FFFFFF00FFFFFF00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B200B2B2B200EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066CCFF0066CCCC00FFFFFF008686
      86008080800080808000808080008080800086868600FFFFFF0066CCCC0066CC
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100A4A0A000FFFFFF00FFFFFF00C0C0C000B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1
      F10086868600808080008080800086868600F1F1F100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6D6EF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC00C6D6EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000808080008080800080808000808080008080800080808000808080008080
      8000C0C0C000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6D6EF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0099CCFF00FFFFFF00EAEAEA00CC996600CC996600CC99
      6600CC999900CC999900CC999900CC999900CC996600CC996600CC996600CC99
      6600CC996600DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0099CCFF00FFFFFF00F0CAA600CC993300CC993300CC99
      330099663300996633009966330099663300CC993300CC993300CC993300CC99
      3300CC993300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000E3E3E300B2B2B200B2B2B200B2B2B200B2B2B200E3E3E300C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000099CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0099CCFF00FFFFFF00F0CAA600CC993300996633009966
      66009966660099663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC993300CC996600FFFFFF00FFFFFF00A4A0A00080808000808080008080
      8000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000777777008080800077777700A4A0A000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000099CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0099CCFF00FFFFFF00F0CAA600CC993300996633009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300CC993300CC996600FFFFFF00FFFFFF007777770080808000808080007777
      7700808080008080800080808000808080008080800080808000808080008080
      800077777700808080008080800077777700000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000066CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCFF00FFFFFF00F0CAA600CC993300996633007777
      7700777777007777770077777700777777007777770077777700777777009966
      6600CC663300CC999900FFFFFF00FFFFFF0080808000EAEAEA00EAEAEA008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000066CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC663300999933009999330099993300999933009999
      33009999330099993300DDDDDD00FFFFFF008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000066CCFF0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CCCC0066CC
      CC0066CCCC0066CCCC0066CCFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC6633009999330099CC9900CCCC9900C0DCC000C0DC
      C000C0DCC000C0DCC00099CC6600FFFFFF00808080008080800096969600E3E3
      E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300969696008080800080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC00FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC66330099993300D7D7D700DDDDDD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099CC6600FFFFFF008080800080808000E3E3E300CCCC
      9900CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CCCC9900E3E3E3008080800080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0033669900336699003366
      9900336699003366990033669900336699003366990033669900336699003366
      99003366990033669900FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC663300CC663300CC66330099993300DDDDDD00EAEAEA00F8F8F800F8F8
      F800F8F8F800F1F1F10099CC6600FFFFFF008080800080808000FFFFFF00CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC663300FFFFFF007777770080808000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0033669900336699003366
      99003366990033669900336699006699CC0099CCCC0099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC00FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC993300CC996600CC9966009999660099CC660099993300999933009999
      33009999330099993300CCCC9900FFFFFF007777770080808000FFFFFF00CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC663300FFFFFF007777770077777700000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF0033999900336699003366
      9900336699003366990090A9AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC9900CC663300CC66
      3300CC993300CC999900FFFFFF00FFFFFF00A4A0A00077777700FFFFFF00CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC663300FFFFFF0077777700A4A0A000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CCCC9900669933006699330066993300F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00F1F1F100CCCCCC00EAEAEA00CCCC9900CC663300CC66
      3300CC993300FFECCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC663300FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D7D7009999660066993300F0CAA600CC993300CC663300CC66
      3300CC996600FFFFFF00CCCCCC005555550099999900F0CAA600CC663300CC66
      3300FFCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0DCC00099996600DDDDDD0066993300F8F8F800F0CAA600F0CAA600F0CA
      A600DDDDDD00FFFFFF00EAEAEA00A4A0A000D7D7D700EAEAEA00F0CAA600DDDD
      DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F10066993300669933006699
      330099996600EAEAEA00FFFFFF00CCCC9900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00868686008080800080808000808080008080800080808000808080008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFF88000000000
      F81FD00000000000E18F800000000000C7E7800000000000CFB3878000000000
      DF13888000000000FE7B084900000000FE7B184100000000FE73084300000000
      C6738C870000000087E7830F0000000087C7800700000000F00F800F00000000
      FC7FD8CF00000000FFFFF8FF00000000FFFF0000FFFFFFFFFFFF0000FFFFFFFF
      FFFF0000EFEFE007FC03000087E38003FDFB00009FF91FF9FF3B00003E793FFD
      C11B00003C3D3FFDDF1B00003C393FF9DD1B00009E719FF9DC030000CE638FE3
      DFFF0000EFE7EFE7DF7F0000E7EFE7E7C07F0000F3CFE3CFFFFF0000F81FF01F
      FFFF0000FC7FFC3FFFFF0000FFFFFFFFF81F0000000001FFE0070000000001FF
      C0030000000081FF800100000000C20F000100000000C007000000000000C007
      000000000000E007000000000000E007000000000000E007000000000000F017
      000000000000F113000100000000F8E1800100000000F8638003000000000071
      C007000000000078F00F00000000007900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C00F000000000000C01F000000000000
      C03F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = ToolbarImages
    Left = 328
    Top = 212
    object FileNewCmd: TAction
      Category = 'File'
      Caption = '&New'
      Hint = 'Create a new file'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = FileNew
    end
    object FileOpenCmd: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open an existing file'
      ImageIndex = 1
      ShortCut = 16463
      BeforeExecute = FileOpenBeforeExecute
      OnAccept = FileOpenAccept
    end
    object FileSaveCmd: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save current file'
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = FileSave
    end
    object FilePrintCmd: TPrintDlg
      Category = 'File'
      Caption = '&Print'
      Hint = 'Print current file'
      ImageIndex = 3
      ShortCut = 16464
      OnAccept = FilePrintAccept
    end
    object FileExitCmd: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit this application'
      ImageIndex = 8
      ShortCut = 32856
    end
    object FileSaveAsCmd: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 
        'Rich Text Files (*.rtf)|*.rtf|Text Files (*.txt)|*.txt|Log Files' +
        ' (*.log)|*.log'
      Hint = 'Save current file under a new name'
      ImageIndex = 9
      BeforeExecute = FileSaveAsCmdBeforeExecute
      OnAccept = FileSaveAs
    end
    object EditUndoCmd: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo the last action'
      ImageIndex = 4
      ShortCut = 16474
    end
    object EditCutCmd: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Delete selected item'
      ImageIndex = 5
      ShortCut = 16472
    end
    object EditCopyCmd: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy selected item to clipboard'
      ImageIndex = 6
      ShortCut = 16451
    end
    object EditPasteCmd: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste contents of clipboard'
      ImageIndex = 7
      ShortCut = 16470
    end
    object EditFontCmd: TFontEdit
      Category = 'Edit'
      Caption = '&Font...'
      Dialog.Font.Charset = DEFAULT_CHARSET
      Dialog.Font.Color = clWindowText
      Dialog.Font.Height = -11
      Dialog.Font.Name = 'Tahoma'
      Dialog.Font.Style = []
      BeforeExecute = SelectFontBeforeExecute
      OnAccept = SelectFont
    end
    object FormatRichEditBoldCmd: TRichEditBold
      Category = 'Format'
      AutoCheck = True
      Caption = '&Bold'
      Hint = 'Bold'
      ImageIndex = 10
      ShortCut = 16450
    end
    object FormatRichEditItalicCmd: TRichEditItalic
      Category = 'Format'
      AutoCheck = True
      Caption = '&Italic'
      Hint = 'Italic'
      ImageIndex = 11
      ShortCut = 16457
    end
    object FormatRichEditUnderlineCmd: TRichEditUnderline
      Category = 'Format'
      AutoCheck = True
      Caption = '&Underline'
      Hint = 'Underline'
      ImageIndex = 12
      ShortCut = 16469
    end
    object FormatRichEditStrikeOutCmd: TRichEditStrikeOut
      Category = 'Format'
      AutoCheck = True
      Caption = '&Strikeout'
      Hint = 'Strikeout'
      ImageIndex = 13
    end
    object FormatRichEditBulletsCmd: TRichEditBullets
      Category = 'Format'
      AutoCheck = True
      Caption = '&Bullets'
      Hint = 'Bullets|Inserts a bullet on the current line'
      ImageIndex = 14
    end
    object FormatRichEditAlignLeftCmd: TRichEditAlignLeft
      Category = 'Format'
      AutoCheck = True
      Caption = 'Align &Left'
      Hint = 'Align Left|Aligns text at the left indent'
      ImageIndex = 15
    end
    object FormatRichEditAlignRightCmd: TRichEditAlignRight
      Category = 'Format'
      AutoCheck = True
      Caption = 'Align &Right'
      Hint = 'Align Right|Aligns text at the right indent'
      ImageIndex = 16
    end
    object FormatRichEditAlignCenterCmd: TRichEditAlignCenter
      Category = 'Format'
      AutoCheck = True
      Caption = '&Center'
      Hint = 'Center|Centers text between margins'
      ImageIndex = 17
    end
    object SuperscriptCmd: TAction
      Category = 'Format'
      Caption = 'Superscript'
      Hint = 'Superscript|Formats text as superscript'
      ImageIndex = 18
      OnExecute = SuperscriptCmdExecute
      OnUpdate = SuperscriptCmdUpdate
    end
    object SubscriptCmd: TAction
      Category = 'Format'
      Caption = 'Subscript'
      Hint = 'Subscript|Formats text as subscript'
      ImageIndex = 19
      OnExecute = SubscriptCmdExecute
      OnUpdate = SubscriptCmdUpdate
    end
  end
  object FindDialog1: TFindDialog
    OnClose = FindDialog1Close
    OnShow = FindDialog1Show
    OnFind = FindDialog1Find
    Left = 400
    Top = 280
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 328
    Top = 151
  end
  object OpenDialog1: TOpenDialog
    Left = 400
    Top = 153
  end
  object PopupMenu1: TPopupMenu
    Images = ToolbarImages
    Left = 480
    Top = 280
    object CloseTheDevice1: TMenuItem
      Caption = 'Close And Remove This Page/Device'
      ImageIndex = 20
      OnClick = CloseTheDevice1Click
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object MenuItem2: TMenuItem
      Caption = 'Copy'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Paste'
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = 'Select All'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Caption = 'Save As...'
      OnClick = MenuItem7Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object MenuItem6: TMenuItem
      Caption = 'Clear All Datas'
      OnClick = MenuItem6Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object CancelItem: TMenuItem
      Caption = 'Cancel'
      OnClick = CancelItemClick
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer2Timer
    Left = 472
    Top = 154
  end
end
