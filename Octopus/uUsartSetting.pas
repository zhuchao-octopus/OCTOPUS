unit uUsartSetting;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.ShlObj,
  Winapi.ActiveX,

  System.SysUtils,
  System.Classes,
  System.ImageList,
  System.Math,
  System.Win.ComObj,

  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,

  Vcl.ImgList,
  Vcl.MyPageEdit,
  Vcl.Menus,
  Vcl.Grids,
  Vcl.Mask,

  Registry,

  GlobalFunctions,
  uOcComPortObj;

type
  TSettingChangedCallBackFuntion = Procedure(Obj: TObject; Action: integer) of object;

  TSettingPagesDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Panel6: TPanel;
    Panel11: TPanel;
    Panel23: TPanel;
    Label111: TLabel;
    Label110: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Edit2: TEdit;
    CheckBox8: TCheckBox;
    CheckBox7: TCheckBox;
    Panel24: TPanel;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    Panel17: TPanel;
    Panel3: TPanel;
    Button3: TButton;
    ComboBoxEx1: TComboBoxEx;
    Panel19: TPanel;
    Label105: TLabel;
    Label104: TLabel;
    Label103: TLabel;
    Label102: TLabel;
    Label101: TLabel;
    Label100: TLabel;
    Label106: TLabel;
    ComboBox6: TComboBox;
    ComboBox5: TComboBox;
    ComboBox4: TComboBox;
    ComboBox3: TComboBox;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBox7: TComboBox;
    Panel20: TPanel;
    CBReceivingCodePage: TComboBox;
    CBAlignmentMode: TComboBox;
    Label109: TLabel;
    CBSendCodePage: TComboBox;
    Label108: TLabel;
    Label107: TLabel;
    ImageList1: TImageList;
    Button2: TButton;
    Timer1: TTimer;
    Button5: TButton;
    Button4: TButton;
    Button6: TButton;
    CheckBox2: TCheckBox;
    ColorBoxContentBG: TColorBox;
    ColorBoxText: TColorBox;
    Label112: TLabel;
    Label113: TLabel;
    ComboBox8: TComboBox;
    Label114: TLabel;
    CheckBoxShortcutForExplorer: TCheckBox;
    CheckBoxDesktopShortcutMenu: TCheckBox;
    FontDialogConsole: TFontDialog;
    Label115: TLabel;
    Edit3: TEdit;
    UpDown3: TUpDown;
    PanelInternalCacheContainner: TPanel;
    Button7: TButton;
    CheckboxProcessDataBackground: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxEx1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ColorBoxTextChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    OcComPortDeviceList: TStringList;

    /// CurrentLaunguage: Integer;
    procedure WMDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;
  public
    { Public declarations }
    SelectedOcComPortObj: TOcComPortObj;
    /// 系统端口列表
    OctopusCfgDir: String;
    OctopusCfgDir_LogFilePath: String;
    VersionNumberStr: String;
    WindowsVersion: String;

    AlphaBlendValue: integer;
    AlphaBlend: Boolean;

    SettingChangedCallBackFuntion: TSettingChangedCallBackFuntion;

    procedure updateSystemDevicesList(DevideName: String = ''; ActionType: integer = $8000);

    function getCurrentDeviceName(): String;

    function getDeciceByPort(Port: string): TOcComPortObj;
    function getDeciceByFullName(DeviceName: string): TOcComPortObj;
    function getDeciceByIndex(Index: integer): TOcComPortObj;
    function getAvailableDevice(): TOcComPortObj;
    function getCurrentDevice(): TOcComPortObj;

    function openDevice(OcComPortObj: TOcComPortObj): Boolean; overload;
    function openDevice(DeviceFullName: String): TOcComPortObj; overload;
    function openDevice(DeviceFullName: String; LogMemo: TMyMemo): TOcComPortObj; overload;
    function openDeviceRandom(): TOcComPortObj;

    procedure CloseDevice(DeviceFullName: String); overload;
    procedure CloseDevice(OcComPortObj: TOcComPortObj); overload;

    procedure SaveDeviceSetting(OcComPortObj: TOcComPortObj);
    procedure LoadDeviceSetting(OcComPortObj: TOcComPortObj);
    procedure SaveAllComPortLogData(DoClose: Boolean);

    procedure ApplyCodePageSetting(OcComPortObj: TOcComPortObj);
    procedure ApplyOcComPortObjAtrribute(OcComPortObj: TOcComPortObj);

    procedure LoadLaunguageFromFile(Form: TForm; const Path: String; Create: Boolean);
    procedure LoadOrCreateLaunguageFromFile(Form: TForm; Create: Boolean);

    procedure UpdateLaunguage(Form: TForm);
  end;

  /// const
  /// APPLICATION_TITLE_NAME = 'Octopus Serial Port Debugging and Development Assistant';
  /// APPLICATION_EXPLORER_MENU_NAME = 'Edit With Octopus Development Assistant';
  /// UPGRADING_URL = 'http://47.106.172.94:8090/zhuchao/octopus/devices/getDeviceInfor';

var
  SettingPagesDlg: TSettingPagesDlg;

function ExtractFileNameNoExt(FilePathName: String): String;
function GetSystemDateTimeStampStr(): string;
function CreateShortcut(Exe: string; Lnk: string = ''; Dir: string = ''; ID: integer = -1): Boolean;
procedure AddExplorerContextMenu(const MenuName, PathFileName: string);
procedure RemoveExplorerContextMenu(const MenuName: string);

const
{$IFDEF CPU64BITS}
  APPLICATION_TITLE_CN = '八爪鱼串口调试开发助手 64bit '; // for 64 bit;
{$ELSE}
  APPLICATION_TITLE_CN = '八爪鱼串口调试开发助手 32bit '; // for 32 bit;
{$ENDIF}
  OCTOPUS_DEFAULT_E_MAIL = 'Octopus@1234998.cn';
  OCTOPUS_DEFAULT_CONFIGURATION_DIR = '\Setting\';
  OCTOPUS_DEFAULT_LOG_DIR = '\Logs\';

  OCTOPUS_DEFAULT_WEBSITE_ADDRESS1 = 'http://www.1234998.cn';
  OCTOPUS_DEFAULT_WEBSITE_ADDRESS2 = 'http://www.1234998.top';

  OCTOPUS_UPGRADING_URL = 'http://47.106.172.94:8090/zhuchao/octopus/devices/getDeviceInfor';
  OCTOPUS_APPLICATION_TITLE_NAME = 'Octopus Usart Debugging and Development Assistant';
  OCTOPUS_DEBUGGING_AND_DEVELOPMENT_CLASSNAME = 'TMainOctopusDebuggingDevelopmentForm';

{$IFDEF CPU64BITS}
  OCTOPUS_SYSTEM_DESKTOP_SHORTCUT_NAME = 'Octopus Usart Developer Assistant'; // for 64 bit;
  OCTOPUS_SYSTEM_EXPLORER_MENU_NAME = 'Edit With Octopus Development Assistant';
{$ELSE}
  OCTOPUS_SYSTEM_DESKTOP_SHORTCUT_NAME = 'Octopus Usart Development Assistant 32'; // for 32 bit;
  OCTOPUS_SYSTEM_EXPLORER_MENU_NAME = 'Edit With Octopus Development Assistant';
{$ENDIF}

implementation

{$R *.dfm}

uses ocPcDeviceMgt, IniFiles, uOctopusFunction, CPort, CPortCtl, uDeviceMaintence;

function GetSystemDateTimeStampStr(): string;
var
  // lpSystemTime:TSystemTime;
  LocalSystemTime: _SYSTEMTIME;
begin
  Result := '';
  // Getsystemtime(lpSystemTime);
  GetLocalTime(LocalSystemTime);
  // Result:=Format('[%0.4d\%0.2d\%0.2d\%0.2d:%0.2d:%0.2d] ',[lpSystemTime.wYear,lpSystemTime.wMonth,lpSystemTime.wDay,lpSystemTime.wHour,lpSystemTime.wMinute,lpSystemTime.wSecond]);
  Result := Format('%0.4d%0.2d%0.2d_%0.2d%0.2d%0.2d', [LocalSystemTime.wYear, LocalSystemTime.wMonth, LocalSystemTime.wDay, LocalSystemTime.wHour,
    LocalSystemTime.wMinute, LocalSystemTime.wSecond]);
end;

function FirstDriveFromMask(unitmask: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to 25 do
  begin
    if Boolean(unitmask and 1) then
      Result := Result + Char(integer('A') + i);
    unitmask := unitmask shr 1;
  end;
end;

function FalconGetComPort(DriverName: string): string;
var
  ss: string;
  i1, i2: integer;
  pStr: PChar;
begin
  DriverName := Trim(DriverName);
  pStr := StrRScan(PChar(DriverName), 'C');
  if (Pos('COM', pStr) > 0) then
  begin
    i1 := 1;
    i2 := Pos(')', pStr);
    if ((i2 - i1) > 1) then
    begin
      ss := Copy(pStr, i1, i2 - i1);
    end;
  end
  else if (Pos('PID', DriverName) > 0) then
    ss := Copy(DriverName, Pos('PID', DriverName), 10)
  else
    ss := '';

  Result := ss;
end;

procedure TSettingPagesDlg.WMDeviceChange(var Msg: TMessage);
var
  pHDR: PDEV_BROADCAST_HDR;
  pVOLUME: PDEV_BROADCAST_VOLUME;
  pOEM: PDEV_BROADCAST_OEM;
  pPORT: PDEV_BROADCAST_PORT;
  // dvName: string;
  DeviceType: string; // 设备类型，媒体设备，网络驱动器
  // DeviceAction: string; // 设备动作
  DeviceName: string; // 设备磁盘名
  // MCIO              : TMCI_Open_Parms;      //MMSystem
begin
  pPORT := nil;
  DeviceName := '';
  pHDR := PDEV_BROADCAST_HDR(Msg.LParam);
  if pHDR = nil then
    exit;
  // Log('Change= ' + inttostr(pHDR^.dbch_devicetype));
  case pHDR^.dbch_devicetype of
    DBT_DEVTYP_VOLUME:
      begin
        pVOLUME := PDEV_BROADCAST_VOLUME(pHDR);
        DeviceName := IntToHex(pVOLUME^.dbcv_unitmask, 8);
        if Boolean(pVOLUME^.dbcv_flags and DBTF_MEDIA) then
        begin
          DeviceType := 'Media Device ';
        end
        else
        begin
          if Boolean(pVOLUME^.dbcv_flags and DBTF_NET) then
          begin
            DeviceType := 'Network Drive ';
          end
          else
            DeviceType := 'Unknown device type 0x' + IntToHex(pVOLUME^.dbcv_flags, 8) + ' ';
        end;

        DeviceName := FirstDriveFromMask(pVOLUME^.dbcv_unitmask) + ':';

        case GetDriveType(PChar(DeviceName)) of
          DRIVE_UNKNOWN:
            DeviceType := DeviceType + 'Unknown device type ';
          DRIVE_NO_ROOT_DIR:
            DeviceType := DeviceType + 'The root directory does not exist';
          DRIVE_REMOVABLE:
            DeviceType := DeviceType + 'Removable';
          DRIVE_FIXED:
            DeviceType := DeviceType + 'Unremovable';
          DRIVE_REMOTE:
            DeviceType := DeviceType + 'Network';
          DRIVE_CDROM:
            DeviceType := DeviceType + 'CDROM';
          DRIVE_RAMDISK:
            DeviceType := DeviceType + 'RAM';
        end; // Case GetDriveType(PChar(DeviceName)) Of
      end; // DBT_DEVTYP_VOLUME
    DBT_DEVTYP_OEM:
      begin
        DeviceType := 'OEM- or IHV-defined device type. ';
        pOEM := PDEV_BROADCAST_OEM(pHDR);
        DeviceName := IntToHex(pOEM^.dbco_identifier, 8);
      end;
    DBT_DEVTYP_PORT:
      begin
        DeviceType := 'Port device (serial port) ';
        pPORT := PDEV_BROADCAST_PORT(pHDR);
        DeviceName := pPORT^.dbcp_name;
      end;
  end;

  case Msg.wParam of
    DBT_DEVNODES_CHANGED:
      begin
        // Log('Change.');
      end;
    DBT_DEVICEARRIVAL:
      begin
        if (pPORT <> nil) and (DeviceName <> '') then
        begin
          // Log0('Device ' + DeviceName + ' attached' + #13#10);
          updateSystemDevicesList(DeviceName, DBT_DEVICEARRIVAL);
        end;
      end;
    DBT_DEVICEREMOVECOMPLETE:
      begin
        if (pPORT <> nil) and (DeviceName <> '') then
        begin
          // Log0('Device ' + DeviceName + ' unattached');
          updateSystemDevicesList(DeviceName, DBT_DEVICEREMOVECOMPLETE);
        end;
      end;

    DBT_DEVICEREMOVEPENDING:
      begin

      end;
  end;
end;

procedure TSettingPagesDlg.updateSystemDevicesList(DevideName: String = ''; ActionType: integer = $8000);
var
  imageId, i: integer;
  devideNameList: TStringList;
  OcComPortObj: TOcComPortObj;
  s: String;
  iniFile: TIniFile;
begin
  try
    ImageList1.Clear;

    if OcComPortDeviceList = nil then
      OcComPortDeviceList := TStringList.Create;

    devideNameList := TStringList.Create;
    imageId := 0;
    OcComPortObj := nil;

    GetTheHardDevice('ports', ImageList1, devideNameList, imageId);

    if DevideName <> '' then
      OcComPortObj := getDeciceByPort(DevideName);

    if (OcComPortObj <> nil) and (ActionType = DBT_DEVICEREMOVECOMPLETE) then
    begin
      OcComPortObj.DebugLog(OcComPortObj.ComPortFullName + ' has been removed from the system!');
      if OcComPortObj.Connected then
        CloseDevice(OcComPortObj);
      /// if Assigned(SettingChangedCallBackFuntion) then
      /// SettingChangedCallBackFuntion(OcComPortObj,DBT_DEVICEREMOVECOMPLETE);
      /// 关闭移除的设备
    end;

    /// 更新设备列表
    ComboBoxEx1.Clear;
    ComboBoxEx1.Images := ImageList1;
    /// 内部设备列表
    for i := 0 to devideNameList.Count - 1 do // 当前可用列表
    begin
      if ComboBoxEx1.Items.IndexOf(devideNameList.Strings[i]) < 0 then
      /// 只增加不删除,ComboBoxEx1
      begin
        // ComboBoxEx1.ItemsEx.BeginUpdate;
        ComboBoxEx1.ItemsEx.AddItem(devideNameList.Strings[i], imageId, imageId, imageId, -1, nil);
        ComboBoxEx1.ItemsEx.EndUpdate;
        // ComboBoxEx1.ItemsEx.Items[i].ImageIndex := imageId;
      end;

      OcComPortDeviceList.BeginUpdate;
      if (OcComPortDeviceList.IndexOf(devideNameList.Strings[i])) < 0 then
      /// 只增加不删除,增加到内部列表
      begin
        OcComPortObj := TOcComPortObj.Create(self, devideNameList.Strings[i]);
        OcComPortDeviceList.AddObject(devideNameList.Strings[i], OcComPortObj);
        /// 导入设备配置信息
        s := OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + OcComPortObj.ComPortFullName + '.ini';
        OcComPortObj.LoadSettings(stIniFile, s);
        LoadDeviceSetting(OcComPortObj);
      end;
      OcComPortDeviceList.EndUpdate;
    end;

    OcComPortDeviceList.BeginUpdate;
    for i := 0 to OcComPortDeviceList.Count - 1 do
    begin
      if (i >= OcComPortDeviceList.Count) then
        break;

      if (devideNameList.IndexOf(OcComPortDeviceList.Strings[i])) < 0 then
        OcComPortDeviceList.Delete(i);
    end;
    OcComPortDeviceList.EndUpdate;

    ComboBoxEx1.ItemsEx.BeginUpdate;
    for i := 0 to ComboBoxEx1.GetCount - 1 do
    begin
      if (i >= ComboBoxEx1.GetCount) then
        break;

      if (devideNameList.IndexOf(ComboBoxEx1.Items[i])) < 0 then
        ComboBoxEx1.Items.Delete(i);
    end;
    ComboBoxEx1.ItemsEx.EndUpdate;
    /// 回调UI层
    if Assigned(SettingChangedCallBackFuntion) then
      SettingChangedCallBackFuntion(nil, 0);

    if ComboBoxEx1.ItemIndex < 0 then
      ComboBoxEx1.ItemIndex := 1;
    ComboBoxEx1.Update;
  finally
    devideNameList.Free;
  end;
end;

procedure TSettingPagesDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SettingPagesDlg.LoadOrCreateLaunguageFromFile(self, true);
end;

procedure TSettingPagesDlg.FormCreate(Sender: TObject);
var
  ComComboBox: TComComboBox;
  j: TRECEIVE_FORMAT;
  i: integer;
  OcComPortObj: TOcComPortObj;
begin

  if OcComPortDeviceList = nil then
    OcComPortDeviceList := TStringList.Create;
  OctopusCfgDir := ExtractFilePath(Application.Exename) + '\';

  SetCurrentDir(OctopusCfgDir);
  OctopusCfgDir_LogFilePath := OctopusCfgDir + OCTOPUS_DEFAULT_LOG_DIR;
  if not DirectoryExists(OctopusCfgDir) then
    CreateDir(OctopusCfgDir);
  if not DirectoryExists(OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR) then
    CreateDir(OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR);
  if not DirectoryExists(OctopusCfgDir_LogFilePath) then
    CreateDir(OctopusCfgDir + OCTOPUS_DEFAULT_LOG_DIR);

  VersionNumberStr := GetBuildInfo(Application.Exename);
  WindowsVersion := GetWIndowsVersion();

  ComComboBox := TComComboBox.Create(self);
  ComComboBox.Parent := self;
  ComComboBox.Visible := false;

  ComComboBox.ComProperty := cpBaudRate;
  ComComboBox.Refresh;
  ComboBox1.Items := ComComboBox.Items;
  ComboBox1.Items.Add('1000000');
  ComboBox1.Items.Add('1152000');
  ComboBox1.Items.Add('1500000');
  ComboBox1.Items.Add('2000000');
  ComboBox1.Items.Add('2500000');
  ComboBox1.Items.Add('3000000');
  ComboBox1.Items.Add('3500000');
  ComboBox1.Items.Add('4000000');

  ComboBox1.ItemIndex := 13;

  ComComboBox.ComProperty := cpDataBits;
  ComComboBox.Refresh;
  ComboBox2.Items := ComComboBox.Items;
  ComboBox2.ItemIndex := 3; // Ord(OctopusComPort1.DataBits);

  ComComboBox.ComProperty := cpStopBits;
  ComComboBox.Refresh;
  ComboBox3.Items := ComComboBox.Items;
  ComboBox3.ItemIndex := 0; // Ord(OctopusComPort1.StopBits);

  ComComboBox.ComProperty := cpParity;
  ComComboBox.Refresh;
  ComboBox4.Items := ComComboBox.Items;
  ComboBox4.ItemIndex := 0; // Ord(OctopusComPort1.Parity.Bits);

  ComComboBox.ComProperty := cpFlowControl;
  ComComboBox.Refresh;
  ComboBox5.Items := ComComboBox.Items;
  ComboBox5.ItemIndex := 2;

  ComboBox7.Clear;
  // for j := Low(RECEIVE_FORMAT_String) to High(RECEIVE_FORMAT_String) do
  for j := ASCIIFormat to OctopusProtocol do
  begin
    ComboBox7.Items.Add(RECEIVE_FORMAT_String[j]);
  end;
  ComboBox7.ItemIndex := 0;

  /// ////////////////////////////////////////////////////////////////////////////
  /// 获取系统端口设备，并配置信息
  updateSystemDevicesList();
  for i := 0 to ComboBoxEx1.Items.Count - 1 do
  begin
    ComboBoxEx1.ItemIndex := i;
    ComboBoxEx1Change(self); // 刷新到默认串口设置界面
    OcComPortObj := TOcComPortObj(OcComPortDeviceList.Objects[i]);
    if OcComPortObj <> nil then
    begin
      ApplyOcComPortObjAtrribute(OcComPortObj);
      ApplyCodePageSetting(OcComPortObj);
    end;
  end;

  if CheckBoxShortcutForExplorer.Checked then
  begin
    AddExplorerContextMenu(OCTOPUS_SYSTEM_EXPLORER_MENU_NAME, Application.Exename);
  end;
  if CheckBoxDesktopShortcutMenu.Checked then
  begin
    CreateShortcut(Application.Exename, OCTOPUS_SYSTEM_DESKTOP_SHORTCUT_NAME);
  end;

  try
    MaintenanceOfEquipment.ApplicationFileName := Application.Exename;
    MaintenanceOfEquipment.ConfigFileName := OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Octopus.ini';
    MaintenanceOfEquipment.SetComments('');
    MaintenanceOfEquipment.Resume;
  finally
  end;

  CheckBox8.Checked := false;
  Timer1.Enabled := CheckBox8.Checked;
  /// CurrentLaunguage := -1;
end;

procedure TSettingPagesDlg.FormShow(Sender: TObject);
var
  // OcComPortObj: TOcComPortObj;
  i: integer;
begin
  // OcComPortObj := getDeciceByFullName(getCurrentDeviceName());
  if SelectedOcComPortObj = nil then
    exit;

  i := ComboBoxEx1.Items.IndexOf(SelectedOcComPortObj.ComPortFullName);
  if (i >= 0) and (i < ComboBoxEx1.Items.Count) then
    ComboBoxEx1.ItemIndex := i;

  ComboBoxEx1Change(self); // 刷新到默认串口设置界面
  UpdateLaunguage(self);

  /// ShowMessage(getCommandLine());
  /// SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, 0);
end;

procedure TSettingPagesDlg.ComboBoxEx1Change(Sender: TObject);
var
  // bName: string;
  i: integer;
  OcComPortObj: TOcComPortObj;
begin
  if (ComboBoxEx1.Items.Count <= 0) or (ComboBoxEx1.Text = 'None') then
    exit;

  if ComboBoxEx1.ItemIndex < 0 then
    ComboBoxEx1.ItemIndex := 0;

  OcComPortObj := getDeciceByFullName(getCurrentDeviceName());

  if OcComPortObj = nil then
    exit;
  /// sDriverName := Trim(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  /// sDriverName := FalconGetComPort(sDriverName);
  if OcComPortObj.BaudRate = TBaudRate(0) then
  begin
    i := ComboBox1.Items.IndexOf(IntToStr(OcComPortObj.CustomBaudRate));
    if (i > 0) and (i < ComboBox1.Items.Count) then
      ComboBox1.ItemIndex := i
    else
      ComboBox1.ItemIndex := 0;
  end
  else
  begin
    ComboBox1.ItemIndex := ord(OcComPortObj.BaudRate);
  end;

  ComboBox2.ItemIndex := ord(OcComPortObj.DataBits);
  ComboBox3.ItemIndex := ord(OcComPortObj.StopBits);
  ComboBox4.ItemIndex := ord(OcComPortObj.Parity.Bits);
  ComboBox5.ItemIndex := ord(OcComPortObj.FlowControl.FlowControl);
  ComboBox6.ItemIndex := ord(OcComPortObj.SendFormat);
  ComboBox7.ItemIndex := ord(OcComPortObj.ReceiveFormat);

  CBReceivingCodePage.ItemIndex := OcComPortObj.CodePage;
  CBSendCodePage.ItemIndex := OcComPortObj.SendCodeFormat;
  CBAlignmentMode.ItemIndex := OcComPortObj.HexModeFormatCount;

  CheckBox33.Checked := OcComPortObj.ShowTime;
  CheckBox34.Checked := OcComPortObj.ShowDate;
  CheckBox35.Checked := OcComPortObj.ShowLineNumber;
  CheckBox36.Checked := OcComPortObj.ShowSendedLog;
end;

procedure TSettingPagesDlg.ComboBox1Change(Sender: TObject);
var
  str: String;
  btl: integer;
  OcComPortObj: TOcComPortObj;
begin

  if ComboBoxEx1.Items.Count <= 0 then
  begin
    MessageBox(Handle, 'Please specify a device for custom baudrate.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  OcComPortObj := getDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if OcComPortObj = nil then
  begin
    MessageBox(Handle, 'Please specify a device for custom baudrate.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  // 用户输入波特率
  if ComboBox1.ItemIndex = 0 then
  begin
    // str := inputbox(Application.Title, 'Please Input Custom Baudrate:', inttostr(OcComPortObj.CustomBaudRate));
    if InputQuery(Application.Title, 'Please Input Custom Baudrate:', str) then
    begin
      try
        btl := StrToInt(str);
        OcComPortObj.CustomBaudRate := btl;
        if ComboBox1.Items.IndexOf(str) < 0 then
          ComboBox1.Items.Add(str);
        /// OcComPortObj.Log('You have set the custom baudrate to: ' + str);
        ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(str);
      except
        ComboBox1.ItemIndex := 13;
        MessageBox(Handle, 'Wrong baud rate,Please input a integer number. ', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
      end;
    end;
    exit;
  end;

  if (ComboBox1.ItemIndex <= MAX_BAUDRATE_INDEX) then // High(TBaudRate))
  begin // 配置内置波特率  1 .. 15
    OcComPortObj.BaudRate := TBaudRate(ComboBox1.ItemIndex); // 取内置波特率
    // OcComPortObj.BaudRateIndex := ComboBox1.ItemIndex;
  end
  else
  begin // 配置自定义波特率
    OcComPortObj.BaudRate := TBaudRate(0);
    OcComPortObj.CustomBaudRate := StrToInt(ComboBox1.Text);
    // if ComboBox1.Items.IndexOf(IntToStr(OcComPortObj.CustomBaudRate)) < 0 then
    // ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(str);
  end;
end;

procedure TSettingPagesDlg.ComboBox8Change(Sender: TObject);
begin
  UpdateLaunguage(self);
end;

procedure TSettingPagesDlg.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TSettingPagesDlg.Button2Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := getCurrentDevice();
  if OcComPortObj <> nil then
  begin
    ApplyOcComPortObjAtrribute(OcComPortObj);
    ApplyCodePageSetting(OcComPortObj);
    SaveDeviceSetting(OcComPortObj);
  end;

  Timer1.Enabled := CheckBox8.Checked;
  AlphaBlendValue := UpDown1.Position;
  AlphaBlend := CheckBox7.Checked;

  if CheckBoxShortcutForExplorer.Checked then
    AddExplorerContextMenu(OCTOPUS_SYSTEM_EXPLORER_MENU_NAME, Application.Exename)
  else
    RemoveExplorerContextMenu(OCTOPUS_SYSTEM_EXPLORER_MENU_NAME);

  if CheckBoxDesktopShortcutMenu.Checked then
    CreateShortcut(Application.Exename, OCTOPUS_SYSTEM_DESKTOP_SHORTCUT_NAME);

  Close();
end;

procedure TSettingPagesDlg.Button3Click(Sender: TObject);
begin
  ComboBoxEx1.Clear;
  updateSystemDevicesList();
end;

procedure TSettingPagesDlg.Button4Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(OctopusCfgDir), nil, nil, SW_SHOWNORMAL);
end;

procedure TSettingPagesDlg.Button5Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
begin
  OcComPortObj := getCurrentDevice();
  if OcComPortObj = nil then
    exit;

  /// if not OcComPortObj.Connected then
  /// exit;
  /// OcComPortObj.StringInternelCache.Lines.SaveToFile('StringInternelCache.log');
  OcComPortObj.ClearLog;
  OcComPortObj.ClearInternalBuff; // 清除内部缓存
  /// IF FileExists(OctopusCfgDir + CONFIGURATION_DIR + 'Lang_CN.ini') then
  /// DeleteFile(OctopusCfgDir + CONFIGURATION_DIR + 'Lang_CN.ini');
  /// IF FileExists(OctopusCfgDir + CONFIGURATION_DIR + 'Lang_EN.ini') then
  /// DeleteFile(OctopusCfgDir + CONFIGURATION_DIR + 'Lang_EN.ini');
end;

procedure TSettingPagesDlg.Button6Click(Sender: TObject);
begin
  CreateShortcut(Application.Exename, OCTOPUS_SYSTEM_DESKTOP_SHORTCUT_NAME);
end;

procedure TSettingPagesDlg.UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
begin
  Timer1.Interval := UpDown2.Position * 1000;
end;

procedure TSettingPagesDlg.Timer1Timer(Sender: TObject);
begin
  if CheckBox8.Checked then
  begin
    SaveAllComPortLogData(false);
  end;
end;

procedure TSettingPagesDlg.ColorBoxTextChange(Sender: TObject);
begin
  self.FontDialogConsole.Font.Color := ColorBoxText.Selected;
end;

function TSettingPagesDlg.getDeciceByPort(Port: string): TOcComPortObj;
var
  i: integer;
  str: String;
begin
  Result := nil;
  if Port = '' then
    exit;
  for i := 0 to OcComPortDeviceList.Count - 1 do
  begin
    str := OcComPortDeviceList[i];
    if (Pos(Port, str) > 0) then
    begin
      Result := TOcComPortObj(OcComPortDeviceList.Objects[i]);
    end;
  end;
end;

function TSettingPagesDlg.getCurrentDeviceName(): String;
begin
  Result := '';
  if (ComboBoxEx1.Items.Count > 0) then
  begin
    if (ComboBoxEx1.ItemIndex >= 0) and (ComboBoxEx1.ItemIndex < ComboBoxEx1.Items.Count) then
      Result := ComboBoxEx1.Items[ComboBoxEx1.ItemIndex];
  end;
end;

function TSettingPagesDlg.getDeciceByFullName(DeviceName: string): TOcComPortObj;
var
  i: integer;
begin
  Result := nil;
  try
    i := OcComPortDeviceList.IndexOf(DeviceName);
    if i >= 0 then
      Result := TOcComPortObj(OcComPortDeviceList.Objects[i]);
  finally
  end;
end;

function TSettingPagesDlg.getDeciceByIndex(Index: integer): TOcComPortObj;
begin
  Result := nil;
  try
    if (Index >= 0) and (Index < OcComPortDeviceList.Count) then
      Result := TOcComPortObj(OcComPortDeviceList.Objects[Index]);
  finally
  end;
end;

function TSettingPagesDlg.getAvailableDevice(): TOcComPortObj;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to OcComPortDeviceList.Count - 1 do
  begin
    if (OcComPortDeviceList.Objects[i] = nil) then
      continue;
    if not TOcComPortObj(OcComPortDeviceList.Objects[i]).Connected and (TOcComPortObj(OcComPortDeviceList.Objects[i]).status = 0) then
    begin
      Result := TOcComPortObj(OcComPortDeviceList.Objects[i]);
      break;
    end;
  end;
end;

function TSettingPagesDlg.getCurrentDevice(): TOcComPortObj;
begin
  Result := getDeciceByFullName(getCurrentDeviceName());
end;

procedure TSettingPagesDlg.CloseDevice(DeviceFullName: String);
var
  OcComPortObj: TOcComPortObj;
  i: integer;
begin
  if OcComPortDeviceList = nil then
    exit;
  if DeviceFullName = '' then
    exit;
  i := OcComPortDeviceList.IndexOf(DeviceFullName);
  if i >= 0 then
  begin
    OcComPortObj := TOcComPortObj(OcComPortDeviceList.Objects[i]);
    if (OcComPortObj <> nil) and (OcComPortObj.Connected) then
    begin
      OcComPortObj.CloseDevice();
    end;
  end;
end;

procedure TSettingPagesDlg.CloseDevice(OcComPortObj: TOcComPortObj);
begin
  if (OcComPortObj <> nil) and (OcComPortObj.Connected) then
  begin
    OcComPortObj.CloseDevice();
  end;
end;

function TSettingPagesDlg.openDevice(OcComPortObj: TOcComPortObj): Boolean;
var
  i: integer;
begin
  Result := false;
  if OcComPortObj = nil then
  begin
    OcComPortObj.DebugLog('Open ' + OcComPortObj.ComPortFullName + ' failed the device do not exists!');
    exit;
  end;
  if OcComPortObj.Connected then
    exit;

  i := ComboBoxEx1.Items.IndexOf(OcComPortObj.ComPortFullName);
  if (i >= 0) and (i < ComboBoxEx1.GetCount) then
  begin // 刷新当前设备配置显示
    ComboBoxEx1.ItemIndex := i;
    ComboBoxEx1.OnChange(self);
    ApplyOcComPortObjAtrribute(OcComPortObj);
    ApplyCodePageSetting(OcComPortObj);
    // SaveDeviceSetting(OcComPortObj);
  end
  else
  begin
    OcComPortObj.DebugLog('OcComPortObj.ComPortFullName is not avalable!');
    exit;
  end;

  try
    OcComPortObj.Open;
    Result := true;
    OcComPortObj.status := 1;
  Except
    OcComPortObj.DebugLog('Open ' + OcComPortObj.ComPortFullName + ' failed the device may be in using!');
    Result := false;
    OcComPortObj.status := 1;
    // MessageBox(Application.Handle, PChar('Open device ' + DeviceFullName + ' failed, it may be in used.'), PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  if not OcComPortObj.Connected then
  begin
  end;
end;

function TSettingPagesDlg.openDevice(DeviceFullName: String): TOcComPortObj;
begin
  openDevice(DeviceFullName, nil);
end;

function TSettingPagesDlg.openDevice(DeviceFullName: String; LogMemo: TMyMemo): TOcComPortObj;
var
  OcComPortObj: TOcComPortObj;
  i: integer;
begin
  Result := nil;
  if OcComPortDeviceList = nil then
    exit;
  if DeviceFullName = '' then
    exit;

  OcComPortObj := getDeciceByFullName(DeviceFullName);
  if OcComPortObj = nil then
    exit;

  OcComPortObj.SetLogComponent(LogMemo);
  openDevice(OcComPortObj);
end;

function TSettingPagesDlg.openDeviceRandom(): TOcComPortObj;
begin
  Result := getAvailableDevice();
  // Result := openDevice(Result);
end;

procedure TSettingPagesDlg.SaveDeviceSetting(OcComPortObj: TOcComPortObj);
var
  s: String;
  Octopusini: TIniFile;

  function getObjectID(str: String): String;
  begin
    Result := 'OBJECT_' + UpperCase(str);
  end;

begin
  if OcComPortObj = nil then
    exit;
  try
    s := OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + OcComPortObj.ComPortFullName + '.ini';
    OcComPortObj.StoreSettings(stIniFile, s);
    Octopusini := TIniFile.Create(s);

    Octopusini.WriteInteger(OcComPortObj.ComPortFullName, getObjectID(ComboBox6.Name), ComboBox6.ItemIndex);
    Octopusini.WriteInteger(OcComPortObj.ComPortFullName, getObjectID(ComboBox7.Name), ComboBox7.ItemIndex);

    Octopusini.WriteBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox33.Name), CheckBox33.Checked);
    Octopusini.WriteBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox34.Name), CheckBox34.Checked);
    Octopusini.WriteBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox35.Name), CheckBox35.Checked);
    Octopusini.WriteBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox36.Name), CheckBox36.Checked);
    Octopusini.WriteBool(OcComPortObj.ComPortFullName, getObjectID(CheckboxProcessDataBackground.Name), CheckboxProcessDataBackground.Checked);

    Octopusini.WriteString('Configuration', 'CONTENT_FONTNAME', FontDialogConsole.Font.Name);
    Octopusini.WriteInteger('Configuration', 'CONTENT_FONTSIZE', FontDialogConsole.Font.Size);
    Octopusini.WriteInteger('Configuration', 'CONTENT_FONTCOLOR', ColorBoxText.Selected);
    Octopusini.WriteInteger('Configuration', 'CONTENT_BACKGROUNDCOLOR', ColorBoxContentBG.Selected);
    /// Octopusini.WriteInteger('Configuration', 'CONTENT_TEXTCOLOR', ColorBoxText.Selected);
  finally
    Octopusini.Free;
  end;
end;

procedure TSettingPagesDlg.LoadDeviceSetting(OcComPortObj: TOcComPortObj);
var
  Octopusini: TIniFile;
  s: string;
  i: integer;

  function getObjectID(str: String): String;
  begin
    Result := 'OBJECT_' + UpperCase(str);
  end;

begin
  Octopusini := nil;
  if not DirectoryExists(OctopusCfgDir) then
    exit;
  s := OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + OcComPortObj.ComPortFullName + '.ini';
  if (not FileExists(s)) then
    exit;

  try
    Octopusini := TIniFile.Create(s);
    CheckBox33.Checked := Octopusini.ReadBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox33.Name), false);
    CheckBox34.Checked := Octopusini.ReadBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox34.Name), false);
    CheckBox35.Checked := Octopusini.ReadBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox35.Name), false);
    CheckBox36.Checked := Octopusini.ReadBool(OcComPortObj.ComPortFullName, getObjectID(CheckBox36.Name), false);

    ComboBox6.ItemIndex := Octopusini.ReadInteger(OcComPortObj.ComPortFullName, getObjectID(ComboBox6.Name), ComboBox6.ItemIndex);
    ComboBox7.ItemIndex := Octopusini.ReadInteger(OcComPortObj.ComPortFullName, getObjectID(ComboBox7.Name), ComboBox7.ItemIndex);

    CheckboxProcessDataBackground.Checked := Octopusini.ReadBool(OcComPortObj.ComPortFullName, getObjectID(CheckboxProcessDataBackground.Name), true);

    FontDialogConsole.Font.Charset := TFontCharset(DEFAULT_CHARSET);
    FontDialogConsole.Font.Name := Octopusini.ReadString(OcComPortObj.ComPortFullName, 'CONTENT_FONTNAME', FontDialogConsole.Font.Name);
    FontDialogConsole.Font.Size := Octopusini.ReadInteger(OcComPortObj.ComPortFullName, 'CONTENT_FONTSIZE', FontDialogConsole.Font.Size);
    FontDialogConsole.Font.Color := Octopusini.ReadInteger(OcComPortObj.ComPortFullName, 'CONTENT_FONTCOLOR', FontDialogConsole.Font.Color);
    ColorBoxText.Selected := FontDialogConsole.Font.Color;

    ColorBoxContentBG.Selected := Octopusini.ReadInteger(OcComPortObj.ComPortFullName, 'CONTENT_BACKGROUNDCOLOR', ColorBoxContentBG.Selected);
    if ColorBoxContentBG.Selected = clBlack then
    begin
      FontDialogConsole.Font.Color := clSilver;
      ColorBoxText.Selected := FontDialogConsole.Font.Color;
    end;

    OcComPortObj.SendFormat := Max(ComboBox6.ItemIndex, 0);
    OcComPortObj.ReceiveFormat := Max(ComboBox7.ItemIndex, 0);
    ComboBox6.ItemIndex := OcComPortObj.SendFormat;
    ComboBox7.ItemIndex := OcComPortObj.ReceiveFormat;

    OcComPortObj.ShowTime := CheckBox33.Checked;
    OcComPortObj.ShowDate := CheckBox34.Checked;
    OcComPortObj.ShowLineNumber := CheckBox35.Checked;
    OcComPortObj.ShowSendedLog := CheckBox36.Checked;

  finally
    Octopusini.Free;
  end;
end;

procedure TSettingPagesDlg.SaveAllComPortLogData(DoClose: Boolean);
var
  i: integer;
  OcComPortObj: TOcComPortObj;
begin
  try
    for i := 0 to OcComPortDeviceList.Count - 1 do
    begin
      OcComPortObj := TOcComPortObj(OcComPortDeviceList.Objects[i]);
      if OcComPortObj <> nil then
      begin
        if OcComPortObj.Connected then
        begin
          OcComPortObj.SaveLog(OctopusCfgDir_LogFilePath);
          if (DoClose) then
          begin
            OcComPortObj.Free;
          end;
        end;
      end;
    end;
  finally
  end;
end;

procedure TSettingPagesDlg.ApplyOcComPortObjAtrribute(OcComPortObj: TOcComPortObj);
var
  CodePage: integer;
begin
  if OcComPortObj = nil then
    exit;
  OcComPortObj.OcComPortObjInit2('', '', ComboBox1.ItemIndex, ComboBox2.ItemIndex, ComboBox3.ItemIndex, ComboBox4.ItemIndex, ComboBox5.ItemIndex,
    ComboBox6.ItemIndex, ComboBox7.ItemIndex, nil, CheckBox33.Checked, CheckBox34.Checked, CheckBox35.Checked, CheckBox36.Checked, true);

  OcComPortObj.BackgroundTaskMode := CheckboxProcessDataBackground.Checked;

  case CBAlignmentMode.ItemIndex of
    0:
      OcComPortObj.HexModeFormatCount := 16;
    1:
      OcComPortObj.HexModeFormatCount := 32;
    2:
      OcComPortObj.HexModeFormatCount := 0;
  else
    OcComPortObj.HexModeFormatCount := 0;
  end;

end;

procedure TSettingPagesDlg.ApplyCodePageSetting(OcComPortObj: TOcComPortObj);
var
  CodePage: integer;
begin
  if OcComPortObj = nil then
    exit;

  /// CP_ACP { ANSI / GB2312 }
  /// CP_OEMCP { OEM  code page }
  /// CP_MACCP { MAC  code page }
  /// CP_SYMBOL { SYMBOL translations }
  /// CP_UTF7 { UTF-7 translation }
  /// CP_UTF8 { UTF-8 translation }
  /// CP_ASCII { ANSI / ASCII }

  /// TEncoding.DEFAULT
  /// TEncoding.ASCII.Encoding
  /// TEncoding.ANSI.Encoding
  /// TEncoding.UTF7.Encoding
  /// TEncoding.UTF8.Encoding
  /// TEncoding.Unicode.Encoding
  /// TEncoding.BigEndianUnicode.Encoding

  CodePage := 0;
  OcComPortObj.CompatibleUnicode := false;
  case CBReceivingCodePage.ItemIndex of
    0:
      CodePage := TEncoding.Default.CodePage; // 0;
    1:
      CodePage := TEncoding.ASCII.CodePage; // 1;
    2:
      CodePage := TEncoding.ANSI.CodePage; // 2;
    3:
      CodePage := TEncoding.UTF7.CodePage; // 42;
    4:
      begin
        OcComPortObj.CompatibleUnicode := true;
        CodePage := TEncoding.UTF8.CodePage;
      end;
    5:
      begin
        OcComPortObj.CompatibleUnicode := true;
        CodePage := TEncoding.Unicode.CodePage;
      end;
    6:
      begin
        OcComPortObj.CompatibleUnicode := true;
        CodePage := TEncoding.BigEndianUnicode.CodePage;
      end;
  end;

  OcComPortObj.CodePage := CodePage;
  OcComPortObj.SendCodeFormat := CBSendCodePage.ItemIndex;

  OcComPortObj.ShowTime := CheckBox33.Checked;
  OcComPortObj.ShowDate := CheckBox34.Checked;
  OcComPortObj.ShowLineNumber := CheckBox35.Checked;
  OcComPortObj.ShowSendedLog := CheckBox36.Checked;

end;

/// 从语言文件载入语言
procedure TSettingPagesDlg.UpdateLaunguage(Form: TForm);
begin
  /// if CurrentLaunguage <> ComboBox8.ItemIndex then
  begin
    case ComboBox8.ItemIndex of
      0:
        LoadLaunguageFromFile(Form, OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Lang_EN.ini', false);
      1:
        LoadLaunguageFromFile(Form, OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Lang_CN.ini', false);
    end;
    /// CurrentLaunguage := ComboBox8.ItemIndex;
  end;
end;

/// 创建语言文件
procedure TSettingPagesDlg.LoadOrCreateLaunguageFromFile(Form: TForm; Create: Boolean);
begin
  if Create then
  begin
    /// 创建语言文件
    case ComboBox8.ItemIndex of
      0:
        LoadLaunguageFromFile(Form, OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Lang_EN.ini', Create);
      1:
        LoadLaunguageFromFile(Form, OctopusCfgDir + OCTOPUS_DEFAULT_CONFIGURATION_DIR + 'Lang_CN.ini', Create);
    end;
  end;
end;

procedure TSettingPagesDlg.LoadLaunguageFromFile(Form: TForm; const Path: String; Create: Boolean);
var
  i: integer;
  tmpComponent: TComponent;
  IniFiles: TIniFile;
  str: String;
  SectionName: String;
  function getMsgID(const str: String): String;
  begin
    Result := 'MESSAGE_' + UpperCase(str);
  end;

begin
  try
    IniFiles := nil;
    SectionName := UpperCase(Form.Name);
    if (FileExists(Path)) and (not Create) then
    begin
      IniFiles := TIniFile.Create(Path);
      Form.Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TForm', getMsgID(Form.Name), Form.Caption);
      Application.Title := IniFiles.ReadString(SectionName + '_LANGUAGE_APPLICATION_TITLE', getMsgID('title_name'), OCTOPUS_APPLICATION_TITLE_NAME);
      /// showmessage(Form.Caption+' '+Path);
      For i := 0 To Form.ComponentCount - 1 Do
      Begin
        tmpComponent := Form.Components[i];

        /// if tmpComponent is TForm then
        /// TForm(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TForm', getMsgID(TForm(tmpComponent).Name), TForm(tmpComponent).Caption);

        if tmpComponent is TButton then
        begin
          TButton(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TButton', getMsgID(TButton(tmpComponent).Name),
            TButton(tmpComponent).Caption);
          /// showmessage(TButton(tmpComponent).Caption+' ' +getMsgID(TButton(tmpComponent).Name)+' '+Path);
        end;

        if tmpComponent is TCheckBox then
          TCheckBox(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TCheckBox', getMsgID(TCheckBox(tmpComponent).Name),
            TCheckBox(tmpComponent).Caption);

        if tmpComponent is TLabel then
          TLabel(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TLabel', getMsgID(TLabel(tmpComponent).Name),
            TLabel(tmpComponent).Caption);

        if tmpComponent is TMenuItem then
          TMenuItem(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TMenuItem', getMsgID(TMenuItem(tmpComponent).Name),
            TMenuItem(tmpComponent).Caption);

        if tmpComponent is TTabSheet then
          TTabSheet(tmpComponent).Caption := IniFiles.ReadString(SectionName + '_LANGUAGE_TTabSheet', getMsgID(TTabSheet(tmpComponent).Name),
            TTabSheet(tmpComponent).Caption);

        if tmpComponent is TStringGrid then
        begin
          TStringGrid(tmpComponent).Cells[0, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL0'),
            TStringGrid(tmpComponent).Cells[0, 0]);
          TStringGrid(tmpComponent).Cells[1, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL1'),
            TStringGrid(tmpComponent).Cells[1, 0]);
          TStringGrid(tmpComponent).Cells[2, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL2'),
            TStringGrid(tmpComponent).Cells[2, 0]);

          TStringGrid(tmpComponent).Cells[4, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL4'),
            TStringGrid(tmpComponent).Cells[4, 0]);
          TStringGrid(tmpComponent).Cells[5, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL5'),
            TStringGrid(tmpComponent).Cells[5, 0]);
          TStringGrid(tmpComponent).Cells[6, 0] := IniFiles.ReadString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL6'),
            TStringGrid(tmpComponent).Cells[6, 0]);
        end;
        /// application.ProcessMessages;
      End;
    end
    /// else if (not FileExists(Path)) and (Create) then
    else if (Create) then
    /// 创建语言文件
    begin
      IniFiles := TIniFile.Create(Path);
      IniFiles.WriteString(SectionName + '_LANGUAGE_TForm', getMsgID(Form.Name), Form.Caption);
      IniFiles.WriteString(SectionName + '_LANGUAGE_APPLICATION_TITLE', getMsgID('title_name'), Application.Title);
      For i := 0 To Form.ComponentCount - 1 Do
      Begin
        tmpComponent := Form.Components[i];

        /// if tmpComponent is TForm then
        /// IniFiles.WriteString(SectionName + '_LANGUAGE_TForm', getMsgID(TForm(tmpComponent).Name), TForm(tmpComponent).Caption);

        if tmpComponent is TButton then
          IniFiles.WriteString(SectionName + '_LANGUAGE_TButton', getMsgID(TButton(tmpComponent).Name), TButton(tmpComponent).Caption);

        if tmpComponent is TCheckBox then
          IniFiles.WriteString(SectionName + '_LANGUAGE_TCheckBox', getMsgID(TCheckBox(tmpComponent).Name), TCheckBox(tmpComponent).Caption);

        if tmpComponent is TLabel then
          IniFiles.WriteString(SectionName + '_LANGUAGE_TLabel', getMsgID(TLabel(tmpComponent).Name), TLabel(tmpComponent).Caption);

        if tmpComponent is TMenuItem then
        begin
          if TMenuItem(tmpComponent).Caption <> '-' then
            IniFiles.WriteString(SectionName + '_LANGUAGE_TMenuItem', getMsgID(TMenuItem(tmpComponent).Name), TMenuItem(tmpComponent).Caption);
        end;

        if tmpComponent is TTabSheet then
          IniFiles.WriteString(SectionName + '_LANGUAGE_TTabSheet', getMsgID(TTabSheet(tmpComponent).Name), TTabSheet(tmpComponent).Caption);

        if tmpComponent is TStringGrid then
        begin
          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL0'), TStringGrid(tmpComponent).Cells[0, 0]);
          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL1'), TStringGrid(tmpComponent).Cells[1, 0]);
          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL2'), TStringGrid(tmpComponent).Cells[2, 0]);

          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL4'), TStringGrid(tmpComponent).Cells[4, 0]);
          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL5'), TStringGrid(tmpComponent).Cells[5, 0]);
          IniFiles.WriteString('LANGUAGE_TStringGrid', getMsgID(TStringGrid(tmpComponent).Name + 'COL6'), TStringGrid(tmpComponent).Cells[6, 0]);
        end;
      End;
    end
    else
    begin
      /// showmessage('dfdfdfd');
    end;

  finally

    if IniFiles <> nil then
      IniFiles.Free;
  end;
end;

function ExtractFileNameNoExt(FilePathName: String): String;
Var
  FileWithExtString: String;
  FileExtString: String;
  LenExt: integer;
  LenNameWithExt: integer;
Begin
  FileWithExtString := ExtractFileName(FilePathName);
  LenNameWithExt := Length(FileWithExtString);
  FileExtString := ExtractFileExt(FilePathName);
  LenExt := Length(FileExtString);
  If LenExt = 0 Then
  Begin
    Result := FileWithExtString;
  End
  Else
  Begin
    Result := Copy(FileWithExtString, 1, (LenNameWithExt - LenExt));
  End;
End;

{ 第一个参数是要建立快捷方式的文件, 这是必须的; 其他都是可选参数 }
{ 第二个参数是快捷方式名称, 缺省使用参数一的文件名 }
{ 第三个参数是指定目的文件夹, 缺省目的是桌面; 如果有第四个参数, 该参数将被忽略 }
{ 第四个参数是用常数的方式指定目的文件夹; 该系列常数定义在 ShlObj 单元, CSIDL_ 打头 }
// CreateShortcut(Application.ExeName, '', '', CSIDL_PROGRAMS);
// CreateShortcut(Application.ExeName, '', 'C:/');
function CreateShortcut(Exe: string; Lnk: string = ''; Dir: string = ''; ID: integer = -1): Boolean;
var
  IObj: IUnknown;
  ILnk: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  InFolder: array [0 .. MAX_PATH] of Char;
  LinkFileName: WideString;
begin
  Result := false;
  if not FileExists(Exe) then
    exit;
  if Lnk = '' then
    Lnk := ChangeFileExt(ExtractFileName(Exe), '');
  IObj := CreateComObject(CLSID_ShellLink);
  ILnk := IObj as IShellLink;
  ILnk.SetPath(PChar(Exe));
  ILnk.SetWorkingDirectory(PChar(ExtractFilePath(Exe)));
  if (Dir = '') and (ID = -1) then
    ID := CSIDL_DESKTOP;
  if ID > -1 then
  begin
    SHGetSpecialFolderLocation(0, ID, PIDL);
    SHGetPathFromIDList(PIDL, InFolder);
    LinkFileName := Format('%s/%s.lnk', [InFolder, Lnk]);
  end
  else
  begin
    Dir := ExcludeTrailingPathDelimiter(Dir);
    if not DirectoryExists(Dir) then
      exit;
    LinkFileName := Format('%s/%s.lnk', [Dir, Lnk]);
  end;
  IPFile := IObj as IPersistFile;
  if IPFile.Save(PWideChar(LinkFileName), false) = 0 then
    Result := true;
end;

procedure AddExplorerContextMenu(const MenuName, PathFileName: string);
var
  Reg: TRegistry;
const
  KeyName = 'OctopusSoftware'; // 固定 Key 名称
begin
  //fileName := ChangeFileExt(ExtractFileName(PathFileName), '');
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    // 主菜单项
    if Reg.OpenKey('\Software\Classes\*\shell\' + KeyName, true) then
      Reg.WriteString('', MenuName);

    // 命令
    if Reg.OpenKey('\Software\Classes\*\shell\' + KeyName + '\command', true) then
      Reg.WriteString('', '"' + PathFileName + '" "%1"');

    // 图标
    if Reg.OpenKey('\Software\Classes\*\shell\' + KeyName, true) then
      Reg.WriteString('Icon', '"' + PathFileName + '",0');
  finally
    Reg.Free;
  end;

  // 通知系统刷新
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, 0, 0);
end;

procedure RemoveExplorerContextMenu(const MenuName: string);
begin
  with TRegistry.Create do
  begin
    try
      RootKey := HKEY_CURRENT_USER;

      // 删除菜单项及其子键
      DeleteKey('\Software\Classes\*\shell\' + MenuName);

      // 刷新资源管理器以使更改生效
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, 0, 0);
    finally
      Free;
    end;
  end;
end;

end.
