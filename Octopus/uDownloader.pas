unit uDownloader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.SyncObjs, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,

  uDownloadsManager;

type
  TDownloaderFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ProgressBar1: TProgressBar;
    ButtonUpgrade: TButton;
    Memo1: TMemo;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonUpgradeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function FormatJSON(Json: String): String;
    function CompareVersion(LVersion, RVersion: String): Boolean;
    procedure DownLoadObjectDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer; AContentLength, AReadCount: Int64;
      var Abort: Boolean);
    procedure DownLoadManagerDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer; AContentLength, AReadCount: Int64;
      var Abort: Boolean);
  end;

var
  DownloaderFrm: TDownloaderFrm;
  DownloadCriticalSection: TCriticalSection;
  DownloadObjects: TDownloadObjects;

function IsProgramRunning(const WindowClassName: string): Boolean;
procedure RenameFileForUpgrading(const CurrentName, NewName: string);
procedure ExecuteExternalProgram(const FileName: string);

implementation

uses Json, REST.Json, ShellAPI, uOctopusFunction,uUsartSetting;

{$R *.dfm}

procedure TDownloaderFrm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  /// Memo1.Lines.Add('Cancelling the download process may take some time.');
  /// Application.ProcessMessages;
  DownloadObjects.FClosingForm := true;

  /// while DownloadsManager.FAllowFormClose do
  /// begin
  /// Application.ProcessMessages;
  /// Sleep(1);
  /// end;
end;

procedure TDownloaderFrm.FormCreate(Sender: TObject);
begin
  DownloadObjects := TDownloadObjects.Create();
end;

procedure TDownloaderFrm.FormShow(Sender: TObject);
begin
  /// SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, 0);
end;

procedure TDownloaderFrm.Button1Click(Sender: TObject);
begin
  if IsProgramRunning(OCTOPUS_DEBUGGING_AND_DEVELOPMENT_CLASSNAME) then
    showmessage(' yes ')
  else
    showmessage(' no ')
end;

procedure TDownloaderFrm.ButtonUpgradeClick(Sender: TObject);
var
  DownloadObject: TDownloadObject;
  URL: String;
begin
  /// if IsProgramRunning(OCTOPUS_DEBUGGING_AND_DEVELOPMENT_CLASSNAME) then
  /// begin
  /// showmessage('Close the Main Octopus Debugging And DevelopmentForm program before upgrading!');
  /// Exit;
  /// end;
  Memo1.Clear;
  ButtonUpgrade.Enabled := false;
  URL := OCTOPUS_UPGRADING_URL;
  DownloadObject := TDownloadObject.Create(URL);
  DownloadObject.OnThreadData := DownLoadObjectDataEvent;
  DownloadObject.StartPost();
  DownloadObjects.OnThreadData := DownLoadManagerDataEvent;
end;

procedure TDownloaderFrm.DownLoadObjectDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer; AContentLength, AReadCount: Int64;
  var Abort: Boolean);
var
  ResultContent: String;
  DownloadObject: TDownloadObject;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  name, updateFilePath, appVersion, comments: String;
  DownloadUrl: String;
  I: Integer;
  Thread: TThread;
  LDownLoadFileName: String;
begin
  if Sender = nil then
  begin
    Memo1.Lines.Add('Error DownloadObject = nil from to ' + DownloadObject.URL);
    Exit;
  end;

  DownloadObject := TDownloadObject(Sender);

  if MsgType = DOWNLOAD_OBJECT_MSG_POST then
  begin
    ResultContent := DownloadObject.ResultContent;
    if ResultContent = '' then
    begin
      Memo1.Lines.Add('Error No Result DownloadObject from to ' + DownloadObject.URL);
      /// Memo1.Lines.Append('Posting: ' + IntToStr(AReadCount) + '/' + IntToStr(AContentLength) + ' Speed' + IntToStr(ASpeed) + '%');
      Exit;
    end;

    try
      /// Memo1.Lines.Append(FormatJSON(ResultContent));
      JSONValue := TJsonObject.ParseJSONValue(ResultContent);
      JSONArray := (JSONValue as TJsonObject).GetValue('datas') as TJSONArray;
    Except
      Memo1.Lines.Add('Error TJsonObject.ParseJSONValue from to ' + DownloadObject.URL);
      Exit;
    end;

    if JSONArray = nil then
    begin
      Memo1.Lines.Append('Get download information1 failed! ');
      ButtonUpgrade.Enabled := true;
      Exit;
    end;

    if JSONArray.Count <= 0 then
    begin
      Memo1.Lines.Append('Get download information2 failed! ');
      ButtonUpgrade.Enabled := true;
      Exit;
    end;

    try
      JSONValue := JSONArray.Items[0];
      name := (JSONValue as TJsonObject).GetValue('name').ToString;
      appVersion := (JSONValue as TJsonObject).GetValue('appVersion').ToString;
{$IFDEF CPU64BITS}
      updateFilePath := (JSONValue as TJsonObject).GetValue('updateFilePath').ToString; // for 64 bit;
{$ELSE}
      updateFilePath := (JSONValue as TJsonObject).GetValue('updateFilePath32').ToString; // for 32 bit;
{$ENDIF}
      comments := (JSONValue as TJsonObject).GetValue('comments').ToString;
      Memo1.Lines.Add('FileName:  ' + name);
      Memo1.Lines.Add('Version :  ' + appVersion);
      Memo1.Lines.Add('FilePath:  ' + updateFilePath);
      Memo1.Lines.Add('FilePath:  ' + comments);

      DownloadUrl := StringReplace(updateFilePath, '"', '', [rfReplaceAll, rfIgnoreCase]);
      DownloadUrl := StringReplace(DownloadUrl, '\', '', [rfReplaceAll, rfIgnoreCase]);

      LDownLoadFileName := DownloadObjects.GetLocalFilePathName(DownloadUrl, ExtractFilePath(Application.Exename));
      Memo1.Lines.Append('Prepare to download to ' + LDownLoadFileName);
      Memo1.Lines.Append('Prepare to download in pieces...........');
    except
      Memo1.Lines.Append('Get download file information failed! ' + updateFilePath);
      ButtonUpgrade.Enabled := true;
      Exit;
    end;

    /// if CompareVersion('100', appVersion) then
    if CompareVersion(GetBuildInfo(Application.Exename), appVersion) then
    begin
      try
        /// Memo1.Lines[i + StartLine] := 'Downloading: ' + DownloadObject.FilePathName;
        /// DownloadObject.StartDownload(DownloadUrl,  ExtractFilePath(Application.Exename));
        for I := 0 to DownloadObjects.FNumThreads - 1 do
          Memo1.Lines.Append(' ');
        /// Memo1.Lines.Append('Downloading: ' + IntToStr(AReadCount) + '/' + IntToStr(AContentLength) + ' Speed' + IntToStr(ASpeed) + '%');
        /// ButtonUpgrade.Enabled := true;
        Memo1.Perform(EM_SCROLL, SB_TOP, 0);

        /// if FileExists(LDownLoadFileName) then
        /// begin
        /// if MessageBox(Self.Handle, 'Download is complete, do you want to start it now?', 'do you want to start it now?', MB_OKCANCEL or MB_ICONQUESTION) = IDCANCEL then
        /// end;
        Thread := TThread.CreateAnonymousThread(
          procedure
          begin
            // 在此处编写需要在后台执行的任务代码
            DownloadObjects.StartDownload(DownloadUrl, ExtractFilePath(Application.Exename));
          end);
        Thread.FreeOnTerminate := true; // 线程执行完毕后自动释放
        Thread.Start; // 启动线程
      finally
      end;
    end
    else
    begin
      Memo1.Lines.Add('No new version was found for upgrading');
      Memo1.Lines.Add('No new version was found for upgrading');
      ButtonUpgrade.Enabled := true;
    end;

  end;
end;

procedure TDownloaderFrm.DownLoadManagerDataEvent(const Sender: TObject; MsgType: Integer; ThreadNo: Integer; ASpeed: Integer;
AContentLength, AReadCount: Int64; var Abort: Boolean);
var
  ResultContent: String;
  DownloadObject: TDownloadObject;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  name, updateFilePath, appVersion: String;
  DownloadUrl: String;
  I: Integer;
  /// Label ENDENDENDENDCLOSE;
begin
  DownloadCriticalSection.Enter;
  if Sender = nil then
  begin
    Memo1.Lines.Add('Error DownloadObject = nil from ??');
    Exit;
  end;

  if Sender is TDownloadObjects then
  begin
    if MsgType = DOWNLOAD_OBJECT_MSG_ALLDOWNLOADING_FINISHIED then
    begin
      ButtonUpgrade.Enabled := true;
      if FileExists(TDownloadObjects(Sender).FToPathFileName) then
      begin
        Memo1.Lines.Append('The downloading is complete, please confirm that the latest file name is called ' + TDownloadObjects(Sender).FToPathFileName);

        if MessageBox(Self.Handle, 'The program has successfully completed the download and upgrade, do you want to start it now?',
          'do you want to start it now?', MB_OKCANCEL or MB_ICONQUESTION) = IDOK then
        begin
          ExecuteExternalProgram(TDownloadObjects(Sender).FToPathFileName);
          /// Application.Terminate;
        end;
        DownloadCriticalSection.Leave;
        Close;
      end;
    end
    else if MsgType = DOWNLOAD_OBJECT_MSG_ERROR then
    begin
      Memo1.Lines.Add('Error DownloadObjects from ' + TDownloadObjects(Sender).FFromURL);
      ButtonUpgrade.Enabled := true;
    end;
  end
  else if Sender is TDownloadObject then
  begin
    DownloadObject := TDownloadObject(Sender);
  end
  else
  begin
    Memo1.Lines.Append('error!!!!!!!');
    DownloadCriticalSection.Leave;
    Exit;
  end;

  Application.ProcessMessages;

  if (MsgType = DOWNLOAD_OBJECT_MSG_DOWNLOADING) then
  begin
    case ThreadNo of
      0:
        begin
          /// ProgressBar1.Visible := true;
          ProgressBar1.Max := AContentLength;
          ProgressBar1.Position := AReadCount;
          if (DownloadObject.MaxSize > 0) then

            Label1.Caption := Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
        end;
      1:
        begin
          /// ProgressBar2.Visible := true;
          ProgressBar2.Max := AContentLength;
          ProgressBar2.Position := AReadCount;
          if (DownloadObject.MaxSize > 0) then
            Label2.Caption := Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
        end;
      2:
        begin
          /// ProgressBar3.Visible := true;
          ProgressBar3.Max := AContentLength;
          ProgressBar3.Position := AReadCount;
          if (DownloadObject.MaxSize > 0) then
            Label3.Caption := Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
        end;
      3:
        begin
          /// ProgressBar4.Visible := true;
          ProgressBar4.Max := AContentLength;
          ProgressBar4.Position := AReadCount;
          if (DownloadObject.MaxSize > 0) then
            Label4.Caption := Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
        end;
      4:
        begin
          /// ProgressBar5.Visible := true;
          ProgressBar5.Max := AContentLength;
          ProgressBar5.Position := AReadCount;
          if (DownloadObject.MaxSize > 0) then
            Label5.Caption := Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
        end;
    end;

    if (DownloadObject.MaxSize > 0) then
      Memo1.Lines[Memo1.Lines.Count - ThreadNo - 1] := 'Downloading[' + IntToStr(ThreadNo) + ']: ' + IntToStr(AReadCount) + '/' + IntToStr(AContentLength) +
        ' Speed: ' + IntToStr(ASpeed) + ' byte/s ' + Format('%d%%', [Round((AReadCount / AContentLength) * 100)]);
  end
  else if MsgType = DOWNLOAD_OBJECT_MSG_DOWNLOADING_FINISHIED then
  begin
    Memo1.Lines[Memo1.Lines.Count - ThreadNo - 1] := 'Downloading[' + IntToStr(ThreadNo) + ']: ' + IntToStr(AReadCount) + '/' + IntToStr(AContentLength) +
      ' Speed: ' + IntToStr(ASpeed) + ' byte/s ' + Format('%d%%', [Round((AReadCount / AContentLength) * 100)]) + ' Finished';
  end;

  Application.ProcessMessages;
  /// ENDENDENDENDCLOSE:
  DownloadCriticalSection.Leave;

end;

function TDownloaderFrm.FormatJSON(Json: String): String;
var
  tmpJson: TJSONValue;
begin
  tmpJson := TJsonObject.ParseJSONValue(Json);
  Result := TJson.Format(tmpJson);
  FreeAndNil(tmpJson);
end;

function TDownloaderFrm.CompareVersion(LVersion, RVersion: String): Boolean;
var
  Liv, Riv: Integer;
  Lsv, Rsv: String;
begin
  Result := false;
  Lsv := StringReplace(LVersion, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Lsv := StringReplace(Lsv, '"', '', [rfReplaceAll, rfIgnoreCase]);

  Rsv := StringReplace(RVersion, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Rsv := StringReplace(Rsv, '"', '', [rfReplaceAll, rfIgnoreCase]);

  try
    Liv := StrToInt(Lsv);
    Riv := StrToInt(Rsv);
  Except
  end;
  if Riv > Liv then
    Result := true;
end;

procedure ExecuteExternalProgram(const FileName: string);
begin
  ShellExecute(0, 'open', PChar(FileName), nil, nil, SW_SHOW);
end;

procedure RenameFileForUpgrading(const CurrentName, NewName: string);
begin
  if FileExists(CurrentName) then
  begin
    try
      RenameFile(CurrentName, NewName);
      showmessage('Upgrade successfully.');
    except
      on E: Exception do
        showmessage('You need to download it manually for the upgrade,because an error occurred while renaming the file: ' + E.Message);
    end;
  end;
  /// else
  /// showmessage('File does not exist.');
end;

function IsProgramRunning(const WindowClassName: string): Boolean;
var
  Handle: HWND;
begin
  Handle := FindWindow(PChar(WindowClassName), nil);
  Result := (Handle <> 0);
end;

initialization

DownloadCriticalSection := TCriticalSection.Create;

finalization

DownloadCriticalSection.Free;

end.
