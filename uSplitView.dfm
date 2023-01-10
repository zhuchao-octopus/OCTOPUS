object SplitViewForm: TSplitViewForm
  Left = 0
  Top = 0
  AlphaBlendValue = 238
  Caption = 'OCTOPUS '#31456#40060#20018#21475#32456#31471
  ClientHeight = 699
  ClientWidth = 1265
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter1: TSplitter
    Left = 1262
    Top = 0
    Height = 675
    Align = alRight
    Beveled = True
    OnMoved = Splitter1Moved
    ExplicitLeft = 1090
    ExplicitTop = 1
    ExplicitHeight = 608
  end
  object SV_L: TSplitView
    Left = 0
    Top = 0
    Width = 320
    Height = 675
    AnimationStep = 60
    OpenedWidth = 320
    ParentColor = True
    ParentDoubleBuffered = True
    Placement = svpLeft
    TabOrder = 0
    OnClosed = SV_LClosed
    object Notebook1: TNotebook
      Left = 0
      Top = 0
      Width = 320
      Height = 649
      Align = alClient
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'Octops '#20018#21475#35774#32622
        object Panel17: TPanel
          Left = 0
          Top = 0
          Width = 320
          Height = 649
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 5
            Top = 3
            Width = 310
            Height = 73
            TabOrder = 0
            object Button2: TButton
              Left = 76
              Top = 35
              Width = 224
              Height = 34
              Caption = #25171#24320#20018#21475
              ImageAlignment = iaRight
              ImageIndex = 0
              TabOrder = 2
              OnClick = Button2Click
            end
            object ComboBoxEx1: TComboBoxEx
              Left = 5
              Top = 3
              Width = 295
              Height = 26
              ItemsEx = <>
              Style = csExDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ItemHeight = 20
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = ComboBoxEx1Change
            end
            object Button4: TButton
              Left = 5
              Top = 35
              Width = 63
              Height = 34
              Caption = #26032#35774#22791
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = Button4Click
            end
          end
          object Panel14: TPanel
            Left = 5
            Top = 402
            Width = 310
            Height = 87
            TabOrder = 1
            object Button17: TButton
              Left = 83
              Top = 5
              Width = 217
              Height = 34
              Caption = #12304#32972#26223#39068#33394#12305#25991#26412#30340#32972#26223#39068#33394
              TabOrder = 0
              OnClick = Button17Click
            end
            object Button12: TButton
              Left = 5
              Top = 5
              Width = 77
              Height = 34
              Caption = #23383#20307#35774#32622
              TabOrder = 1
              OnClick = Button12Click
            end
            object Button24: TButton
              Left = 83
              Top = 38
              Width = 217
              Height = 34
              Caption = #12304#21457#36865#25991#20214#12305#21521#35774#22791#21457#36865#25991#20214
              TabOrder = 2
              OnClick = Button24Click
            end
            object Button23: TButton
              Left = 5
              Top = 38
              Width = 77
              Height = 34
              Caption = #36733#20837#25991#20214
              TabOrder = 3
              OnClick = Button23Click
            end
          end
          object Panel19: TPanel
            Left = 5
            Top = 79
            Width = 310
            Height = 234
            TabOrder = 2
            object Label13: TLabel
              Left = 5
              Top = 171
              Width = 64
              Height = 17
              Hint = #21457#36865#25968#25454#30340#26684#24335'ASCI'#20026#23383#31526'HEX'#20026#21313#20845#36827#21046'CMD'#20026#25191#34892#26412#22320'Shell'#21629#20196
              Caption = #21457#36865#26684#24335
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label15: TLabel
              Left = 5
              Top = 139
              Width = 64
              Height = 17
              Caption = #27969#25511#21046#31526
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 5
              Top = 108
              Width = 64
              Height = 17
              Caption = #26657#39564#20301#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 5
              Top = 77
              Width = 64
              Height = 17
              Caption = #20572#27490#20301#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 5
              Top = 46
              Width = 64
              Height = 17
              Caption = #25968#25454#20301#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 5
              Top = 15
              Width = 64
              Height = 17
              Caption = #27874#29305#29575#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 5
              Top = 201
              Width = 64
              Height = 17
              Caption = #25509#25910#26684#24335
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object ComboBox6: TComboBox
              Left = 76
              Top = 167
              Width = 224
              Height = 25
              Style = csDropDownList
              ItemIndex = 0
              ParentColor = True
              TabOrder = 0
              Text = 'ASCII Format            '#23383#31526#20018
              OnChange = ComboBox6Change
              Items.Strings = (
                'ASCII Format            '#23383#31526#20018
                'Hexadecimal Format '#21313#20845#36827#21046' '
                'Octopus Protocol      '#21327#35758' ')
            end
            object ComboBox5: TComboBox
              Left = 76
              Top = 136
              Width = 224
              Height = 25
              Style = csDropDownList
              ParentColor = True
              TabOrder = 1
            end
            object ComboBox4: TComboBox
              Left = 76
              Top = 105
              Width = 224
              Height = 25
              Style = csDropDownList
              ParentColor = True
              TabOrder = 2
            end
            object ComboBox3: TComboBox
              Left = 76
              Top = 74
              Width = 224
              Height = 25
              Style = csDropDownList
              ParentColor = True
              TabOrder = 3
            end
            object ComboBox2: TComboBox
              Left = 76
              Top = 43
              Width = 224
              Height = 25
              Style = csDropDownList
              ParentColor = True
              TabOrder = 4
            end
            object ComboBox1: TComboBox
              Left = 76
              Top = 7
              Width = 224
              Height = 25
              Style = csDropDownList
              DropDownCount = 20
              ParentColor = True
              TabOrder = 5
              OnChange = ComboBox1Change
            end
            object ComboBox7: TComboBox
              Left = 76
              Top = 198
              Width = 224
              Height = 25
              Style = csDropDownList
              ParentColor = True
              TabOrder = 6
              OnChange = ComboBox7Change
            end
          end
          object Panel20: TPanel
            Left = 5
            Top = 317
            Width = 310
            Height = 82
            TabOrder = 3
            object Button10: TButton
              Left = 5
              Top = 6
              Width = 295
              Height = 34
              Caption = #12304#28165#38500#25968#25454#12305#24403#21069#35774#22791#25509#25910#21040#30340#25968#25454
              TabOrder = 0
              OnClick = Button10Click
            end
            object Button26: TButton
              Left = 5
              Top = 45
              Width = 295
              Height = 34
              Caption = #12304#21478#23384#25968#25454#12305#24403#21069#35774#22791#25509#25910#21040#30340#25968#25454
              TabOrder = 1
              OnClick = Button26Click
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = #39640#32423
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 320
          Height = 649
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 0
          object cbxVclStyles: TComboBox
            Left = 6
            Top = 3
            Width = 308
            Height = 25
            Style = csDropDownList
            DropDownCount = 30
            TabOrder = 0
            OnChange = cbxVclStylesChange
          end
          object GroupBox3: TGroupBox
            Left = 6
            Top = 35
            Width = 307
            Height = 175
            TabOrder = 1
            object Label1: TLabel
              Left = 8
              Top = 36
              Width = 147
              Height = 17
              Caption = #36879#26126#24230','#20540#36234#23567#36234#28165#29245
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 8
              Top = 98
              Width = 152
              Height = 17
              Caption = #33258#21160#20445#23384#26102#38388#38388#38548#31186'  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Edit2: TEdit
              Left = 186
              Top = 31
              Width = 90
              Height = 25
              Color = clScrollBar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = '238'
            end
            object UpDown2: TUpDown
              Left = 276
              Top = 31
              Width = 25
              Height = 25
              Associate = Edit2
              Min = 1
              Max = 255
              Position = 238
              TabOrder = 1
              OnChanging = UpDown2Changing
            end
            object CheckBox8: TCheckBox
              Left = 8
              Top = 65
              Width = 298
              Height = 25
              Caption = #25968#25454#33258#21160#20445#23384#21040#26412#22320#25991#20214
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = CheckBox8Click
            end
            object Edit3: TEdit
              Left = 186
              Top = 94
              Width = 90
              Height = 25
              Hint = #21333#20301#31186
              Color = clScrollBar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
              Text = '10'
            end
            object UpDown5: TUpDown
              Left = 276
              Top = 94
              Width = 25
              Height = 25
              Associate = Edit3
              Min = 5
              Max = 32766
              Position = 10
              TabOrder = 4
              OnChanging = UpDown5Changing
            end
            object Button6: TButton
              Left = 8
              Top = 131
              Width = 178
              Height = 34
              Caption = #21382#21490#25968#25454#25991#20214#30446#24405
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = Button6Click
            end
            object Button5: TButton
              Left = 195
              Top = 131
              Width = 106
              Height = 34
              Caption = #28165#38500#32531#23384
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnClick = Button5Click
            end
            object CheckBox7: TCheckBox
              Left = 8
              Top = 3
              Width = 263
              Height = 25
              Caption = #31383#21475#32972#26223#21551#29992#36879#26126#25928#26524
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = CheckBox7Click
            end
          end
          object GroupBox4: TGroupBox
            Left = 6
            Top = 216
            Width = 307
            Height = 210
            TabOrder = 2
            object CheckBox2: TCheckBox
              Left = 8
              Top = 11
              Width = 297
              Height = 25
              Caption = #22987#32456#20445#25345#22312#25152#26377#31383#21475#30340#26368#39030#23618
              TabOrder = 0
              OnClick = CheckBox2Click
            end
            object CheckBox25: TCheckBox
              Left = 8
              Top = 39
              Width = 273
              Height = 25
              Caption = #21457#36865#21644#25509#25910#35760#24405#21069#38754#26174#31034#26102#38388#20449#24687
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMenuText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = CheckBox25Click
            end
            object CheckBox3: TCheckBox
              Left = 8
              Top = 67
              Width = 273
              Height = 25
              Caption = #21457#36865#21644#25509#25910#35760#24405#21069#38754#26174#31034#24180#26376#26085#26399
              TabOrder = 2
              OnClick = CheckBox3Click
            end
            object CheckBox4: TCheckBox
              Left = 8
              Top = 95
              Width = 258
              Height = 25
              Caption = #25968#25454#35760#24405#21069#38754#26174#31034#34892#21495
              TabOrder = 3
              OnClick = CheckBox4Click
            end
            object CheckBox5: TCheckBox
              Left = 8
              Top = 123
              Width = 249
              Height = 25
              Caption = #26174#31034#20018#21475#27491#22312#21457#36865#30340#25968#25454
              TabOrder = 4
              OnClick = CheckBox5Click
            end
            object CheckBox6: TCheckBox
              Left = 8
              Top = 179
              Width = 258
              Height = 25
              Caption = 'Switch To English Language'
              TabOrder = 5
              OnClick = CheckBox6Click
            end
            object CheckBox1: TCheckBox
              Left = 8
              Top = 151
              Width = 209
              Height = 25
              Caption = #22312#26700#38754#21019#24314#24555#25463#26041#24335
              Checked = True
              State = cbChecked
              TabOrder = 6
            end
          end
          object Panel11: TPanel
            Left = 6
            Top = 431
            Width = 308
            Height = 193
            TabOrder = 3
            object Label4: TLabel
              Left = 8
              Top = 80
              Width = 140
              Height = 17
              Caption = #21313#20845#36827#21046#23545#40784#26041#24335'   '
            end
            object CheckBox12: TCheckBox
              Left = 8
              Top = 17
              Width = 287
              Height = 17
              Hint = #21246#19978#65292#25903#25345#20013#25991#31561#22810#22269#35821#35328#30340#25509#25910
              Caption = #25509#25910#20351#29992' UNICODE '#23383#31526#38598#32534#30721#65288#20013#25991#65289
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox12Click
            end
            object Combobox_CodePage: TComboBox
              Left = 8
              Top = 45
              Width = 293
              Height = 25
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 1
              Text = ' CP_ACP                { ANSI / GB2312  }'
              OnChange = Combobox_CodePageChange
              Items.Strings = (
                ' CP_ACP                { ANSI / GB2312  }'
                ' CP_OEMCP           { OEM  code page }'
                ' CP_MACCP           { MAC  code page }'
                ' CP_SYMBOL          { SYMBOL translations }'
                ' CP_UTF7               { UTF-7 translation }'
                ' CP_UTF8               { UTF-8 translation }')
            end
            object ComboBox8: TComboBox
              Left = 8
              Top = 102
              Width = 293
              Height = 25
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 2
              Text = 'Hexadecimal 16Bytes Align'
              OnChange = ComboBox8Change
              Items.Strings = (
                'Hexadecimal 16Bytes Align'
                'Hexadecimal 32Bytes Align'
                'None')
            end
            object LabeledEdit1: TLabeledEdit
              Left = 8
              Top = 156
              Width = 169
              Height = 25
              Color = clWhite
              EditLabel.Width = 128
              EditLabel.Height = 17
              EditLabel.Caption = #25509#25910#24310#36831#65288#27627#31186#65289
              EditLabel.Color = clBtnHighlight
              EditLabel.ParentColor = False
              NumbersOnly = True
              TabOrder = 3
              Text = ''
            end
            object Button14: TButton
              Left = 200
              Top = 148
              Width = 101
              Height = 33
              Caption = #24212#29992
              TabOrder = 4
              OnClick = Button14Click
            end
          end
        end
      end
    end
    object TabSet1: TTabSet
      Left = 0
      Top = 649
      Width = 320
      Height = 26
      Align = alBottom
      DitherBackground = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentShowHint = False
      ShowHint = False
      Style = tsModernTabs
      Tabs.Strings = (
        'Octops '#20018#21475#35774#32622)
      TabIndex = 0
      OnChange = TabSet1Change
    end
  end
  object SV_R: TSplitView
    Left = 942
    Top = 0
    Width = 320
    Height = 675
    AnimationStep = 60
    OpenedWidth = 320
    ParentColor = True
    ParentDoubleBuffered = True
    Placement = svpRight
    TabOrder = 1
    OnClosed = SV_RClosed
    OnOpened = SV_ROpened
    object Notebook3: TNotebook
      Left = 0
      Top = 0
      Width = 320
      Height = 649
      Align = alClient
      PageIndex = 1
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = #22359#21457#36865
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 314
          Height = 643
          Align = alClient
          BevelOuter = bvNone
          Color = clMenuBar
          ParentBackground = False
          TabOrder = 0
          object Panel5: TPanel
            Left = 0
            Top = 232
            Width = 314
            Height = 411
            Align = alClient
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 314
              Height = 340
              Align = alClient
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Memo2: TMemo
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 308
                Height = 334
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
              Top = 340
              Width = 314
              Height = 71
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 1
              object Button7: TButton
                Left = 2
                Top = 0
                Width = 75
                Height = 34
                Caption = #28165#31354
                TabOrder = 0
                OnClick = Button7Click
              end
              object Button8: TButton
                Left = 78
                Top = 0
                Width = 235
                Height = 34
                Caption = #21457#36865#25968#25454
                TabOrder = 1
                OnClick = Button8Click
              end
              object Button25: TButton
                Left = 2
                Top = 36
                Width = 311
                Height = 34
                Hint = #21435#25481#22810#20313#31354#26684#12289#36887#21495#12289'0x'#12289'0X'#20998#21106#31526#21495
                Caption = #26684#24335#21270#21313#20845#36827#21046#25968#25454
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = Button25Click
              end
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 314
            Height = 232
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Memo3: TMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 308
              Height = 122
              Align = alTop
              Ctl3D = True
              Lines.Strings = (
                'Octopus '#31456#40060#20018#21475#21161#25163)
              ParentCtl3D = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Button9: TButton
              Left = 2
              Top = 129
              Width = 311
              Height = 34
              Caption = #23558#19978#38754#30340#23383#31526#20018#36716#25442#25104#21313#20845#36827#21046#23383#33410#30721
              TabOrder = 1
              OnClick = Button9Click
            end
            object Button11: TButton
              Left = 2
              Top = 163
              Width = 311
              Height = 34
              Caption = #23558#19979#38754#30340#21313#20845#36827#21046#23383#33410#30721#36716#25442#25104#23383#31526#20018
              TabOrder = 2
              OnClick = Button11Click
            end
            object Button13: TButton
              Left = 2
              Top = 198
              Width = 311
              Height = 34
              Caption = #20135#29983#31616#21333#32047#21152#21644#26657#39564#23383#33410#24182#20197'7E'#32467#26463
              TabOrder = 3
              OnClick = Button13Click
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Octopus '#21333#26465#21457#36865
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 314
          Height = 643
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object StringGrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 314
            Height = 605
            Hint = #28857#20987#24038#36793#25353#38062#21457#36865#25968#25454
            Align = alClient
            BorderStyle = bsNone
            ColCount = 6
            Ctl3D = True
            DefaultColWidth = 50
            DefaultRowHeight = 26
            RowCount = 1000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goEditing, goAlwaysShowEditor, goFixedColClick, goFixedRowClick]
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
            OnSelectCell = StringGrid1SelectCell
            ColWidths = (
              50
              33
              202
              41
              50
              186)
          end
          object Panel4: TPanel
            Left = 0
            Top = 605
            Width = 314
            Height = 38
            Align = alBottom
            Alignment = taLeftJustify
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object Button1: TButton
              Left = 79
              Top = 3
              Width = 235
              Height = 34
              Caption = #24490#29615#21457#36865#36873#20013#30340#20869#23481
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button3: TButton
              Left = 0
              Top = 3
              Width = 78
              Height = 34
              Caption = #20572#27490#24490#29615
              TabOrder = 1
              OnClick = Button3Click
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = #21327#35758#36716#25442
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 314
          Height = 643
          Align = alClient
          BevelOuter = bvNone
          Color = clMenuBar
          ParentBackground = False
          TabOrder = 0
          object Memo5: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 127
            Width = 308
            Height = 478
            Align = alClient
            Lines.Strings = (
              'restart')
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object Panel16: TPanel
            Left = 0
            Top = 608
            Width = 314
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Button16: TButton
              Left = 99
              Top = 0
              Width = 211
              Height = 34
              Caption = #21457#36865#25805#20316
              TabOrder = 0
              OnClick = Button16Click
            end
            object Button27: TButton
              Left = 3
              Top = 0
              Width = 94
              Height = 34
              Caption = #28165#38500
              TabOrder = 1
              OnClick = Button27Click
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 314
            Height = 124
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label18: TLabel
              Left = 3
              Top = 102
              Width = 64
              Height = 17
              Caption = #25805#20316#31867#22411
            end
            object Label11: TLabel
              Left = 3
              Top = 72
              Width = 64
              Height = 17
              Caption = #35835#23383#33410#25968
            end
            object Label8: TLabel
              Left = 3
              Top = 42
              Width = 64
              Height = 17
              Caption = #22120#20214#22320#22336
            end
            object Label7: TLabel
              Left = 3
              Top = 13
              Width = 64
              Height = 17
              Caption = #36890#35759#21327#35758
            end
            object ComboBox12: TComboBox
              Left = 73
              Top = 96
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
            object ComboBox9: TComboBox
              AlignWithMargins = True
              Left = 74
              Top = 3
              Width = 237
              Height = 25
              Align = alRight
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
            object ComboBox10: TComboBox
              Left = 73
              Top = 34
              Width = 237
              Height = 25
              ItemIndex = 0
              TabOrder = 2
              Text = '0x00'
              OnKeyPress = ComboBox10KeyPress
              Items.Strings = (
                '0x00')
            end
            object ComboBox11: TComboBox
              Left = 73
              Top = 66
              Width = 237
              Height = 25
              TabOrder = 3
              Text = '1'
              OnKeyPress = ComboBox11KeyPress
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Graphic '
        object Panel9: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 314
          Height = 643
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox10: TGroupBox
            Left = 0
            Top = 0
            Width = 314
            Height = 643
            Align = alClient
            TabOrder = 0
            object CheckBox10: TCheckBox
              Left = 5
              Top = 69
              Width = 161
              Height = 25
              Caption = #22270#24418#36319#38543#21521#24038#28378#21160' '
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object Button15: TButton
              Left = 4
              Top = 98
              Width = 308
              Height = 34
              Caption = #20840#23631#26174#31034#25152#26377#25968#25454
              TabOrder = 1
              OnClick = Button15Click
            end
            object Button18: TButton
              Left = 4
              Top = 170
              Width = 308
              Height = 34
              Caption = #25918#22823#22270#24418' ZOOM OUT'
              TabOrder = 2
              OnClick = Button18Click
            end
            object Button19: TButton
              Left = 4
              Top = 206
              Width = 308
              Height = 34
              Caption = #32553#23567#22270#24418' ZOOM IN'
              TabOrder = 3
              OnClick = Button19Click
            end
            object ButtonColor1: TButtonColor
              Left = 4
              Top = 242
              Width = 308
              Height = 34
              Caption = #35774#32622#22270#24418' 1 '#30340#39068#33394
              TabOrder = 4
              OnClick = ButtonColor1Click
            end
            object ButtonColor2: TButtonColor
              Left = 4
              Top = 278
              Width = 308
              Height = 34
              Caption = #35774#32622#22270#24418' 2 '#30340#39068#33394
              TabOrder = 5
              OnClick = ButtonColor2Click
            end
            object CheckBox11: TCheckBox
              Left = 169
              Top = 73
              Width = 137
              Height = 17
              Caption = #22270#24418#21472#21152#22312#19968#36215
              TabOrder = 6
              OnClick = CheckBox11Click
            end
            object Button20: TButton
              Left = 4
              Top = 314
              Width = 308
              Height = 34
              Caption = #23558#25968#25454#23548#20986#21040'EXCEL'
              TabOrder = 7
              OnClick = Button20Click
            end
            object Button21: TButton
              Left = 4
              Top = 134
              Width = 308
              Height = 34
              Caption = #28165#38500#22270#34920#25968#25454
              TabOrder = 8
              OnClick = Button21Click
            end
            object Button22: TButton
              Left = 4
              Top = 351
              Width = 308
              Height = 34
              Caption = #23558#22270#24418#20445#23384#20026#22270#29255
              TabOrder = 9
              OnClick = Button22Click
            end
            object Panel15: TPanel
              Left = 4
              Top = 4
              Width = 308
              Height = 60
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 10
              object Label16: TLabel
                Left = 2
                Top = 8
                Width = 18
                Height = 16
                Caption = 'X:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'TeamViewer13'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 2
                Top = 32
                Width = 27
                Height = 16
                Caption = 'Y: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'TeamViewer13'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
      end
    end
    object TabSet3: TTabSet
      Left = 0
      Top = 649
      Width = 320
      Height = 26
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Style = tsModernTabs
      Tabs.Strings = (
        'Octopus '#33258#23450#20041#21457#36865
        #35774#32622)
      TabIndex = 0
      OnChange = TabSet3Change
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 675
    Width = 1265
    Height = 24
    Panels = <
      item
        Bevel = pbNone
        Text = #25805#20316#35828#26126#65306'  ESC '#12289'F1'#12289'F2'#12289'F3'
        Width = 210
      end
      item
        Bevel = pbNone
        Text = 'http://www.1234998.top'
        Width = 230
      end
      item
        Bevel = pbNone
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 320
    Top = 0
    Width = 622
    Height = 675
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 3
    object Notebook2: TNotebook
      Left = 0
      Top = 0
      Width = 622
      Height = 649
      Align = alClient
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = #26412#22320#25991#20214#30446#24405
        object Memo1: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 616
          Height = 643
          Align = alClient
          BorderStyle = bsNone
          Color = clMenuText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -19
          Font.Name = #26032#23435#20307
          Font.Style = []
          HideSelection = False
          Lines.Strings = (
            'Memo1'
            'FCheck := TBitmap.Create;'
            '  FNoCheck := TBitmap.Create;'
            '  bmp := TBitmap.Create;'
            '  try'
            '    bmp.Handle := LoadBitmap(0, Pchar(OBM_CHECKBOXES));'
            '    with FNoCheck do'
            '    begin'
            '      width := bmp.width div 4;'
            '      height := bmp.height div 3;'
            
              '      Canvas.CopyRect(Canvas.cliprect, bmp.Canvas, Canvas.clipre' +
              'ct);'
            '    end;'
            '    with FCheck do'
            '    begin'
            '      width := bmp.width div 4;'
            '      height := bmp.height div 3;'
            '      Canvas.CopyRect(Canvas.cliprect, bmp.Canvas,'
            '        Rect(width, 0, 2 * width, height));'
            '    end;'
            '  finally'
            '    DeleteObject(bmp.Handle);'
            '    bmp.Free;'
            '  end;'
            '  for i := 0 to 2 do'
            '  begin'
            '    StringGrid1.Cells[0, 0] := '#39#21457#36865#39';'
            '    StringGrid1.Cells[1, 0] := '#39#36873#39';'
            '    StringGrid1.Cells[2, 0] := '#39#20869#23481#39';'
            '  end;'
            '  for i := 1 to StringGrid1.RowCount - 1 do'
            '  begin'
            '    if i < 10 then'
            '      StringGrid1.Cells[0, i] := '#39'0'#39' + inttostr(i)'
            '    else'
            '      StringGrid1.Cells[0, i] := inttostr(i);'
            '  end;')
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ScrollBars = ssBoth
          ShowHint = False
          TabOrder = 0
          WantTabs = True
          OnKeyDown = Memo1KeyDown
          OnKeyPress = Memo1KeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = #27874#24418
        object Chart1: TChart
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 616
          Height = 643
          AllowPanning = pmVertical
          Legend.Visible = False
          ScrollMouseButton = mbMiddle
          Title.Alignment = taLeftJustify
          Title.Font.Color = clBlack
          Title.Font.Name = 'Segoe UI'
          Title.Text.Strings = (
            'TChart Name')
          Title.Visible = False
          BottomAxis.Visible = False
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.Minimum = 55.000000000000000000
          Panning.MouseWheel = pmwNone
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.Visible = False
          TopAxis.Automatic = False
          TopAxis.AutomaticMaximum = False
          TopAxis.AutomaticMinimum = False
          TopAxis.Maximum = 0.000000000330143303
          TopAxis.Minimum = -0.000000000330143303
          TopAxis.Visible = False
          View3D = False
          Zoom.Animated = True
          Zoom.AnimatedSteps = 2
          Zoom.Direction = tzdHorizontal
          Zoom.MinimumPixels = 2
          Zoom.MouseButton = mbRight
          Zoom.MouseWheel = pmwNormal
          Zoom.Pen.Style = psDot
          Align = alClient
          BevelOuter = bvNone
          Color = -1
          TabOrder = 0
          OnMouseMove = Chart1MouseMove
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            8
            15
            8)
          ColorPaletteIndex = 19
          object Series1: TFastLineSeries
            HoverElement = []
            LinePen.Color = 15054131
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = #24110#21161
        object W1234998: TWebBrowser
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 616
          Height = 643
          Align = alClient
          TabOrder = 0
          OnNewWindow2 = W1234998NewWindow2
          ExplicitWidth = 1086
          ExplicitHeight = 578
          ControlData = {
            4C000000AA3F0000754200000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object TabSet2: TTabSet
      Left = 0
      Top = 649
      Width = 622
      Height = 26
      ParentCustomHint = False
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = False
      SelectedColor = clYellow
      Style = tsModernTabs
      Tabs.Strings = (
        #26412#22320#25991#20214#30446#24405)
      TabIndex = 0
      OnChange = TabSet2Change
      OnMouseDown = TabSet2MouseDown
    end
  end
  object DeviceIconList: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 604
    Top = 36
    Bitmap = {
      494C010106008000040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
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
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
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
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
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
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
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
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
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
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000050506060086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF000000000000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF218FF9FF774A65FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF4965
      94FF664361FF5E3953FF4C70A9FF0086FFFF0086FFFF0086FFFFC487A8FF118C
      FCFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF9E70
      8DFF49547CFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF4389D5FF4F71ACFF0086FFFF0086FFFF0086FFFF0086FFFF4A5F
      8FFF7B4B6AFF9D668DFF713A61FF865176FF0589FEFF0086FFFF8B5679FF8756
      74FF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF0086FFFFAF7AA1FFB379
      9FFF4284C9FF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF8E5B7DFFA56D8DFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF1D8FF9FF724762FF834876FF875478FF0086FFFF5473B7FFBE84
      A7FF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF3C8DE3FFC68DBAFF585E
      9AFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF4E70ABFFBB7CA9FFB082A2FF0086FFFF0086FFFF48333EFF543247FF2990
      F4FF0086FFFF0086FFFF0086FFFF76506DFF8A4F79FF3F3C58FF3F8EE8FFCC93
      B9FF0A8AFEFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF65425AFFBC82AFFF4F77
      BAFF0086FFFF0086FFFF0187FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFFBF8EB0FFB47CACFF8A5A78FF0086FFFF0086FFFF0086FFFF8C5779FF7A49
      70FF423E5EFF0086FFFF0086FFFF3B8DE2FF824973FF6F4561FF8A5772FFC188
      B2FF2C90F0FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF745069FFB97DACFF4D7C
      C3FF0086FFFF4586D0FF6C3F5CFF0086FFFF0086FFFF0086FFFF0086FFFF2A90
      F2FFB87DABFFC18EB6FF516FABFF0086FFFF0086FFFF0086FFFF6A435FFF6D39
      62FF7A4D6DFF0187FFFF0086FFFF0086FFFF744768FF6B3861FF753D60FFB075
      A4FF3A8EE3FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF6C5063FFC289B7FF9060
      80FF0086FFFF703F61FF855178FF0086FFFF0086FFFF0086FFFF0086FFFF925D
      7CFFAF79A6FFC084ACFF2790F3FF0086FFFF0086FFFF0086FFFF4E69A1FFAE7A
      A5FF814D78FF5E3D52FF0086FFFF0086FFFF5C2F4CFF744065FF925584FFBA83
      ABFF1C8FF9FF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF2690F5FFC88DBAFFB278
      A1FF0086FFFF814D6DFF865078FF0086FFFF0086FFFF0086FFFF0086FFFFBE86
      ACFFB387ABFFB77AA5FF1F8FF9FF0086FFFF0086FFFF0086FFFF4A84CCFF7443
      69FF77426DFF6E4761FF0086FFFF0086FFFF613550FF8A4F75FFB782ADFFDFA5
      CAFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFFB886A8FFBC83
      ACFF6F435DFF6A4F6AFF844E76FF5D3956FF0086FFFF0086FFFF0086FFFFC98E
      B7FFB783AEFFC185B1FF7D5973FF0086FFFF0086FFFF0086FFFF4F6298FF7A50
      72FF6F3F67FF67425DFF0086FFFF0086FFFF612F4DFFA2668EFFBE8DB6FFBE8D
      AAFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF468AD9FFC295
      B5FFB1769FFF825371FF865278FF94608AFF198EFAFF0086FFFF0086FFFFCF96
      BFFFBC89B2FFB680A7FFB885A8FF3C8EE4FF0086FFFF0086FFFF5A3651FF5529
      4BFF66325BFF45223AFF0086FFFF0388FFFFAC7095FFB983ADFFC38FB7FF4952
      7CFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF654C
      5DFFC18FB2FFA06791FF713C64FF6F375EFF66385BFF0086FFFF0086FFFFA076
      95FFBF90B8FFC093B7FFC286AFFFBC84B1FF7D536FFF5478BCFF5D314DFF592A
      4EFF5C294EFF643457FFA06A92FFB0739EFFAD729BFFB887ADFFD7A9C6FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF6B4A62FFC08FB4FFB481A9FF99658AFF79426DFF743D61FF475581FFA276
      97FFC18DB3FFBC8BB1FFB67DA6FFB988AEFFD6A1C6FFA9709CFF7B426CFFA065
      91FFA26891FFAA6F98FF9B608BFFC691B9FFC08DB5FFC892B9FF4D679EFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF4C6398FFDEB2D4FFCD96BCFF9E6391FF9E6896FF5A254AFF7137
      5DFF985E86FFC18BB3FFC28EB6FFB484AAFFB27CA4FFC993BFFFBC85B0FFC089
      B0FFC38AB3FFC085AEFFD096BFFFA6709AFFC18BB3FFC190AFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF7B5A6FFFBD8EB2FFCC97C0FF703C64FF884F
      79FF8D5078FF9F648CFFC892BAFFC088B6FFBF8DB6FFB985ADFFB37DA7FFC691
      BAFFCA95BDFFE0ADD6FF9B648EFF82476EFFA66E94FF0187FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF906B85FFC18EB6FFB384
      A6FFE4B6DAFF9D6991FFBA7DACFFB87DABFFB883ACFFB57CA5FFBF8AB6FFB781
      ACFFA6709EFFB983AEFFA56B98FFBC85AFFF874A6DFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF6D395BFFCD8B
      B9FFBF89B6FFC48EB6FFC087AEFFB883AAFFBB85B0FFB47CA9FFB883ACFF8061
      7BFF7B5572FFB986ACFFBC84AEFFBD89AEFFC78CAFFF168DFAFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF3E8CDDFF8554
      74FFA46C95FF95718DFFFDF8FFFFCBA2BBFFC690BBFFBD88B4FFB782AAFFFFF6
      FFFFFBF3FBFF6E4D69FFB783ABFF995E89FF9D6689FF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF458A
      D9FFB985ADFFB392ADFFFFF1FFFF9B6F93FFBC86B1FFC289B6FFB47DAAFFBB8B
      AFFF99678CFF9A678FFFA8739EFFAF77A4FFAA6F98FF4D72AEFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF6F4B
      5BFFB781A9FFA0658EFFA16892FFC08CB4FFA76F9CFFA16996FFB983AEFFC18E
      B8FFC995BDFFCD99C1FFC998BEFFC99ABEFFB280A7FF9C658BFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF5833
      46FFB588AFFFC79AC1FFC392BAFFC28BB6FFB882ADFF99618EFF9F6794FFBD88
      B3FFC38FB7FFC28EB7FFC18EB6FFD4A4CAFFB681ABFFC084ACFF4586CEFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF673D
      55FFBD8CB4FFC092B9FFC18EB8FFC386B4FFB882ADFFBD87B2FFBA84AFFFB881
      ACFFBB85B0FFBB84AFFFB884ADFFD6A5CBFFDCABD5FFA36995FF633E58FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF7043
      5DFFD19BC3FFBB87AFFFB581ADFFB47DADFFB781ACFFB882ADFFBB84AFFFBF86
      B1FFBB82ADFFBB80ACFFBC84AFFFB983ABFFAB749EFFB883ADFF956385FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF6C41
      5AFFBE87AFFFB684AEFFBD84AFFFB983B1FFB984AFFFB782ADFFB782ADFFBA83
      AEFFC38BB6FFC48EB9FFBF8CB5FFC18FB7FFC28EB6FFC599C1FFBB81A0FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00241CED00241CED00241CED000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF4D7B
      C0FFD09AC1FFB17AA7FFB982ACFFB883AFFFB984AFFFBB86B1FFBB86B1FFC28C
      B7FFC08AB5FFBF8BB6FFC08EB7FFBB89B1FFBD8BB4FFD09CC7FFBA85A3FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFFD1A0C3FFC28BB5FFB37DA8FFB782ADFFB782ADFFBB86B1FFCC97C2FFC08C
      B7FFBC8AB3FFBA89B2FFBF90B7FFBF90B7FFC897C0FFC68FBAFF8F6682FF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF946988FFB880AAFFC08BB6FFC38AB7FFCA95C0FFC38EB9FFC28DB8FFBA88
      B2FFC99AC0FFC899BFFFC89ABFFFC395B9FFC595BCFFBD8AB2FF3F8BDEFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFFB98BABFFC68EB8FFC092B9FFBE8DB3FFBB8CB2FFC394BAFFC897
      BDFFCA9AC1FFC397BCFFC99EC0FFD9ABCBFFB98CADFF6A485CFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFFB088A7FFCC97BFFFC297BBFFC49BBEFFBE98BBFFC29B
      BEFFC29CBDFFD0A3C7FFCB99BEFFC696B9FF50659BFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      0000000000000000000000000000000000000086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF3C8DE1FF946A85FFD6ADC6FFF1C9E2FFEBC3
      DCFFD8AFCBFF906A84FF496498FF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0000000000000000000000000000
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
      000000000000000000000000000000000000568ABABA0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086FFFF0086
      FFFF0086FFFF0086FFFF0086FFFF050506060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFF000000010000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F800001F000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F800001F000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      F800001F000000000000000000000000F800001F000000000000000000000000
      F800001F000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 348
    Top = 147
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 350
    Top = 35
  end
  object OpenDialog1: TOpenDialog
    Left = 424
    Top = 33
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = Timer3Timer
    Left = 352
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 136
    object CloseTheDevice1: TMenuItem
      Caption = #20851#38381#36825#20010#35774#22791
      OnClick = CloseTheDevice1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #22797#21046'&(C)'
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #31896#36148'&(P)'
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #20840#37096#36873#20013'&(S)'
      OnClick = N7Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #28165#38500#25968#25454
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #21478#23384#25968#25454'...'
      OnClick = N3Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 
      '.txt '#25991#26412#25991#20214' |.txt|.log '#26085#24535#25991#20214'|.log|.xls 2003 Excell '#25991#20214'|.xls|.xlsx '#26032#29256 +
      'Excell '#25991#20214'|.xlsx|.dat|.dat|.bin|.bin|.hex|.hex|.oct Octopus '#21152#23494#25991#20214'|' +
      '.oct|*.* '#25152#26377#25991#20214'|*.*'
    FilterIndex = 0
    Left = 499
    Top = 35
  end
  object TrayIcon1: TTrayIcon
    Left = 496
    Top = 296
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 376
    Top = 247
  end
  object ColorDialog1: TColorDialog
    Left = 443
    Top = 243
  end
  object FindDialog1: TFindDialog
    OnClose = FindDialog1Close
    OnShow = FindDialog1Show
    OnFind = FindDialog1Find
    Left = 576
    Top = 208
  end
end
