unit Vcl.MyPageEdit;

interface

uses
  System.SysUtils, System.StrUtils, System.Classes, System.UITypes, System.IOUtils, System.Actions, System.ImageList,
  Winapi.Windows, Winapi.Messages, Winapi.RichEdit, Winapi.ShellAPI,

  Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.ClipBrd,
  Vcl.ToolWin, Vcl.ActnList, Vcl.ImgList, Vcl.StdActns, Vcl.ExtActns,
  Vcl.Tabs, VCLTee.TeCanvas, Vcl.Grids, Vcl.WinXCtrls, Vcl.TabNotBk, Vcl.Themes, Vcl.Printers,

  SHDocVw, SyncObjs;

type
  TEventCallBackFuntion = Procedure(Msg: String) of object;

  TLogType = (ltSend, ltRecv, ltInfo, ltError, ltNone);

  TMyMemo = class(TMemo)
  private
    FTAG: String;
    FSourceBytes: TBytes;
    FLock: TCriticalSection; // 用于线程同步的临界区对象
  protected
  public
    FStyle: Integer;
    FEncoding: TEncoding;
    FPathFileName: String;
    FHexadecimalMode: Boolean;
    FShowLinesNumber: Boolean;
    EventCallBackFuntion: TEventCallBackFuntion;
    FMAXLINES: Integer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetLastLine(): String;
    function GetLine(Line: Integer): String;

    procedure Clear();
    procedure Log(const Msg: String);
    procedure LogLine(const Msg: String; Line: Integer);
    procedure LogEndLine(const Msg: String);
    procedure LogBuffer(const Buffer: array of Byte; Count: Integer);

    procedure SaveTo(const PathFileName: String); overload;
    procedure SaveTo(const PathFileName: String; Encoding: TEncoding); overload;
    procedure LoadFrom(const PathFileName: String); overload;
    procedure LoadFrom(const PathFileName: String; Encoding: TEncoding); overload;
    procedure LoadAsBinFrom(const PathFileName: String);

    procedure ConvertEncoding(TargetEncoding: TEncoding);
    procedure ConvertToUTF8WithBOM();
    procedure ConvertEncoding3(TargetEncoding: TEncoding);
    procedure SetDefaultFormat();
    procedure SetHexadecimalMode(); overload;
    procedure SetHexadecimalMode(HexMode: Boolean); overload;
    procedure Print(TitleStr: string = 'No Title'); overload;
    procedure Print(UserPrinter: TPrinter; TitleStr: string = 'No Title'); overload;
  published
  end;

  TMyRichEdit = class(TRichEdit)
  private
    FTAG: String;
    FSourceBytes: TBytes;
    FPrevTimestamp: TDateTime;

    FSendColor: TColor;
    FReceiveColor: TColor;
    FDefaultColor: TColor;
    FLock: TCriticalSection;
    FLogQueue: TStringList;
    FCacheList: TStringList;
    FIsDestroying: Boolean;
    procedure FlushLogQueue;
    function DetectTextFileEncoding(const FileName: string): TEncoding;
  protected
  public
    FStyle: Integer;
    FEncoding: TEncoding;
    FPathFileName: String;
    FHexadecimalMode: Boolean;
    FShowLinesNumber: Boolean;
    EventCallBackFuntion: TEventCallBackFuntion;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetRichEditText(RichEdit: TRichEdit): WideString; overload;
    function GetRichEditText(RichEdit: TRichEdit; AnsiCodePage: UINT): AnsiString; overload;

    function GetLastLine(): String;
    function GetLine(Line: Integer): String;
    function IsModifiedByExternal(): Boolean;
    function LoadFrom(PathFileName: String): Boolean; overload;
    function ExistLocalFile(): Boolean;

    procedure Clear();
    procedure AppendLog(const Text: string; LogType: TLogType);
    procedure Log(const Msg: string; LogType: TLogType = ltNone);
    procedure LogLine(const Msg: String; Line: Integer);
    procedure LogEndLine(const Msg: String);
    procedure LogBuffer(const Buffer: array of Byte; Count: Integer);

    procedure SaveTo(const PathFileName: String); overload;
    procedure SaveTo(const PathFileName: String; Encoding: TEncoding); overload;

    procedure LoadFrom(PathFileName: String; Encoding: TEncoding); overload;
    procedure LoadAsBinFrom(const PathFileName: String);

    procedure ConvertEncoding(TargetEncoding: TEncoding);
    procedure ConvertToUTF8WithBOM();
    procedure ConvertEncoding3(TargetEncoding: TEncoding);

    procedure SetDefaultFormat();
    procedure SetHexadecimalMode(); overload;
    procedure SetHexadecimalMode(HexMode: Boolean); overload;

    property SendColor: TColor read FSendColor write FSendColor;
    property ReceiveColor: TColor read FReceiveColor write FReceiveColor;
    property DefaultColor: TColor read FDefaultColor write FDefaultColor;
  published
  end;

  TMyPageEdit = class(TPageControl)
  private
    FRichEditList: TList;
  protected
  public

    constructor Create(AOwner: TComponent); override;
    procedure CreatePage(PageName: String; PageType: Integer = 0);
    procedure DeletePage(PageName: String); overload;
    procedure DeletePageComponent(Index: Integer); overload;
    procedure SetPageName(PageName: String; PageIndex: Integer);

    procedure Log(Msg: String; Index: Integer);
    /// procedure Clear(Index: Integer);
    procedure FreeAll();

    function GetEdit(Index: Integer): TMyRichEdit; overload;
    function GetEdit(PageName: String): TMyRichEdit; overload;

    function GetMemo(Index: Integer): TMyMemo; overload;
    function GetMemo(PageName: String): TMyMemo; overload;
    function GetAMemo(): TMyMemo;
    function GetAMemoIndex(): Integer;

    function GetComponent(Index: Integer): TComponent; overload;
    function GetComponent(PageName: String): TComponent; overload;

    function GetWebBrowser(Index: Integer): TWebBrowser; overload;
    function GetWebBrowser(PageName: String): TWebBrowser; overload;

    function GetPageName(Index: Integer): String;
    function GetActivePageName(): String;
    function GetPageByName(PageName: String): TTabSheet;
    function GetPageByIndex(PageIndex: Integer): TTabSheet;
    function GetPageIndex(PageName: String): Integer;

    function LoadFileFrom(PathFileName: String; PageName: String): TMyRichEdit;
    function LoadFileAsBinFrom(PathFileName: String; PageName: String): TMyRichEdit;
    function GetPathFileName(Index: Integer): String;
  published
  end;

implementation

uses DataEngine, uOctopusFunction;

/// //////////////////////////////////////////////////////////////////////////////
/// //////////////////////////////////////////////////////////////////////////////
/// Memo
constructor TMyMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLock := TCriticalSection.Create;
  FMAXLINES := 100000;
end;

destructor TMyMemo.Destroy;
begin
  FLock.Free;
  inherited Destroy;
end;

procedure TMyMemo.Clear();
begin
  FLock.Enter;
  try
    Self.Lines.Clear;
  finally
    FLock.Leave;
  end;
end;

procedure TMyMemo.Log(const Msg: String);
begin
  TThread.Queue(nil,
    procedure
    begin
      try
        FLock.Enter;
        try
          if Lines.Count > FMAXLINES then
            Lines.Delete(0);
          Self.Lines.Append(Msg);
        finally
          FLock.Leave;
        end;
      except
        on E: Exception do
        begin
          if Assigned(EventCallBackFuntion) then
            EventCallBackFuntion('Log error: ' + E.Message + ' | Msg: ' + Msg);
        end;
      end;
    end);
end;

procedure TMyMemo.LogLine(const Msg: String; Line: Integer);
begin
  TThread.Queue(nil,
    procedure
    begin
      FLock.Enter;
      try
        if (Self.Lines.Count > 0) and (Line >= 0) and (Line < Self.Lines.Count) then
        begin
          Self.Lines[Line] := Msg;
        end
        else
        begin
          // 默认行为：新日志追加
          if Self.Lines.Count > FMAXLINES then
            Self.Lines.Delete(0); // 滚动控制
          Self.Lines.Append(Msg);
        end;
      finally
        FLock.Leave;
      end;
    end);
end;

procedure TMyMemo.LogEndLine(const Msg: String);
begin
  TThread.Queue(nil,
    procedure
    begin
      FLock.Enter;
      try
        if Lines.Count > 0 then
        begin
          Lines[Lines.Count - 1] := Lines[Lines.Count - 1] + Msg;
        end
        else
        begin
          if Lines.Count > FMAXLINES then
            Lines.Delete(0); // 可选：限制最大行数
          Lines.Append(Msg);
        end;
      finally
        FLock.Leave;
      end;
    end);
end;

procedure TMyMemo.LogBuffer(const Buffer: array of Byte; Count: Integer);
var
  i: Integer;
  LineStr: string;
  OutputLines: TStringList;
begin
  OutputLines := TStringList.Create;
  try
    LineStr := '';
    for i := 0 to Count - 1 do
    begin
      LineStr := LineStr + Format('%.2x ', [Buffer[i]]);

      if ((i + 1) mod 32) = 0 then
      begin
        OutputLines.Add(LineStr);
        LineStr := '';
      end;
    end;

    // 如果还有残余字节
    if LineStr <> '' then
      OutputLines.Add(LineStr);

    // 使用线程安全方式在主线程中更新 Memo
    TThread.Queue(nil,
      procedure
      var
        s: string;
      begin
        FLock.Enter;
        try
          for s in OutputLines do
          begin
            // 可选：行数限制
            if Lines.Count > FMAXLINES then
              Lines.Delete(0);
            Lines.Append(s);
          end;
        finally
          FLock.Leave;
        end;
      end);

  finally
    OutputLines.Free;
  end;
end;

function TMyMemo.GetLastLine(): String;
begin
  try
    if Lines.Count > 0 then
      Result := Lines.Strings[Lines.Count - 1]
    else
      Result := '';
  finally
    FLock.Leave;
  end;
end;

function TMyMemo.GetLine(Line: Integer): String;
begin
  Result := '';
  FLock.Enter;
  try
    if (Line < 0) or (Line >= Lines.Count) then
      Result := ''
    else
      Result := Lines.Strings[Line];
  finally
    FLock.Leave;
  end;
end;

procedure TMyMemo.SaveTo(const PathFileName: String);
begin
  Lines.SaveToFile(PathFileName);
  Self.FPathFileName := PathFileName;
end;

procedure TMyMemo.SaveTo(const PathFileName: String; Encoding: TEncoding);
begin
  Lines.SaveToFile(PathFileName, Encoding);
  Self.FPathFileName := PathFileName;
end;

procedure TMyMemo.LoadFrom(const PathFileName: String);
begin
  if FileExists(PathFileName) then
  begin
    Self.Lines.LoadFromFile(PathFileName);
    Self.FPathFileName := PathFileName;
  end
  else if FileExists(Self.FPathFileName) then
  begin
    Self.Lines.LoadFromFile(Self.FPathFileName);
  end
  else
  begin
    /// ConvertEncoding(Self.Lines.Encoding);
  end;
end;

procedure TMyMemo.LoadFrom(const PathFileName: String; Encoding: TEncoding);
begin
  if FileExists(PathFileName) then
  begin
    try
      Self.Lines.LoadFromFile(PathFileName, Encoding);
    Except
    end;
    Self.FPathFileName := PathFileName;
  end;
end;

procedure TMyMemo.LoadAsBinFrom(const PathFileName: String);
var
  FS: TFileStream;
  FileSize: Integer;
begin
  if not FileExists(PathFileName) then
    raise Exception.CreateFmt('File not found: %s', [PathFileName]);

  FS := TFileStream.Create(PathFileName, fmOpenRead or fmShareDenyWrite);
  try
    FileSize := FS.Size;
    SetLength(FSourceBytes, FileSize);
    if FileSize > 0 then
      FS.ReadBuffer(FSourceBytes[0], FileSize);

    // 清空 Memo
    Self.Clear;

    // 用十六进制显示
    LogBuffer(FSourceBytes, Length(FSourceBytes));

    // 可以根据需求给 Memo 一个标记，比如保存路径
    FTAG := PathFileName;
  finally
    FS.Free;
  end;
end;

procedure TMyMemo.ConvertEncoding(TargetEncoding: TEncoding);
var
  SourceBytes, TargetBytes: TBytes;
  SourceEncoding: TEncoding;
begin
  SourceEncoding := Self.Lines.Encoding;
  // 将Memo控件中的文本内容转换为源编码格式的字节序列
  SourceBytes := SourceEncoding.GetBytes(Text);

  // 将源编码格式的字节序列转换为目标编码格式的字节序列
  TargetBytes := TEncoding.Convert(SourceEncoding, TargetEncoding, SourceBytes);

  // 将目标编码格式的字节序列转换为字符串，并更新Memo控件的内容
  Text := TargetEncoding.GetString(TargetBytes);
end;

procedure TMyMemo.ConvertToUTF8WithBOM();
var
  UTF8Encoding: TEncoding;
  BOM: TBytes;
  TextBytes: TBytes;
begin
  // 创建UTF-8编码和BOM字节序列
  UTF8Encoding := TEncoding.UTF8;
  BOM := TEncoding.UTF8.GetPreamble;

  // 将UTF-8编码的文本转换为字节序列
  TextBytes := TEncoding.UTF8.GetBytes(Text);

  // 合并BOM和文本字节序列
  Text := UTF8Encoding.GetString(BOM + TextBytes);
end;

procedure TMyMemo.ConvertEncoding3(TargetEncoding: TEncoding);
var
  ss: TStringStream;
begin
  ss := TStringStream.Create(Text, TargetEncoding);
  Lines.LoadFromStream(ss);
  /// ss.Free;
end;

procedure TMyMemo.SetDefaultFormat();
begin
  Font.Charset := TFontCharset(DEFAULT_CHARSET);
  Font.Name := '新宋体';
  Font.Size := 14;
  SelStart := MaxInt;

  WantReturns := false;
  HideSelection := false;
  ParentFont := false;
end;

procedure TMyMemo.SetHexadecimalMode();
var
  SourceEncoding: TEncoding;
  /// i: Integer;
begin
  SourceEncoding := Self.Lines.Encoding;
  // 将Memo控件中的文本内容转换为源编码格式的字节序列
  FSourceBytes := SourceEncoding.GetBytes(Text);
  Self.Clear;
  LogBuffer(FSourceBytes, Length(FSourceBytes));
  DataEngineManager.Remove2(FTAG);
end;

procedure TMyMemo.SetHexadecimalMode(HexMode: Boolean);
begin
  FTAG := 'SetHexadecimalMode';
  if (not Self.FHexadecimalMode) and (HexMode) then
  begin
    FHexadecimalMode := true;
    if not DataEngineManager.Exist2(FTAG, nil) then
      DataEngineManager.DoAction(FTAG, SetHexadecimalMode);
  end;

  if (not HexMode) then
  begin
    LoadFrom('');
    FHexadecimalMode := false;
  end;
end;

procedure TMyMemo.Print(TitleStr: string);
var
  Left: Integer;
  Top: Integer;
  i, j, X, Y: Integer; // PageHeight,
  PagesStr: String;
  posX, posY, Posx1, posY1: Integer;
  PrintDialog1: TPrintDialog;
begin
  Left := 500;
  Top := 800;
  Y := Top; // 40
  X := Left; // 80
  j := 1;
  PrintDialog1 := TPrintDialog.Create(Application);
  if PrintDialog1.Execute then
    With Printer do
    begin
      BeginDoc; // 另存的打印的文件名 如何实现  默认为 .jnt
      Canvas.Font := Font;
      // -------------------------------------------------------------------------
      // 打印文件名的标题
      // TitleStr:='无标题';
      posX := (PageWidth div 2) - Length(TitleStr) * 50; // x+1800;
      posY := (PageHeight * 6) div 100;

      // 第N页的标题
      PagesStr := Format('第 %d 页', [Printer.PageNumber]);
      Posx1 := (PageWidth div 2) - Length(PagesStr) * 50;
      posY1 := (PageHeight * 92) div 100;
      // -------------------------------------------------------------------------
      for i := 0 to Lines.Count - 1 do
      begin
        Canvas.TextOut(X, Y, Lines[i]); // TextOut(Left,Top,string);
        Y := Y + Font.Size * 10; // Memo.Font.Size*10为行间距 第1行与第2行的间距,2和3,3与4,...

        if (Y > PageHeight - Top) then
        begin
          Canvas.TextOut(posX, posY, TitleStr);
          for j := 1 to Printer.PageNumber do
          begin
            PagesStr := Format('第 %d 页', [j]);
            Canvas.TextOut(Posx1, posY1, PagesStr);
            Application.ProcessMessages;
          end;
          NewPage;
          Y := Top;
        end;
      end;
      Canvas.TextOut(posX, posY, TitleStr);
      Canvas.TextOut(Posx1, posY1, Format('第 %d 页', [j]));
      // Form1.Label1.Caption:=System.Concat(' 正在打印',#13#10,TitleStr,#13#10,Format('第 %d 页',[j]));
      EndDoc;
      // Form1.Caption:= Format('x = %d y = %d Width = %d Height = %d ',[x,y,PageWidth,Pageheight]);
    end;
end;

procedure TMyMemo.Print(UserPrinter: TPrinter; TitleStr: string);
var
  Left: Integer;
  Top: Integer;
  i, j, X, Y: Integer; // PageHeight,
  PagesStr: String;
  posX, posY, Posx1, posY1: Integer;
  // PrintDialog1: TPrintDialog;
begin
  Left := 500;
  Top := 800;
  Y := Top; // 40
  X := Left; // 80
  j := 1;
  // PrintDialog1 := TPrintDialog.Create(Application);
  // if PrintDialog1.Execute then

  With Printer do
  begin
    BeginDoc; // 另存的打印的文件名 如何实现  默认为 .jnt
    Canvas.Font := Font;
    // -------------------------------------------------------------------------
    // 打印文件名的标题
    // TitleStr:='无标题';
    posX := (PageWidth div 2) - Length(TitleStr) * 50; // x+1800;
    posY := (PageHeight * 6) div 100;

    // 第N页的标题
    PagesStr := Format('第 %d 页', [Printer.PageNumber]);
    Posx1 := (PageWidth div 2) - Length(PagesStr) * 50;
    posY1 := (PageHeight * 92) div 100;
    // -------------------------------------------------------------------------
    for i := 0 to Lines.Count - 1 do
    begin
      Canvas.TextOut(X, Y, Lines[i]); // TextOut(Left,Top,string);
      Y := Y + Font.Size * 10; // Memo.Font.Size*10为行间距 第1行与第2行的间距,2和3,3与4,...

      if (Y > PageHeight - Top) then
      begin
        Canvas.TextOut(posX, posY, TitleStr);
        for j := 1 to Printer.PageNumber do
        begin
          PagesStr := Format('第 %d 页', [j]);
          Canvas.TextOut(Posx1, posY1, PagesStr);
          Application.ProcessMessages;
        end;
        NewPage;
        Y := Top;
      end;
    end;
    Canvas.TextOut(posX, posY, TitleStr);
    Canvas.TextOut(Posx1, posY1, Format('第 %d 页', [j]));
    // Form1.Label1.Caption:=System.Concat(' 正在打印',#13#10,TitleStr,#13#10,Format('第 %d 页',[j]));
    EndDoc;
    // Form1.Caption:= Format('x = %d y = %d Width = %d Height = %d ',[x,y,PageWidth,Pageheight]);
  end;
end;

/// ////////////////////////////////////////////////////////////////////////////
/// ////////////////////////////////////////////////////////////////////////////
/// RichEdit
constructor TMyRichEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLock := TCriticalSection.Create;
  FLogQueue := TStringList.Create;
  FCacheList := TStringList.Create; // 只创建一次

  FDefaultColor := clBlack;
  FIsDestroying := false;
  FSendColor := FDefaultColor;
  FReceiveColor := clBlue;

end;

destructor TMyRichEdit.Destroy;
begin
  FIsDestroying := true;
  FLock.Enter;
  try
    FLogQueue.Clear;
    FCacheList.Clear;
  finally
    FLock.Leave;
  end;
  FreeAndNil(FLogQueue);
  FreeAndNil(FCacheList);
  FreeAndNil(FLock);
  inherited Destroy;
end;

procedure TMyRichEdit.Clear();
begin
  if TThread.CurrentThread.ThreadID = MainThreadID then
    Lines.Clear
  else
    TThread.Queue(nil,
      procedure
      begin
        if not FIsDestroying then
          Lines.Clear;
      end);
end;

procedure TMyRichEdit.AppendLog(const Text: string; LogType: TLogType);
var
  AColor: TColor;
begin
  case LogType of
    ltSend:
      AColor := FSendColor; // 发送 - 蓝色

    ltRecv:
      AColor := FReceiveColor; // 接收 - 绿色

    ltInfo:
      AColor := FDefaultColor; // 普通信息 - 黑色

    ltError:
      AColor := clRed; // 错误 - 红色

    ltNone:
      AColor := clWindowText; // 黑白风格兼容（系统默认前景色）
  else
    AColor := clWindowText;
  end;

  // 确保可以写
  ReadOnly := false;

  // 插入时设置颜色
  SelStart := GetTextLen;
  SelLength := 0;
  SelAttributes.Color := AColor;
  SelText := Text + sLineBreak; // 插入文本（带颜色）

  // 滚动到底部（可选）
  // SelStart := GetTextLen;
  // Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TMyRichEdit.FlushLogQueue;
var
  i: Integer;
  LogTypeValue: TLogType;
begin
  if FIsDestroying then
    Exit;

  FLock.Enter;
  try
    if FLogQueue.Count = 0 then
      Exit;

    FCacheList.Clear;
    FCacheList.Assign(FLogQueue);

    for i := 0 to FCacheList.Count - 1 do
    begin
      if Assigned(FCacheList.Objects[i]) then
        LogTypeValue := TLogType(NativeInt(FCacheList.Objects[i]))
      else
        LogTypeValue := ltNone;

      AppendLog(FCacheList[i], LogTypeValue);
    end;
  finally
    FCacheList.Clear;
    FLogQueue.Clear;
    FLock.Leave;
  end;
end;

procedure TMyRichEdit.Log(const Msg: string; LogType: TLogType = ltNone);
var
  ColorToUse: TColor;
begin
  if FIsDestroying then
    Exit;

  if TThread.CurrentThread.ThreadID = MainThreadID then
  begin
    // Lines.Add(Msg);
    AppendLog(Msg, LogType);
  end
  else
  begin
    FLock.Enter;
    try
      FLogQueue.AddObject(Msg, TObject(LogType));
    finally
      FLock.Leave;
    end;
    TThread.Queue(nil, FlushLogQueue);
  end;
end;

procedure TMyRichEdit.LogLine(const Msg: string; Line: Integer);
begin
  if (Line >= 0) and (Line < Lines.Count) then
  begin
    if TThread.CurrentThread.ThreadID = MainThreadID then
      Lines.Strings[Line] := Msg
    else
      TThread.Queue(nil,
        procedure
        begin
          Lines.Strings[Line] := Msg;
        end);
  end
  else
    Log(Msg);
end;

procedure TMyRichEdit.LogEndLine(const Msg: string);
begin
  if Lines.Count > 0 then
    LogLine(Lines.Strings[Lines.Count - 1] + Msg, Lines.Count - 1)
  else
    Log(Msg);
end;

procedure TMyRichEdit.LogBuffer(const Buffer: array of Byte; Count: Integer);
var
  i: Integer;
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    for i := 0 to Count - 1 do
    begin
      sb.AppendFormat('%.02x ', [Buffer[i]]);
      if ((i + 1) mod 16) = 0 then
      begin
        Log(sb.ToString);
        sb.Clear;
      end;
    end;
    if sb.Length > 0 then
      Log(sb.ToString);
  finally
    sb.Free;
  end;
end;

function TMyRichEdit.GetLastLine(): String;
begin
  FLock.Enter;
  try
    if Lines.Count > 0 then
      Result := Lines.Strings[Lines.Count - 1]
    else
      Result := '';
  finally
    FLock.Leave;
  end;
end;

function TMyRichEdit.GetLine(Line: Integer): string;
begin
  FLock.Enter;
  try
    if (Line >= 0) and (Line < Lines.Count) then
      Result := Lines.Strings[Line]
    else
      Result := '';
  finally
    FLock.Leave;
  end;
end;

function TMyRichEdit.IsModifiedByExternal(): Boolean;
var
  CurrentTimestamp: TDateTime;
begin
  if not FileExists(FPathFileName) then
    Exit(false);
  CurrentTimestamp := FileAge(FPathFileName);
  Result := CurrentTimestamp <> FPrevTimestamp;
  if Result then
    FPrevTimestamp := CurrentTimestamp;
end;

procedure TMyRichEdit.SaveTo(const PathFileName: String);
var
  ext: String;
begin
  ext := LowerCase(ExtractFileExt(PathFileName));
  if (ext = '.txt') or (ext = '.log') or (ext = '') then
    Self.PlainText := true
  else
    Self.PlainText := false;

  if (ext <> '.rtf') then
    Self.PlainText := true
  else
    Self.PlainText := false;

  Lines.SaveToFile(PathFileName);
  Self.FPathFileName := PathFileName;
  Self.FPrevTimestamp := FileAge(PathFileName);
end;

procedure TMyRichEdit.SaveTo(const PathFileName: String; Encoding: TEncoding);
var
  ext: String;
begin
  ext := LowerCase(ExtractFileExt(PathFileName));
  if (ext = '.txt') or (ext = '.log') or (ext = '') then
    Self.PlainText := true
  else
    Self.PlainText := false;

  if (ext <> '.rtf') then
    Self.PlainText := true
  else
    Self.PlainText := false;

  Lines.SaveToFile(PathFileName, Encoding);
  Self.FPathFileName := PathFileName;
  Self.FPrevTimestamp := FileAge(PathFileName);
end;

function TMyRichEdit.ExistLocalFile(): Boolean;
begin
  if FileExists(Self.FPathFileName) then
    Result := true
  else
    Result := false;
end;

function TMyRichEdit.LoadFrom(PathFileName: String): Boolean;
begin
  Result := false;
  if FileExists(PathFileName) then
  begin
    Self.Lines.LoadFromFile(PathFileName);
    Self.FPathFileName := PathFileName;
    Result := true;
  end
  else if FileExists(Self.FPathFileName) then
  begin
    Self.Lines.LoadFromFile(Self.FPathFileName);
    Result := true;
  end
  else
  begin
    /// ConvertEncoding(Self.Lines.Encoding);
  end;
end;

procedure TMyRichEdit.LoadFrom(PathFileName: String; Encoding: TEncoding);
begin
  if FileExists(PathFileName) then
  begin
    try
      Self.Lines.LoadFromFile(PathFileName, Encoding);
    Except
    end;
    Self.FPathFileName := PathFileName;
  end;
end;

procedure TMyRichEdit.LoadAsBinFrom(const PathFileName: String);
var
  FS: TFileStream;
  FileSize: Integer;
begin
  if not FileExists(PathFileName) then
    Exit;
  // raise Exception.CreateFmt('File not found: %s', [PathFileName]);

  FS := TFileStream.Create(PathFileName, fmOpenRead or fmShareDenyWrite);
  try
    FileSize := FS.Size;
    SetLength(FSourceBytes, FileSize);
    if FileSize > 0 then
      FS.ReadBuffer(FSourceBytes[0], FileSize);

    // 清空 Memo
    Self.Clear;

    // 用十六进制显示
    LogBuffer(FSourceBytes, Length(FSourceBytes));

    // 可以根据需求给 Memo 一个标记，比如保存路径
    FTAG := PathFileName;
  finally
    FS.Free;
  end;
end;

procedure TMyRichEdit.ConvertEncoding(TargetEncoding: TEncoding);
var
  SourceBytes, TargetBytes: TBytes;
  SourceEncoding: TEncoding;
begin
  SourceEncoding := Self.Lines.Encoding;
  // 将Memo控件中的文本内容转换为源编码格式的字节序列
  SourceBytes := SourceEncoding.GetBytes(Text);

  // 将源编码格式的字节序列转换为目标编码格式的字节序列
  TargetBytes := TEncoding.Convert(SourceEncoding, TargetEncoding, SourceBytes);

  // 将目标编码格式的字节序列转换为字符串，并更新Memo控件的内容
  Text := TargetEncoding.GetString(TargetBytes);
end;

procedure TMyRichEdit.ConvertToUTF8WithBOM();
var
  UTF8Encoding: TEncoding;
  BOM: TBytes;
  TextBytes: TBytes;
begin
  // 创建UTF-8编码和BOM字节序列
  UTF8Encoding := TEncoding.UTF8;
  BOM := TEncoding.UTF8.GetPreamble;

  // 将UTF-8编码的文本转换为字节序列
  TextBytes := TEncoding.UTF8.GetBytes(Text);

  // 合并BOM和文本字节序列
  Text := UTF8Encoding.GetString(BOM + TextBytes);
end;

procedure TMyRichEdit.ConvertEncoding3(TargetEncoding: TEncoding);
var
  ss: TStringStream;
begin
  ss := TStringStream.Create(Text, TargetEncoding);
  Lines.LoadFromStream(ss);
  /// ss.Free;
end;

function TMyRichEdit.GetRichEditText(RichEdit: TRichEdit): WideString;
var
  GetTextLengthEx: TGetTextLengthEx;
  GetTextEx: TGetTextEx;
  Len: Integer;
begin
  GetTextLengthEx.flags := GTL_DEFAULT;
  GetTextLengthEx.codepage := 1200;
  Len := SendMessage(RichEdit.Handle, EM_GETTEXTLENGTHEX, wParam(@GetTextLengthEx), 0);
  if Len = E_INVALIDARG then
    raise Exception.Create('EM_GETTEXTLENGTHEX failed');
  SetLength(Result, Len);
  if Len = 0 then
    Exit;
  GetTextEx.cb := (Length(Result) + 1) * SizeOf(WideChar);
  GetTextEx.flags := GTL_DEFAULT;
  GetTextEx.codepage := 1200;
  GetTextEx.lpDefaultChar := nil;
  GetTextEx.lpUsedDefChar := nil;
  SendMessage(RichEdit.Handle, EM_GETTEXTEX, wParam(@GetTextEx), LPARAM(PWideChar(Result)));
end;

function TMyRichEdit.GetRichEditText(RichEdit: TRichEdit; AnsiCodePage: UINT): AnsiString;
var
  GetTextLengthEx: TGetTextLengthEx;
  GetTextEx: TGetTextEx;
  Len: Integer;
begin
  GetTextLengthEx.flags := GTL_DEFAULT;
  GetTextLengthEx.codepage := AnsiCodePage;
  Len := SendMessage(RichEdit.Handle, EM_GETTEXTLENGTHEX, wParam(@GetTextLengthEx), 0);
  if Len = E_INVALIDARG then
    raise Exception.Create('EM_GETTEXTLENGTHEX failed');
  SetLength(Result, Len);
  if Len = 0 then
    Exit;
  GetTextEx.cb := (Length(Result) + 1) * SizeOf(AnsiChar);
  GetTextEx.flags := GTL_DEFAULT;
  GetTextEx.codepage := AnsiCodePage;
  GetTextEx.lpDefaultChar := nil;
  GetTextEx.lpUsedDefChar := nil;
  SendMessage(RichEdit.Handle, EM_GETTEXTEX, wParam(@GetTextEx), LPARAM(PWideChar(Result)));
end;

// 取得文件编码
function TMyRichEdit.DetectTextFileEncoding(const FileName: string): TEncoding;
var
  Buffer: array [0 .. 3] of Byte;
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Stream.ReadBuffer(Buffer, SizeOf(Buffer));
    if (Buffer[0] = $FF) and (Buffer[1] = $FE) then
      Result := TEncoding.Unicode
      /// Little-Endian UTF-16
    else if (Buffer[0] = $FE) and (Buffer[1] = $FF) then
      Result := TEncoding.BigEndianUnicode
      /// Big-Endian UTF-16
    else if (Buffer[0] = $EF) and (Buffer[1] = $BB) and (Buffer[2] = $BF) then
      Result := TEncoding.UTF8
      /// UTF-8 带BOM 编码（UTF8）
    else if (Buffer[0] = $2B) and (Buffer[1] = $2F) and (Buffer[2] = $76) then
      Result := TEncoding.UTF7
    else
      Result := TEncoding.Default; // 默认使用系统默认编码
  finally
    Stream.Free;
  end;
end;

procedure TMyRichEdit.SetDefaultFormat();
begin
  Font.Charset := TFontCharset(DEFAULT_CHARSET);
  Font.Name := '新宋体';
  Font.Size := 14;
  SelStart := MaxInt;
  SelAttributes.Name := Font.Name;
  SelAttributes.Size := Font.Size;
  SelAttributes.Color := Font.Color;
  SelAttributes.Style := Font.Style;
  SelAttributes.Charset := Font.Charset;

  WantReturns := false;
  HideSelection := false;
  EnableURLs := true;
  ParentFont := false;
end;

procedure TMyRichEdit.SetHexadecimalMode();
var
  SourceEncoding: TEncoding;
begin

  try
    // SourceEncoding := Self.Lines.Encoding;
    // 将Memo控件中的文本内容转换为源编码格式的字节序列
    // FSourceBytes := SourceEncoding.GetBytes(Text);
    Self.Clear;
    // LogBuffer(FSourceBytes, Length(FSourceBytes));
    Self.LoadAsBinFrom(FPathFileName);
    DataEngineManager.Remove2(FTAG);
  except
  end;
end;

procedure TMyRichEdit.SetHexadecimalMode(HexMode: Boolean);
begin
  FTAG := 'SetHexadecimalMode';
  if (not Self.FHexadecimalMode) and (HexMode) then
  begin
    FHexadecimalMode := true;
    if not DataEngineManager.Exist2(FTAG, nil) then
      DataEngineManager.DoAction(FTAG, SetHexadecimalMode);
  end;

  if (not HexMode) then
  begin
    if LoadFrom('') then
      FHexadecimalMode := false;
  end;
end;

/// /////////////////////////////////////////////////////////////////////////////
///
/// /////////////////////////////////////////////////////////////////////////////
///
constructor TMyPageEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRichEditList := TList.Create;
end;

function TMyPageEdit.GetPageIndex(PageName: String): Integer;
var
  TabSheet: TTabSheet;
begin
  Result := -1;
  TabSheet := GetPageByName(PageName);
  if TabSheet <> nil then
  begin
    Result := TabSheet.PageIndex;
  end;
end;

function TMyPageEdit.GetPageByName(PageName: String): TTabSheet;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Self.PageCount - 1 do
  begin
    if Self.Pages[i].Caption = PageName then
    begin
      Result := Self.Pages[i];
      break;
    end;
  end;
end;

function TMyPageEdit.GetPageByIndex(PageIndex: Integer): TTabSheet;
begin
  Result := nil;
  if (PageIndex >= 0) and (PageIndex < Self.PageCount) and (Self.PageCount > 0) then
  begin
    Result := Self.Pages[PageIndex];
  end;
end;

procedure TMyPageEdit.SetPageName(PageName: String; PageIndex: Integer);
var
  TabSheet: TTabSheet;
begin
  if Trim(PageName) = '' then
    Exit;

  TabSheet := GetPageByIndex(PageIndex);
  if TabSheet <> nil then
  begin
    TabSheet.Caption := PageName;
  end;
end;

procedure TMyPageEdit.CreatePage(PageName: String; PageType: Integer);
var
  NewTab: TTabSheet;
  NewRichEdit: TMyRichEdit;
  MyMemo: TMyMemo;
  WebBrowser: TWebBrowser;
  // f: TFont;
begin
  if FRichEditList = nil then
    FRichEditList := TList.Create;
  if PageType = 0 then
  begin
    if GetPageByName(PageName) = nil then
    begin
      NewTab := TTabSheet.Create(Self);
      NewTab.PageControl := Self;
      NewTab.Caption := PageName;

      NewRichEdit := TMyRichEdit.Create(NewTab);
      NewRichEdit.Parent := NewTab;
      NewRichEdit.Align := alClient;
      NewRichEdit.BorderStyle := bsNone;
      NewRichEdit.ScrollBars := ssBoth;
      NewRichEdit.DoubleBuffered := true;
      NewRichEdit.FDoubleBuffered := true;
      NewRichEdit.ParentDoubleBuffered := true;
      NewRichEdit.SetDefaultFormat();
      FRichEditList.Add(NewRichEdit);
    end;
  end

  else if PageType = 1 then
  begin
    if GetPageByName(PageName) = nil then
    begin
      NewTab := TTabSheet.Create(Self);
      NewTab.PageControl := Self;
      NewTab.Caption := PageName;

      WebBrowser := TWebBrowser.Create(NewTab);
      WebBrowser.SetParentComponent(NewTab);
      WebBrowser.Align := alClient;
      WebBrowser.silent := true; // 屏蔽脚本错误
      FRichEditList.Add(WebBrowser);
    end;
  end

  else if PageType = 2 then
  begin
    if GetPageByName(PageName) = nil then
    begin
      NewTab := TTabSheet.Create(Self);
      NewTab.PageControl := Self;
      NewTab.Caption := PageName;

      MyMemo := TMyMemo.Create(NewTab);
      MyMemo.Parent := NewTab;
      MyMemo.Align := alClient;
      MyMemo.BorderStyle := bsNone;
      MyMemo.ScrollBars := ssBoth;
      MyMemo.DoubleBuffered := true;
      MyMemo.FDoubleBuffered := true;
      /// MyMemo.FDoubleBufferedSaved := true;
      MyMemo.ParentDoubleBuffered := true;
      MyMemo.SetDefaultFormat();
      MyMemo.FStyle := 1;
      /// 文本风格样式，TMemo只有黑白风格
      FRichEditList.Add(MyMemo);
    end;
  end;

end;

procedure TMyPageEdit.DeletePage(PageName: String);
var
  NewTab: TTabSheet;
begin
  NewTab := GetPageByName(PageName);
  if NewTab <> nil then
  begin
    try
      DeletePageComponent(NewTab.PageIndex);
    finally
      NewTab.Free;
      NewTab := nil;
    end;
  end;
end;

procedure TMyPageEdit.DeletePageComponent(Index: Integer);
var
  NewRichEdit: TRichEdit;
begin
  if FRichEditList = nil then
    Exit;
  if Index >= FRichEditList.Count then
    Exit;
  if Index < 0 then
    Exit;

  NewRichEdit := FRichEditList.Items[Index];
  FRichEditList.Delete(Index);
  NewRichEdit.Free;

end;

function TMyPageEdit.GetEdit(Index: Integer): TMyRichEdit;
var
  tmpComponent: TComponent;
begin
  Result := nil;
  if FRichEditList = nil then
    Exit;
  if Index >= FRichEditList.Count then
    Exit;
  if Index < 0 then
    Exit;
  tmpComponent := FRichEditList.Items[Index];
  if tmpComponent is TMyRichEdit then
    Result := TMyRichEdit(tmpComponent);
end;

function TMyPageEdit.GetEdit(PageName: String): TMyRichEdit;
var
  NewTab: TTabSheet;
begin
  Result := nil;
  NewTab := GetPageByName(PageName);
  if NewTab <> nil then
  begin
    Result := GetEdit(NewTab.PageIndex);
  end;
end;

function TMyPageEdit.GetMemo(Index: Integer): TMyMemo;
var
  tmpComponent: TComponent;
begin
  Result := nil;
  if FRichEditList = nil then
    Exit;
  if Index >= FRichEditList.Count then
    Exit;
  if Index < 0 then
    Exit;
  tmpComponent := FRichEditList.Items[Index];
  if tmpComponent is TMyMemo then
    Result := TMyMemo(tmpComponent);
end;

function TMyPageEdit.GetMemo(PageName: String): TMyMemo;
var
  NewTab: TTabSheet;
begin
  Result := nil;
  NewTab := GetPageByName(PageName);
  if NewTab <> nil then
  begin
    Result := GetMemo(NewTab.PageIndex);
  end;
end;

function TMyPageEdit.GetAMemo(): TMyMemo;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Self.PageCount - 1 do
  begin
    Result := GetMemo(i);
    if Result <> nil then
      break;
  end;
end;

function TMyPageEdit.GetAMemoIndex(): Integer;
var
  i: Integer;
begin
  Result := Self.PageCount - 1;
  for i := Self.PageCount - 1 downto 0 do
  begin
    if GetMemo(i) <> nil then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TMyPageEdit.GetComponent(Index: Integer): TComponent;
begin
  Result := nil;
  if FRichEditList = nil then
    Exit;
  if Index >= FRichEditList.Count then
    Exit;
  if Index < 0 then
    Exit;
  Result := FRichEditList.Items[Index];
end;

function TMyPageEdit.GetComponent(PageName: String): TComponent;
var
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := GetPageByName(PageName);
  if TabSheet <> nil then
  begin
    Result := GetComponent(TabSheet.PageIndex);
  end;
end;

{ procedure TMyPageEdit.Log(Msg: String; Index: Integer);
  var
  NewRichEdit: TTextControl;
  begin
  NewRichEdit := GetEdit(Index);
  if NewRichEdit <> nil then
  begin
  NewRichEdit.Log(Msg);
  end;
  end; }

function TMyPageEdit.GetPageName(Index: Integer): String;
begin
  Result := 'Null';
  if ((Index < 0) or (Index >= Self.PageCount)) then
    Exit;

  Result := Self.Pages[Index].Caption;
end;

function TMyPageEdit.GetActivePageName(): String;
begin
  Result := Self.ActivePage.Caption;
end;

{ procedure TMyPageEdit.Clear(Index: Integer);
  var
  NewRichEdit: TTextControl;
  begin
  NewRichEdit := GetEdit(Index);
  if NewRichEdit <> nil then
  begin
  NewRichEdit.Clear;
  end;
  end; }

function TMyPageEdit.GetWebBrowser(Index: Integer): TWebBrowser;
var
  tmpComponent: TComponent;
begin
  Result := nil;
  if FRichEditList = nil then
    Exit;
  if Index >= FRichEditList.Count then
    Exit;
  if Index < 0 then
    Exit;
  tmpComponent := FRichEditList.Items[Index];
  if tmpComponent is TWebBrowser then
    Result := TWebBrowser(tmpComponent);
end;

function TMyPageEdit.GetWebBrowser(PageName: String): TWebBrowser;
var
  NewTab: TTabSheet;
begin
  Result := nil;
  NewTab := GetPageByName(PageName);
  if NewTab <> nil then
  begin
    Result := GetWebBrowser(NewTab.PageIndex);
  end;
end;

function TMyPageEdit.LoadFileFrom(PathFileName: String; PageName: String): TMyRichEdit;
begin
  Result := GetEdit(PageName);
  if Result <> nil then
  begin
    Result.LoadFrom(PathFileName);
  end;
end;

function TMyPageEdit.LoadFileAsBinFrom(PathFileName: String; PageName: String): TMyRichEdit;
begin
  Result := GetEdit(PageName);
  if Result <> nil then
  begin
    Result.LoadAsBinFrom(PathFileName);
  end;
end;

function TMyPageEdit.GetPathFileName(Index: Integer): String;
var
  Component: TComponent;
begin
  Result := '';
  Component := GetComponent(Index);
  if Component is TMyRichEdit then
    Result := TMyRichEdit(Component).FPathFileName
  else if Component is TMyMemo then
    Result := TMyMemo(Component).FPathFileName;
end;

procedure TMyPageEdit.FreeAll();
var
  i: Integer;
begin
  for i := 0 to Self.FRichEditList.Count - 1 do
  begin
  end;
  FRichEditList.Clear;
end;

procedure TMyPageEdit.Log(Msg: String; Index: Integer);
var
  Component: TComponent;
begin
  Component := GetComponent(Index);
  if Component is TMyMemo then
  begin
    TMyMemo(Component).Log(Msg);
  end;
end;

end.
