unit uOctopusAbout;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    FreeRes: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    ProgramIcon: TImage;
    PhysMem: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LinkLabel1: TLinkLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckNewVersion();
    procedure DownLoadObjectDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer; AContentLength, AReadCount: Int64;
      var Abort: Boolean);
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

uses uUsartSetting, uDownloadsManager, Json, REST.Json, ShellAPI,
  uOctopusFunction,
  uDownloader;

function GetFileCreationTime(const Filename: string): TDateTime; // 获应用程序时间
var
  Data: TWin32FindData;
  H: THandle;
  FT: TFileTime;
  I: Integer;
begin
  {
    Data.ftCreationTime:   TFileTime;   //创建时间
    Data.ftLastAccessTime:   TFileTime; //最后访问时间
    Data.ftLastWriteTime:   TFileTime;  //最后修改时间
  }
  H := FindFirstFile(PCHAR(Filename), Data);
  if H <> INVALID_HANDLE_VALUE then
  begin
    try
      FileTimeToLocalFileTime(Data.ftLastWriteTime, FT);
      FileTimeToDosDateTime(FT, LongRec(I).Hi, LongRec(I).Lo);
      Result := FileDateToDateTime(I);
    finally
      Windows.FindClose(H);
    end
  end
  else
  begin
    Result := 0;
  end;
end;

function GetSystemBits: Integer;
var
  IsWow64: BOOL;
begin
  IsWow64 := False;
  if IsWow64Process(GetCurrentProcess, IsWow64) then
  begin
    if IsWow64 then
      Result := 64
    else
      Result := 32;
  end
  else
  begin
    Result := 32; // 默认假设为 32 位
  end;
end;

function GetCPUBits: Integer;
begin
  if IsProcessorFeaturePresent(PF_XMMI64_INSTRUCTIONS_AVAILABLE) then
    Result := 64
  else
    Result := 32;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var
  MS: TMemoryStatusEx;
  bits: Integer;
  builddt: String;
  dt: TDateTime;
begin
  MS.dwLength := SizeOf(TMemoryStatusEx);
  GlobalMemoryStatusEx(MS);
  PhysMem.Caption := FormatFloat('#,###" MB"', MS.ullTotalPhys shr 20);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
  bits := GetCPUBits();
  dt := GetFileCreationTime(Application.Exename);
  builddt := DateTimeToStr(dt);

{$IFDEF CPU64BITS}
  Label5.Caption := 'Version: ' + SettingPagesDlg.VersionNumberStr + ' 64bit ' + builddt + ' (' + SettingPagesDlg.WindowsVersion + ' ' + inttostr(bits)
    + 'bit )';
{$ELSE}
  Label5.Caption := 'Version: ' + SettingPagesDlg.VersionNumberStr + ' 32bit ' + builddt + ' (' + SettingPagesDlg.WindowsVersion + ' ' + inttostr(bits)
    + 'bit )';
{$ENDIF}
  CheckNewVersion();
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.Button1Click(Sender: TObject);
begin

  Button1.Enabled := False;
  DownloaderFrm.Show();

  Close();
end;

procedure TAboutBox.CheckNewVersion();
var
  /// URL: String;
  DownloadObject: TDownloadObject;
begin
  DownloadObject := TDownloadObject.Create(OCTOPUS_UPGRADING_URL);
  DownloadObject.OnThreadData := DownLoadObjectDataEvent;
  DownloadObject.StartPost();
end;

procedure TAboutBox.DownLoadObjectDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer; AContentLength, AReadCount: Int64;
  var Abort: Boolean);
var
  ResultContent: String;
  DownloadObject: TDownloadObject;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  name, updateFilePath, appVersion: String;
  /// DownloadUrl: String;
  /// I: Integer;
begin
  if Sender = nil then
  begin
    Exit;
  end;
  DownloadObject := TDownloadObject(Sender);
  if MsgType = DOWNLOAD_OBJECT_MSG_POST then
  begin
    ResultContent := DownloadObject.ResultContent;
    if ResultContent = '' then
    begin
      Exit;
    end;
    try
      /// Memo1.Lines.Append(FormatJSON(ResultContent));
      JSONValue := TJsonObject.ParseJSONValue(ResultContent);
      JSONArray := (JSONValue as TJsonObject).GetValue('datas') as TJSONArray;
    Except
      Exit;
    end;

    try
      if JSONArray.Count >= 1 then
      begin
        JSONValue := JSONArray.Items[0];
        name := (JSONValue as TJsonObject).GetValue('name').ToString;
        appVersion := (JSONValue as TJsonObject).GetValue('appVersion').ToString;
        updateFilePath := (JSONValue as TJsonObject).GetValue('updateFilePath').ToString;
        if CompareVersion(SettingPagesDlg.VersionNumberStr, appVersion) then
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              Button1.Caption := 'Found A New Version:' + RemoveQuotes(appVersion);
              Button1.Visible := true;
              Button1.Enabled := true;
            end);
          /// application.ProcessMessages;
        end
        else
        begin
          Button1.Visible := False;
        end;
      end;
    finally
    end;
  end;
end;

end.
