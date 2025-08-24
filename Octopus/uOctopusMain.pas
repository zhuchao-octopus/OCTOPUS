unit uOctopusMain;

interface

uses
  System.SysUtils, System.StrUtils, Winapi.Windows, Winapi.Messages, Winapi.WinInet, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.ClipBrd,
  Vcl.ToolWin, Vcl.ActnList, System.Actions, System.ImageList, Vcl.ImgList, Vcl.StdActns, Vcl.ExtActns,
  Vcl.Tabs, VCLTee.TeCanvas, Vcl.Grids, Vcl.WinXCtrls, Vcl.TabNotBk, Vcl.Themes,

  System.SyncObjs,
  IniFiles,
  OcComPortObj,
  Vcl.MyPageEdit,
  uOctopusFunction, Vcl.OleCtrls, SHDocVw;

type
  TMainOctopusDebuggingDevelopmentForm = class(TForm)
    MainMenu: TMainMenu;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FilePrintItem: TMenuItem;
    FileExitItem: TMenuItem;
    EditUndoItem: TMenuItem;
    EditCutItem: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    RichEditMenu: TMenuItem;
    RichEditTransparentItem: TMenuItem;
    RichEditWordWrapItem: TMenuItem;
    RichEditBoldItem: TMenuItem;
    RichEditItalicItem: TMenuItem;
    RichEditUnderlineItem: TMenuItem;
    RichEditStrikeoutItem: TMenuItem;
    RichEditAlignLeftItem: TMenuItem;
    RichEditAlignCenterItem: TMenuItem;
    RichEditAlignRightItem: TMenuItem;
    RichEditBulletsItem: TMenuItem;
    RichEditSuperscriptItem: TMenuItem;
    RichEditSubscriptItem: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    HelpAboutItem: TMenuItem;
    EditFontItem: TMenuItem;

    FontDialog: TFontDialog;
    StandardToolBar1: TToolBar;
    StandardToolBar2: TToolBar;

    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton7: TToolButton;
    ComBoBoxFontName: TComboBox;
    FontSize: TEdit;
    ToolButton8: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton1: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    BulletsButton: TToolButton;

    FileNewButton: TToolButton;
    StrikeoutButton: TToolButton;
    ToolButton2: TToolButton;
    FGColorBox: TColorBox;
    BGColorBox: TColorBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SupersciptButton: TToolButton;
    SubscriptButton: TToolButton;
    ToolButton6: TToolButton;

    EditCutCmd: TEditCut;
    EditCopyCmd: TEditCopy;
    EditPasteCmd: TEditPaste;
    EditUndoCmd: TEditUndo;
    EditFontCmd: TFontEdit;
    FileSaveAsCmd: TFileSaveAs;
    FormatRichEditBoldCmd: TRichEditBold;
    FormatRichEditItalicCmd: TRichEditItalic;
    FormatRichEditUnderlineCmd: TRichEditUnderline;
    FormatRichEditStrikeOutCmd: TRichEditStrikeOut;
    FormatRichEditBulletsCmd: TRichEditBullets;
    FormatRichEditAlignLeftCmd: TRichEditAlignLeft;
    FormatRichEditAlignRightCmd: TRichEditAlignRight;
    FormatRichEditAlignCenterCmd: TRichEditAlignCenter;
    SuperscriptCmd: TAction;
    SubscriptCmd: TAction;
    ToolbarImages: TImageList;
    ActionList: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TFileOpen;
    FileSaveCmd: TAction;
    FilePrintCmd: TPrintDlg;
    FileExitCmd: TFileExit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    SettingItem1: TMenuItem;
    ToolsMenu: TMenuItem;
    Panel1: TPanel;
    SV_R: TSplitView;
    Panel2: TPanel;
    Panel25: TPanel;
    Panel7: TPanel;
    Memo2: TMemo;
    Panel8: TPanel;
    Button102: TButton;
    Button103: TButton;
    Button105: TButton;
    Panel13: TPanel;
    Memo1: TMemo;
    Button100: TButton;
    Button101: TButton;
    Panel200: TPanel;
    StringGrid1: TStringGrid;
    Panel201: TPanel;
    Button201: TButton;
    Button200: TButton;
    Panel5: TPanel;
    Memo3: TMemo;
    Panel16: TPanel;
    Button301: TButton;
    Button300: TButton;
    Button302: TButton;
    Panel18: TPanel;
    Label003: TLabel;
    Label002: TLabel;
    Label001: TLabel;
    Label000: TLabel;
    ComboBox304: TComboBox;
    ComboBox301: TComboBox;
    ComboBox302: TComboBox;
    ComboBox303: TComboBox;
    Splitter1: TSplitter;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    SkinsMenu: TMenuItem;
    ViewMenu: TMenuItem;
    PageControl1: TMyPageEdit;
    PageControl2: TPageControl;
    StatusPanel: TPanel;

    TabSheet_SendingData: TTabSheet;
    TabSheet_BatchData: TTabSheet;
    TabSheet_ProtocolData: TTabSheet;
    FormatToolBarMenuItem1: TMenuItem;
    FormatToolBarMenuItem2: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    Button104: TButton;
    ToggleSwitchDeviceOnOff: TToggleSwitch;
    ToolButton14: TToolButton;
    COMMenu: TMenuItem;
    StatusBar1: TStatusBar;
    N8: TMenuItem;
    TopLevelMenuItem: TMenuItem;
    N9: TMenuItem;
    SettingItem2: TMenuItem;
    ToolButton12: TToolButton;
    ToolButton15: TToolButton;
    RightOperationPanel1: TMenuItem;
    LptatpMenuItem: TMenuItem;
    RptatpMenuItem: TMenuItem;
    N10: TMenuItem;
    RptabpMenuItem: TMenuItem;
    RptarpMenuItem: TMenuItem;
    LptabpMenuItem: TMenuItem;
    LptalpMenuItem: TMenuItem;
    ToolButton16: TToolButton;
    EnglishMenuItem: TMenuItem;
    N11: TMenuItem;
    ChineseMenuItem: TMenuItem;
    FindDialog1: TFindDialog;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    ScreenshotTool1: TMenuItem;
    ScreenshotTool2: TMenuItem;
    DataEncryption1: TMenuItem;
    CRC1: TMenuItem;
    MachineLearningOfNeuralNetworks1: TMenuItem;
    N12: TMenuItem;
    ProblemFeedback1: TMenuItem;
    WelcomeAndHelp1: TMenuItem;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    Encoding1: TMenuItem;
    ASCIIItem: TMenuItem;
    ANSIItem: TMenuItem;
    BigEndianUnicodeEncodingItem: TMenuItem;
    UnicodeEncodingItem: TMenuItem;
    UTF7EncodingItem: TMenuItem;
    UTF8EncodingItem: TMenuItem;
    N13: TMenuItem;
    ConverttoAnsi1: TMenuItem;
    ConverttoUTF81: TMenuItem;
    N14: TMenuItem;
    CharacteSets1: TMenuItem;
    DefaultItem: TMenuItem;
    ConverttoUTF82: TMenuItem;
    Search1: TMenuItem;
    N15: TMenuItem;
    PopupMenu1: TPopupMenu;
    CloseTheDevice1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N16: TMenuItem;
    QuickTextEditingModeItem: TMenuItem;
    N17: TMenuItem;
    HexModeItem: TMenuItem;
    QuickTerminalCommandsItem: TMenuItem;
    DownloadUpdate1: TMenuItem;
    N18: TMenuItem;
    PageSetting1: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    CancelItem: TMenuItem;
    N21: TMenuItem;
    ToolButton19: TToolButton;
    Timer2: TTimer;
    MergeBinFile1: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SelectionChange(Sender: TObject);

    procedure FileNew(Sender: TObject);
    procedure FileOpenAccept(Sender: TObject);
    procedure FileOpenBeforeExecute(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrintAccept(Sender: TObject);

    procedure SelectFont(Sender: TObject);
    procedure SelectFontBeforeExecute(Sender: TObject);

    procedure RichEditChange(Sender: TObject);
    procedure RichEditTransparentItemClick(Sender: TObject);
    procedure RichEditorLinkClick(Sender: TCustomRichEdit; const URL: string; Button: TMouseButton);
    procedure RichEditorClick(Sender: TObject);

    procedure FontSizeChange(Sender: TObject);
    procedure ComBoBoxFontNameChange(Sender: TObject);
    procedure FGColorBoxChange(Sender: TObject);
    procedure BGColorBoxChange(Sender: TObject);

    procedure SuperscriptCmdExecute(Sender: TObject);
    procedure SuperscriptCmdUpdate(Sender: TObject);
    procedure SubscriptCmdExecute(Sender: TObject);
    procedure SubscriptCmdUpdate(Sender: TObject);
    procedure RichEditWordWrapItemClick(Sender: TObject);
    procedure SettingItem1Click(Sender: TObject);

    procedure HelpAbout(Sender: TObject);
    procedure SkinsMenuClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid1FixedCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure StringGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormatToolBarMenuItem2Click(Sender: TObject);
    procedure FormatToolBarMenuItem1Click(Sender: TObject);

    procedure ToolButton13Click(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure ToggleSwitchDeviceOnOffClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TopLevelMenuItemClick(Sender: TObject);
    procedure SettingItem2Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure RightOperationPanel1Click(Sender: TObject);
    procedure RptatpMenuItemClick(Sender: TObject);
    procedure RptabpMenuItemClick(Sender: TObject);
    procedure RptarpMenuItemClick(Sender: TObject);
    procedure LptatpMenuItemClick(Sender: TObject);
    procedure LptabpMenuItemClick(Sender: TObject);
    procedure LptalpMenuItemClick(Sender: TObject);
    procedure ViewMenuClick(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure HelpMenuClick(Sender: TObject);
    procedure EnglishMenuItemClick(Sender: TObject);
    procedure ChineseMenuItemClick(Sender: TObject);
    procedure FindDialog1Close(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FindDialog1Show(Sender: TObject);
    procedure Button201Click(Sender: TObject);
    procedure Button200Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button102Click(Sender: TObject);
    procedure Button100Click(Sender: TObject);
    procedure Button101Click(Sender: TObject);
    procedure Button103Click(Sender: TObject);
    procedure Button104Click(Sender: TObject);
    procedure Button105Click(Sender: TObject);
    procedure Button300Click(Sender: TObject);
    procedure Button301Click(Sender: TObject);
    procedure Button302Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ProblemFeedback1Click(Sender: TObject);
    procedure ScreenshotTool2Click(Sender: TObject);
    procedure ScreenshotTool1Click(Sender: TObject);
    procedure DataEncryption1Click(Sender: TObject);
    procedure CRC1Click(Sender: TObject);
    procedure WelcomeAndHelp1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Encoding1Click(Sender: TObject);
    procedure ConverttoUTF81Click(Sender: TObject);
    procedure ConverttoAnsi1Click(Sender: TObject);
    procedure CharacteSets1Click(Sender: TObject);
    procedure DefaultItemClick(Sender: TObject);
    procedure ASCIIItemClick(Sender: TObject);
    procedure ANSIItemClick(Sender: TObject);
    procedure UTF7EncodingItemClick(Sender: TObject);
    procedure UTF8EncodingItemClick(Sender: TObject);
    procedure BigEndianUnicodeEncodingItemClick(Sender: TObject);
    procedure UnicodeEncodingItemClick(Sender: TObject);
    procedure ConverttoUTF82Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure CloseTheDevice1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure QuickTextEditingModeItemClick(Sender: TObject);
    procedure HexModeItemClick(Sender: TObject);
    procedure FileSaveAsCmdBeforeExecute(Sender: TObject);
    procedure RichEditMenuClick(Sender: TObject);
    procedure QuickTerminalCommandsItemClick(Sender: TObject);
    procedure DownloadUpdate1Click(Sender: TObject);
    procedure SV_ROpened(Sender: TObject);
    procedure SV_RClosed(Sender: TObject);
    procedure FontDialogShow(Sender: TObject);
    procedure PageSetting1Click(Sender: TObject);
    procedure CancelItemClick(Sender: TObject);
    procedure StatusBar1MouseEnter(Sender: TObject);
    procedure COMMenuClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: LongInt; const Value: string);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure MergeBinFile1Click(Sender: TObject);

  private
    OcComPortObj_Loop: TOcComPortObj;
    LoopingString: String;
    FVersionNumberStr: String;
    CMyRichEdit: TMyRichEdit;
    WebBrowser: TWebBrowser;
    SkinMenuItem: TMenuItem;
    FThemeSkinName: String;

    FCheck, FNoCheck: TBitmap;
    Fprogress, FprogressMax: Integer;

    /// FFilePathName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;

    procedure StopLoopSending();
    procedure ShowHint(Sender: TObject);

    function CurrTextAttributes(): TTextAttributes;
    procedure SynchroSetMyRichEditFont(MyRichEdit: TComponent);
    procedure SetMyRichEditFont(MyRichEdit: TMyRichEdit);
    procedure SynchroFontDialog(MyRichEdit: TMyRichEdit; Style: Integer);

    procedure GetFontNames();
    procedure SetPathFileName(const PathFileName: String);
    procedure CheckFileSave();
    procedure SaveLog(Component: TComponent; PathFileName: String);
    procedure UpdateCursorPos();

    procedure PerformFileOpen(const AFileName: string); overload;
    procedure PerformFileOpen(const AFileName: string; PageName: String); overload;
    procedure LoadNewFileFromTo(PathFileName: String);
    procedure LoadUntitledContent(MyRichEdit: TMyRichEdit);

    procedure SetModified(Value: Boolean);
    procedure UpdateStatus(Value: String); overload;
    procedure UpdateStatus(Value: String; Index: Integer); overload;

    function GetStringGridValidStr(sStr: String): String;
    function GetCurrentPageName(): String;
    function GetCurrentSelectedDevice(): TOcComPortObj;

    function SearchTextFrom(Component: TComponent; const SearchString: string; Options: TFindOptions): Boolean;
    procedure ShowSearchDialog();

    procedure CreateMyObjectPage(PageName: String; PageType: Integer);
    procedure InitAllUartDevices();
    procedure GetAndOpenADevices(OcComPortObj: TOcComPortObj; AutoOpen: Boolean = true); overload;
    procedure GetAndOpenADevices(DeviceName: String; AutoOpen: Boolean = true); overload;
    procedure GetAndRemoveDevices(DeviceName: String);

    procedure SkinsMenuOnClick(Sender: TObject);
    procedure InitSkinsMenu(ParentMenu: TMenuItem; OnClicEvent: TOnClicEvent);

    procedure InitStringGrid();
    procedure StringGridSelectCell(ACol, ARow: Integer);
    procedure StringGridSave();
    procedure StringGridLoad();

    procedure InitUartsParameters();
    procedure InitUartsMenu(ParentMenu: TMenuItem; OnClicEvent: TOnClicEvent);
    procedure COM1MenuItemOnClick(Sender: TObject);

    procedure InitMainUI();
    procedure AdjustUI();
    procedure InitUserConfiguration();

    procedure UpdateUartToolBar();
    procedure UpdateMainMenu();
    procedure UpdateCommandObject();

    procedure StatusBar1DrawProgress(progress: Integer; progressMax: Integer);

    procedure StatusBarPrintFileSize();
    procedure ShowStartComments(OcComPortObj: TOcComPortObj);

    procedure SaveUserData(SavePrivate: Boolean);
    procedure SaveProjectSetting(SavePrivate: Boolean);
    procedure LoadProjectSetting();

    procedure ShowHideRLPanel(RL: Integer = 1); overload;
    procedure ShowHideRLPanel(OpenClose: Boolean; RL: Integer = 1); overload;
    procedure SendFileAsBin(OcComPortObj: TOcComPortObj; FileName: String);
    procedure SendFileAsHex(OcComPortObj: TOcComPortObj; FileName: String);

    procedure AcceptCommandLine();
    procedure MyAppMsg(var Msg: TMsg; var Handled: Boolean);
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    Procedure SystemMessage_WMMenuSelect(var Msg: TWMMenuSelect); message WM_SysCommand;
    procedure OcComPortObjCallBack(Count: Integer);
    Procedure SettingChangedCallBackFuntion(Obj: TObject; Action: Integer);
    procedure EventCallBackFuntion(Obj: TObject);
  end;

const
  CHECKCOL: Integer = 3;
  DATACOL: Integer = 2;

var
  MainOctopusDebuggingDevelopmentForm: TMainOctopusDebuggingDevelopmentForm;

  UserDataChanged: Boolean;
  UserDataLength: Integer;
  FCriticalSection: TCriticalSection;

implementation

uses System.UITypes, System.IOUtils, System.Math, System.Win.ComObj, Winapi.RichEdit, Winapi.ShellAPI, Winapi.ShlObj, Winapi.ActiveX,
  uSetting, OcProtocol, CPort, uMainSetting, uSMTP, uEncryptionDecryption, uCRC,
  Screenshot, uScreenMain, uCommand, uDownloader, uDownloadsManager, uPageSetup, uOctopusAbout,
  uMergeBin;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'The file already exists, if you need to overwrite it %s';
  sUntitled = 'Untitled.rtf';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d  Col: %3d';
  sScrollPos = 'Scroll Pos: %d, %d';
  sOpenLink = 'Open link: %s ?';
  sSaved = 'The File Saved';

const
  RulerAdj = 4 / 3;
  GutterWid = 6;

{$R *.dfm}
  { Event Handlers }

Function CheckUrl(URL: string): Boolean;
var
  hSession, hfile, hRequest: hInternet;
  dwindex, dwcodelen: dword;
  dwcode: array [1 .. 20] of Char;
  res: PChar;
begin
  Result := false;
  if Pos('http://', LowerCase(URL)) = 0 then
    URL := 'http://' + URL;

  hSession := InternetOpen('InetURL:/1.0', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then
  begin
    hfile := InternetOpenUrl(hSession, PChar(URL), nil, 0, INTERNET_FLAG_RELOAD, 0);
    dwindex := 0;
    dwcodelen := 10;
    HttpQueryInfo(hfile, HTTP_QUERY_STATUS_CODE, @dwcode, dwcodelen, dwindex);
    res := PChar(@dwcode);
    Result := (res = '200') or (res = '302'); // 200,302δ�ض�λ��־
    if Assigned(hfile) then
      InternetCloseHandle(hfile);
    InternetCloseHandle(hSession);
  end;
end;

procedure DelayDelay(msec: Integer);
var
  FirstTickCount: real;
begin
  FirstTickCount := GetTickCount();
  FirstTickCount := FirstTickCount + msec;
  While FirstTickCount > GetTickCount() do
    Application.ProcessMessages;
end;

procedure Delay(MSecs: LongInt);
var
  FirstTickCount, Now: LongInt;
begin
  FirstTickCount := GetTickCount();
  repeat
    Application.ProcessMessages;
    Now := GetTickCount();
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

procedure TMainOctopusDebuggingDevelopmentForm.ShowHideRLPanel(OpenClose: Boolean; RL: Integer = 1);
begin
  if RL = 1 then
  begin
    if OpenClose = false then
    begin
      SV_R.Close;
    end
    else
    begin
      if SV_R.Width < 30 then
        SV_R.Width := 400;
      Splitter1.Align := alLeft;
      SV_R.Align := alRight;
      SV_R.Placement := svpRight;
      SV_R.Open;
      /// AdjustUI();
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ShowHideRLPanel(RL: Integer);
begin
  if RL = 1 then
  begin
    if SV_R.Opened then
      SV_R.Close
    else
    begin
      if SV_R.Width < 30 then
      begin
        SV_R.Width := 400;
      end;
      SV_R.Open;
      /// AdjustUI();
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SystemMessage_WMMenuSelect(var Msg: TWMMenuSelect);
begin
  inherited;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MyAppMsg(var Msg: TMsg; var Handled: Boolean);
var
  OcComPortObj: TOcComPortObj;
  keyState: TKeyBoardState;
  i: Integer;
begin
  case Msg.message of
    WM_LBUTTONDOWN:
      begin
        // TStringGridEx(StringGrid1).MouseToCell(LoWord(Msg.LParam), HiWord(Msg.LParam), StringGrid1_Col, StringGrid1_Row);
      end;
    WM_KEYDOWN:
      begin
        if Msg.wParam = VK_TAB then
        begin
        end;

        if Msg.wParam = VK_CONTROL then
        begin
          OcComPortObj := Self.GetCurrentSelectedDevice();
          if (OcComPortObj <> nil) then
          begin
            if OcComPortObj.Connected then
            begin
              OcComPortObj.MouseTextSelection := true;
            end;
          end;
        end;

        if (Msg.wParam = VK_F1) then
        begin
          ShowHideRLPanel(1);
          Handled := true;
        end;

        if Msg.wParam = VK_F2 then
        begin
          ShowHideRLPanel(1);
          Handled := true;
        end;

        if (Msg.wParam = VK_ESCAPE) then
        begin
          OcComPortObj := Self.GetCurrentSelectedDevice();
          if (OcComPortObj <> nil) then
            OcComPortObj.SetLogComponentReadOnly(true);

          if CommandFrm.Showing then
            CommandFrm.Close
          else
            ShowHideRLPanel(1);
          Handled := true;
        end;

        GetKeyboardstate(keyState);
        if (Msg.wParam = VK_F3) or ((keyState[VK_LCONTROL] = 129) and (Msg.wParam = 70)) then
        begin
          ShowSearchDialog();
          Handled := true;
        end;
      end; // WM_KEYDOWN:begin
    WM_KEYUP:
      begin

        if (Msg.wParam = VK_F1) then
        begin
          Handled := true;
        end;

        if (Msg.wParam = VK_CONTROL) and (not IsLeftMouseButtonDown()) then
        begin
          OcComPortObj := Self.GetCurrentSelectedDevice();
          if (OcComPortObj <> nil) then
          begin
            OcComPortObj.MouseTextSelection := false;
            OcComPortObj.StartFlushOutCackedString();
          end;
        end;
      end;
  end; // case msg.message of

end;

procedure TMainOctopusDebuggingDevelopmentForm.FormCreate(Sender: TObject);
/// var
/// OcComPortObj: TOcComPortObj;
begin
  InitMainUI();
  InitSkinsMenu(SkinsMenu, SkinsMenuOnClick);
  InitStringGrid();
  InitUartsParameters();

  InitAllUartDevices();

  InitUartsMenu(COMMenu, COM1MenuItemOnClick);
  UpdateUartToolBar();
  LoadProjectSetting();

  InitUserConfiguration();
  Application.OnMessage := MyAppMsg;
  UserDataChanged := false;
  UserDataLength := 0;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FormResize(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);

  if CMyRichEdit <> nil then
  begin
    SelectionChange(Sender);
    CMyRichEdit.Invalidate;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FormShow(Sender: TObject);
begin
  AcceptCommandLine();
  if SV_R.Opened then
  begin
    AdjustUI();
  end
  else
  begin
    Self.Splitter1.Visible := false;
  end;
  DragAcceptFiles(Handle, true);

end;

procedure TMainOctopusDebuggingDevelopmentForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    /// CheckFileSave;
    Self.PageControl1.FreeAll;
    Self.SaveProjectSetting(true);
    SettingPagesDlg.LoadOrCreateLaunguageFromFile(Self, true);
  except
    CanClose := false;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.AcceptCommandLine();
var
  SelectedFile: string;
begin
  /// ShowMessage(getCommandLine());
  SelectedFile := ParamStr(1); // 获取命令行参数中的第二个参数，即选中的文件路径
  if FileExists(SelectedFile) then
  begin
    ShowHideRLPanel(false);
    LoadNewFileFromTo(SelectedFile);
    Self.StandardToolBar1.Visible := true;
    Self.StandardToolBar2.Visible := false;
  end;
end;

/// ///////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////
/// richedit
procedure TMainOctopusDebuggingDevelopmentForm.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    // StatusBar1.SimplePanel := True;
    // StatusBar1.SimpleText := Application.Hint;
    /// StatusBar1.Panels[1].Text := Application.Hint;
    UpdateStatus(Application.Hint);
  end;
  // else StatusBar1.SimplePanel := False;
end;

procedure TMainOctopusDebuggingDevelopmentForm.LoadUntitledContent(MyRichEdit: TMyRichEdit);
var
  FileNameExt: String;
  AFileName: String;
begin
  if MyRichEdit = nil then
    exit;
  AFileName := ExtractFilePath(Application.Exename) + '\' + sUntitled;
  /// UpdateCursorPos;
  /// DragAcceptFiles(Handle, True);
  /// RichEditChange(nil);
  /// MyRichEdit.SetFocus;
  /// Check if we should load a file from the command line, assuming the default file is not available
  if TFile.Exists(AFileName) then
  begin
    MyRichEdit.LoadFrom(AFileName);
    MyRichEdit.FPathFileName := '';
    /// MyRichEdit.SetFocus;
    /// FileNameNoExt := ExtractFileNameNoExt(AFileName);
    FileNameExt := ExtractFileName(AFileName);
    PageControl1.SetPageName(FileNameExt, PageControl1.ActivePageIndex);
    SetModified(false);
    SetPathFileName(AFileName);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SelectionChange(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  try
    FUpdating := true;
    FontSize.Text := IntToStr(CMyRichEdit.SelAttributes.Size);
    ComBoBoxFontName.Text := CMyRichEdit.SelAttributes.Name;
    FGColorBox.Selected := CMyRichEdit.SelAttributes.Color;
    BGColorBox.Selected := CMyRichEdit.SelAttributes.BackColor;
    /// UpdateCursorPos();
  finally
    FUpdating := false;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditChange(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  SetModified(CMyRichEdit.Modified);
  UpdateCursorPos;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FontSizeChange(Sender: TObject);
var
  Component: TComponent;
begin
  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  if Component is TMemo then
  begin
    TMemo(Component).Font.Size := StrToInt(FontSize.Text);
    exit;
  end;
  if Component is TMyRichEdit then
  begin
    if FUpdating then
      exit;
    if CMyRichEdit = nil then
      CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
    if CMyRichEdit = nil then
      exit;
    CurrTextAttributes.Size := StrToInt(FontSize.Text);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ComBoBoxFontNameChange(Sender: TObject);
var
  Component: TComponent;
  FontName: String;
begin
  FontName := Trim(ComBoBoxFontName.Items[ComBoBoxFontName.ItemIndex]);
  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  if Component is TMemo then
  begin
    if FontName <> '' then
      TMemo(Component).Font.Name := FontName;
    exit;
  end;
  if Component is TMyRichEdit then
  begin
    if FUpdating then
      exit;
    if FontName <> '' then
      CurrTextAttributes.Name := FontName;
  end;
end;

procedure SetSelColor(RE: TRichEdit; AColor: TColor);
var
  cf: CHARFORMAT2;
begin
  FillChar(cf, SizeOf(cf), 0);
  cf.cbSize := SizeOf(cf);
  cf.dwMask := CFM_COLOR;
  cf.crTextColor := ColorToRGB(AColor);
  SendMessage(RE.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@cf));
end;

procedure TMainOctopusDebuggingDevelopmentForm.FGColorBoxChange(Sender: TObject);
var
  Component: TComponent;
begin
  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);

  if Component is TMemo then
  begin
    TMemo(Component).Font.Color := FGColorBox.Selected;
  end;
  if Component is TMyRichEdit then
  begin
    CMyRichEdit := TMyRichEdit(Component);
    if CMyRichEdit.SelLength > 0 then
    begin
      if TThread.CurrentThread.ThreadID = MainThreadID then
      begin
        CMyRichEdit.PlainText := false;
        CMyRichEdit.ParentFont := false;
        CMyRichEdit.SelAttributes.Color := FGColorBox.Selected;
        // CMyRichEdit.Font.Color:=  FGColorBox.Selected;
        // CMyRichEdit.Repaint;
        // SetSelColor(CMyRichEdit,FGColorBox.Selected);
      end;
    end
    else
    begin
      // ShowMessage('请先选择一段文本');
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.BGColorBoxChange(Sender: TObject);
var
  Component: TComponent;
begin
  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  if Component is TMemo then
  begin
    TMemo(Component).Color := BGColorBox.Selected;
  end;
  if Component is TMyRichEdit then
  begin
    TMyRichEdit(Component).SelAttributes.BackColor := BGColorBox.Selected;
  end;
end;

function TMainOctopusDebuggingDevelopmentForm.CurrTextAttributes: TTextAttributes;
begin
  /// Result := nil;
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  if CMyRichEdit.SelLength > 0 then
    Result := CMyRichEdit.SelAttributes
  else
    Result := CMyRichEdit.DefAttributes;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditorClick(Sender: TObject);
begin
  UpdateCursorPos;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditorLinkClick(Sender: TCustomRichEdit; const URL: string; Button: TMouseButton);
begin
  if (Button = mbLeft) and (MessageDlg(Format(sOpenLink, [URL]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL)
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TMainOctopusDebuggingDevelopmentForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(ComBoBoxFontName.Items));
  ReleaseDC(0, DC);
  ComBoBoxFontName.Sorted := true;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SetPathFileName(const PathFileName: String);
begin
  if PathFileName <> '' then
  begin
    Caption := Format('%s - %s', [Application.Title, PathFileName]);
    UpdateStatus(PathFileName, 2);
  end
  else
  begin
    Caption := Format('%s', [Application.Title]);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.CancelItemClick(Sender: TObject);
begin;
end;

procedure TMainOctopusDebuggingDevelopmentForm.CharacteSets1Click(Sender: TObject);
begin
  EditFontItem.Click;
end;

procedure TMainOctopusDebuggingDevelopmentForm.CheckFileSave;
var
  SaveResp: Integer;
begin
  if CMyRichEdit = nil then
    exit;
  if not CMyRichEdit.Modified then
    exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [CMyRichEdit.FPathFileName]), mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes:
      FileSave(Self);
    idNo:
      /// Nothing
      ;
    idCancel:
      Abort;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SubscriptCmdExecute(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  CMyRichEdit.SelAttributes.Subscript := sstSubscript;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SubscriptCmdUpdate(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  (Sender as TAction).Checked := CMyRichEdit.SelAttributes.Subscript = sstSubscript;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SuperscriptCmdExecute(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  CMyRichEdit.SelAttributes.Subscript := sstSuperscript;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SuperscriptCmdUpdate(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  (Sender as TAction).Checked := CMyRichEdit.SelAttributes.Subscript = sstSuperscript;
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateCommandObject();
begin
  CommandFrm.OcComPortObj := Self.GetCurrentSelectedDevice();
  if CommandFrm.OcComPortObj <> nil then
    SetPathFileName(CommandFrm.OcComPortObj.ComPortFullName);
end;

procedure TMainOctopusDebuggingDevelopmentForm.PageControl1Change(Sender: TObject);
var
  Component: TComponent;
begin
  /// showmessage(intTostr(PageControl1.ActivePageIndex));
  Component := Self.PageControl1.GetComponent(PageControl1.ActivePageIndex);
  if Component is TMyRichEdit then
  begin
    CMyRichEdit := TMyRichEdit(Component);
    SynchroSetMyRichEditFont(Component);
    SetPathFileName(CMyRichEdit.FPathFileName);
    Self.ComBoBoxFontName.ItemIndex := Self.ComBoBoxFontName.Items.IndexOf(CMyRichEdit.Font.Name);
  end;
  if Component is TMyMemo then
  begin
    Self.ComBoBoxFontName.ItemIndex := Self.ComBoBoxFontName.Items.IndexOf(TMyMemo(Component).Font.Name);
    Self.FontSize.Text := IntToStr(TMyMemo(Component).Font.Size);
    FGColorBox.Selected := TMyMemo(Component).Font.Color;
    BGColorBox.Selected := SettingPagesDlg.ColorBoxContentBG.Selected;
    TMyMemo(Component).Align := alClient;
    TMyMemo(Component).Visible := true;
    TMyMemo(Component).BringToFront;
    TMyMemo(Component).Update;
    TMyMemo(Component).SetFocus;
    UpdateStatus(OCTOPUS_DEFAULT_WEBSITE_ADDRESS1, 0);
  end
  else
  begin
    if CommandFrm.Showing then
      CommandFrm.Close;
  end;

  UpdateCommandObject();
  UpdateUartToolBar();
  StatusBarPrintFileSize();
end;

procedure TMainOctopusDebuggingDevelopmentForm.PageControl2Change(Sender: TObject);
begin
  AdjustUI();
end;

procedure TMainOctopusDebuggingDevelopmentForm.PageSetting1Click(Sender: TObject);
begin
  /// CMyRichEdit.Paragraph.FirstIndent := 12;
  /// CMyRichEdit.Paragraph.LeftIndent := 10;
  /// SelectionChange(Sender);
  PageSetupFrm.CMyRichEdit := Self.CMyRichEdit;
  PageSetupFrm.Show();
end;

/// 创建一个空的未命名的文档
procedure TMainOctopusDebuggingDevelopmentForm.FileNew(Sender: TObject);
var
  PageIndex: Integer;
begin
  CreateMyObjectPage(sUntitled, 0);
  CMyRichEdit := PageControl1.GetEdit(sUntitled);
  if CMyRichEdit = nil then
    exit;
  CMyRichEdit.StyleElements := [seClient, seBorder];
  LoadUntitledContent(CMyRichEdit);

  /// SetPathFileName(sUntitled);
  /// CMyRichEdit.Clear();
  /// CMyRichEdit.Modified := false;
  /// SetModified(false);
end;

procedure TMainOctopusDebuggingDevelopmentForm.PerformFileOpen(const AFileName: string);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  CMyRichEdit.LoadFrom(AFileName);
  SetPathFileName(AFileName);
  /// CMyRichEdit.SetFocus;
  CMyRichEdit.Modified := false;
  SetModified(false);
end;

procedure TMainOctopusDebuggingDevelopmentForm.PerformFileOpen(const AFileName: string; PageName: String);
var
  FileNameNoExt: String;
begin
  CMyRichEdit := PageControl1.GetEdit(PageName);

  if CMyRichEdit = nil then
    exit;

  CMyRichEdit.LoadFrom(AFileName);
  SetPathFileName(AFileName);

  FileNameNoExt := ExtractFileName(AFileName);
  PageControl1.SetPageName(FileNameNoExt, PageControl1.GetPageIndex(PageName));
  /// CMyRichEdit.SetFocus;
  CMyRichEdit.Modified := false;
  SetModified(false);
end;

procedure TMainOctopusDebuggingDevelopmentForm.LoadNewFileFromTo(PathFileName: String);
var
  FileNameExt: String;
  MyRichEdit: TMyRichEdit;
  NewPageName: String;
begin
  FileNew(Self);
  NewPageName := PageControl1.GetActivePageName;
  if NewPageName = sUntitled then
  begin
    MyRichEdit := PageControl1.LoadFileFrom(PathFileName, sUntitled);
    if MyRichEdit <> nil then
    begin
      MyRichEdit.ReadOnly := ofReadOnly in FileOpenCmd.Dialog.Options;
      /// MyRichEdit.SetFocus;
      FileNameExt := ExtractFileName(PathFileName);
      PageControl1.SetPageName(FileNameExt, PageControl1.ActivePageIndex);
      SetModified(false);
      SetPathFileName(PathFileName);
    end
    else
      UpdateStatus('Load file failed!');
  end
  else
    UpdateStatus('Load file failed! ' + NewPageName);
end;

procedure TMainOctopusDebuggingDevelopmentForm.FileOpenAccept(Sender: TObject);
begin
  LoadNewFileFromTo(FileOpenCmd.Dialog.FileName);
end;

procedure TMainOctopusDebuggingDevelopmentForm.FileOpenBeforeExecute(Sender: TObject);
begin
  /// CheckFileSave;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SaveLog(Component: TComponent; PathFileName: String);
begin
  if Component = nil then
    exit;
  if Component is TMyRichEdit then
  begin
    TMyRichEdit(Component).SaveTo(PathFileName);
    TMyRichEdit(Component).Modified := false;
    SetModified(false);
    UpdateStatus(sSaved);
  end;
  if Component is TMyMemo then
  begin
    TMyMemo(Component).SaveTo(PathFileName);
    UpdateStatus(sSaved);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FileSaveAsCmdBeforeExecute(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := GetCurrentSelectedDevice();
  if (OcComPortObj <> nil) then
    FileSaveAsCmd.Dialog.FileName := OcComPortObj.Port + '_' + GetSystemDateTimeStampStr + '.log';
end;

/// Control + s save
procedure TMainOctopusDebuggingDevelopmentForm.FileSave(Sender: TObject);
var
  tmpComponent: TComponent;
  FilePathName: String;
begin
  tmpComponent := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  FilePathName := PageControl1.GetPathFileName(PageControl1.ActivePageIndex);
  if (FilePathName <> '') then
  begin
    SaveLog(tmpComponent, FilePathName);
  end
  else
  /// if (FFilePathName = sUntitled) or (FFilePathName = '') then
  begin
    FileSaveAs(Sender);
  end
end;

procedure TMainOctopusDebuggingDevelopmentForm.FileSaveAs(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
  FileNameNoExt: String;
  tmpComponent: TComponent;
begin
  tmpComponent := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  OcComPortObj := GetCurrentSelectedDevice();
  /// if (OcComPortObj <> nil) then
  /// FileSaveAsCmd.Dialog.FileName := OcComPortObj.Port + '_' + GetSystemDateTimeStampStr + '.log';
  if not(tmpComponent is TCustomMemo) then
  begin
    ShowMessage('Unable not save the current document, please switch to another page!');
    exit;
  end;
  if FileSaveAsCmd.Dialog.FileName = '' then
  begin
    FileSaveAsItem.Click;
    { if FileSaveAsCmd.Dialog.FileName <> '' then
      begin
      SetPathFileName(FileSaveAsCmd.Dialog.FileName);
      ///FileNameNoExt := ExtractFileNameNoExt(FileSaveAsCmd.Dialog.FileName);
      PageControl1.SetPageName(FileNameNoExt, PageControl1.ActivePageIndex);
      end; }
    exit;
  end;

  if FileExists(FileSaveAsCmd.Dialog.FileName) then
    if MessageDlg(Format(sOverWrite, [FileSaveAsCmd.Dialog.FileName]), mtConfirmation, mbYesNoCancel, 0) <> idYes then
      exit;

  FileNameNoExt := ExtractFileExt(FileSaveAsCmd.Dialog.FileName);
  if FileNameNoExt = '' then
  begin
    case FileSaveAsCmd.Dialog.FilterIndex of
      1:
        FileSaveAsCmd.Dialog.FileName := FileSaveAsCmd.Dialog.FileName + '.rtf';
      2:
        FileSaveAsCmd.Dialog.FileName := FileSaveAsCmd.Dialog.FileName + '.txt';
      3:
        FileSaveAsCmd.Dialog.FileName := FileSaveAsCmd.Dialog.FileName + '.log';
    else
      FileSaveAsCmd.Dialog.FileName := FileSaveAsCmd.Dialog.FileName + '.txt';
    end;

  end;

  SaveLog(tmpComponent, FileSaveAsCmd.Dialog.FileName);
  SetPathFileName(FileSaveAsCmd.Dialog.FileName);

  if tmpComponent is TMyRichEdit then
    PageControl1.SetPageName(FileNameNoExt, PageControl1.ActivePageIndex);
end;

procedure TMainOctopusDebuggingDevelopmentForm.FilePrintAccept(Sender: TObject);
var
  tmpComponent: TComponent;
  FilePathName: String;
begin
  tmpComponent := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  FilePathName := PageControl1.GetPathFileName(PageControl1.ActivePageIndex);
  if tmpComponent is TMyRichEdit then
    TMyRichEdit(tmpComponent).Print(FilePathName);

  if tmpComponent is TMyMemo then
    TMyMemo(tmpComponent).Print(nil, FilePathName);
end;

procedure TMainOctopusDebuggingDevelopmentForm.SelectFont(Sender: TObject);
begin
  CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  if FontDialog.Execute then
  begin
    /// CurrTextAttributes.Assign(FontDialog.Font);
    SetMyRichEditFont(CMyRichEdit);
  end;
  SelectionChange(Self);
  /// CMyRichEdit.SetFocus;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SelectFontBeforeExecute(Sender: TObject);
begin
  FontDialog.Font.Assign(CMyRichEdit.SelAttributes);
end;

procedure TMainOctopusDebuggingDevelopmentForm.FontDialogShow(Sender: TObject);
begin
  SynchroFontDialog(Self.CMyRichEdit, Self.CMyRichEdit.FStyle);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  CharPos.Y := SendMessage(CMyRichEdit.Handle, EM_EXLINEFROMCHAR, 0, CMyRichEdit.SelStart);
  CharPos.X := (CMyRichEdit.SelStart - SendMessage(CMyRichEdit.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar1.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
  StatusBar1.Panels[1].Text := Format(sScrollPos, [CMyRichEdit.ScrollPosition.X, CMyRichEdit.ScrollPosition.Y]);
end;

procedure TMainOctopusDebuggingDevelopmentForm.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array [0 .. MAX_PATH] of Char;
  FileNameNoExt: String;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      /// CheckFileSave;
      { FileNew(Self);
        if PageControl1.GetActivePageName = sUntitled then
        begin
        PerformFileOpen(CFileName);
        ///FileNameNoExt := ExtractFileNameNoExt(CFileName);
        PageControl1.SetPageName(FileNameNoExt, PageControl1.ActivePageIndex);
        end; }
      LoadNewFileFromTo(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditMenuClick(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    HexModeItem.Checked := CMyRichEdit.FHexadecimalMode;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditTransparentItemClick(Sender: TObject);
begin
  CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;
  RichEditTransparentItem.Checked := not RichEditTransparentItem.Checked;
  CMyRichEdit.Transparent := RichEditTransparentItem.Checked;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RichEditWordWrapItemClick(Sender: TObject);
begin
  if CMyRichEdit = nil then
    CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if CMyRichEdit = nil then
    exit;

  RichEditWordWrapItem.Checked := not RichEditWordWrapItem.Checked;
  CMyRichEdit.WordWrap := RichEditWordWrapItem.Checked;

  if RichEditWordWrapItem.Checked then
    CMyRichEdit.ScrollBars := ssVertical
  else
    CMyRichEdit.ScrollBars := ssBoth;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RightOperationPanel1Click(Sender: TObject);
begin
  RightOperationPanel1.Checked := not RightOperationPanel1.Checked;
  ShowHideRLPanel(RightOperationPanel1.Checked);
end;

procedure TMainOctopusDebuggingDevelopmentForm.SetModified(Value: Boolean);
begin
  if Value then
    UpdateStatus(sModified, 1)
  else
    UpdateStatus(OCTOPUS_DEFAULT_WEBSITE_ADDRESS2, 1);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateStatus(Value: String);
begin
  /// StatusBar1.Panels[1].Text := Value;
  UpdateStatus(Value, 1);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateStatus(Value: String; Index: Integer);
var
  w: Integer;
begin
  if Index = 1 then
  begin
    w := StatusBar1.Canvas.TextWidth(Value);
    /// if w > StatusBar1.Panels[Index].Width then
    StatusBar1.Panels[Index].Width := w + 30;
  end;

  StatusBar1.Panels[Index].Text := Value;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SynchroSetMyRichEditFont(MyRichEdit: TComponent);
begin
  if MyRichEdit = nil then
    exit;
  if MyRichEdit is TMemo then
  begin
    TMemo(MyRichEdit).Color := SettingPagesDlg.ColorBoxContentBG.Selected;
    TMemo(MyRichEdit).Font := SettingPagesDlg.FontDialogConsole.Font;
    TMemo(MyRichEdit).ParentColor := false;
  end;
  if MyRichEdit is TMyRichEdit then
  begin
    TMyRichEdit(MyRichEdit).Color := clWhite;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SetMyRichEditFont(MyRichEdit: TMyRichEdit);
begin
  if MyRichEdit = nil then
    exit;
  if MyRichEdit.FStyle = 1 then
  begin
    /// 控制台风格
    MyRichEdit.Color := SettingPagesDlg.ColorBoxContentBG.Selected;
    MyRichEdit.Font := Self.FontDialog.Font;
    MyRichEdit.Transparent := false;
    MyRichEdit.ParentColor := false;
    SettingPagesDlg.FontDialogConsole.Font := MyRichEdit.Font;
    SettingPagesDlg.ColorBoxText.Selected := MyRichEdit.Font.Color;
  end
  else
  /// 文本编辑模式黑白默认
  begin
    MyRichEdit.Color := clWhite;
    if MyRichEdit.PlainText then // 纯文本应用全局字体
    begin
      /// FontDialog.Font.Color := clBlack;
      MyRichEdit.Font := FontDialog.Font;
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SynchroFontDialog(MyRichEdit: TMyRichEdit; Style: Integer);
begin
  if MyRichEdit = nil then
    exit;
  if MyRichEdit.FStyle = 1 then
  begin
    /// 控制台风格
    Self.FontDialog.Font := MyRichEdit.Font;
  end
  else
  /// 文本编辑模式黑白默认
  begin
    Self.FontDialog.Font := MyRichEdit.Font;
  end;
end;

/// ///////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////
/// click event
procedure TMainOctopusDebuggingDevelopmentForm.SV_RClosed(Sender: TObject);
begin
  Splitter1.Visible := false;
  Splitter1.Align := alNone;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SV_ROpened(Sender: TObject);
begin
  Splitter1.Visible := true;
  Splitter1.Align := alRight;
  AdjustUI();
end;

procedure TMainOctopusDebuggingDevelopmentForm.FormatToolBarMenuItem1Click(Sender: TObject);
begin
  StandardToolBar1.Visible := not StandardToolBar1.Visible;
  FormatToolBarMenuItem1.Checked := StandardToolBar1.Visible;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FormatToolBarMenuItem2Click(Sender: TObject);
begin
  StandardToolBar2.Visible := not StandardToolBar2.Visible;
  FormatToolBarMenuItem2.Checked := StandardToolBar2.Visible;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MenuItem2Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.CopyToClipboard;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MenuItem3Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.PasteFromClipboard;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MenuItem4Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.SelectAll;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MenuItem6Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.Clear;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.MenuItem7Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    FileSaveAsItem.Click;
  end;

end;

procedure TMainOctopusDebuggingDevelopmentForm.MergeBinFile1Click(Sender: TObject);
begin
  MergeBinFrm.OcComPortObj := Self.GetCurrentSelectedDevice();
  MergeBinFrm.ShowModal();
end;

procedure TMainOctopusDebuggingDevelopmentForm.Search1Click(Sender: TObject);
begin
  ShowSearchDialog();
end;

procedure TMainOctopusDebuggingDevelopmentForm.ScreenshotTool1Click(Sender: TObject);
begin
  // WindowState := wsMinimized;
  Self.Hide;
  sleep(300);
  if ScreenshotFrm = nil then
    ScreenshotFrm := TScreenshotFrm.Create(nil);

  ScreenshotFrm.MouseDownStart := true;
  ScreenshotFrm.MouseUpDone := true;
  ScreenshotFrm.CopyScreenToBmp(ScreenshotFrm.Image1);
  WindowState := wsNormal;

  if ScreenshotFrm.ShowModal = mrOk then
  begin
    if ScreenshotFrm.ScreenShotBitmap <> nil then
    begin
      ScreenMainFrm.Image1.Picture.Assign(ScreenshotFrm.ScreenShotBitmap);
      ScreenMainFrm.WindowState := wsNormal;
      Self.WindowState := wsNormal;
      // ScreenMainFrm.FilePath := FILE_DATA_ANN;
      // ScreenMainFrm.FileName := FStockDrawKLines.stock.GetLevelKey();
      Self.Show();
      ScreenMainFrm.Show;
    end
    else
    begin
      Show();
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ScreenshotTool2Click(Sender: TObject);
begin
  ScreenMainFrm.WindowState := wsNormal;
  ScreenMainFrm.Show();
end;

procedure TMainOctopusDebuggingDevelopmentForm.DataEncryption1Click(Sender: TObject);
begin
  DecryptEncryptFrm.Show();
end;

procedure TMainOctopusDebuggingDevelopmentForm.DefaultItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.Default);
end;

procedure TMainOctopusDebuggingDevelopmentForm.DownloadUpdate1Click(Sender: TObject);
begin
  DownloaderFrm.ShowModal();
end;

procedure TMainOctopusDebuggingDevelopmentForm.ASCIIItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.ASCII);
end;

procedure TMainOctopusDebuggingDevelopmentForm.ANSIItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.ANSI);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UTF7EncodingItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.UTF7);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UTF8EncodingItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.UTF8);
end;

procedure TMainOctopusDebuggingDevelopmentForm.UnicodeEncodingItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.Unicode);
end;

procedure TMainOctopusDebuggingDevelopmentForm.BigEndianUnicodeEncodingItemClick(Sender: TObject);
begin
  CMyRichEdit.LoadFrom(CMyRichEdit.FPathFileName, TEncoding.BigEndianUnicode);
end;

procedure TMainOctopusDebuggingDevelopmentForm.CRC1Click(Sender: TObject);
begin
  CRCFrm.Show();
end;

procedure TMainOctopusDebuggingDevelopmentForm.ProblemFeedback1Click(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, 0);
  TopLevelMenuItem.Checked := false;
  SubmitProblemFrm.Show();
end;

procedure TMainOctopusDebuggingDevelopmentForm.QuickTerminalCommandsItemClick(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj = nil then
  begin
    Self.PageControl1.ActivePageIndex := Self.PageControl1.GetAMemoIndex();
    OcComPortObj := Self.GetCurrentSelectedDevice();
  end;

  CommandFrm.OcComPortObj := OcComPortObj;
  CommandFrm.Show();
  CommandFrm.Left := MainOctopusDebuggingDevelopmentForm.Left + MainOctopusDebuggingDevelopmentForm.Width - CommandFrm.Width - 30;
  CommandFrm.Top := MainOctopusDebuggingDevelopmentForm.Top + MainOctopusDebuggingDevelopmentForm.Height - CommandFrm.Height * 2 + 5;
  Self.StandardToolBar1.Visible := false;
  Self.StandardToolBar2.Visible := true;
  ShowHideRLPanel(false);
end;

procedure TMainOctopusDebuggingDevelopmentForm.QuickTextEditingModeItemClick(Sender: TObject);
begin
  if CommandFrm.Showing then
    CommandFrm.Close;
  ShowHideRLPanel(false);
  Self.StandardToolBar1.Visible := true;
  Self.StandardToolBar2.Visible := false;
  FileNewButton.Click;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button100Click(Sender: TObject);
var
  s, ss: String;
  b: array of byte;
  i: Integer;
begin
  s := Trim(Memo1.Text);
  i := Length(AnsiString(s));
  SetLength(b, i);
  WideStringToByte(s, b);
  ss := '';
  for i := 0 to Length(b) - 1 do
  begin
    ss := ss + Format('%.02x ', [b[i]]);
  end;
  Memo2.Lines.Add(ss);
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button101Click(Sender: TObject);
var
  str, s: String;
  buf: array [0 .. 1023] of byte;
begin
  str := Trim(Memo2.Text);
  s := '';
  s := FormatHexStr(Trim(str), buf);
  Memo1.Lines.Append(ByteToWideString(@buf, Length(buf)));
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button102Click(Sender: TObject);
begin
  Memo2.Clear;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button103Click(Sender: TObject);
var
  buffer: array [0 .. 255] of byte;
  ss: String;
  OcComPortObj: TOcComPortObj;
  bLength: Integer;
  BytesWritten: Cardinal;
begin

  OcComPortObj := Self.GetCurrentSelectedDevice(); // GetDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if (OcComPortObj = nil) then
  begin
    /// Log0('No device is found,please open a device.');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  if (not OcComPortObj.Connected) then
  begin
    OcComPortObj.DebugLog('[No device connected,please open a device.  ]');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  ss := Trim(Memo2.Text);
  OcComPortObj.FalconComSendData_MultiTimes(ss, 0);
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button104Click(Sender: TObject);
var
  buffer: array [0 .. 255] of byte;
  ss: String;
  OcComPortObj: TOcComPortObj;
  bLength: Integer;
  BytesWritten: Cardinal;
begin

  OcComPortObj := Self.GetCurrentSelectedDevice(); // GetDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if (OcComPortObj = nil) then
  begin
    /// Log('No device is found,please open a device.');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  if (not OcComPortObj.Connected) then
  begin
    OcComPortObj.DebugLog('[No device connected,please open a device.  ]');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  ss := Trim(Memo2.Text);
  OcComPortObj.FalconComSendData_MultiTimes(ss, 1);
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button105Click(Sender: TObject);
var
  i, bLength: Integer;
  buffer: array [0 .. 20000] of byte;
  ss: String;
begin
  ss := '';
  Memo2.Text := Trim(Memo2.Text);
  for i := 0 to Memo2.Lines.Count - 1 do
    ss := ss + Trim(Memo2.Lines.Strings[i]) + ' ';
  try
    // ss := FormatHexStrToByte(ss, buffer,bLength);
    ss := FormatHexStrToBuffer(ss, buffer, bLength);
  except
    ShowMessage('There are too many datas to fomat!!!!!!!!!!');
  end;

  Memo2.Text := ss;
  i := Pos('(', Button105.Caption);
  if i > 0 then
    Button105.Caption := Copy(Button105.Caption, 1, i - 1) + '( ' + IntToStr(bLength) + ' ) Bytes'
  else
    Button105.Caption := Button105.Caption + ' ( ' + IntToStr(bLength) + ' ) Bytes';
end;

procedure TMainOctopusDebuggingDevelopmentForm.StopLoopSending();
begin
  Button200.Caption := 'Loop Stopped';
  Button201.Caption := LoopingString;
  OcComPortObj_Loop := nil;
  Timer1.Tag := 0;
  Timer1.Enabled := false;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Timer1Timer(Sender: TObject);
var
  sStr: string;
  i, j, Count, delayCount: Integer;
  /// OcComPortObj: TOcComPortObj;
begin

  if (OcComPortObj_Loop = nil) or (not OcComPortObj_Loop.Connected) then
  begin
    StopLoopSending();
    exit;
  end;

  Timer1.Tag := 1;
  Timer1.Enabled := false;
  Button200.Caption := 'Stop Looping';
  Button201.Caption := LoopingString + '...';

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if Timer1.Tag = 0 then
      break;
    if Trim(StringGrid1.Cells[CHECKCOL, i]) = '1' then
    begin
      if Timer1.Tag = 0 then
        break;

      try
        sStr := GetStringGridValidStr(StringGrid1.Cells[2, i]);
        Count := StrToInt(Trim(StringGrid1.Cells[4, i]));
        delayCount := StrToInt(Trim(StringGrid1.Cells[5, i]));
        if Count = 0 then
        begin
          While (true) do
          begin
            if (OcComPortObj_Loop <> nil) then
              OcComPortObj_Loop.FalconComSendData_MultiTimes(sStr, OcComPortObj_Loop.SendFormat);
            Delay(delayCount);
            if Timer1.Tag = 0 then
              break;
          end;
        end
        else
        begin
          for j := 0 to Count - 1 do
          begin
            if (OcComPortObj_Loop <> nil) then
              OcComPortObj_Loop.FalconComSendData_MultiTimes(sStr, OcComPortObj_Loop.SendFormat);
            Delay(delayCount);
            if Timer1.Tag = 0 then
              break;
          end;
        end;

        Delay(delayCount);
      Except
        continue;
      end;
    end;
  end; // for

  if (Timer1.Tag <> 0) and ((SettingPagesDlg.UpDown3.Position > (Button201.Tag + 1)) or (SettingPagesDlg.UpDown3.Position <= 0)) then
  /// TSettingPagesDlg
  begin
    Button201.Caption := 'Looping... ' + IntToStr(Button201.Tag);
    Button201.Tag := Button201.Tag + 1;
    Timer1.Enabled := true;
  end
  else
  begin
    StopLoopSending();
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Timer2Timer(Sender: TObject);
begin
  Self.SaveUserData(UserDataChanged);
  UserDataChanged := false;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button200Click(Sender: TObject);
begin
  StopLoopSending();
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button201Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice(); // GetDeciceByFullName(self.GetCurrentSelectedDeviceName);
  if OcComPortObj = nil then
  begin
    exit;
  end;

  if not OcComPortObj.Connected then
  begin
    OcComPortObj.Log('No device was Connected,please open a device.');
    MessageBox(Application.Handle, 'No device was Connected,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Timer1.Enabled := false;
    exit;
  end;

  if (Timer1.Tag >= 1) or (Timer1.Enabled) then
  begin
    MessageBox(Application.Handle, 'Looping, please stop it first!', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  LoopingString := Button201.Caption;
  if OcComPortObj.Connected then
  begin
    Timer1.Enabled := false;
    Button201.Tag := 0;

    OcComPortObj_Loop := OcComPortObj;
    Timer1.Enabled := true;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button300Click(Sender: TObject);
begin
  Memo3.Clear;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button301Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
  str: String;
  Datas: array [0 .. 1023] of byte;
  Ret: Boolean;
  i, AdressCount, Count2, WantReadCount: Integer;
  ID: Word;
  Addressb: array [0 .. 9] of byte;
  rwCount: Integer;
  SL: TStringList;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if (OcComPortObj = nil) then
  begin
    // Log0('No device is found,please open a device.');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  if (not OcComPortObj.Connected) then
  begin
    OcComPortObj.DebugLog('[No device connected,please open a device.  ]');
    /// MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  SL := TStringList.Create;
  // ExtractStrings([ ' '],   [],   PChar(str),   SL); ExtractStrings�����ָ��ַ���
  AdressCount := FormatHexStrToByte2(Trim(ComboBox302.Text), Addressb);
  WantReadCount := StrToInt(Trim(ComboBox303.Text));
  str := '';
  for i := 0 to Memo3.Lines.Count - 1 do
    str := str + Trim(Memo3.Lines.Strings[i]) + ' ';
  str := Trim(str);

  if str = '' then
    exit;
  case ComboBox301.ItemIndex of
    Ord(S_ASCIIFormat):
      begin
        WideStringToByte(str, Datas);
        Count2 := Length(str);
      end;
    Ord(S_HexadecimalFormat):
      begin
        if (AdressCount > 1) then
          str := FormatHexStrToBuffer(str, &Datas[1], Count2)
        else
          str := FormatHexStrToBuffer(str, Datas, Count2);
      end;
    Ord(S_OctopusProtocol):
      begin
        if not checkIsHexStr(str) then
        begin
          WideStringToByte(str, Datas);
          Count2 := Length(str);
        end
        else
        begin
          if (AdressCount > 1) then
            str := FormatHexStrToBuffer(str, &Datas[1], Count2)
          else
            str := FormatHexStrToBuffer(str, Datas, Count2);
        end;
      end;
  end;

  // OcComPortObj.SendProtocolData(OCCOMPROTOCAL_HEAD2, OCCOMPROTOCAL_DATA, Datas, Count2, false);
  SL.Clear;
  SL.Free;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Button302Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
  FileStream: TFileStream;
  FileNameLoaded: String;
begin

  OcComPortObj := Self.GetCurrentSelectedDevice();
  /// GetDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if OcComPortObj = nil then
  begin
    OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  if not OcComPortObj.Connected then
  begin
    OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  FileNameLoaded := 'Null';
  if OpenDialog1.Execute then
  begin
    FileNameLoaded := OpenDialog1.FileName;
    if FileExists(FileNameLoaded) then
    begin
      FileStream := readFileToStream(FileNameLoaded);
      OcComPortObj.Log(' ');
      OcComPortObj.Log('File Name: ' + FileNameLoaded);
      OcComPortObj.Log('File Size: ' + IntToStr(FileStream.Size) + ' Bytes');
      // OcComPortObj.Log('This file have been loaded,press the left-bottom button to start sending');
      if (FileStream.Size > 1024 * 1024 * 5) then
      begin
        OcComPortObj.Log('This file size is too biger,only support less then 5M size file.');
      end;
      FileStream.Free;
      FileStream := nil;
    end;
  end;

  if not FileExists(FileNameLoaded) then
  begin
    OcComPortObj.Log('Do not exist the file ' + FileNameLoaded);
    exit;
  end;

  ComboBox301.ItemIndex := 0;
  ComboBox2.ItemIndex := Ord(OctopusProtocol);
  ComboBox2.OnChange(Self);

  if IsHexFile(FileNameLoaded) then
  begin
    SendFileAsHex(OcComPortObj, FileNameLoaded);
  end
  else if IsBinFile(FileNameLoaded) then
  begin
    SendFileAsBin(OcComPortObj, FileNameLoaded);
  end
  else
  begin
    /// SendFileAsCommon(OcComPortObj);
  end;

end;

procedure TMainOctopusDebuggingDevelopmentForm.FindDialog1Close(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj <> nil then
    OcComPortObj.LogScrollMode := true;
  Self.Show;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FindDialog1Find(Sender: TObject);
var
  FindStr: String;
  OcComPortObj: TOcComPortObj;
  Component: TComponent;
  bRet: Boolean;
Label ReStart;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  with Sender as TFindDialog do
  begin
    FindStr := FindText;
    if (OcComPortObj = nil) or (OcComPortObj.LogObject = nil) or (OcComPortObj.LogObject.Parent = nil) then
    begin
      Component := Self.CMyRichEdit;
    end
    else
    begin
      Component := OcComPortObj.LogObject;
    end;

    if Component = nil then
      exit;

  ReStart:
    bRet := SearchTextFrom(Component, FindStr, Options);

    if bRet = false then
    begin
      if frDown in Options then
      begin
        if MessageBox(Handle, PWideChar(Concat('Not found "', FindStr, '" restart seach from the beginning of the file')), PChar(Application.Title), MB_YESNO) = ID_YES
        then
        begin
          if Component is TMyMemo then
            TMyMemo(Component).SelStart := 0;
          if Component is TMyRichEdit then
            TMyRichEdit(Component).SelStart := 0;

          goto ReStart;
        end;
      end
      else
      begin
        if MessageBox(Handle, PWideChar(Concat('Not found "', FindStr, '" restart seach from the end of the file')), PChar(Application.Title), MB_YESNO) = ID_YES
        then
        begin
          if Component is TMyMemo then
            TMyMemo(Component).SelStart := TMyMemo(Component).GetTextLen;
          if Component is TMyRichEdit then
            TMyRichEdit(Component).SelStart := TMyRichEdit(Component).GetTextLen;

          goto ReStart;
        end;
      end;
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.FindDialog1Show(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj = nil then
    exit;
  OcComPortObj.LogScrollMode := false;
end;

procedure TMainOctopusDebuggingDevelopmentForm.WelcomeAndHelp1Click(Sender: TObject);
var
  Types: Integer;
  str: String;
begin
  /// ShellExecute(Application.Handle, nil, 'http://1234998.cn', nil, nil, SW_SHOWNORMAL);
  /// if Self.WebBrowser = nil then
  /// begin
  CreateMyObjectPage('Welcome And Help', 1);
  /// end;

  if Self.WebBrowser <> nil then
  begin
    Types := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
    str := 'file:///' + ExtractFileDir(Application.Exename) + '\Octopus Software.html';
    /// if CheckUrl('http://www.baidu.com') then
    /// if internetGetConnectedState(@types,0) then
    if DownloadObjectsManager.IsNetworkAvailable then
    begin
      str := ByteToWideString(@testbuff, Length(testbuff));
    end;
    Self.WebBrowser.Navigate(str); // (DEFAULT_WEBSITE_ADDRESS);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.HelpAbout(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.HelpMenuClick(Sender: TObject);
begin
  case SettingPagesDlg.ComboBox8.ItemIndex of
    0:
      begin
        EnglishMenuItem.Checked := true;
        ChineseMenuItem.Checked := false;
      end;
    1:
      begin
        ChineseMenuItem.Checked := true;
        EnglishMenuItem.Checked := false;
      end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.HexModeItemClick(Sender: TObject);
var
  Component: TComponent;
begin
  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  // CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  if Component is TMyRichEdit then
  begin
    CMyRichEdit := TMyRichEdit(Component);
    HexModeItem.Checked := not HexModeItem.Checked;
    if not CMyRichEdit.ExistLocalFile() then
    begin
      SaveLog(Component, sUntitled);
      SetPathFileName(FileSaveAsCmd.Dialog.FileName);
    end;
    CMyRichEdit.SetHexadecimalMode(HexModeItem.Checked);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Encoding1Click(Sender: TObject);
begin
  DefaultItem.Checked := false;
  ASCIIItem.Checked := false;
  ANSIItem.Checked := false;
  UTF7EncodingItem.Checked := false;
  UTF8EncodingItem.Checked := false;
  UnicodeEncodingItem.Checked := false;
  BigEndianUnicodeEncodingItem.Checked := false;
  if CMyRichEdit <> nil then
  begin
    if CMyRichEdit.Lines.Encoding = TEncoding.Default then
      DefaultItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.ASCII then
      ASCIIItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.ANSI then
      ANSIItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.UTF7 then
      UTF7EncodingItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.UTF8 then
      UTF8EncodingItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.Unicode then
      UnicodeEncodingItem.Checked := true
    else if CMyRichEdit.Lines.Encoding = TEncoding.BigEndianUnicode then
      BigEndianUnicodeEncodingItem.Checked := true
    else
      DefaultItem.Checked := true;
  end
  else
    DefaultItem.Checked := true;
end;

procedure TMainOctopusDebuggingDevelopmentForm.EnglishMenuItemClick(Sender: TObject);
begin
  SettingPagesDlg.ComboBox8.ItemIndex := 0;
  SettingPagesDlg.UpdateLaunguage(Self);
end;

procedure TMainOctopusDebuggingDevelopmentForm.ChineseMenuItemClick(Sender: TObject);
begin
  SettingPagesDlg.ComboBox8.ItemIndex := 1;
  SettingPagesDlg.UpdateLaunguage(Self);
end;

procedure TMainOctopusDebuggingDevelopmentForm.CloseTheDevice1Click(Sender: TObject);
begin
  ToolButton13.Click;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ViewMenuClick(Sender: TObject);
begin
  UpdateMainMenu();
  QuickTerminalCommandsItem.Checked := CommandFrm.Showing;
end;

procedure TMainOctopusDebuggingDevelopmentForm.LptatpMenuItemClick(Sender: TObject);
begin
  Self.PageControl1.TabPosition := tpTop;
end;

procedure TMainOctopusDebuggingDevelopmentForm.LptabpMenuItemClick(Sender: TObject);
begin
  Self.PageControl1.TabPosition := tpBottom;
end;

procedure TMainOctopusDebuggingDevelopmentForm.LptalpMenuItemClick(Sender: TObject);
begin
  Self.PageControl1.TabPosition := tpLeft;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RptatpMenuItemClick(Sender: TObject);
begin
  Self.PageControl2.TabPosition := tpTop;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RptarpMenuItemClick(Sender: TObject);
begin
  Self.PageControl2.TabPosition := tpRight;
end;

procedure TMainOctopusDebuggingDevelopmentForm.RptabpMenuItemClick(Sender: TObject);
begin
  Self.PageControl2.TabPosition := tpBottom;
end;

procedure TMainOctopusDebuggingDevelopmentForm.TopLevelMenuItemClick(Sender: TObject);
begin
  TopLevelMenuItem.Checked := not TopLevelMenuItem.Checked;
  if TopLevelMenuItem.Checked then
  begin
    SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, 0);
  end
  else
  begin
    SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, 0);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SettingItem1Click(Sender: TObject);
var
  Component: TComponent;
  // OcComPortObj: TOcComPortObj;
begin
  /// SettingPagesDlg.CheckBox35.Checked := ShowLinesNumberItem.Checked;
  SettingPagesDlg.SelectedOcComPortObj := GetCurrentSelectedDevice();

  SettingPagesDlg.ShowModal();

  InitUartsParameters();
  UpdateUartToolBar();
  AlphaBlend := SettingPagesDlg.AlphaBlend;
  AlphaBlendValue := SettingPagesDlg.AlphaBlendValue;

  Component := PageControl1.GetComponent(PageControl1.ActivePageIndex);
  SynchroSetMyRichEditFont(Component);
  SettingPagesDlg.UpdateLaunguage(Self);
end;

procedure TMainOctopusDebuggingDevelopmentForm.SettingItem2Click(Sender: TObject);
begin
  SettingItem1.Click;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SkinsMenuClick(Sender: TObject);
var
  i: Integer;
begin
  if FThemeSkinName <> '' then
  begin
    for i := 0 to SkinsMenu.Count - 1 do
    begin
      if GetStyle(i) = FThemeSkinName then
        SkinsMenu.Items[i].Checked := true
      else
        SkinsMenu.Items[i].Checked := false;
    end;
  end
  else if Self.SkinMenuItem <> nil then
  begin
    for i := 0 to SkinsMenu.Count - 1 do
    begin
      if SkinsMenu.Items[i] = Self.SkinMenuItem then
        SkinsMenu.Items[i].Checked := true
      else
        SkinsMenu.Items[i].Checked := false;
    end;
  end
  else
  begin
    SkinsMenu.Items[0].Checked := true;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.COMMenuClick(Sender: TObject);
var
  i: Integer;
  MenuItem: TMenuItem;
  OcComPortObj: TOcComPortObj;
begin
  InitUartsMenu(COMMenu, COM1MenuItemOnClick);
  OcComPortObj := Self.GetCurrentSelectedDevice;
  for i := 0 to COMMenu.Count - 1 do
  begin
    MenuItem := COMMenu.Items[i];
    if MenuItem = nil then
      continue;

    MenuItem.Checked := false;
    if (OcComPortObj = SettingPagesDlg.getDeciceByIndex(i)) and (OcComPortObj <> nil) then
    begin
      if MenuItem.Tag = i then
        MenuItem.Checked := true;
    end;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ToggleSwitchDeviceOnOffClick(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj <> nil then
  begin
    if ToggleSwitchDeviceOnOff.IsOn then
    begin
      ComboBox1.OnChange(Self);
      ComboBox2.OnChange(Self);
      GetAndOpenADevices(OcComPortObj, true);
      // SettingPagesDlg.openDevice(OcComPortObj);
      ToggleSwitchDeviceOnOff.ThumbColor := clRed;
    end
    else
    begin
      SettingPagesDlg.closeDevice(OcComPortObj);
      ToggleSwitchDeviceOnOff.ThumbColor := clWindowText;
    end;

    if OcComPortObj.Connected then
    begin
      ToggleSwitchDeviceOnOff.State := tssOn;
      ToggleSwitchDeviceOnOff.ThumbColor := clRed;
      UpdateCommandObject();
    end
    else
    begin
      ToggleSwitchDeviceOnOff.State := tssOff;
      ToggleSwitchDeviceOnOff.ThumbColor := clWindowText;
    end;
  end
  else
  begin
    ToggleSwitchDeviceOnOff.State := tssOff;
    ToggleSwitchDeviceOnOff.ThumbColor := clWindowText;
    /// MessageBox(Handle, 'This device does not exist or has been removed from the system!', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    /// showmessage();
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.Splitter1Moved(Sender: TObject);
begin
  AdjustUI();
end;

procedure TMainOctopusDebuggingDevelopmentForm.COM1MenuItemOnClick(Sender: TObject);
var
  PageName: String;
begin
  GetAndOpenADevices(SettingPagesDlg.getDeciceByIndex((TMenuItem(Sender)).Tag), false);
end;

procedure TMainOctopusDebuggingDevelopmentForm.ComboBox1Change(Sender: TObject);
var
  str: String;
  btl: Integer;
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();

  if OcComPortObj = nil then
  begin
    /// MessageBox(Handle, 'Please specify a device for custom baudrate.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  try
    if (ComboBox1.ItemIndex <= MAX_BAUDRATE_INDEX) then // High(TBaudRate))
    begin
      OcComPortObj.BaudRate := TBaudRate(ComboBox1.ItemIndex);
      // OcComPortObj.BaudRateIndex := ComboBox1.ItemIndex;
    end
    else
    begin
      OcComPortObj.BaudRate := TBaudRate(0);
      OcComPortObj.CustomBaudRate := StrToInt(ComboBox1.Text);
    end;
  Except
    on err: Exception do // 捕
    begin
      ShowMessage(err.message + ' Please go to Octopus Option Settings page to setup the device.');
    end;
  end;
  Self.PageControl1.SetFocus;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ComboBox2Change(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj = nil then
    exit;
  /// if (ComboBox2.ItemIndex = Ord(Graphic)) then
  /// OcComPortObj.FastLineSeries := self.CharInitSeries(True);
  OcComPortObj.ReceiveFormat := ComboBox2.ItemIndex;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ConverttoAnsi1Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.ConvertEncoding(TEncoding.ANSI);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ConverttoUTF81Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.ConvertEncoding(TEncoding.UTF8);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ConverttoUTF82Click(Sender: TObject);
begin
  if CMyRichEdit <> nil then
  begin
    CMyRichEdit.ConvertToUTF8WithBOM();
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ToolButton12Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
  Component: TComponent;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj <> nil then
  begin
    OcComPortObj.ClearLog();
    // OcComPortObj.ClearInternalBuff();
    exit;
  end;
  Component := Self.PageControl1.GetComponent(PageControl1.ActivePageIndex);
  if Component is TMyRichEdit then
  begin
    TMyRichEdit(Component).Clear;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ToolButton13Click(Sender: TObject);
begin
  GetAndRemoveDevices(Self.GetCurrentPageName());
  UpdateUartToolBar();
end;

procedure TMainOctopusDebuggingDevelopmentForm.ToolButton16Click(Sender: TObject);
begin
  SettingItem1.Click;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ToolButton19Click(Sender: TObject);
begin
  { ShowHideRLPanel(false);
    CommandFrm.OcComPortObj := Self.GetCurrentSelectedDevice();
    CommandFrm.Show();
    CommandFrm.Left := MainOctopusDebuggingDevelopmentForm.Left + MainOctopusDebuggingDevelopmentForm.Width - CommandFrm.Width - 15;
    CommandFrm.Top := MainOctopusDebuggingDevelopmentForm.Top + MainOctopusDebuggingDevelopmentForm.Height - CommandFrm.Height * 2 + 20;
    Self.StandardToolBar1.Visible := false;
    Self.StandardToolBar2.Visible := True; }

  if CommandFrm.Showing then
    CommandFrm.Close
  else
    QuickTerminalCommandsItem.Click;
end;

/// ///////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////
/// init
procedure TMainOctopusDebuggingDevelopmentForm.InitMainUI();
begin
  /// ToggleSwitchDeviceOnOff.Height := 25;
  /// StandardToolBar2.Height := 33;
  Application.Title := OCTOPUS_APPLICATION_TITLE_NAME;
  Self.Caption := OCTOPUS_APPLICATION_TITLE_NAME;
  Self.Icon := Application.Icon;
  Application.OnHint := ShowHint;

  if SettingPagesDlg = nil then
  begin
    SettingPagesDlg := TSettingPagesDlg.Create(nil);
    SettingPagesDlg.SettingChangedCallBackFuntion := Self.SettingChangedCallBackFuntion;
  end;
  Self.Caption := OCTOPUS_APPLICATION_TITLE_NAME + ' (' + SettingPagesDlg.VersionNumberStr + ')';

  CMyRichEdit := PageControl1.GetEdit(PageControl1.ActivePageIndex);
  FileOpenCmd.Dialog.InitialDir := ExtractFilePath(ParamStr(0));
  FileSaveAsCmd.Dialog.InitialDir := FileOpenCmd.Dialog.InitialDir;
  FVersionNumberStr := GetBuildInfo(Application.Exename);
  // SetFileName(sUntitled);
  GetFontNames();
  SelectionChange(Self);
  UpdateMainMenu();
  AdjustUI();
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateMainMenu();
begin
  FormatToolBarMenuItem1.Checked := StandardToolBar1.Visible;
  FormatToolBarMenuItem2.Checked := StandardToolBar2.Visible;
  RightOperationPanel1.Checked := Self.SV_R.Opened;

  RptatpMenuItem.Checked := false;
  RptabpMenuItem.Checked := false;
  RptarpMenuItem.Checked := false;
  LptatpMenuItem.Checked := false;
  LptabpMenuItem.Checked := false;
  LptalpMenuItem.Checked := false;

  if Self.PageControl1.TabPosition = tpTop then
    LptatpMenuItem.Checked := true;
  if Self.PageControl1.TabPosition = tpBottom then
    LptabpMenuItem.Checked := true;
  if Self.PageControl1.TabPosition = tpLeft then
    LptalpMenuItem.Checked := true;

  if Self.PageControl2.TabPosition = tpTop then
    RptatpMenuItem.Checked := true;
  if Self.PageControl2.TabPosition = tpBottom then
    RptabpMenuItem.Checked := true;
  if Self.PageControl2.TabPosition = tpRight then
    RptarpMenuItem.Checked := true;

  /// if (CMyRichEdit <> nil) then
  /// ShowLinesNumberItem.Checked := CMyRichEdit.FShowLinesNumber;
end;

procedure TMainOctopusDebuggingDevelopmentForm.AdjustUI();
begin
  Button100.Width := Memo1.Width;
  Button101.Width := Button100.Width;

  Button104.Width := Button100.Width - Button102.Width - Button103.Width - 4;
  Button105.Width := Button100.Width;

  Button201.Width := Panel201.Width - Button200.Width - 4;

  ComboBox301.Width := Memo3.Width - 74;
  ComboBox302.Width := ComboBox301.Width;
  ComboBox303.Width := ComboBox301.Width;
  ComboBox304.Width := ComboBox301.Width;

  Button302.Width := Memo3.Width;
  Button301.Width := Button302.Width - Button300.Width - 2;
end;

procedure TMainOctopusDebuggingDevelopmentForm.InitUserConfiguration();
begin
  if (CMyRichEdit <> nil) then
  begin
    /// CurrText.Name := string(DefFontData.Name);
    /// CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
    /// CurrText.Name := FontDialog.Font.Name;
    /// CurrText.Size := FontDialog.Font.Size;
    RichEditTransparentItem.Checked := CMyRichEdit.Transparent;
    RichEditWordWrapItem.Checked := CMyRichEdit.ScrollBars = ssVertical;
    CMyRichEdit.WordWrap := RichEditWordWrapItem.Checked;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.UpdateUartToolBar();
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj <> nil then
  begin
    if Ord(OcComPortObj.BaudRate) = 0 then
    begin
      Self.ComboBox1.ItemIndex := Self.ComboBox1.Items.IndexOf(IntToStr(OcComPortObj.CustomBaudRate));
    end
    else
    begin
      Self.ComboBox1.ItemIndex := Ord(OcComPortObj.BaudRate);
    end;
    Self.ComboBox2.ItemIndex := Ord(OcComPortObj.ReceiveFormat);
    if OcComPortObj.Connected then
    begin
      ToggleSwitchDeviceOnOff.State := tssOn;
      ToggleSwitchDeviceOnOff.ThumbColor := clRed;
    end
    else
    begin
      ToggleSwitchDeviceOnOff.State := tssOff;
      ToggleSwitchDeviceOnOff.ThumbColor := clWindowText;
    end;
    SetPathFileName(OcComPortObj.ComPortFullName);
  end
  else
  begin
    ToggleSwitchDeviceOnOff.State := tssOff;
    ToggleSwitchDeviceOnOff.ThumbColor := clWindowText;
    SetPathFileName('');
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.InitSkinsMenu(ParentMenu: TMenuItem; OnClicEvent: TOnClicEvent);
var
  i: Integer;
  MenuItem: TMenuItem;
begin
  ParentMenu.Clear;
  for i := Low(TStyleManager.StyleNames) to High(TStyleManager.StyleNames) do
  begin
    MenuItem := TMenuItem.Create(nil);
    MenuItem.Caption := TStyleManager.StyleNames[i]; // StyleName;
    MenuItem.Tag := i;
    ParentMenu.Add(MenuItem);
    MenuItem.OnClick := OnClicEvent;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SkinsMenuOnClick(Sender: TObject);
var
  str: String;
begin;
  str := GetStyle(TMenuItem(Sender).Tag);
  if str <> '' then
  begin
    SkinMenuItem := TMenuItem(Sender);
    FThemeSkinName := str;
    AdjustSetStyle(str);
    /// AdjustSetStyle(str);
    TMenuItem(Sender).Checked := true;
  end;
end;

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// StringGridL
function TMainOctopusDebuggingDevelopmentForm.GetStringGridValidStr(sStr: String): String;
var
  strstr: String;
  Pos: Integer;
begin
  Result := '';
  // str := Trim(sStr);
  Pos := PosEx('#', sStr);
  if (Pos > 0) then
    strstr := Copy(sStr, 1, Pos - 1)
  else
    strstr := sStr;
  Pos := PosEx('//', strstr);
  if (Pos > 0) then
    Result := Trim(Copy(strstr, 1, Pos - 1))
  else
    Result := Trim(strstr)
end;

procedure TMainOctopusDebuggingDevelopmentForm.InitStringGrid();
var
  bmp: TBitmap;
  i: Integer;
  // GridRect: TGridRect;
begin
  try
    FCheck := TBitmap.Create;
    FNoCheck := TBitmap.Create;
    bmp := TBitmap.Create;
    bmp.Handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
    bmp.PixelFormat := pf32bit;
    bmp.HandleType := bmDIB;
    bmp.Transparent := true;
    bmp.TransparentColor := clWhite;
    // Bmp.Canvas.Brush.Color := clWhite;
    // Bmp.Canvas.FillRect(Rect(0, 0, Bmp.Width, Bmp.Height));

    FNoCheck.PixelFormat := pf32bit;
    FNoCheck.HandleType := bmDIB;
    FNoCheck.Transparent := true;
    FNoCheck.TransparentColor := clWhite;
    with FNoCheck do
    begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.CopyRect(Canvas.cliprect, bmp.Canvas, Canvas.cliprect);
    end;
    with FCheck do
    begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.CopyRect(Canvas.cliprect, bmp.Canvas, Rect(Width, 0, 2 * Width, Height));
    end;
  finally
    DeleteObject(bmp.Handle);
    bmp.Free;
  end;

  StringGrid1.RowCount := 520;
  StringGrid1.DefaultRowHeight := 28;
  StringGrid1.ColCount := 6;
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 50;
  StringGrid1.ColWidths[2] := 300;
  StringGrid1.ColWidths[3] := 32;
  StringGrid1.ColWidths[4] := 40;
  StringGrid1.ColWidths[5] := 40;
  StringGrid1.FixedCols := 2;
  StringGrid1.FixedRows := 1;

  StringGrid1.Cells[0, 0] := 'TEXT';
  StringGrid1.Cells[1, 0] := 'BYTE';
  StringGrid1.Cells[2, 0] := 'CONTENT FOR SENDING';

  StringGrid1.Cells[4, 0] := 'LOOP';
  StringGrid1.Cells[5, 0] := 'MS';
  /// StringGrid1.Cells[6, 0] := 'Comments';
  StringGrid1.Align := alClient;
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    StringGrid1.Cells[0, i] := Format('%.04d ', [i]); // '0' + inttostr(i)
    StringGrid1.Cells[1, i] := Format('%.04x ', [i]);

    StringGrid1.Cells[CHECKCOL, i] := '0';
    StringGrid1.Cells[4, i] := '2';
    StringGrid1.Cells[5, i] := '1000';
  end;

end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  try
    if (ACol = CHECKCOL) and (ARow > 0) then
    begin
      // StringGrid1.BeginUpdate;
      // if not(gdFixed in State) then
      with TStringGrid(Sender).Canvas do
      begin
        Brush.Color := clWindow;
        fillRect(Rect);
        if StringGrid1.Cells[ACol, ARow] = '1' then
          Draw((Rect.Right + Rect.Left - FCheck.Width) div 2 - 2, (Rect.Bottom + Rect.Top - FCheck.Height) div 2, FCheck)
        else
          Draw((Rect.Right + Rect.Left - FCheck.Width) div 2 - 2, (Rect.Bottom + Rect.Top - FCheck.Height) div 2, FNoCheck);
      end;
      // StringGrid1.EndUpdate;
    end;
  except
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1FixedCellClick(Sender: TObject; ACol, ARow: Integer);
var
  str: String;
  OcComPortObj: TOcComPortObj;
begin
  if ARow <= 0 then
  begin
    // if ACol = 0 then
    // MessageBox(Application.Handle, PChar('��һ�з����ַ���'), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    // if ACol = 1 then
    // MessageBox(Application.Handle, PChar('��һ�з����ֽڣ�ʮ�����ƣ�'), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  StringGrid1.Options := StringGrid1.Options - [goEditing];
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if OcComPortObj = nil then
  begin
    /// MessageBox(Application.Handle, PChar('No device!! You need to open a device,please use F1 to get help'), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  if not OcComPortObj.Connected then
  begin
    OcComPortObj.DebugLog('[No device connected,please open a device.  ]');
    /// MessageBox(Application.Handle, PChar('No device!! You need to open a device,please use F1 to get help'), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  StringGridSelectCell(ACol, ARow);
  str := GetStringGridValidStr(StringGrid1.Cells[2, ARow]);

  if ACol = 0 then
  begin
    OcComPortObj.FalconComSendData_Common(str, 0);
  end;
  if ACol = 1 then
  begin
    OcComPortObj.FalconComSendData_Common(str, 1);
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (StringGrid1.Col = 4) or (StringGrid1.Col = 5) then
  begin
    if not(Key in ['0' .. '9', #8]) then
      Key := #0;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  StringGrid1_Col, StringGrid1_Row: Integer;
begin
  StringGrid1.MouseToCell(X, Y, StringGrid1_Col, StringGrid1_Row);
  if (StringGrid1_Col = CHECKCOL) OR (StringGrid1_Col = 1) OR (StringGrid1_Col = 0) then
    StringGridSelectCell(StringGrid1_Col, StringGrid1_Row);

  if StringGrid1_Col = DATACOL then
    StringGrid1.Col := DATACOL;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  StringGrid1_Col, StringGrid1_Row: Integer;
begin
  StringGrid1.MouseToCell(X, Y, StringGrid1_Col, StringGrid1_Row);
  if StringGrid1_Col = DATACOL then
    StringGrid1.Col := DATACOL;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if StringGrid1.Col <> 2 then
    StringGrid1.Col := 2;
  // Handled:=true;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if StringGrid1.Col <> 2 then
    StringGrid1.Col := 2;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  // StringGrid1.MouseToCell(X, Y, StringGrid1_Col, StringGrid1_Row);
  try
    with StringGrid1 do
    begin
      if ACol = CHECKCOL then
      begin
        if Options * [goEditing] <> [] then
          Options := Options - [goEditing];
        Options := Options + [goRowSelect];
        CanSelect := false;
        // Memo1.Lines.Add(IntToStr(ACol) + ',' + IntToStr(ARow) + ',False ' + boolToStr(CanSelect));
      end
      else
      begin
        CanSelect := true;
        Options := Options + [goEditing];
        if Options * [goRowSelect] <> [] then
          Options := Options - [goRowSelect];
        // Memo1.Lines.Add(IntToStr(ACol) + ',' + IntToStr(ARow) + ',True ' + boolToStr(CanSelect));
      end;
    end;
  Except
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGrid1SetEditText(Sender: TObject; ACol, ARow: LongInt; const Value: string);
begin
  UserDataLength := UserDataLength + Length(Value);
  if (UserDataLength >= 10) and (not Timer2.Enabled) then
  begin
    UserDataChanged := true;
    Timer2.Enabled := true;
    UserDataLength := 0;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGridSelectCell(ACol, ARow: Integer);
var
  GridRect: TGridRect;
begin
  StringGrid1.BeginUpdate;
  if (ACol = CHECKCOL) and (ARow > 0) then
  begin
    if StringGrid1.Cells[ACol, ARow] = '1' then
      StringGrid1.Cells[ACol, ARow] := '0'
    else if StringGrid1.Cells[ACol, ARow] = '0' then
      StringGrid1.Cells[ACol, ARow] := '1'
    else
      StringGrid1.Cells[ACol, ARow] := '0'
  end;

  if ((ACol = 1) OR (ACol = 0)) and (ARow > 0) then
  begin
    with GridRect do
    begin
      Top := ARow;
      Left := 0;
      Bottom := ARow;
      Right := 6;
    end;
    StringGrid1.Selection := GridRect;
    // StringGrid1.Options := StringGrid1.Options + [goRowSelect];
  end;
  StringGrid1.EndUpdate;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGridSave();
var
  Octopusini: TIniFile;
  s: String;
  i: Integer;
begin
  s := SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Octopus.ini';
  try
    Octopusini := TIniFile.Create(s);
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      Octopusini.WriteString('MyCustData', IntToStr(i) + '_2', StringGrid1.Cells[2, i]);
      // Octopusini.WriteString('MyCustData', IntToStr(i) + '_5', StringGrid1.Cells[5, i]);
    end;
  finally
    Octopusini.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StringGridLoad();
var
  Octopusini: TIniFile;
  s: String;
  i: Integer;
begin
  s := SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Octopus.ini';
  try
    Octopusini := TIniFile.Create(s);
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Cells[2, i] := Octopusini.ReadString('MyCustData', IntToStr(i) + '_2', '');
      // StringGrid1.Cells[5, i] := Octopusini.ReadString('MyCustData', IntToStr(i) + '_5', '');
    end;
  finally
    Octopusini.Free;
  end;
end;

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// uart
procedure TMainOctopusDebuggingDevelopmentForm.InitUartsParameters();
/// var
/// i: Integer;
begin
  // Self.ComboBoxEx1.Images := SettingPagesDlg.ComboBoxEx1.Images;
  // Self.ComboBoxEx1.Items := SettingPagesDlg.ComboBoxEx1.Items;

  Self.ComboBox1.Items := SettingPagesDlg.ComboBox1.Items;
  /// Self.ComboBox1.Items.Delete(0); // ɾ���Զ��岨����
  Self.ComboBox2.Items := SettingPagesDlg.ComboBox7.Items;
end;

procedure TMainOctopusDebuggingDevelopmentForm.InitUartsMenu(ParentMenu: TMenuItem; OnClicEvent: TOnClicEvent);
var
  i: Integer;
  MenuItem: TMenuItem;
  OcComPortObj: TOcComPortObj;
begin
  if ParentMenu.Count <> SettingPagesDlg.ComboBoxEx1.Items.Count then
  begin
    ParentMenu.Clear;
    for i := 0 to SettingPagesDlg.ComboBoxEx1.Items.Count - 1 do
    begin
      MenuItem := TMenuItem.Create(nil);
      OcComPortObj := SettingPagesDlg.getDeciceByIndex(i);
      if OcComPortObj <> nil then
      begin
        MenuItem.Caption := OcComPortObj.ComPortFullName;
        MenuItem.Tag := i;
        ParentMenu.Add(MenuItem);
        MenuItem.OnClick := OnClicEvent;
      end;
    end;
  end
  else if ParentMenu.Count = SettingPagesDlg.ComboBoxEx1.Items.Count then
  begin
    for i := 0 to ParentMenu.Count - 1 do
    begin
      MenuItem := ParentMenu.Items[i];
      OcComPortObj := SettingPagesDlg.getDeciceByIndex(i);
      if OcComPortObj <> nil then
      begin
        MenuItem.Caption := OcComPortObj.ComPortFullName;
        MenuItem.Tag := i;
        // ParentMenu.Add(MenuItem);
        MenuItem.OnClick := OnClicEvent;
      end
      else
      begin
        MenuItem.Caption := '-';
        MenuItem.Tag := i;
        MenuItem.OnClick := nil;
      end;
    end;
  end;

end;

/// function TMainForm.GetSelectedDeviceName(): String;
/// begin
/// Result := '';
/// if (ComboBoxEx1.Items.Count > 0) and (ComboBoxEx1.ItemIndex >= 0) then
/// Result := ComboBoxEx1.Items[ComboBoxEx1.ItemIndex];
/// end;

function TMainOctopusDebuggingDevelopmentForm.GetCurrentPageName(): String;
begin
  if Self.PageControl1.PageCount > 0 then
    Result := Self.PageControl1.GetActivePageName
  else
    Result := '';
end;

function TMainOctopusDebuggingDevelopmentForm.GetCurrentSelectedDevice(): TOcComPortObj;
var
  /// OcComPortObj: TOcComPortObj;
  ActivePageName: String;
begin
  ActivePageName := GetCurrentPageName();
  Result := SettingPagesDlg.GetDeciceByFullName(ActivePageName);
  /// Result := OcComPortObj;
end;

procedure TMainOctopusDebuggingDevelopmentForm.GetAndRemoveDevices(DeviceName: String);
var
  OcComPortObj: TOcComPortObj;
  ActivePageIndex: Integer;
begin
  OcComPortObj := SettingPagesDlg.GetDeciceByFullName(DeviceName);
  if OcComPortObj <> nil then
  begin
    SettingPagesDlg.closeDevice(DeviceName);
  end;
  ActivePageIndex := PageControl1.ActivePageIndex;
  PageControl1.DeletePage(DeviceName);
  ActivePageIndex := Max(0, PageControl1.PageCount - 1);
  PageControl1.ActivePageIndex := ActivePageIndex;
  CMyRichEdit := nil;
  SetPathFileName('');
  UpdateStatus('', 2);
end;

procedure TMainOctopusDebuggingDevelopmentForm.GetAndOpenADevices(DeviceName: String; AutoOpen: Boolean = true);
var
  OcComPortObj: TOcComPortObj;
  PageIndex: Integer;
begin
  OcComPortObj := SettingPagesDlg.GetDeciceByFullName(DeviceName);
  if OcComPortObj <> nil then
    GetAndOpenADevices(OcComPortObj);
end;

procedure TMainOctopusDebuggingDevelopmentForm.GetAndOpenADevices(OcComPortObj: TOcComPortObj; AutoOpen: Boolean = true);
var
  PageIndex: Integer;
  MyRichEdit: TMyMemo;
begin
  if OcComPortObj = nil then
    exit;
  CreateMyObjectPage(OcComPortObj.ComPortFullName, 2);
  MyRichEdit := PageControl1.GetMemo(OcComPortObj.ComPortFullName);
  MyRichEdit.FStyle := 1;
  OcComPortObj.SetLogComponent(MyRichEdit);
  OcComPortObj.SetMsgCallbackFunction(OcComPortObjCallBack);

  OcComPortObj.SetCacheComponent(SettingPagesDlg.PanelInternalCacheContainner);

  OcComPortObj.SaveLog(SettingPagesDlg.OctopusCfgDir_LogFilePath);
  SynchroSetMyRichEditFont(MyRichEdit);
  if not OcComPortObj.Connected and AutoOpen then
  begin
    SettingPagesDlg.openDevice(OcComPortObj);
  end;
  Self.UpdateUartToolBar();
end;

procedure TMainOctopusDebuggingDevelopmentForm.InitAllUartDevices();
var
  i: Integer;
  OcComPortObj: TOcComPortObj;
  MyRichEdit: TMyMemo;
begin
  WelcomeAndHelp1.Click;
  if ParamStr(1) <> '' then
    exit;
  /// 外部参数启动，作为文本编辑器器使用，不需要打开端口

  for i := 0 to SettingPagesDlg.ComboBoxEx1.Items.Count - 1 do
  begin
    OcComPortObj := SettingPagesDlg.getDeciceByIndex(i);
    if OcComPortObj = nil then
      exit;
    CreateMyObjectPage(OcComPortObj.ComPortFullName, 2);
    MyRichEdit := PageControl1.GetMemo(OcComPortObj.ComPortFullName);
    MyRichEdit.FStyle := 1;
    OcComPortObj.SetLogComponent(MyRichEdit);
    OcComPortObj.SetMsgCallbackFunction(OcComPortObjCallBack);

    OcComPortObj.SetCacheComponent(SettingPagesDlg.PanelInternalCacheContainner);

    ShowStartComments(OcComPortObj);
    SynchroSetMyRichEditFont(MyRichEdit);

    OcComPortObj.SaveLog(SettingPagesDlg.OctopusCfgDir_LogFilePath);
    if i >= 5 then
      break;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.CreateMyObjectPage(PageName: String; PageType: Integer);
var
  MyRichEdit: TMyRichEdit;
  PageIndex: Integer;
  Component: TComponent;
begin
  // 创建新页面并获取索引
  PageControl1.CreatePage(PageName, PageType);
  PageIndex := PageControl1.GetPageIndex(PageName);
  Component := PageControl1.GetComponent(PageIndex);
  PageControl1.ActivePageIndex := PageIndex;

  // 如果页面组件是 RichEdit，则进行初始化
  if Component is TMyRichEdit then
  begin
    MyRichEdit := TMyRichEdit(Component);
    // 事件绑定
    MyRichEdit.OnSelectionChange := Self.SelectionChange;
    MyRichEdit.OnClick := Self.RichEditorClick;
    MyRichEdit.OnLinkClick := Self.RichEditorLinkClick;

    // 上下文菜单
    MyRichEdit.PopupMenu := Self.PopupMenu1;

    // 编辑器配置
    MyRichEdit.PlainText := false; // 支持 RTF 格式
    MyRichEdit.ParentFont := false; // 独立字体，不继承父控件
    MyRichEdit.SpellChecking := true; // 启用拼写检查

    // 键盘输入配置
    // 这个属性只在Memo、RichEdit和DBMemo组件中使用。
    // 通常在切换当前焦点控件时，我们通常使用Tab键。
    // 但在上述三种组件中，编辑文本时常用Tab键来跳过若干个空格使文本对齐，这时就会有冲突。
    // 所以应将WantTabs设置为True，这样子在组件内就可以使用Tab键来编辑文本。
    MyRichEdit.WantTabs := true; // Tab 键输入制表符，而非切换焦点
    MyRichEdit.WantReturns := true; // 回车换行

    // 文字显示
    MyRichEdit.WordWrap := false; // 禁用自动换行，允许水平滚动
    MyRichEdit.OnChange := nil; // 初始时不绑定 OnChange 事件

    // StyleElements := [seClient, seBorder]; → 禁用字体样式，保留客户端和边框样式
    // StyleElements := []; → 禁用该控件的全部 VCL 样式（纯系统外观）
    // StyleElements := StyleElements - [seBorder]; → 关闭边框的样式，其他照旧
    MyRichEdit.StyleElements := [seClient, seBorder];
    Self.ComBoBoxFontName.ItemIndex := Self.ComBoBoxFontName.Items.IndexOf(MyRichEdit.Font.Name);
  end;

  // 如果是 WebBrowser 页，且 WebBrowser 尚未创建，则获取并缓存
  if (PageType = 1) and (WebBrowser = nil) then
  begin
    WebBrowser := PageControl1.GetWebBrowser(PageName);
  end;

  // 如果页面是 Memo 类型，预留事件绑定位置
  if Component is TMyMemo then
  begin
    // TMyMemo(Component).OnClick := Self.RichEditorClick;
    Self.ComBoBoxFontName.ItemIndex := Self.ComBoBoxFontName.Items.IndexOf(TMyMemo(Component).Font.Name);
  end;
end;

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// uart call back
procedure TMainOctopusDebuggingDevelopmentForm.OcComPortObjCallBack(Count: Integer);
begin
  StatusBarPrintFileSize();
end;

Procedure TMainOctopusDebuggingDevelopmentForm.SettingChangedCallBackFuntion(Obj: TObject; Action: Integer);
begin
  UpdateUartToolBar();
  InitUartsMenu(COMMenu, COM1MenuItemOnClick);
end;

procedure TMainOctopusDebuggingDevelopmentForm.EventCallBackFuntion(Obj: TObject);
begin
  try
    StatusBar1.Panels[1].Text := 'error!';
    TMyRichEdit(Obj).Font := FontDialog.Font;
    TMyRichEdit(Obj).SelStart := MaxInt;
  finally
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  X: Integer;
  str: String;
begin

  try
    if (Panel.Index = 1) and (Fprogress = 0) and (FprogressMax = 0) then
    begin
      str := OCTOPUS_DEFAULT_WEBSITE_ADDRESS1;
      with StatusBar1.Canvas do
      begin
        Brush.Color := clMenuBar;
        Font.Color := clBlack;
        Rectangle(Rect.Left, Rect.Top, Rect.Width, Rect.Height);
        TextOut(Rect.Left, Rect.Top, str);
        // TextOut(Rect.TopLeft.X+3,Rect.TopLeft.Y, str);
      end;
      exit;
    end;
    if (Panel.Index = 1) and (Fprogress >= 0) and (FprogressMax > 0) and (Fprogress <= FprogressMax) then
    begin
      str := IntToStr(Floor(Fprogress / FprogressMax * 100)) + '%';
      with StatusBar1.Canvas do
      begin
        Brush.Color := $00641F04;
        Font.Color := clWhite;
        X := Floor((Rect.Right - Rect.Left) * Fprogress / FprogressMax);
        Rectangle(Rect.Left, Rect.Top + 1, Rect.Left + X, Rect.Bottom - 1);

        if (Rect.Left + X > TextWidth(str)) then
          TextOut(Rect.Left + X - TextWidth(str) - 1, Rect.Top + 1, str);
        // TextOut(Rect.TopLeft.X+3,Rect.TopLeft.Y, str);
      end;
    end;
  Except
    ShowMessage('unknow error!');
  end;

end;

procedure TMainOctopusDebuggingDevelopmentForm.StatusBar1DrawProgress(progress: Integer; progressMax: Integer);
begin
  StatusBar1.Panels[1].Style := psOwnerDraw;
  Self.Fprogress := progress;
  Self.FprogressMax := progressMax;
  StatusBar1.Repaint;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StatusBar1MouseEnter(Sender: TObject);
begin
  StatusBar1.Panels[1].Width := 160;
end;

procedure TMainOctopusDebuggingDevelopmentForm.StatusBarPrintFileSize();
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if (OcComPortObj = nil) then
    exit;

  if not OcComPortObj.Connected then
  begin
    UpdateUartToolBar();
  end;

  StatusBar1.Panels.BeginUpdate;
  if (OcComPortObj.LogObject <> nil) then
  /// and (OcComPortObj.Connected)
  begin

    StatusBar1.Panels.Items[2].Text := OcComPortObj.Port + ' | Sent: ' + IntToStr(OcComPortObj.ComSentCount) + ' Bytes' + ' | Received: ' +
      IntToStr(OcComPortObj.ComReceiveCount) + ' Bytes' + ' | Processed: ' + IntToStr(OcComPortObj.ComProcessedCount) + ' Bytes' + ' | Total: ' +
      IntToStr(Length(OcComPortObj.LogObject.Text)) + ' Bytes' + ' | Line: ' + IntToStr(OcComPortObj.LogObject.CaretPos.Y) + ' | Lines: ' +
      IntToStr(OcComPortObj.LogObject.Lines.Count) + ' | Frames: ' + IntToStr(OcComPortObj.OctopusUartProtocol.GetFrameCount);

    // StatusBar1.Panels.EndUpdate;
  end
  else
  begin
    /// StatusBar1.Panels.Items[2].Text := OcComPortObj.Port + ' | Sent: ' + IntToStr(OcComPortObj.ComSentCount) + ' Bytes | ' + 'Received: ' + IntToStr(OcComPortObj.ComReceiveCount) + ' Bytes | ' +
    /// 'Processed: ' + IntToStr(OcComPortObj.ComProcessedCount) + ' Bytes | ' + 'Total: ' + IntToStr(Length(Memo1.Text)) + ' Bytes | ' + 'Line: ' + IntToStr(Memo1.CaretPos.Y) + ' | ' + 'Lines: ' +
    /// IntToStr(Memo1.Lines.Count) + ' | Packs: ' + IntToStr(OcComPortObj.GetPacks);
  end;
  StatusBar1.Panels.EndUpdate;
  /// StatusBar1.Update;
  /// Application.ProcessMessages;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ShowStartComments(OcComPortObj: TOcComPortObj);
begin
  OcComPortObj.DebugLog('#############################################################################');
  // OcComPortObj.DebugLog(APPLICATION_TITLE + FVersionNumberStr);
  OcComPortObj.DebugLog('Octopus Serial Port Development & Debugging Assistant ' + FVersionNumberStr);
  OcComPortObj.DebugLog('Home Page: ' + OCTOPUS_DEFAULT_WEBSITE_ADDRESS1 + ' ');
  OcComPortObj.DebugLog('#############################################################################');
  OcComPortObj.DebugLog('' + OcComPortObj.ComPortFullName + ' ');

  UpdateStatus(OCTOPUS_DEFAULT_WEBSITE_ADDRESS2, 0);
end;

procedure TMainOctopusDebuggingDevelopmentForm.SaveUserData(SavePrivate: Boolean);
var
  Octopusini: TIniFile;
  s: String;
  i: Integer;
  str: String;
begin
  if not SavePrivate then
    exit;

  if not DirectoryExists(SettingPagesDlg.OctopusCfgDir) then
    exit;

  if not DirectoryExists(IncludeTrailingPathDelimiter(SettingPagesDlg.OctopusCfgDir) + OCTOPUS_DEFAULT_CONFIGURATION_DIR) then
    exit;

  s := IncludeTrailingPathDelimiter(SettingPagesDlg.OctopusCfgDir) + IncludeTrailingPathDelimiter(OCTOPUS_DEFAULT_CONFIGURATION_DIR) + 'Octopus.ini';

  Octopusini := TIniFile.Create(s);
  try
    // 加锁，防止多线程访问冲突
    FCriticalSection.Enter;
    try
      for i := 1 to StringGrid1.RowCount - 1 do
      begin
        str := Trim(StringGrid1.Cells[2, i]);
        if str <> '' then
          Octopusini.WriteString('MyCustData', IntToStr(i) + '_2', str);
      end;
    finally
      FCriticalSection.Leave;
    end;
  finally
    Octopusini.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SaveProjectSetting(SavePrivate: Boolean);
var
  Octopusini: TIniFile;
  s: String;
  i: Integer;
  str: String;
begin
  try
    if not DirectoryExists(SettingPagesDlg.OctopusCfgDir) then
      CreateDir(SettingPagesDlg.OctopusCfgDir);
    if not DirectoryExists(SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR) then
      CreateDir(SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR);

    if SavePrivate then
    begin
      s := SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Octopus.ini';
      Octopusini := TIniFile.Create(s);

      for i := 1 to StringGrid1.RowCount - 1 do
      begin
        str := Trim(StringGrid1.Cells[2, i]);
        if str <> '' then
          Octopusini.WriteString('MyCustData', IntToStr(i) + '_2', str);
        /// Octopusini.WriteString('MyCustData', IntToStr(i) + '_6', StringGrid1.Cells[6, i]);
      end;

      /// if SkinMenuItem <> nil then
      /// str := GetStyle(TMenuItem(SkinMenuItem).Tag)
      /// else
      /// str := TStyleManager.StyleNames[0];

      Octopusini.WriteBool('MyPreference', 'APPLICATION_CHINESE_LANG', ChineseMenuItem.Checked);
      Octopusini.WriteString('MyPreference', 'APPLICATION_THEME_SKIN_NAME', FThemeSkinName);

      Octopusini.WriteBool('MyPreference', 'APPLICATION_ALPHA_BLEND', Self.AlphaBlend);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_ALPHA_VALUE', Self.AlphaBlendValue);

      Octopusini.WriteBool('MyPreference', 'APPLICATION_SVR_STATUS', SV_R.Opened);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_SVR_WIDTH', SV_R.Width);

      Octopusini.WriteString('MyPreference', 'APPLICATION_MAINUI_FONTNAME', MainOctopusDebuggingDevelopmentForm.Font.Name);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_MAINUI_FONTSIZE', MainOctopusDebuggingDevelopmentForm.Font.Size);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_MAINUI_FONTCOLOR', MainOctopusDebuggingDevelopmentForm.Font.Color);
      Octopusini.WriteString('MyPreference', 'APPLICATION_CONTENT_FONTNAME', FontDialog.Font.Name);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CONTENT_FONTSIZE', FontDialog.Font.Size);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CONTENT_FONTCOLOR', FontDialog.Font.Color);

      Octopusini.WriteBool('MyPreference', 'APPLICATION_STANDART_TOOLBAR1', StandardToolBar1.Visible);
      Octopusini.WriteBool('MyPreference', 'APPLICATION_STANDART_TOOLBAR2', StandardToolBar2.Visible);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_PAGECONTROL1', Ord(Self.PageControl1.TabPosition));
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_PAGECONTROL2', Ord(Self.PageControl2.TabPosition));
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_PAGECONTROL2_DEFAULT_INDEX', Ord(Self.PageControl2.ActivePageIndex));

      Octopusini.WriteBool('Configuration', 'APPLICATION_MENU_ITEM_EXPLORER', SettingPagesDlg.CheckBoxShortcutForExplorer.Checked);
      Octopusini.WriteBool('Configuration', 'APPLICATION_MENU_ITEM_DESKTOP', SettingPagesDlg.CheckBoxDesktopShortcutMenu.Checked);
      /// Octopusini.WriteString('Configuration', 'APPLICATION_VERSIONNUMBER64', FVersionNumberStr);

      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CUSTOM_WIDTH', Self.Width);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CUSTOM_HEIGHT', Self.Height);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CUSTOM_TOP', Self.Top);
      Octopusini.WriteInteger('MyPreference', 'APPLICATION_CUSTOM_LEFT', Self.Left);
    end;
  finally
    Octopusini.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.LoadProjectSetting();
var
  Octopusini: TIniFile;
  s: string;
  i: Integer;
  w, h, t, l: Integer;
  b: Boolean;
begin
  Octopusini := nil;
  if not DirectoryExists(SettingPagesDlg.OctopusCfgDir) then
    exit;
  s := SettingPagesDlg.OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Octopus.ini';
  if (not FileExists(s)) then
    exit;
  try
    Octopusini := TIniFile.Create(s);
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Cells[2, i] := Octopusini.ReadString('MyCustData', IntToStr(i) + '_2', '');
      /// StringGrid1.Cells[6, i] := Octopusini.ReadString('MyCustData', IntToStr(i) + '_6', '');
    end;

    w := Octopusini.ReadInteger('MyPreference', 'APPLICATION_CUSTOM_WIDTH', Self.Width);
    h := Octopusini.ReadInteger('MyPreference', 'APPLICATION_CUSTOM_HEIGHT', Self.Height);
    t := Octopusini.ReadInteger('MyPreference', 'APPLICATION_CUSTOM_TOP', Self.Top);
    l := Octopusini.ReadInteger('MyPreference', 'APPLICATION_CUSTOM_LEFT', Self.Left);
    if w < 100 then
      w := 100;
    if h < 200 then
      h := 200;

    if t < 0 then
      t := 10;
    if l < 0 then
      l := 10;

    Self.Width := w;
    Self.Height := h;
    Self.Top := t;
    Self.Left := l;

    b := Octopusini.ReadBool('MyPreference', 'APPLICATION_CHINESE_LANG', false);

    FThemeSkinName := Octopusini.ReadString('MyPreference', 'APPLICATION_THEME_SKIN_NAME', TStyleManager.StyleNames[0]);

    SV_R.Opened := Octopusini.ReadBool('MyPreference', 'APPLICATION_SVR_STATUS', false);
    SV_R.Width := Octopusini.ReadInteger('MyPreference', 'APPLICATION_SVR_WIDTH', SV_R.Width);

    StandardToolBar1.Visible := Octopusini.ReadBool('MyPreference', 'APPLICATION_STANDART_TOOLBAR1', false);
    StandardToolBar2.Visible := Octopusini.ReadBool('MyPreference', 'APPLICATION_STANDART_TOOLBAR2', true);

    i := Octopusini.ReadInteger('MyPreference', 'APPLICATION_PAGECONTROL1', 1);
    PageControl1.TabPosition := TTabPosition(i);
    i := Octopusini.ReadInteger('MyPreference', 'APPLICATION_PAGECONTROL2', 1);
    PageControl2.TabPosition := TTabPosition(i);

    i := Octopusini.ReadInteger('MyPreference', 'APPLICATION_PAGECONTROL2_DEFAULT_INDEX', 0);
    PageControl2.ActivePageIndex := i;

    /// FontDialog.Font.Name := Octopusini.ReadString('Configuration', 'CONTENT_FONTNAME', '新宋体');
    /// FontDialog.Font.Size := Octopusini.ReadInteger('Configuration', 'CONTENT_FONTSIZE', 14);
    /// FontDialog.Font.Color := Octopusini.ReadInteger('Configuration', 'CONTENT_FONTCOLOR', clBlack);
    /// FGColorBox.Selected := FontDialog.Font.Color;

    SettingPagesDlg.CheckBoxShortcutForExplorer.Checked := Octopusini.ReadBool('Configuration', 'APPLICATION_MENU_ITEM_EXPLORER', true);
    SettingPagesDlg.CheckBoxDesktopShortcutMenu.Checked := Octopusini.ReadBool('Configuration', 'APPLICATION_MENU_ITEM_DESKTOP', true);

    if FThemeSkinName <> '' then
      AdjustSetStyle(FThemeSkinName);

    Self.AlphaBlend := Octopusini.ReadBool('MyPreference', 'APPLICATION_ALPHA_BLEND', false);
    Self.AlphaBlendValue := Octopusini.ReadInteger('MyPreference', 'APPLICATION_ALPHA_VALUE', 238);

    if (b) then
    begin
      SettingPagesDlg.ComboBox8.ItemIndex := 1;
      SettingPagesDlg.UpdateLaunguage(Self);
    end
    else
    begin
      SettingPagesDlg.ComboBox8.ItemIndex := 0;
      SettingPagesDlg.UpdateLaunguage(Self);
    end;

  finally
    Octopusini.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.ShowSearchDialog();
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := Self.GetCurrentSelectedDevice();
  if (OcComPortObj <> nil) and (OcComPortObj.LogObject <> nil) then
  begin
    with FindDialog1 do
    begin
      Left := Self.Left + 600;
      Top := Self.Top + 150;
      FindText := OcComPortObj.LogObject.SelText;
      Execute;
    end;
  end
  else if (CMyRichEdit <> nil) then
  begin
    with FindDialog1 do
    begin
      Left := Self.Left + 600;
      Top := Self.Top + 150;
      FindText := CMyRichEdit.SelText;
      Execute;
    end;
  end;
end;

function TMainOctopusDebuggingDevelopmentForm.SearchTextFrom(Component: TComponent; const SearchString: string; Options: TFindOptions): Boolean;
var
  Size: Integer;
  buffer, p: PChar;
begin
  Result := false;
  if Length(SearchString) = 0 then
    exit;
  if Component is TMyMemo then
  begin
    Size := TMemo(Component).GetTextLen;
    if (Size = 0) then
      exit;

    buffer := System.SysUtils.StrAlloc(Size + 1);
    try
      TMemo(Component).GetTextBuf(buffer, Size + 1);
      if frDown in Options then
        p := SearchBuf(buffer, Size, TMemo(Component).SelStart, TMemo(Component).SelLength, SearchString, [soDown])
      else
        p := SearchBuf(buffer, Size, TMemo(Component).SelStart, TMemo(Component).SelLength, SearchString, []);

      if (frMatchCase in Options) then
        p := SearchBuf(buffer, Size, TMemo(Component).SelStart, TMemo(Component).SelLength, SearchString, [soMatchCase]);

      if (frWholeWord in Options) then
        p := SearchBuf(buffer, Size, TMemo(Component).SelStart, TMemo(Component).SelLength, SearchString, [soWholeWord]);

      if p <> nil then
      begin
        TMemo(Component).SelStart := p - buffer;
        TMemo(Component).SelLength := Length(SearchString);
        Result := true;
      end;
    finally
      System.SysUtils.StrDispose(buffer);
    end;
  end;

  if Component is TMyRichEdit then
  begin
    Size := TMyRichEdit(Component).GetTextLen;
    if (Size = 0) then
      exit;

    buffer := System.SysUtils.StrAlloc(Size + 1);
    try
      TMyRichEdit(Component).GetTextBuf(buffer, Size + 1);
      if frDown in Options then
        p := SearchBuf(buffer, Size, TMyRichEdit(Component).SelStart, TMyRichEdit(Component).SelLength, SearchString, [soDown])
      else
        p := SearchBuf(buffer, Size, TMyRichEdit(Component).SelStart, TMyRichEdit(Component).SelLength, SearchString, []);

      if (frMatchCase in Options) then
        p := SearchBuf(buffer, Size, TMyRichEdit(Component).SelStart, TMyRichEdit(Component).SelLength, SearchString, [soMatchCase]);

      if (frWholeWord in Options) then
        p := SearchBuf(buffer, Size, TMyRichEdit(Component).SelStart, TMyRichEdit(Component).SelLength, SearchString, [soWholeWord]);

      if p <> nil then
      begin
        TMyRichEdit(Component).SelStart := p - buffer;
        TMyRichEdit(Component).SelLength := Length(SearchString);
        Result := true;
      end;
    finally
      System.SysUtils.StrDispose(buffer);
    end;
  end;
end;

function CalculateHexChecksum(Line: String): byte;
var
  i, Sum, ByteValue: Integer;
begin
  Sum := 0;

  // 从第2个字符开始处理（跳过冒号），长度是整行的字符长度减去最后2个字符（校验和）
  i := 2;
  while i < Length(Line) - 1 do
  begin
    // 取两个字符作为一个字节，并转换为整数
    ByteValue := StrToInt('$' + Copy(Line, i, 2));
    Inc(Sum, ByteValue);
    Inc(i, 2); // 手动增加步长
  end;

  // 计算补码
  Result := byte((-Sum) and $FF);
end;

function ValidateHexFile(FileName: String; out FirstAddress: UInt32; out DataLength: UInt32): Boolean;
var
  SL: TStringList;
  i: Integer;
  LineStr: String;
  Checksum: byte;
  FileChecksum: byte;
  ByteCount, Address, RecordType: Word;
  DataStr: String;
begin
  Result := true;
  FirstAddress := 0;
  DataLength := 0;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);

    for i := 0 to SL.Count - 1 do
    begin
      LineStr := Trim(SL.Strings[i]);
      if (Length(LineStr) < 11) or (LineStr[1] <> ':') then
      begin
        Result := false;
        exit;
      end;

      // 校验和验证
      Checksum := CalculateHexChecksum(LineStr);
      FileChecksum := StrToInt('$' + Copy(LineStr, Length(LineStr) - 1, 2));
      if Checksum <> FileChecksum then
      begin
        Result := false;
        exit;
      end;

      RecordType := StrToInt('$' + Copy(LineStr, 8, 2)); // 2 chars = 1 byte
      ByteCount := StrToInt('$' + Copy(LineStr, 2, 2)); // 2 chars = 1 byte
      if RecordType = 0 then // Data record
        DataLength := DataLength + ByteCount;
      // 只处理第一行
      if i = 0 then
      begin
        Address := StrToInt('$' + Copy(LineStr, 4, 4)); // 4 chars = 2 bytes
        DataStr := Copy(LineStr, 10, ByteCount * 2); // 2 chars per byte

        case RecordType of
          0: // Data record
            begin
              FirstAddress := Address; // Relative, usually needs base
            end;
          4: // Extended linear address
            begin
              FirstAddress := StrToInt('$' + DataStr) shl 16;
            end;
        end;
      end;

    end;
  finally
    SL.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SendFileAsHex(OcComPortObj: TOcComPortObj; FileName: String);
var
  SL: TStringList;
  LineStr, DataType, TempStr: String;
  DynamicData: array of byte;
  BaseAddress, Checksum: Cardinal;
  i, DataLen, bCount: Integer;
  Frame: TOctopusUARTFrame;
  StatusOK: Boolean;
  SendCount: Integer;
  TotalLength: Integer;
  FileValidDataSize: UInt32;
  TotalCRC, LineCRC: Integer;
  ParseResult: Boolean;
  FirstAddress: UInt32;

  // :10 0000 00 F02C0020 D5000108 ED1C0108 41140108 66
  // ↑ ↑↑↑↑ ↑ ↑       ←16字节数据→              ↑ 校验和
  // |  |   |__  记录类型 00：数据记录
  // |  |_______ 偏移地址 0x0000
  // |__________ 数据长度 0x10（16 字节）

  function ParseHexLine(Line: String): Boolean;
  var
    // DataLen: Integer;
    DataType, TempStr: String;
    Address: dword; // 用于存储解析出的地址（16位，2字节）
    bCount: Integer;
  begin
    Result := false;

    // 校验行格式是否正确
    if (Line[1] <> ':') or (Length(Line) < 11) then
    begin
      OcComPortObj.Log('Invalid line format: ' + Line);
      exit;
    end;

    // 获取数据长度
    TempStr := Copy(Line, 2, 2);
    try
      DataLen := StrToInt('$' + TempStr);
    except
      on E: Exception do
      begin
        OcComPortObj.Log('Invalid data length in line: ' + Line);
        exit;
      end;
    end;

    // 获取地址部分（前2个字节是地址）
    TempStr := Copy(Line, 4, 4); // 地址占用 2 字节（4 个十六进制字符）
    Address := StrToInt('$' + TempStr); // 解析为地址
    Address := (BaseAddress) + Address;

    // 获取记录类型
    TempStr := Copy(Line, 8, 2);
    DataType := TempStr;

    // 处理数据记录
    if DataType = '00' then
    begin
      // 获取数据部分（跳过地址部分后才是数据）
      TempStr := Copy(Line, 10, DataLen * 2); // 数据段（从第 10 字符开始，长度为 DataLen*2）

      // 设置数据段大小，2 个字节的地址 + 数据部分
      DataLen := DataLen + 4;
      SetLength(DynamicData, DataLen); // 帧数据字段前4个字节为地址，后面为HEX数据

      // 将地址放到数据段的前 4 字节
      Move(Address, DynamicData[0], 4);
      // 设置数据部分
      FormatHexStrToBuffer(TempStr, DynamicData[4], bCount);
      Result := true;
    end
    else if DataType = '04' then
    begin
      // 扩展地址类型：获取扩展地址的 4 字节
      TempStr := Copy(Line, 10, 4);
      // SetLength(DynamicData, 4); // 假设扩展地址的高位需要 2 字节
      // FormatHexStrToBuffer(TempStr, DynamicData, bCount);

      BaseAddress := StrToInt('$' + TempStr); // MakeDWord(MakeWord(DynamicData[0], DynamicData[1]), 0);
      BaseAddress := BaseAddress shl 16;
      // 返回 False，因为扩展地址不需要发送数据
      Result := false;
    end
    else if DataType = '01' then
    begin
      // 结束行：如果是结束行，则不需要处理任何数据
      Result := false;
    end
    else
    begin
      // 处理未知类型：记录并跳过该行
      OcComPortObj.Log('Unknown data type in line: ' + Line);
      Result := false;
    end;
  end;

begin

  if (not ValidateHexFile(FileName, FirstAddress, FileValidDataSize)) then
  begin
    ShowMessage('The hex file is not good,maybe has been modified!!!!');
    exit;
  end;

  if (FileValidDataSize <= 0) then
  begin
    ShowMessage('The hex file with a wrong size,FileValidDataSize=' + IntToStr(FileValidDataSize));
    exit;
  end;

  OcComPortObj.Log(FileName + ' checked sucessfully');
  BaseAddress := $00000000;
  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    if not OcComPortObj.Connected then
    begin
      OcComPortObj.Log('Device was closed, please open a device.');
      exit
    end;

    OcComPortObj.OctopusUartProtocol.ClearFrame();
    // 发送启动更新命令
    SetLength(DynamicData, 8);
    Move(FirstAddress, DynamicData[0], 4);
    Move(FileValidDataSize, DynamicData[4], 4);
    Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_ENTER_FW_UPGRADE_MODE, DynamicData, 8);
    StatusOK := OcComPortObj.SendProtocolPackageWaitACKCommand(@Frame, Ord(FRAME_CMD_UPDATE_REQUEST_FW_DATA));
    if not StatusOK then
    begin
      OcComPortObj.Log('Device is not ready to receive file!');
      exit;
    end;

    TotalLength := 0;
    SendCount := 0;
    TotalCRC := $FFFFFFFF; // 初始化为全 1，表示开始时 CRC 值
    // 遍历 HEX 文件
    for i := 0 to SL.Count - 1 do
    begin
      Application.ProcessMessages;
      if not OcComPortObj.Connected then
        break;

      LineStr := SL.Strings[i];
      ParseResult := ParseHexLine(LineStr);
      if (DataLen > 100) then
      begin
        OcComPortObj.Log('parse hex file failed! at ' + IntToStr(i));
        break;
      end;

      if ParseResult then
      begin
        // 构建并发送数据包
        Inc(SendCount);
        TotalLength := TotalLength + DataLen - 4;
        Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_SEND_FW_DATA, DynamicData, DataLen);
        StatusOK := OcComPortObj.SendProtocolPackageWaitACKCommand(@Frame, Ord(FRAME_CMD_UPDATE_REQUEST_FW_DATA), Ord(MCU_UPDATE_STATE_RECEIVING), SendCount);
        if not StatusOK then
        begin
          OcComPortObj.Log('Transmission failed at line no responese ' + IntToStr(SendCount) + '/' + IntToStr(i + 1) + '/' + IntToStr(SL.Count));
          exit;
        end;
        TotalCRC := UpdateCRC32(DynamicData, 4, DataLen - 4, TotalCRC);
      end;

      StatusBar1DrawProgress(i + 1, SL.Count);
    end; // for i := 0 to SL.Count - 1 do

    TotalCRC := TotalCRC xor $FFFFFFFF; // 确保最后的 CRC 是 32 位
    SetLength(DynamicData, 8);
    Move(TotalCRC, DynamicData[0], 4);
    Move(TotalLength, DynamicData[4], 4);
    Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_EXITS_FW_UPGRADE_MODE, DynamicData, 8);
    StatusOK := OcComPortObj.SendProtocolPackage(@Frame);
    if FileValidDataSize = FileValidDataSize then
    begin
      StatusBar1DrawProgress(SL.Count, SL.Count);
      OcComPortObj.Log('File transmission completed successfully! CRC:' + IntToHex(TotalCRC, 4) + ' TotalLength:' + IntToStr(TotalLength) + ' FileSize:' +
        IntToStr(FileValidDataSize));
    end
    else
    begin
      OcComPortObj.Log('File transmission interruption! CRC:' + IntToHex(TotalCRC, 4) + ' TotalLength:' + IntToStr(TotalLength) + ' FileSize:' +
        IntToStr(FileValidDataSize));
    end;

  finally
    SL.Free;
  end;
end;

procedure TMainOctopusDebuggingDevelopmentForm.SendFileAsBin(OcComPortObj: TOcComPortObj; FileName: String);
const
  BLOCK_SIZE = 48; // 每次发送的数据长度
var
  FS: TFileStream;
  Frame: TOctopusUARTFrame;
  DynamicData: array of byte;
  ReadAddress, BankAddress, MappingAdress: UInt32;
  TotalLength: Integer;
  TotalCRC: Cardinal;
  buffer: array [0 .. BLOCK_SIZE - 1] of byte;
  BytesRead: Integer;
  SendCount: Integer;
  StatusOK: Boolean;
begin
  if not FileExists(FileName) then
  begin
    ShowMessage('BIN file does not exist: ' + FileName);
    exit;
  end;

  if not OcComPortObj.Connected then
  begin
    ShowMessage('Device is not connected.');
    exit;
  end;

  FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    OcComPortObj.OctopusUartProtocol.ClearFrame;
    TotalLength := FS.Size;
    ReadAddress := 0;
    BankAddress := 0;
    SendCount := 0;
    TotalCRC := $FFFFFFFF;
    if TotalLength < 8 then
      exit;

    FS.Position := 4;
    FS.ReadBuffer(BankAddress, 4);
    BankAddress := BankAddress and $FFFF0000;
    MappingAdress := BankAddress;
    // 发送启动升级帧：首地址为 0，总长度为文件大小
    SetLength(DynamicData, 8);
    Move(BankAddress, DynamicData[0], 4);
    Move(TotalLength, DynamicData[4], 4);
    Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_ENTER_FW_UPGRADE_MODE, DynamicData, 8);
    StatusOK := OcComPortObj.SendProtocolPackageWaitACKCommand(@Frame, Ord(FRAME_CMD_UPDATE_REQUEST_FW_DATA));
    if not StatusOK then
    begin
      OcComPortObj.Log('Device is not ready to receive bin file.');
      FS.Free;
      exit;
    end;

    FS.Position := 0;
    ReadAddress := 0;
    while FS.Position < FS.Size do
    begin
      BytesRead := FS.Read(buffer, BLOCK_SIZE);
      if BytesRead <= 0 then
        break;

      Inc(SendCount);

      SetLength(DynamicData, 4 + BytesRead);
      MappingAdress := BankAddress + ReadAddress;
      Move(MappingAdress, DynamicData[0], 4); // 前4字节是地址
      Move(buffer, DynamicData[4], BytesRead); // 后续为数据

      Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_SEND_FW_DATA, DynamicData, Length(DynamicData));

      StatusOK := OcComPortObj.SendProtocolPackageWaitACKCommand(@Frame, Ord(FRAME_CMD_UPDATE_REQUEST_FW_DATA), Ord(MCU_UPDATE_STATE_RECEIVING), SendCount);
      if not StatusOK then
      begin
        OcComPortObj.Log('Transmission failed at offset: ' + IntToStr(ReadAddress));
        FS.Free;
        exit;
      end;

      TotalCRC := UpdateCRC32(DynamicData, 4, BytesRead, TotalCRC); // 从地址后数据部分开始计算
      Inc(ReadAddress, BytesRead);
      StatusBar1DrawProgress(ReadAddress, TotalLength);
      Application.ProcessMessages;
    end;

    // 最后一帧：发送退出+CRC+总长度
    TotalCRC := TotalCRC xor $FFFFFFFF;
    SetLength(DynamicData, 8);
    Move(TotalCRC, DynamicData[0], 4);
    Move(TotalLength, DynamicData[4], 4);
    Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_EXITS_FW_UPGRADE_MODE, DynamicData, 8);
    StatusOK := OcComPortObj.SendProtocolPackage(@Frame);

    if StatusOK then
    begin
      OcComPortObj.Log('BIN file sent successfully. CRC=' + IntToHex(TotalCRC, 8));
    end
    else
    begin
      OcComPortObj.Log('BIN file send failed at finalization step.');
    end;

  finally
    if FS <> nil then
      FS.Free;
  end;
end;

initialization

FCriticalSection := TCriticalSection.Create;

finalization

FCriticalSection.Free;

end.
