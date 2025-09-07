unit uOcComPortObj;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Winapi.Windows,
  Winapi.Messages,

  Vcl.StdCtrls,
  Vcl.forms,
  Vcl.Controls,
  VCLTee.Series,
  Vcl.MyPageEdit,

  CPort,
  uOcProtocol,

  RegularExpressions,
  System.SyncObjs;

type
  TRECEIVE_FORMAT = (ASCIIFormat, HexadecimalFormat, Graphic, OctopusProtocol, SaveToFile);
  TSEND_FORMAT = (S_ASCIIFormat, S_HexadecimalFormat, S_OctopusProtocol);

const
  INPUT_OUTPUT_BUFFER_SIZE = 2097152; // 1048576;

const
  COM_PROTOCOL_KEEP_MAX_BUFFER_SIZE = 524288; // 1048576;

const
  OCTOPUS_BACKGROUD_STRING_TRIGGERLINE = 80;

const
  SEND_FLAG = '<- ';
  RECE_FLAG = '   ';

const
  RECEIVE_FORMAT_String: array [TRECEIVE_FORMAT] of string = ('ASCII Format Receiving ', 'Hexadecimal Format Receiving ', 'Graphic Analysis ',
    'Octopus Protocol Analysis', 'File Receiving');

  MAX_BAUDRATE_INDEX: Integer = 15;
  DEFAULT_HEXDATA_HEXSTRING_SPACE = 5;

type
  TCallBackFun = Procedure(Count: Integer = 0) of object;
  TProtocolCallBackFun = Procedure(TypeID: Integer) of object;

  { TOcComPortObjPara = packed record
    ComportFullName: String;
    Port: String; // change com port;
    BaudRate: integer;
    DataBits: integer;
    StopBits: integer;
    ParityBits: integer;
    FlowControl: integer;
    ReceiveFormat: integer;
    SendFormat: integer;
    LogMemo: TMemo; // j
    ShowDate: Boolean;
    ShowTime: Boolean;
    ShowLineNumber: Boolean;
    ShowSendedLog: Boolean;
    HexModeWithString: Boolean; // o
    end; }

  // thread for background monitoring of port events
type
  TComUIHandleThread = class;
  TComPackParserHandleThread = class;

  TOcComPortObj = class(TComport)
  private

    FComReceiveBuffer: array [0 .. INPUT_OUTPUT_BUFFER_SIZE] of Byte;
    // 1024 * 1024 =  1048576 =1M // for com port receive buffer
    FComReceiveInternalBuffer: array of Byte; // for 异步处理
    FFastLineSeries: TFastLineSeries;

    FComPortFullName: String;
    FSendFormat: Integer; // h
    FSendCodeFormat: Integer;
    FReceiveFormat: Integer; // i
    FLogObject: TMyMemo; // TMyRichEdit; // j
    FShowDate: Boolean;
    FShowTime: Boolean;
    FShowLineNumber: Boolean;
    /// 永远为false,已抛弃
    FShowSendingLog: Boolean;
    FHexModeWithString: Boolean; // o
    FHexModeFormatCount: Integer;
    FCompatibleUnicode: Boolean;
    FComReceiveString: String;
    FStringInternalMemo: TMemo;

    FComUIHandleThread: TComUIHandleThread; // 异步线程
    FComPackParserThread: TComPackParserHandleThread;
    FBackGroundProcessRecordCount: Integer;
    FComHandleThread_Wait: Boolean; // 同步变量

    FProtocalData: Integer;
    FNeedCRC16: Boolean;
    FComReceiveCount: Int64;
    FComProcessedCount: Int64;
    FComSentCount: Int64;
    FCallBackFun: TCallBackFun;
    FProtocolCallBackFun: TProtocolCallBackFun;

    FullLogFileName: String;
    FFileStream: TFileStream;
    FFileStreamName: String;
    FOctopusUartProtocol: TOctopusUartProtocol;
    FExcelAppRows: Int64;
    FCommadLineStr: String;
    FPreCommadLineStr: String;
    FLastLineStr: String;
    FCommandHistory: TStringList;
    FCommandHistoryIndex: Integer;
    FNeedNewLine: Boolean;
    FLogScrollMode: Boolean;
    FMouseTextSelection: Boolean;
    // FMouseStatus:Boolean;
    FBackgroundTaskMode: Boolean;
    // function GetConfiguration(): TOcComPortObjPara;
    function GetLineNumberDateTimeStamp(N: Int64): String;
    function SaveToTheExcelFile(Length: Integer; Rows: Integer): Integer;
    procedure OcComPortObjRxChar(Sender: TObject; Count: Integer);
    procedure OcComPortObjRxProtocol(PFrame: TPOctopusUARTFrame);

    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RunWindosShellCmd(const str: string);

    procedure CachedString(const str: String);
  public
    status: Integer;
    ExcelApp: Variant;

    Constructor Create(AOwner: TComponent; DeviceName: String);
    destructor Destroy; override;
    // procedure OcComPortObjInit(OcComPortObjPara: TOcComPortObjPara);
    procedure OcComPortObjInit2(a, b: String; c, d, e, f, g, h, i: Integer; j: TMyRichEdit; time, date, line, log, o: Boolean);

    function getCMDStr(): String;
    function IsLogAtBottom(): Boolean;
    procedure log(const Msg: string); // log data
    procedure LogBuff(flag: String; const Buff: Array of Byte; Count: Integer);
    procedure LogBottomMod(const Msg: string; appendMod: Boolean; bottomMod: Boolean);
    procedure DebugLog(const Msg: string);
    procedure ClearLog();
    procedure ClearInternalBuff(id: Integer = 100);

    procedure SaveLog(FullLogFilePath: String);
    procedure SetLogComponent(Component: TMyMemo);
    procedure SetLogComponentReadOnly(ReadOnly: Boolean);
    procedure SetCacheComponent(AOwner: TWinControl);
    procedure SetMsgCallbackFunction(CallBackFun: TCallBackFun);

    /// property OcComPortObjPara: TOcComPortObjPara read GetConfiguration write FOcComPortObjPara;
    property LogObject: TMyMemo read FLogObject write FLogObject;
    property StringInternelCache: TMemo read FStringInternalMemo write FStringInternalMemo;

    property CallBackFun: TCallBackFun read FCallBackFun write FCallBackFun;

    property ProtocolCallBackFun: TProtocolCallBackFun read FProtocolCallBackFun write FProtocolCallBackFun;
    property ComReceiveCount: Int64 read FComReceiveCount;
    property ComProcessedCount: Int64 read FComProcessedCount;
    property ComSentCount: Int64 read FComSentCount;
    property ComHandleThread_AsynCount: Integer read FBackGroundProcessRecordCount write FBackGroundProcessRecordCount
      default OCTOPUS_BACKGROUD_STRING_TRIGGERLINE;
    property HexModeFormatCount: Integer read FHexModeFormatCount write FHexModeFormatCount default 32;
    property FileStream: TFileStream read FFileStream write FFileStream default nil;
    property FileStreamName: String read FFileStreamName write FFileStreamName;
    property ProtocalData: Integer read FProtocalData write FProtocalData default -1;
    property FastLineSeries: TFastLineSeries read FFastLineSeries write FFastLineSeries;

    property ReceiveFormat: Integer read FReceiveFormat write FReceiveFormat;
    property SendFormat: Integer read FSendFormat write FSendFormat default 0;
    property SendCodeFormat: Integer read FSendCodeFormat write FSendCodeFormat default 0;

    property CompatibleUnicode: Boolean read FCompatibleUnicode write FCompatibleUnicode default false;
    property NeedCRC16: Boolean read FNeedCRC16 write FNeedCRC16 default false;
    property ShowSendedLog: Boolean read FShowSendingLog write FShowSendingLog;
    property ShowDate: Boolean read FShowDate write FShowDate;
    property ShowLineNumber: Boolean read FShowLineNumber write FShowLineNumber default false;
    property ShowTime: Boolean read FShowTime write FShowTime;
    property LogScrollMode: Boolean read FLogScrollMode write FLogScrollMode default True;
    property MouseTextSelection: Boolean read FMouseTextSelection write FMouseTextSelection;
    property BackgroundTaskMode: Boolean read FBackgroundTaskMode write FBackgroundTaskMode default True;
    property CommadLineStr: String read FCommadLineStr write FCommadLineStr;
    property ComPortFullName: String read FComPortFullName write FComPortFullName;
    property OctopusUartProtocol: TOctopusUartProtocol read FOctopusUartProtocol;

    function FalconComSendBuffer(const Buffer: array of Byte; Count: Integer): Bool;
    function FalconComSendData_Common(str: string; SendFormat: Integer): Bool;
    function FalconComSendData_Terminal(str: string; SendFormat: Integer): Bool;
    function FalconComSendData_MultiTimes(str: string; SendFormat: Integer): Bool;
    function FalconComSendData_SentString(str: string): Integer;

    function WaitProtocolACK(ACK: Integer; timeOut: Integer): Boolean;
    function WaitProtocolCommand(ACK_Command: Integer; timeOut: Integer): Boolean; overload;
    function WaitProtocolCommand(ACK_Command: Integer; parameter1, parameter2: Integer; timeOut: Integer): Boolean; overload;
    function SendProtocolData(AFrameType, ACommand: Byte; AData: array of Byte; Count: Integer; NeedACK: Boolean): Boolean; overload;
    function SendProtocolData(AHeader, AFrameType, ACommand: Byte; AData: array of Byte; Count: Integer; NeedACK: Boolean): Boolean; overload;

    function SendProtocolPackage(PFrame: TPOctopusUARTFrame): Boolean; overload;
    function SendProtocolPackageWaitACK(PFrame: TPOctopusUARTFrame; ACK: Integer): Boolean;
    function SendProtocolPackageWaitACKCommand(PFrame: TPOctopusUARTFrame; ACKCommand: Integer): Boolean; overload;
    function SendProtocolPackageWaitACKCommand(PFrame: TPOctopusUARTFrame; ACKCommand, ACKParatemer1, ACKParatemer2: Integer): Boolean; overload;
    procedure SendProtocolACK(); // 发送ACK
    procedure RequestProtocolConnection(); // 发送连接请求

    procedure NotifyCallBack();

    procedure CloseDevice();
    procedure Free();

    procedure StartFlushOutCackedString();
    procedure PauseFlushOutCackedString();
    function GetCachedLinesCount(): Integer;
  end;

  TComUIHandleThread = class(TThread)
  private
    FEvent: TEvent;
    FOcComPortObj: TOcComPortObj;
    FCachedCounterIndex: Int64;
    FNeedToReset: Integer;
    // FThreadSync_BusyFlag:Boolean;
  protected
    constructor Create(OcComPortObj: TOcComPortObj);
    procedure Execute; override;
    destructor Destroy; override;
    procedure Pause;
    procedure ResumeThread;
  public
    property ResetID: Integer read FNeedToReset write FNeedToReset default -1;
  end;

  TComPackParserHandleThread = class(TThread)
  private
    FOcComPortObj: TOcComPortObj;
    FHOctopusUartProtocol: TOctopusUartProtocol;
    FStartIndex: Int64;
  protected
    constructor Create(OcComPortObj: TOcComPortObj; OcComProtocal: TOctopusUartProtocol);
    procedure Execute; override;
    // procedure RequestConnection();
    // procedure SendPackData()
  public
    procedure StopReSetClear();
  end;

var
  Critical: TRTLCriticalSection;
  CmdDir: String;

function IsLeftMouseButtonDown: Boolean;
function ReadFileToStream(FileName: String): TFileStream;

implementation

uses uOctopusFunction;

function IsLeftMouseButtonDown: Boolean;
begin
  Result := GetKeyState(MK_LBUTTON) < 0;
end;

function ReadFileToStream(FileName: String): TFileStream;
var
  FileStream: TFileStream;
begin
  Result := nil;
  try
    FileStream := TFileStream.Create(FileName, fmOpenReadWrite or fmShareExclusive);
    FileStream.Position := 0;
    Result := FileStream;
  except
  end;
end;

function writeFileToStream(FileStream: TFileStream; Buffer: array of Byte; Len: Integer): Integer;
begin
  try
    Result := FileStream.Write(Buffer, Len);
  except
  end;
end;

function FalconGetComPort(str: string): string;
const
  pattern = 'COM +d';
var
  ss: string;
  i1, i2: Integer;
  pStr: Pchar;
  // match: TMatch;
begin
  str := Trim(str);
  pStr := StrRScan(Pchar(str), 'C');
  if (Pos('COM', pStr) > 0) then
  begin
    i1 := 1;
    i2 := Pos(')', pStr);
    if ((i2 - i1) > 1) then
    begin
      ss := Copy(pStr, i1, i2 - i1);
    end;
  end
  else if (Pos('PID', str) > 0) then
    ss := Copy(str, Pos('PID', str), 10)
  else
    ss := '';

  Result := ss;
end;

function GetSystemDateTimeStampStr2(types: Integer): string;
var
  LocalSystemTime: _SYSTEMTIME;
  d, t: String;
begin
  Result := '';
  GetLocalTime(LocalSystemTime);
  if types = 0 then // 日期
  begin
    d := Format('[%0.4d%0.2d%0.2d]', [LocalSystemTime.wYear, LocalSystemTime.wMonth, LocalSystemTime.wDay]);
    Result := d + ' ';
  end;
  if types = 1 then // 时间
  begin
    t := Format('[%0.2d:%0.2d:%0.2d]', [LocalSystemTime.wHour, LocalSystemTime.wMinute, LocalSystemTime.wSecond]);
    Result := t + ' ';
  end;

  if types = 2 then
  begin
    d := Format('[%0.4d%0.2d%0.2d', [LocalSystemTime.wYear, LocalSystemTime.wMonth, LocalSystemTime.wDay]);
    t := Format('%0.2d:%0.2d:%0.2d]', [LocalSystemTime.wHour, LocalSystemTime.wMinute, LocalSystemTime.wSecond]);
    Result := d + ' ' + t + ' ';
  end;
end;

function GetLineNumberStrForLog(LineNumber: Int64): string;
begin
  // Result := '';
  // if (LineNumber < 0) then
  // LineNumber := 0;
  // if LineNumber < 100 then
  // Result := Format('%0.2d| ', [LineNumber])
  // else if LineNumber < 1000 then
  // Result := Format('%0.3d| ', [LineNumber])
  // else if LineNumber < 10000 then
  // Result := Format('%0.4d| ', [LineNumber])
  if LineNumber < 100000 then
    Result := Format('%0.5d| ', [LineNumber])

  else if LineNumber < 1000000 then
    Result := Format('%0.6d| ', [LineNumber])
  else if LineNumber < 10000000 then
    Result := Format('%0.7d| ', [LineNumber])
  else
    Result := Format('%0.10d| ', [LineNumber])
end;

constructor TComPackParserHandleThread.Create(OcComPortObj: TOcComPortObj; OcComProtocal: TOctopusUartProtocol);
// 数据特殊处理线程后台进行
begin
  inherited Create(True); // 先挂起
  FStartIndex := 0;
  self.FOcComPortObj := OcComPortObj;
  self.Suspended := True;
  FHOctopusUartProtocol := OcComProtocal;
end;

procedure TComPackParserHandleThread.StopReSetClear();
// var
// f: Boolean;
begin
  // f := self.Suspended;
  if not self.Suspended then
  begin
    self.Suspended := True; // 重置解析线程的时候，清空所有缓存
    self.FOcComPortObj.ClearInternalBuff();
  end;
  self.FHOctopusUartProtocol.ClearFrame();
  self.FStartIndex := 0;
  // self.Suspended:=f;
end;

procedure TComPackParserHandleThread.Execute;
var
  j: Int64;
begin
  while (self.Terminated = false) do
  begin
    { if (self.FOcComProtocal.GetLastPackHead.PID = OCCOMPROTOCAL_DATA2) then
      begin
      // 非标准超大数据包处理
      if (Length(FOcComPortObj.FComReceiveInternalBuffer) - FStartIndex <
      self.FOcComProtocal.GetLastPackHead.Length) then
      Continue; // 没有完成继续处理
      FStartIndex := FStartIndex + self.FOcComProtocal.GetLastPackHead.Length;
      // 超大数据包处理完毕，跳过
      end; }

    try
      if Length(FOcComPortObj.FComReceiveInternalBuffer) >= FHOctopusUartProtocol.GetProtocolHeaderSize() then
      begin
        j := self.FHOctopusUartProtocol.ParserUartFrame(@FOcComPortObj.FComReceiveInternalBuffer[FStartIndex], Length(FOcComPortObj.FComReceiveInternalBuffer) -
          FStartIndex);

        FStartIndex := FStartIndex + j;
      end
      else
      begin
        self.Suspended := True; // 数据不足，挂起休眠
      end;
    except
    end;

    // if FStartIndex > Length(FOcComPortObj.FComReceiveInternalBuffer)-SizeOf(TOcComPack2) then //解析完毕
    // if FOcComProtocal.IsParserComplete { and (Length(FOcComPortObj.FComReceiveInternalBuffer) > 0) }

    if FStartIndex >= Length(FOcComPortObj.FComReceiveInternalBuffer) - 1 then // 解析完毕 then
    // 解析任务完毕，清缓存
    begin
      // EnterCriticalSection(Critical);
      FOcComPortObj.ClearInternalBuff();
      // LeaveCriticalSection(Critical);
      FStartIndex := 0; // 再这里复位，复位了不清解析后的数据
      self.Suspended := True;
    end;
    // if  FOcComPortObj.FComPackParserThread.Suspended or (Length(FOcComPortObj.FComReceiveInternalBuffer) > COM_PROTOCOL_KEEP_MAX_BUFFER_SIZE) then //解析线程任务还没有完成 不清缓存
    // begin //清内部缓存，后台线程挂起，或缓存过大,后台线程强制清缓存
    // end
  end; // while(not Self.Terminated) do
end;

constructor TComUIHandleThread.Create(OcComPortObj: TOcComPortObj);
// 数据特殊处理线程后台进行
begin
  inherited Create(True); // 先挂起
  self.FOcComPortObj := OcComPortObj;
  self.Suspended := True;
  self.Priority := tpHighest;
  FEvent := TEvent.Create(nil, True, false, ''); // 手动重置的初始事件
end;

destructor TComUIHandleThread.Destroy;
begin
  FEvent.Free;
  inherited;
end;

procedure TComUIHandleThread.Pause;
begin
  FEvent.ResetEvent; // 暂停线程，WaitFor 将阻塞
end;

procedure TComUIHandleThread.ResumeThread;
begin
  FEvent.SetEvent; // 恢复线程，WaitFor 将通过
end;

procedure Delay(MSecs: Longint);
// 延时函数，MSecs单位为毫秒(千分之1秒)
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount();
  repeat
    Application.ProcessMessages;
    Now := GetTickCount();
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

procedure TComUIHandleThread.Execute;
var
  j: Int64;
  s, f: String;
  delayTimesTick: Int64;
  appended: Boolean;
  tick_diff: Int64;
  diff_count: Integer;
begin
  j := 0;
  s := '';

  if (FOcComPortObj = nil) or (self = nil) then
    Exit;

  delayTimesTick := 0;
  while not Terminated do
  begin
    if (FOcComPortObj = nil) or (self = nil) then
      break;

    if FOcComPortObj.FComHandleThread_Wait then
      Continue;

    if (not FOcComPortObj.Connected) then
      break;

    /// FEvent.WaitFor(INFINITE); // // 阻塞线程，直到被唤醒

    if Terminated then
      break;

    case FNeedToReset of // 强制切换接收格式清先前的缓存
      0:
        FOcComPortObj.ClearInternalBuff(0);
      1:
        FOcComPortObj.ClearInternalBuff(1);
    end;

    /// ////////////////////////////////////////////////////////////////////////////////////////////////////////ASCIIFormat
    if self.FOcComPortObj.FReceiveFormat = Ord(ASCIIFormat) then
    begin
      // if ((GetTickCount() - delayTimesTick) < 5) then
      // Continue;

      if FOcComPortObj.StringInternelCache.Lines.Updating then
        Continue;

      if FCachedCounterIndex >= FOcComPortObj.GetCachedLinesCount() then
        Continue;

      s := FOcComPortObj.StringInternelCache.Lines.Strings[FCachedCounterIndex];
      diff_count := FOcComPortObj.GetCachedLinesCount() - FCachedCounterIndex;

      if ((Trim(s) = '') or (FCachedCounterIndex = 0) or (diff_count <= 2) or (Length(Trim(s)) < 20)) then
      begin
        if delayTimesTick = 0 then
        begin
          delayTimesTick := GetTickCount();
          Continue; // 等
        end
        else
        begin
          tick_diff := (GetTickCount() - delayTimesTick);
          if (tick_diff < 100) then
            Continue; // 等待一会
        end
      end;

      delayTimesTick := 0;
      // 处理完一行
      FOcComPortObj.FComProcessedCount := FOcComPortObj.FComProcessedCount + Length(s);
      s := FOcComPortObj.GetLineNumberDateTimeStamp(FOcComPortObj.FLogObject.Lines.Count) + s;

      FOcComPortObj.LogBottomMod(s, True, FOcComPortObj.IsLogAtBottom());
      INC(FCachedCounterIndex); // 下一行

      // if FOcComPortObj.GetCachedLinesCount() > 0 then
      // FOcComPortObj.StringInternelCache.Lines.Delete(0);

      if Assigned(FOcComPortObj.FCallBackFun) then
        FOcComPortObj.FCallBackFun();
    end
    /// ////////////////////////////////////////////////////////////////////////////////////////////////////////hex
    /// ////////////////////////////////////////////////////////////////////////////////////////////////////////hex
    ///
    else if self.FOcComPortObj.FReceiveFormat = Ord(HexadecimalFormat) then
    begin
      f := '%-' + IntToStr(FOcComPortObj.FHexModeFormatCount * 3 + DEFAULT_HEXDATA_HEXSTRING_SPACE) + 's';
      // 有数据需要累计，开始实时累计数据
      if FCachedCounterIndex < Length(FOcComPortObj.FComReceiveInternalBuffer) then
      begin // 有数据处理数据
        // 累计字节
        s := s + Format('%.02x ', [FOcComPortObj.FComReceiveInternalBuffer[FCachedCounterIndex]]);
        INC(FOcComPortObj.FComProcessedCount);

        if FOcComPortObj.FHexModeFormatCount > 0 then // 累计中需要格式化处理
        begin
          if ((FCachedCounterIndex + 1) mod FOcComPortObj.FHexModeFormatCount) = 0 then
          begin
            j := FCachedCounterIndex + 1; // 实际已经处理过的数据
            if FOcComPortObj.FHexModeWithString then // 需要解析翻译
            begin
              s := Format(f, [Trim(s)]);
              s := s + ByteToWideString2(@FOcComPortObj.FComReceiveInternalBuffer[FCachedCounterIndex - FOcComPortObj.FHexModeFormatCount + 1],
                FOcComPortObj.FHexModeFormatCount);
            end;
            FOcComPortObj.log('   ' + s);
            s := ''; // 这时J 的值无意义
          end;
        end; //

        INC(FCachedCounterIndex); // 累计索引计数
      end;

      if FCachedCounterIndex >= Length(FOcComPortObj.FComReceiveInternalBuffer) then // 已经累计完毕所有数据
      begin // 没有收到新的数据，准备清场,打印所有累计到的数据
        if s <> '' then // 有累计数据需要打印
        begin
          if FOcComPortObj.FHexModeFormatCount > 0 then // 可能存在最后没有格式话的数据，解析固定长度
          begin
            if FOcComPortObj.FHexModeWithString then // 是否需要解析，需要格式话一定需要解析
            begin
              if ((Length(FOcComPortObj.FComReceiveInternalBuffer) - j) <= FOcComPortObj.FHexModeFormatCount) then
              begin
                s := Format(f, [Trim(s)]);
                s := s + ByteToWideString2(@FOcComPortObj.FComReceiveInternalBuffer[j], FOcComPortObj.FHexModeFormatCount);
              end
              else
              begin // 这种情况应该没有
                s := s + '   ' + ByteToWideString2(@FOcComPortObj.FComReceiveInternalBuffer[j], Length(FOcComPortObj.FComReceiveInternalBuffer) - j)
              end;
            end
            else
            begin
              s := Format(f, [Trim(s)]);
            end;
          end;

          { if FOcComPortObj.FHexModeWithString then // 是否需要解析
            begin
            s := Format(f, [Trim(s)]);
            if FOcComPortObj.FHexModeFormatCount > 0 then // 可能存在最后没有格式话的数据，解析固定长度
            s := s + ByteToWideString2(@FOcComPortObj.FComReceiveInternalBuffer[j], FOcComPortObj.FHexModeFormatCount)
            else // 解析所有
            s := s + '   ' + ByteToWideString2(@FOcComPortObj.FComReceiveInternalBuffer[j], Length(FOcComPortObj.FComReceiveInternalBuffer) - j)
            end; }

          FOcComPortObj.log('   ' + s); // 打印出所有数据,输出最终数据
          s := '';
        end;

        if FCachedCounterIndex < Length(FOcComPortObj.FComReceiveInternalBuffer) then
          Continue;
        if FOcComPortObj.FComHandleThread_Wait then
          Continue;
        j := 0;
        s := '';

        EnterCriticalSection(Critical);
        FOcComPortObj.ClearInternalBuff();
        LeaveCriticalSection(Critical);

        self.Suspended := True; // 忙完了挂起
        Continue;
      end;
    end // hex
    /// ////////////////////////////////////////////////////////////////////////////////////////////////////////Graphic
    else if (FOcComPortObj.FReceiveFormat = Ord(Graphic)) and (FOcComPortObj.FastLineSeries <> nil) then
    begin
      if FCachedCounterIndex < Length(FOcComPortObj.FComReceiveInternalBuffer) then
      begin // 有数据处理数据
        FOcComPortObj.FastLineSeries.AddY(FOcComPortObj.FComReceiveInternalBuffer[FCachedCounterIndex]);
        // self.FOcComPortObj.FastLineSeries.AddArray(FOcComPortObj.FComReceiveInternalBuffer);

        if Assigned(FOcComPortObj.FCallBackFun) then
          FOcComPortObj.FCallBackFun(1);
        INC(FCachedCounterIndex);
        INC(FOcComPortObj.FComProcessedCount);
      end;
      if FCachedCounterIndex >= Length(FOcComPortObj.FComReceiveInternalBuffer) then
      begin // 没有数据准备清场
        if FCachedCounterIndex < Length(FOcComPortObj.FComReceiveInternalBuffer) then
          Continue;
        if FOcComPortObj.FComHandleThread_Wait then
          Continue;
        EnterCriticalSection(Critical);
        FOcComPortObj.ClearInternalBuff();
        LeaveCriticalSection(Critical);
        self.Suspended := True; // 忙完了挂起
        Continue;
      end;
    end; // ord(Graphic)

  end; // while(not Self.Terminated) do

end;

Constructor TOcComPortObj.Create(AOwner: TComponent; DeviceName: String);
begin
  inherited Create(nil);
  self.FComPortFullName := Trim(DeviceName);
  self.Port := FalconGetComPort(DeviceName);
  // self.LogMemo := TMemo.Create(nil);
  if self.FLogObject <> nil then
  begin
    self.FLogObject.ScrollBars := ssBoth;
    self.FLogObject.ReadOnly := True;
    self.FLogObject.DoubleBuffered := True;
  end;
  // self.LogMemo.Parent.DoubleBuffered:=true;
  // self.LogMemo.Parent.Parent.DoubleBuffered:=true;
  // self.MemoTemp.Parent:=AOwner;
  self.StringInternelCache := TMemo.Create(nil);
  self.StringInternelCache.ScrollBars := ssBoth;
  self.StringInternelCache.ReadOnly := True;
  self.StringInternelCache.DoubleBuffered := True;
  self.StringInternelCache.Visible := false;

  self.Buffer.InputSize := INPUT_OUTPUT_BUFFER_SIZE;
  self.Buffer.OutputSize := INPUT_OUTPUT_BUFFER_SIZE;

  FOctopusUartProtocol := TOctopusUartProtocol.Create;
  FComPackParserThread := TComPackParserHandleThread.Create(self, FOctopusUartProtocol);
  FComReceiveCount := 0;
  FComProcessedCount := 0;
  FBackGroundProcessRecordCount := OCTOPUS_BACKGROUD_STRING_TRIGGERLINE;
  ClearInternalBuff;
  FHexModeWithString := True;
  FHexModeFormatCount := 16;
  SetLength(FComReceiveInternalBuffer, 0);
  FullLogFileName := '';
  FFileStream := nil;

  FProtocalData := 1;
  FCompatibleUnicode := false;
  FExcelAppRows := 0;
  FShowLineNumber := false;
  FCommadLineStr := '';
  FLastLineStr := '';
  FNeedNewLine := false;
  // LogMemo.ReadOnly:=false;
  FCommandHistory := TStringList.Create;
  FCommandHistoryIndex := 0;
  FLogScrollMode := True;
  FSendFormat := 0;

  Timeouts.ReadInterval := 10;
  FMouseTextSelection := false;
end;

// destroy component
destructor TOcComPortObj.Destroy;
begin
  FStringInternalMemo.Free;
  // FLogMemo.Free;
  if FComUIHandleThread <> nil then
  begin
    FComUIHandleThread.Suspended := True;
    FComUIHandleThread.Terminate;
    FComUIHandleThread.Free;
  end;

  FComPackParserThread.Suspended := True;
  FComPackParserThread.Terminate;
  FComPackParserThread.Free;

  if FFileStream <> nil then
    FreeAndNil(FFileStream);
  inherited Destroy;
end;

{ function TOcComPortObj.GetConfiguration(): TOcComPortObjPara;
  // var
  // FOcComPortObjPara: TOcComPortObjPara;
  begin
  FOcComPortObjPara.Port := self.Port;
  FOcComPortObjPara.ComportFullName := self.FComportFullName;
  FOcComPortObjPara.BaudRate := Ord(self.BaudRate);
  FOcComPortObjPara.DataBits := Ord(self.DataBits);
  FOcComPortObjPara.StopBits := Ord(self.StopBits);
  FOcComPortObjPara.ParityBits := Ord(self.Parity.Bits);
  FOcComPortObjPara.FlowControl := Ord(self.FlowControl.FlowControl);
  FOcComPortObjPara.ReceiveFormat := self.FReceiveFormat;
  FOcComPortObjPara.SendFormat := self.FSendFormat;
  FOcComPortObjPara.LogMemo := self.LogMemo;
  FOcComPortObjPara.ShowDate := self.FShowDate;
  FOcComPortObjPara.ShowTime := self.FShowTime;
  FOcComPortObjPara.ShowLineNumber := self.FShowLineNumber;
  FOcComPortObjPara.ShowSendedLog := self.FShowSendingLog;
  FOcComPortObjPara.HexModeWithString := self.FHexModeWithString;
  Result := FOcComPortObjPara;
  end; }
procedure TOcComPortObj.SetLogComponent(Component: TMyMemo);
begin
  self.FLogObject := Component;
  self.FLogObject.ReadOnly := True;
  self.FLogObject.DoubleBuffered := True;

  /// FLogObject.OnKeyPress := self.KeyPress;
  FLogObject.OnKeyDown := self.KeyDown;
  FLogObject.OnKeyUp := self.KeyUp;

  FLogObject.OnMouseDown := self.MouseDown;
  FLogObject.OnMouseMove := self.MouseMove;
  FLogObject.OnMouseUp := self.MouseUp;
end;

procedure TOcComPortObj.SetLogComponentReadOnly(ReadOnly: Boolean);
begin
  if (FLogObject <> nil) and (FLogObject.Parent <> nil) then
    self.FLogObject.ReadOnly := ReadOnly;
end;

procedure TOcComPortObj.SetCacheComponent(AOwner: TWinControl);
begin
  StringInternelCache.Parent := AOwner;
  StringInternelCache.Align := alClient;
  StringInternelCache.ReadOnly := True;
  /// StringInternelCache.Color:=clBlack;
  StringInternelCache.DoubleBuffered := True;
end;

procedure TOcComPortObj.SetMsgCallbackFunction(CallBackFun: TCallBackFun);
begin
  self.CallBackFun := CallBackFun;
end;

procedure TOcComPortObj.OcComPortObjInit2(a, b: String; c, d, e, f, g, h, i: Integer; j: TMyRichEdit; time, date, line, log, o: Boolean);
var
  threadsuspended: Boolean;
  // oldi:integer;
begin
  FComUIHandleThread := TComUIHandleThread.Create(self);
  // if(self.OnRxChar = nil) then
  self.OnRxChar := OcComPortObjRxChar;
  // if(self.FOcComProtocal.CallBackFun = nil) then
  self.FOctopusUartProtocol.CallBackFun := self.OcComPortObjRxProtocol;

  if a <> '' then
    self.FComPortFullName := a;
  if b <> '' then
    self.Port := b;
  if (c > MAX_BAUDRATE_INDEX) or (c < 0) then
    self.BaudRate := TBaudRate(0)
  else
    self.BaudRate := TBaudRate(c);
  if (d >= 0) then
    self.DataBits := TDataBits(d);
  if (e >= 0) then
    self.StopBits := TStopBits(e);
  if (f >= 0) then
    self.Parity.Bits := TParityBits(f);
  if (g >= 0) then
    self.FlowControl.FlowControl := TFlowControl(g);
  if (h >= 0) then
    self.FSendFormat := h;

  if (FReceiveFormat <> i) and (i >= 0) then // 切换接收格式 ,需要重置缓存
  begin
    threadsuspended := FComUIHandleThread.Suspended;
    if not threadsuspended then
    begin
      self.FComUIHandleThread.Suspended := True;
      // 如果工作线程已经在运行， 通过 ResetID 让工作线程自行重置
      self.FComUIHandleThread.ResetID := self.FReceiveFormat; // 通知线程重置先前的缓存
    end
    else
    begin
      self.ClearInternalBuff; // 否则直接重置
    end;

    FComPackParserThread.StopReSetClear; // 重置解析线程
    if FFileStream <> nil then
    begin
      FreeAndNil(FFileStream);
      self.FFileStreamName := '';
    end;

    self.FReceiveFormat := i;
    self.FComUIHandleThread.Suspended := threadsuspended;
    // 让UI 线程自行结束返回，避免在切换格式的时候丢失数据
  end;

  if j <> nil then
  begin
  end;

  self.FShowTime := time;
  self.FShowDate := date;

  self.FShowLineNumber := line;
  self.FShowSendingLog := log;
  self.FHexModeWithString := o;
  FNeedNewLine := True;
end;

procedure TOcComPortObj.ClearInternalBuff(id: Integer = 100);
// ClearInternelLogBuff(); //不随便清楚内部缓存
begin
  case id of
    0:
      if self.StringInternelCache.Parent <> nil then
      begin
        self.StringInternelCache.Clear; // 清字符串缓存区域
        FComUIHandleThread.FCachedCounterIndex := 0;
        FComUIHandleThread.ResetID := -1; // 复位，避免反复重置
      end;
    1:
      begin
        FComUIHandleThread.FCachedCounterIndex := 0; // 清字节流缓存
        SetLength(self.FComReceiveInternalBuffer, 0);
        FComUIHandleThread.ResetID := -1; // 复位，避免反复重置
      end
  else
    begin
      if self.StringInternelCache.Parent <> nil then
      begin
        self.StringInternelCache.Clear;
        FComUIHandleThread.FCachedCounterIndex := 0;
        SetLength(self.FComReceiveInternalBuffer, 0);
        FComUIHandleThread.ResetID := -1; // 复位，避免反复重置
      end;
    end;
  end;

end;

procedure TOcComPortObj.ClearLog;
begin
  if (FLogObject <> nil) and self.FLogObject.Showing then
  begin

    self.FLogObject.Lines.BeginUpdate;
    self.FLogObject.Clear;
    self.FComProcessedCount := 0;
    self.FComReceiveCount := 0;
    self.FComSentCount := 0;
    self.FComPackParserThread.StopReSetClear;
    self.FOctopusUartProtocol.ClearFrame();
    self.FLogObject.Lines.EndUpdate;

    if Assigned(FCallBackFun) then
      FCallBackFun();
  end;
end;

procedure TOcComPortObj.log(const Msg: string);
var
  i, PreLogLinesCount: Int64;
  str: String;
  isBottom: Boolean;
begin
  if (FLogObject = nil) or (FLogObject.Parent = nil) or (not self.Connected) then
  begin
    // MessageBox(Application.Handle, 'No device is found,please open a device.', Pchar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  isBottom := IsLogAtBottom();
  PreLogLinesCount := FLogObject.Lines.Count;

  // EnterCriticalSection(Critical);
  FLogObject.Lines.BeginUpdate;
  FLogObject.log(Msg);
  if FShowLineNumber or FShowDate or FShowTime then
  begin
    for i := PreLogLinesCount to FLogObject.Lines.Count - 1 do
    begin
      str := GetLineNumberDateTimeStamp(i) + FLogObject.Lines.Strings[i];
      /// LogMemo.Lines.Strings[i] := str;
      FLogObject.LogLine(str, i);
    end;
  end;
  FLogObject.Lines.EndUpdate;
  // LeaveCriticalSection(Critical);

  if FLogScrollMode and isBottom then
    FLogObject.Perform(WM_VSCROLL, SB_BOTTOM, 0);
  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

procedure TOcComPortObj.LogBuff(flag: String; const Buff: Array of Byte; Count: Integer);
var
  str: String;
  i, j: Integer;
  f: string;
  HexModeFormatCount: Integer;
begin
  str := '';
  if (Count <= 0) then
    Exit;

  HexModeFormatCount := 32;
  if (FHexModeFormatCount > 0) then
    HexModeFormatCount := FHexModeFormatCount;

  j := 0;
  f := '%-' + IntToStr(HexModeFormatCount * 3 + DEFAULT_HEXDATA_HEXSTRING_SPACE) + 's';
  for i := 0 to Count - 1 do
  begin
    str := str + Format('%.02x ', [Buff[i]]);
    INC(j);
    if ((i + 1) mod HexModeFormatCount) = 0 then
    begin
      str := Format(f, [Trim(str)]);
      str := str + ByteToWideString2(@Buff[i - HexModeFormatCount + 1], HexModeFormatCount);
      log(flag + str);
      str := '';
      j := 0;
    end;
  end;

  str := Format(f, [Trim(str)]);
  str := str + ByteToWideString2(@Buff[Count - j], j);
  log(flag + str);
end;

/// /////////////////////////////////////////////////////////////////////////////////////////////
// LogMemo 是否需要为底部自动滚动模式
// bottomMod = true 为自动滚动模式
// appendMod = true 起新行
procedure TOcComPortObj.LogBottomMod(const Msg: string; appendMod: Boolean; bottomMod: Boolean);
begin
  if (FLogObject = nil) or (FLogObject.Parent = nil) or (not self.Connected) then
  begin
    Exit;
  end;
  if appendMod then
  begin
    if (not bottomMod) then
    begin
      // BeginUpdate memo控件不会滚动更新垂直滚动条不会自动滑动
      // 但是光标会在最新输入点
      FLogObject.Lines.BeginUpdate;
      FLogObject.log(Msg);
      FLogObject.Lines.EndUpdate;
    end
    else
    begin // bottomMod 底部跟踪模式
      // 垂直滚动条自动滚动到最地下
      FLogObject.log(Msg);
    end;
  end
  else
  begin
    if (not bottomMod) then
    begin
      /// BeginUpdate memo控件不会滚动更新垂直滚动条不会自动滑动
      FLogObject.Lines.BeginUpdate;
      /// LogMemo.Lines.Strings[LogMemo.Lines.Count - 1] := LogMemo.Lines.Strings[LogMemo.Lines.Count - 1] + Msg;
      FLogObject.LogEndLine(Msg);
      FLogObject.Lines.EndUpdate;
    end
    else
    begin // bottomMod 底部跟踪模式
      /// LogMemo.Lines.Strings[LogMemo.Lines.Count - 1] := LogMemo.Lines.Strings[LogMemo.Lines.Count - 1] + Msg;
      FLogObject.LogEndLine(Msg);
    end;
  end;
end;

procedure TOcComPortObj.DebugLog(const Msg: string);
var
  i, PreLogLinesCount: Int64;
  str: String;
  isBottom: Boolean;
begin
  if (FLogObject = nil) or (FLogObject.Parent = nil) then
    Exit;

  isBottom := IsLogAtBottom();
  PreLogLinesCount := FLogObject.Lines.Count;

  FLogObject.Lines.BeginUpdate;
  FLogObject.log(Msg);
  if FShowLineNumber or FShowDate or FShowTime then
  begin
    for i := PreLogLinesCount to FLogObject.Lines.Count - 1 do
    begin
      str := GetLineNumberDateTimeStamp(i) + FLogObject.Lines.Strings[i];
      /// LogMemo.Lines.Strings[i] := str;
      FLogObject.LogLine(str, i);
    end;
  end;
  FLogObject.Lines.EndUpdate;

  if FLogScrollMode and isBottom then
    FLogObject.Perform(WM_VSCROLL, SB_BOTTOM, 0);
  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

// LogMemo 垂直滚动条是否滑到了最底部
// 如果是最底部，则LogMemo进入自动滚动模式
function TOcComPortObj.IsLogAtBottom(): Boolean;
var
  SF: TScrollInfo;
  currentPos: Integer;
begin
  Result := false;
  if FLogObject = nil then
    Exit;
  SF.fMask := SIF_ALL;
  SF.cbSize := SizeOf(SF);
  GetScrollInfo(FLogObject.Handle, SB_VERT, SF);
  currentPos := SF.nPos + SF.nPage;
  if currentPos >= SF.nMax - 20 then
  begin
    // 滚动条已经到达底部
    Result := True;
  end;
end;

// for send file 默认 十六进制发送
function TOcComPortObj.FalconComSendBuffer(const Buffer: array of Byte; Count: Integer): Bool;
var
  wb: Integer;
begin
  Result := True;
  if self.Connected then
  begin
    try
      // LogBuff(SEND_FLAG, Buffer, Count);
      // Critical.Enter;
      wb := Write(Buffer, Count);
      FComSentCount := FComSentCount + Count;

      if wb <> Count then
        log('Sorry Write to device fail ' + IntToStr(wb) + '/' + IntToStr(Count));
      // Critical.Leave;
    except
      log('Sorry Write to device fail!!');
      Exit;
    end;
  end
  else
  begin
    log('Device was closed,please open a device.');
    Exit;
  end;
end;

// 一般发送
function TOcComPortObj.FalconComSendData_Common(str: string; SendFormat: Integer): Bool;
var
  buf: array [0 .. 1023] of Byte;
  bLength: Integer;
  s, tempstr: string;
begin
  Result := True;

  case SendFormat of
    Ord(S_ASCIIFormat): // send string ascci char
      begin
        tempstr := str;
        str := str + #13#10;
        if self.Connected then
        begin
          if FShowSendingLog then
          begin
            if FReceiveFormat = 1 then
              log(SEND_FLAG + tempstr) // 十六进制接收采用单行LOG 的方式，会自起新行。
            else
              log(SEND_FLAG + str); // new ling in memo for receive data 发送字符串,后面自带换行
          end;

          try
            // self.writestr(str);
            // FComSentCount := FComSentCount + Length(str);
            bLength := FalconComSendData_SentString(str);
            FComSentCount := FComSentCount + bLength;
          except
            Result := false;
            log('Sorry Write to device fail!!');
            Exit;
          end;
        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_HexadecimalFormat):
      begin
        if self.Connected then
        begin
          // s := FormatHexStrToByte(Trim(str), buf, bLength);
          s := FormatHexStrToBuffer(Trim(str), buf, bLength);
          if FShowSendingLog then
            log(SEND_FLAG + s); // Log(''); // new line prepare to receive

          try
            self.Write(buf, bLength);
            FComSentCount := FComSentCount + bLength;
          except
            log('Sorry Write to device fail!!');
            Exit;
          end;
        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_OctopusProtocol):
      begin
        if checkIsHexStr(str) then
        begin
          s := FormatHexStrToByte(Trim(str), buf, bLength);
          // SendProtocolData(OCTOPUS_UART_PROTOCAL_HEAD, SOC_TO_MCU_MOD_IPC, CMD_MOD_NORMAL_DATA, buf, bLength, false);
        end
        else
        begin
          WideStringToByte(str, buf);
          bLength := Length(str);
          // SendProtocolData(OCTOPUS_UART_PROTOCAL_HEAD, SOC_TO_MCU_MOD_IPC, CMD_MOD_NORMAL_DATA, buf, bLength, false);
        end;
        FComSentCount := FComSentCount + bLength;
      end;
  end;
  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

// 终端模式发送
function TOcComPortObj.FalconComSendData_Terminal(str: string; SendFormat: Integer): Bool;
var
  buf: array [0 .. 1023] of Byte;
  bLength: Integer;
  s: string;
begin
  Result := True;

  case SendFormat of
    Ord(S_ASCIIFormat): // send string ascci char
      begin
        if self.Connected then
        begin
          if (Length(str) > 0) and (str[Length(str)] = #9) then
          begin
            /// 水平制表符
          end
          else
          begin
            // 0x0D CR (carriage return) 回车键
            str := str + #13;
            if FShowSendingLog then
            begin
              log(SEND_FLAG + str);
              log('');
            end;
          end;

          try
            writestr(str);
            FComSentCount := FComSentCount + Length(str);
          except
            Result := false;
            log('Sorry Write to device fail!!');
            Exit;
          end;
        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_HexadecimalFormat):
      begin
        if self.Connected then
        begin
          s := FormatHexStrToByte(Trim(str), buf, bLength);

          if FShowSendingLog then
          begin
            log(SEND_FLAG + s);
            log('');
          end;

          try
            self.Write(buf, bLength);
            FComSentCount := FComSentCount + bLength;
          except
            log('Sorry Write to device fail!!');
            Exit;
          end;

        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_OctopusProtocol):
      begin
        s := FormatHexStrToByte(Trim(str), buf, bLength);

        if FShowSendingLog then
        begin
          log(SEND_FLAG + s);
          log('');
        end;

        // SendProtocolData(OCCOMPROTOCAL_DATA, buf, bLength, false);
      end;
  end;
end;

// 多次发送 ,块发送，循环发送，区别是不另外预留新行供接收使用
function TOcComPortObj.FalconComSendData_MultiTimes(str: string; SendFormat: Integer): Bool;
var
  buf: array [0 .. 1023] of Byte;
  bLength: Integer;
  s: string;
begin
  Result := True;
  bLength := 0;
  FMouseTextSelection := false;
  case SendFormat of
    Ord(S_ASCIIFormat): // send string ascci char
      begin
        str := str + #13#10;
        if self.Connected then
        begin
          if FShowSendingLog then
            log(SEND_FLAG + str);

          try
            // self.writestr(str);
            bLength := FalconComSendData_SentString(str);
            FComSentCount := FComSentCount + bLength;
          except
            Result := false;
            log('Sorry Write to device fail!!');
            Exit;
          end;
        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_HexadecimalFormat):
      begin
        if self.Connected then
        begin
          s := FormatHexStrToByte(Trim(str), buf, bLength);
          if FShowSendingLog then
            log(SEND_FLAG + s);

          try
            self.Write(buf, bLength);
            FComSentCount := FComSentCount + bLength;
          except
            log('Sorry Write to device fail!!');
            Exit;
          end;
        end
        else
        begin
          log('Device was closed,please open a device.');
          Exit;
        end;
      end;

    Ord(S_OctopusProtocol):
      begin
        if checkIsHexStr(str) then
        begin
          s := FormatHexStrToByte(Trim(str), buf, bLength);
          // SendProtocolData(OCCOMPROTOCAL_HEAD2, OCCOMPROTOCAL_DATA, buf, bLength, false);
        end
        else
        begin
          WideStringToByte(str, buf);
          bLength := Length(str);
          // SendProtocolData(OCCOMPROTOCAL_HEAD2, OCCOMPROTOCAL_DATA, buf, bLength, false);
        end;
        FComSentCount := FComSentCount + bLength;
      end;
  end;

  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

function TOcComPortObj.FalconComSendData_SentString(str: string): Integer;
VAR
  ss: TStringStream;
begin
  Result := 0;
  case self.FSendCodeFormat of
    0:
      begin
        self.writestr(str);
        Result := Length(str);
      end;
    1:
      begin
        ss := StrToEncode(str, TEncoding.ASCII);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
    2:
      begin
        ss := StrToEncode(str, TEncoding.ANSI);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
    3:
      begin
        ss := StrToEncode(str, TEncoding.UTF7);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
    4:
      begin
        ss := StrToEncode(str, TEncoding.UTF8);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
    5:
      begin
        ss := StrToEncode(str, TEncoding.Unicode);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
    6:
      begin
        ss := StrToEncode(str, TEncoding.BigEndianUnicode);
        self.Write(ss.Bytes, ss.Size);
        Result := ss.Size;
      end;
  else
    begin
      self.writestr(str);
      Result := Length(str);
    end;
  end;
  // ss.Free;
end;

function TOcComPortObj.GetLineNumberDateTimeStamp(N: Int64): String;
var
  ln, d, t, dt: String;
begin
  Result := '';
  if N < 0 then
    N := 0;

  if FShowLineNumber then
  begin
    ln := GetLineNumberStrForLog(N);
    Result := ln;
  end;
  if (FShowDate and FShowTime) then
  begin
    dt := GetSystemDateTimeStampStr2(2);
    Result := ln + dt;
    Exit;
  end;
  if FShowDate then
  begin
    d := GetSystemDateTimeStampStr2(0);
    Result := ln + d;
  end;
  if FShowTime then
  begin
    t := GetSystemDateTimeStampStr2(1);
    Result := ln + t;
  end;
end;

function TOcComPortObj.SaveToTheExcelFile(Length: Integer; Rows: Integer): Integer;
var
  // FileName: String;
  i: Integer;
begin
  if Rows = 0 then
    Rows := 1;
  Result := Rows;
  if Length = 0 then
    Exit;

  try
    for i := 0 to Length - 1 do
    begin
      ExcelApp.Cells[Rows, 2].Value := FComReceiveBuffer[i];
      INC(Rows);
    end;
  finally
    // ExcelApp.SaveAs(self.FileStreamName);
  end;
  Result := Rows;
end;

procedure TOcComPortObj.CachedString(const str: String);
// var
// s: String;
begin
  FComHandleThread_Wait := True;
  FComHandleThread_Wait := True;

  EnterCriticalSection(Critical);
  try
    StringInternelCache.Lines.BeginUpdate;
    try
      // 获取最后一行内容并追加新字符串
      if StringInternelCache.Lines.Count > 0 then
        StringInternelCache.Lines.Strings[StringInternelCache.Lines.Count - 1] := StringInternelCache.Lines.Strings[StringInternelCache.Lines.Count - 1] + str
      else
        StringInternelCache.Lines.Add(str); // 如果没有行，则直接添加

    finally
      StringInternelCache.Lines.EndUpdate;
    end;

    // 强制更新界面显示
    // StringInternelCache.Update;
  finally
    LeaveCriticalSection(Critical);
  end;

  FComHandleThread_Wait := false;
  Application.ProcessMessages;
  /// Application.ProcessMessages;
end;

procedure TOcComPortObj.StartFlushOutCackedString();
begin
  if GetCachedLinesCount() <= 0 then
    Exit;
  /// FComUIHandleThread.ResumeThread;
  /// FComHandleThread_Wait := false;

  if FComUIHandleThread.Suspended then
  begin
    FComUIHandleThread.Suspended := false; // 启动后台线程
    FComHandleThread_Wait := false;
  end;
end;

procedure TOcComPortObj.PauseFlushOutCackedString();
begin
  /// FComUIHandleThread.Pause;
  /// FComHandleThread_Wait := True;
  if not FComUIHandleThread.Suspended then
  begin
    // LeaveCriticalSection(Critical);
    FComUIHandleThread.Suspended := True;
    FComHandleThread_Wait := True;
  end;
end;

function TOcComPortObj.GetCachedLinesCount(): Integer;
begin
  // EnterCriticalSection(Critical);
  Result := StringInternelCache.Lines.Count;
  // LeaveCriticalSection(Critical);
end;

procedure TOcComPortObj.OcComPortObjRxChar(Sender: TObject; Count: Integer);
var
  i: Integer;
  PreLogLinesCount: Int64;
  Buff: array of Byte;
  f: Text;
  isAtBottom: Boolean;
Label FUNCTION_END;
  function isBackHandlerMode(): Boolean;
  begin
    Result := ((FMouseTextSelection) or (FShowLineNumber or FShowDate or FShowTime) or (FBackgroundTaskMode));
  end;

// FMouseTextSelection 后台缓存前台复制考本等
begin

  FComReceiveCount := FComReceiveCount + Count; // 统计接收数量
  FComReceiveString := '';

  if (not Connected) then
    Exit; // 突然断开

  isAtBottom := IsLogAtBottom();

  if FReceiveFormat = Ord(ASCIIFormat) then // receive as string
  begin
    try
      if FCompatibleUnicode then
        ReadUnicodeString(FComReceiveString, Count) // 可以读中文
      else
        ReadStr(FComReceiveString, Count);
      // 兼容 \R 字符的索引从1开始也即是>=1
      FComReceiveString := NormalizeLineBreaks(FComReceiveString);
    Except
    end;

    if FComUIHandleThread.FCachedCounterIndex >= GetCachedLinesCount() then
    begin // 当前缓冲区数据已经处理完毕，清空缓冲区
      EnterCriticalSection(Critical);
      // FComHandleThread_Wait := True;
      self.ClearInternalBuff();
      // FComHandleThread_Wait := false;
      LeaveCriticalSection(Critical);
    end;

    if isBackHandlerMode() or (GetCachedLinesCount() > 0) then
    // 后台工作模式
    begin
      CachedString(FComReceiveString);

      if FMouseTextSelection then // 复制文本的时候数据暂时存入缓存
      begin
        PauseFlushOutCackedString(); // 缓存暂不处理
        goto FUNCTION_END; // 缓存暂不处理
      end;

      StartFlushOutCackedString();
      goto FUNCTION_END; // 后台处理
    end
    else
    begin
      FComUIHandleThread.Suspended := True; // 挂起后台线程任务
    end;

    /// ////////////////////////////////////////////////////////////////////////////////////////////////////
    begin // 直接处理，无需缓存无需特殊处理，不额外显示日期日期信息
      if FNeedNewLine then
      begin
        FNeedNewLine := false;
        LogBottomMod(FComReceiveString, True, isAtBottom);
      end
      else
      begin
        LogBottomMod(FComReceiveString, false, isAtBottom);
      end;
      // 统计处理数量
      FComProcessedCount := FComProcessedCount + Length(FComReceiveString);
      FLastLineStr := self.FLogObject.GetLastLine();
      /// LogMemo.Lines.Strings[LogMemo.Lines.Count - 1];
    end;
  end
  /// ///////////////////////////////////////////////////////////////////////////
  else if FReceiveFormat = Ord(HexadecimalFormat) then // receive as hex format
  begin
    // ZeroMemory(@FComReceiveBuffer, SizeOf(FComReceiveBuffer));
    FComHandleThread_Wait := True;
    try
      Read(FComReceiveBuffer, Count);
    Except
    end;
    // EnterCriticalSection(Critical);
    if Length(FComReceiveInternalBuffer) = 0 then
      ClearInternalBuff;
    SetLength(FComReceiveInternalBuffer, Length(FComReceiveInternalBuffer) + Count);
    CopyMemory(@FComReceiveInternalBuffer[Length(FComReceiveInternalBuffer) - Count], @FComReceiveBuffer, Count);
    // LeaveCriticalSection(Critical);
    FComHandleThread_Wait := false;
    if FComUIHandleThread.Suspended then
    begin
      FComUIHandleThread.Suspended := false; // 启动UI工作线程
    end;
  end
  /// //////////////////////////////////////////////////////////////////////////
  else if (FReceiveFormat = Ord(Graphic)) and (FastLineSeries <> nil) then // receive as Graphic
  begin
    ZeroMemory(@FComReceiveBuffer, SizeOf(FComReceiveBuffer));
    self.FComHandleThread_Wait := True;
    try
      self.Read(FComReceiveBuffer, Count);
    Except
    end;
    self.FComHandleThread_Wait := True;
    EnterCriticalSection(Critical);
    if Length(FComReceiveInternalBuffer) = 0 then
      self.ClearInternalBuff;
    SetLength(FComReceiveInternalBuffer, Length(FComReceiveInternalBuffer) + Count);
    CopyMemory(@FComReceiveInternalBuffer[Length(FComReceiveInternalBuffer) - Count], @FComReceiveBuffer, Count);
    LeaveCriticalSection(Critical);
    FComHandleThread_Wait := false;
    if FComUIHandleThread.Suspended then
    begin
      FComUIHandleThread.Suspended := false; // 启动UI工作线程 绘制图形
    end;
  end
  /// ///////////////////////////////////////////////////////////////////////////
  else if FReceiveFormat = Ord(OctopusProtocol) then
  // receive as OctopusProtocol pack
  begin
    ZeroMemory(@FComReceiveBuffer, SizeOf(FComReceiveBuffer));
    FComHandleThread_Wait := True;
    try
      FComProcessedCount := FComProcessedCount + self.Read(FComReceiveBuffer, Count);
    Except
    end;

    FComHandleThread_Wait := True;
    EnterCriticalSection(Critical);
    if Length(FComReceiveInternalBuffer) = 0 then
      self.ClearInternalBuff;
    SetLength(FComReceiveInternalBuffer, Length(FComReceiveInternalBuffer) + Count);
    CopyMemory(@FComReceiveInternalBuffer[Length(FComReceiveInternalBuffer) - Count], @FComReceiveBuffer, Count);
    LeaveCriticalSection(Critical);
    self.FComHandleThread_Wait := false;
    if (FComPackParserThread.Suspended) { and (FProtocalData > 0) } then
    begin
      FComPackParserThread.Suspended := false;
      // 启动协议解析线程
    end;
  end
  /// ///////////////////////////////////////////////////////////////////////////
  else if FReceiveFormat = Ord(SaveToFile) then // for File save to file
  begin
    if (CompareText(ExtractFileExt(self.FileStreamName), '.txt') = 0) or (CompareText(ExtractFileExt(self.FileStreamName), '.log') = 0) then
    begin
      AssignFile(f, self.FileStreamName);
      Append(f);
      // 打开准备追加
      if FCompatibleUnicode then
        self.ReadUnicodeString(FComReceiveString, Count) // 可以读中文
      else
        self.ReadStr(FComReceiveString, Count);
      Writeln(f, FComReceiveString);
      CloseFile(f);
      FComProcessedCount := FComProcessedCount + Count;
      // if Assigned(FCallBackFun) then
      // FCallBackFun();
    end
    else if (CompareText(ExtractFileExt(self.FileStreamName), '.xls') = 0) or (CompareText(ExtractFileExt(self.FileStreamName), '.xlsx') = 0) then
    begin
      ZeroMemory(@FComReceiveBuffer, SizeOf(FComReceiveBuffer));
      i := self.Read(FComReceiveBuffer, Count);
      FExcelAppRows := SaveToTheExcelFile(i, FExcelAppRows);
    end
    else
    begin
      ZeroMemory(@FComReceiveBuffer, SizeOf(FComReceiveBuffer));
      Read(FComReceiveBuffer, Count);
      if FileStream <> nil then
      begin
        SetLength(Buff, Count);
        CopyMemory(Buff, @FComReceiveBuffer, Count);
        FComProcessedCount := FComProcessedCount + FileStream.Write(Buff, Count);

        // if Assigned(FCallBackFun) then
        // FCallBackFun();
      end
    end;
  end;

  /// ///////////////////////////////////////////////////////////////////////////
FUNCTION_END:
  if Assigned(FCallBackFun) then
    FCallBackFun();
  if FReceiveFormat = Ord(ASCIIFormat) then
  begin
    if (FLogScrollMode) and (Length(FComReceiveString) > 0) and isAtBottom then
    begin
      FLogObject.Perform(WM_VSCROLL, SB_BOTTOM, 0);
      FLogObject.Perform(WM_HSCROLL, SB_LEFT, 0);
    end;
  end;
  Application.ProcessMessages;
end;

procedure TOcComPortObj.RequestProtocolConnection;
// var
// b: array of Byte;
begin
  // SendProtocolData(b, 0, OCCOMPROTOCAL_START, false);
end;

procedure TOcComPortObj.SendProtocolACK();
// var
// b: array of Byte;
begin
  // SendProtocolData(b, 0, OCCOMPROTOCAL_ACK, false);
end;

function TOcComPortObj.SendProtocolPackage(PFrame: TPOctopusUARTFrame): Boolean;
var
  SerializedFrame: TBytes;
  TotalLength: Integer;
begin
  Result := false;

  // 检查 Frame 是否有效
  if PFrame = nil then
    Exit;

  // 计算总长度：Header + Frame + Data + Checksum
  TotalLength := FOctopusUartProtocol.GetProtocolHeaderSize() + PFrame.DataLength + 1;

  // 分配序列化缓冲区
  SetLength(SerializedFrame, TotalLength);

  // 序列化数据到缓冲区
  SerializedFrame := FOctopusUartProtocol.SerializeUARTFrame(PFrame^);

  // 打印日志
  if FShowSendingLog then
    LogBuff(SEND_FLAG, SerializedFrame[0], TotalLength);

  // 发送到串口
  Result := FalconComSendBuffer(SerializedFrame[0], TotalLength);
  // if(not Result) then
  // log('SendProtocolPackage transmit failed!');
end;

function TOcComPortObj.SendProtocolPackageWaitACK(PFrame: TPOctopusUARTFrame; ACK: Integer): Boolean;
var
  reTryCount: Integer;
begin
  Result := True;
  reTryCount := 0;
  SendProtocolPackage(PFrame);
  while (not WaitProtocolACK(ACK, 2000)) do
  begin
    INC(reTryCount);
    if reTryCount > 10 then // >=11
    begin
      log('No ack from device transmit failed!');
      Result := false;
      Exit;
    end;
    log('Time Out Try ... ' + IntToStr(reTryCount));
    if (not Connected) then
    begin
      break;
    end;
    SendProtocolPackage(PFrame);
    Application.HandleMessage;
  end;
end;

function TOcComPortObj.SendProtocolPackageWaitACKCommand(PFrame: TPOctopusUARTFrame; ACKCommand: Integer): Boolean;
var
  reTryCount: Integer;
begin
  Result := True;
  reTryCount := 0;
  if not SendProtocolPackage(PFrame) then
    log('SendProtocolPackage transmit failed!');

  while (not WaitProtocolCommand(ACKCommand, 2000)) do
  begin
    INC(reTryCount);
    if reTryCount > 10 then // >=11
    begin
      log('No ack from device transmit failed!');
      Result := false;
      Exit;
    end;
    log('Time out Try ... ' + IntToStr(reTryCount));
    if (not Connected) then
    begin
      break;
    end;
    // SendProtocolPackage(PFrame);
    Application.HandleMessage;
  end;
end;

function TOcComPortObj.SendProtocolPackageWaitACKCommand(PFrame: TPOctopusUARTFrame; ACKCommand, ACKParatemer1, ACKParatemer2: Integer): Boolean;
var
  reTryCount: Integer;
begin
  Result := True;
  reTryCount := 0;
  if not SendProtocolPackage(PFrame) then
    log('SendProtocolPackage transmit failed!');
  while (not WaitProtocolCommand(ACKCommand, ACKParatemer1, ACKParatemer2, 2000)) do
  begin
    INC(reTryCount);
    if reTryCount > 10 then // >=11
    begin
      log('No ack from device transmit failed!');
      Result := false;
      Exit;
    end;
    log('Time Out Try ... ' + IntToStr(reTryCount));
    if (not Connected) then
    begin
      break;
    end;
    // SendProtocolPackage(PFrame);
    Application.HandleMessage;
  end;
end;

function TOcComPortObj.SendProtocolData(AFrameType, ACommand: Byte; AData: array of Byte; Count: Integer; NeedACK: Boolean): Boolean;
begin
  Result := SendProtocolData(OCTOPUS_UART_PROTOCAL_HEAD, AFrameType, ACommand, AData, Count, NeedACK);
end;

function TOcComPortObj.SendProtocolData(AHeader, AFrameType, ACommand: Byte; AData: array of Byte; Count: Integer; NeedACK: Boolean): Boolean;
var
  Frame: TOctopusUARTFrame;
  FrameBytes: TBytes;
begin
  Result := false;

  // 1. 构建完整的帧
  Frame := FOctopusUartProtocol.BuildUARTFrame(AHeader, TPTLFrameType(AFrameType), TPTLFrameCmd(ACommand), AData, 2);

  // 2. 序列化帧数据
  FrameBytes := FOctopusUartProtocol.SerializeUARTFrame(Frame);

  // 3. 直接发送，不分片
  if Length(FrameBytes) <= 255 then
  begin
    if SendProtocolPackage(@FrameBytes[0]) then
      Result := True;
  end
  else
    raise Exception.Create('单个帧数据超出255字节，无法发送');
end;

function TOcComPortObj.WaitProtocolACK(ACK: Integer; timeOut: Integer): Boolean;
var
  Oc: TOctopusUARTFrame;
  Start: real;
  peeked: Boolean;
begin
  Result := false;
  Start := GetTickCount;

  while (True) do
  begin
    Application.ProcessMessages;
    peeked := FOctopusUartProtocol.PeekLastParsedFrame(Oc);

    if peeked then
    begin
      if Oc.data[0] = ACK then // 0x59 89 Y
      begin
        Result := True;
        break;
      end;
    end;

    if (GetTickCount - Start) > timeOut then
    begin
      break; // 超时推出
    end;
  end; // while (True) do

end;

function TOcComPortObj.WaitProtocolCommand(ACK_Command: Integer; timeOut: Integer): Boolean;
var
  Oc: TOctopusUARTFrame;
  Start: real;
  peeked: Boolean;
begin
  Result := false;
  Start := GetTickCount;

  while (True) do
  begin

    peeked := FOctopusUartProtocol.PeekLastParsedFrame(Oc);

    if peeked then
    begin
      if (Ord(Oc.Command) and $7F) = (ACK_Command and $7F) then // 0x59 89 Y
      begin
        Result := True;
        break;
      end;
    end;

    if (GetTickCount - Start) > timeOut then
    begin
      break; // 超时推出
    end;

    Application.ProcessMessages;
  end; // while (True) do

end;

function TOcComPortObj.WaitProtocolCommand(ACK_Command: Integer; parameter1, parameter2: Integer; timeOut: Integer): Boolean;
var
  Oc: TOctopusUARTFrame;
  Start: real;
  peeked: Boolean;
  index: Integer;
begin
  Result := false;
  Start := GetTickCount;

  while (True) do
  begin
    Application.ProcessMessages;
    peeked := FOctopusUartProtocol.PeekLastParsedFrame(Oc);
    index := (Oc.data[1] shl 8) + Oc.data[2];
    if peeked then
    begin
      // log(FOctopusUartProtocol.FrameToHexString(@Oc));
      if ((Ord(Oc.Command) and $7F) = (ACK_Command and $7F)) and (Oc.data[0] = parameter1) and (parameter2 = index) then // 0x59 89 Y
      begin
        Result := True;
        break;
      end;
    end
    else
    begin
      log('PeekLastParsedFrame failed!');
    end;

    if (GetTickCount - Start) > timeOut then
    begin
      log('time out ' + IntToStr(Oc.data[0]) + ':' + IntToStr(parameter2));
      break; // 超时推出
    end;
  end; // while (True) do

end;

// 包解析完成后回调
procedure TOcComPortObj.OcComPortObjRxProtocol(PFrame: TPOctopusUARTFrame);
begin
  self.log(RECE_FLAG + FOctopusUartProtocol.FrameToHexString(PFrame));
  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

procedure TOcComPortObj.SaveLog(FullLogFilePath: String);
begin
  if FullLogFilePath <> '' then
  begin
    if (ExtractFileExt(FullLogFilePath) = '') or (DirectoryExists(FullLogFilePath)) then
    begin
      FLogObject.SaveTo(FullLogFilePath + '\' + self.ComPortFullName + '.log');
      FullLogFileName := FullLogFilePath;
    end
    else
    begin
      FLogObject.SaveTo(FullLogFilePath);
      FullLogFileName := FullLogFilePath;
    end;
  end
  else if FullLogFileName <> '' then
    /// self.LogMemo.Lines.SaveToFile(FullLogFileName);
    FLogObject.SaveTo(FullLogFileName);
end;

function TOcComPortObj.getCMDStr(): String;
var
  LastStr: String;
  jh: Integer;
  my: Integer;
begin
  LastStr := Trim(FLogObject.GetLastLine());
  jh := Pos('#', LastStr);
  my := Pos('$', LastStr);
  if jh > 0 then
  begin
    Result := Copy(LastStr, jh + 1, Length(LastStr));
  end
  else if my > 0 then
  begin
    Result := Copy(LastStr, my + 1, Length(LastStr));
  end
  else
  begin
    Result := '';
  end;
end;

procedure TOcComPortObj.KeyPress(Sender: TObject; var Key: Char);
var
  CurrentLine: Integer;
  // thid: Dword;
  i, j, Len: Integer;
  cmd: String;
  LastStr: String;
begin
  if self.Connected = false then
  begin
    Exit;
  end;
  CurrentLine := FLogObject.CaretPos.Y; // 光标所在的行

  if (Key = #13) then
  begin

    FCommadLineStr := getCMDStr();
    if FLogObject.ReadOnly or (Trim(FCommadLineStr) = '') then
    begin
      FLogObject.ReadOnly := false;
      FalconComSendData_Terminal(' ', self.FSendFormat);
      FCommadLineStr := '';
      Key := #0;
      Exit;
    end;

    // CurrentLine := LogMemo.CaretPos.Y;
    // LastStr := Trim(LogMemo.Lines.Strings[CurrentLine]);
    cmd := Trim(FCommadLineStr); // Trim(copy(LastStr,j+3,Length(LastStr)-j+2));
    if cmd <> '' then
    begin
      self.FNeedNewLine := True;
      self.FalconComSendData_Terminal(cmd, self.FSendFormat);
    end;
    FPreCommadLineStr := FCommadLineStr;
    if (FCommandHistory.IndexOf(FPreCommadLineStr) < 0) and (FPreCommadLineStr <> '') then
    begin
      FCommandHistory.Add(FPreCommadLineStr);
      FCommandHistoryIndex := FCommandHistory.Count - 1;
    end;
    FCommadLineStr := '';
    cmd := '';
    Key := #0;
    Exit;
  end;

  if (Key = #9) then
  begin
    FCommadLineStr := getCMDStr();
    LastStr := FLogObject.GetLine(CurrentLine);
    cmd := Trim(FCommadLineStr) + Key;
    if cmd = Key then
    begin
      Key := #0;
      Exit; // 只有tab
    end;
    log('');
    FalconComSendData_Terminal(cmd, self.FSendFormat);
    FPreCommadLineStr := FCommadLineStr;
    FCommadLineStr := '';
    Key := #0;
    cmd := '';
  end;

  if Key = #8 then // 删除
  begin
    CurrentLine := FLogObject.CaretPos.Y;
    LastStr := FLogObject.GetLine(CurrentLine);
    Len := Length(Trim(FLastLineStr));
    i := Pos(Trim(FCommadLineStr), LastStr);
    j := Pos(Trim(FPreCommadLineStr), LastStr);

    if (Trim(FCommadLineStr) = Trim(LastStr)) then // 光标最后的空行
    begin
      Delete(FCommadLineStr, Length(FCommadLineStr), Length(FCommadLineStr));
      Exit;
    end
    else if Length(LastStr) > Len then // 有输入删
    begin
      Exit;
    end;

    if (j > 0) then // 最后一行有回显
    begin
      LastStr := FLogObject.GetLine(CurrentLine);
      Delete(FPreCommadLineStr, Length(FPreCommadLineStr), Length(FPreCommadLineStr));
    end
    // 当前输入
    else if (i > 0) and (Length(FCommadLineStr) > 0) then
    begin
      Delete(FCommadLineStr, Length(FCommadLineStr), Length(FCommadLineStr));
      if (i <= Len) then
        Key := #0;
    end
    else
    begin
      Key := #0;
      Exit;
    end;
  end; // if key=#8 then

  if ((Key <> #13) and (Key <> #8) and (Key <> #0)) then
  begin
    // FCommadLineStr := FCommadLineStr + Key;
  end;

  if ((Key = #38) OR (Key = #40)) then
  begin
  end;
end;

procedure TOcComPortObj.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
/// var
/// cmdbuf: array [0 .. 1] of Byte;
/// CurrentLine: integer;
// thid: Dword;
/// i, j: integer;
/// LastStr: String;
/// MaskedKeyState: TShiftState;
begin
  { MaskedKeyState := Shift * [ssShift, ssAlt, ssCtrl, ssLeft, ssRight, ssMiddle, ssDouble, ssTouch, ssPen, ssCommand];
    if (Key <> VK_RETURN) and (Key <> VK_PRIOR) and (Key <> VK_NEXT) and (Key <> VK_HOME) and (Key <> VK_END) and (MaskedKeyState = []) then
    begin
    FLogObject.SelStart := MaxInt;
    /// Length(FLogObject.Text);
    FLogObject.Perform(WM_VSCROLL, SB_BOTTOM, 0);
    end; }

  { if (Key = VK_LEFT) or (Key = 38) OR (Key = 39) OR (Key = 40) then // 方向键回溯历史
    BEGIN
    CurrentLine := FLogObject.Lines.Count - 1; // LogMemo.CaretPos.y;
    LastStr := FLogObject.GetLine(CurrentLine);
    i := Pos(FCommadLineStr, LastStr);
    j := Pos(FPreCommadLineStr, LastStr);

    if (FCommandHistoryIndex <= 0) and (FCommandHistory.Count > 0) then
    FCommandHistoryIndex := FCommandHistory.Count - 1
    else
    FCommandHistoryIndex := 0;

    if (FCommandHistory.Count <= 0) then
    begin
    Key := 0;
    Exit;
    end;

    if (Length(LastStr) > Length(FLastLineStr)) then
    delete(LastStr, Length(FLastLineStr) + 1, Length(LastStr) - Length(FLastLineStr));

    if (i > 1) then
    begin
    FLogObject.Lines.Strings[CurrentLine] := LastStr + FCommandHistory.Strings[FCommandHistoryIndex];
    end
    else if (j > 1) then
    begin
    FLogObject.Lines.Strings[CurrentLine] := LastStr + FCommandHistory.Strings[FCommandHistoryIndex];
    end
    else if (FPreCommadLineStr <> '') then
    begin
    FLogObject.Lines.Strings[CurrentLine] := LastStr + FCommandHistory.Strings[FCommandHistoryIndex];
    end
    else
    begin
    FLogObject.Lines.Strings[CurrentLine] := LastStr + FCommandHistory.Strings[FCommandHistoryIndex];
    end;

    FCommandHistoryIndex := FCommandHistoryIndex - 1;
    Key := 0;
    Exit;
    END; }

  { if (Shift = [ssCtrl]) then
    begin
    if (Key = $43) then // Control+VK_C
    begin
    cmdbuf[0] := $03;
    if (self.Connected) and (Trim(FLogObject.SelText) = '') then
    self.FalconComSendBuffer(cmdbuf, 1)
    end
    else if (Key = 70) then // Control+VK_F
    begin
    end
    else if (Key = $56) then // Control+VK_V
    begin
    end;
    end; }

  if (Shift = [ssCtrl]) then
  begin
    FMouseTextSelection := True; // 启动缓存
  end;

  if (Key = $1B) then // ESC
  begin
    if not self.FLogObject.ReadOnly then
      FLogObject.ReadOnly := True;
    FMouseTextSelection := false;
  end;
end;

procedure TOcComPortObj.KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (not IsLeftMouseButtonDown()) then
  begin
    FMouseTextSelection := false; // 去掉缓存
    if (GetCachedLinesCount() > 0) and (not FMouseTextSelection) then
      StartFlushOutCackedString(); // 开启线程
  end;
end;

procedure TOcComPortObj.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TOcComPortObj.MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  /// if (FMouseTextSelection = false) and (IsLeftMouseButtonDown()) then
  /// FMouseTextSelection := True; // 启动缓存
end;

procedure TOcComPortObj.MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [] then
  begin
    FMouseTextSelection := false; // 去掉缓存
    if (GetCachedLinesCount() > 0) then // and (not FMouseTextSelection)
      StartFlushOutCackedString(); // 开启线程
  end;
end;

procedure TOcComPortObj.RunWindosShellCmd(const str: string);
const
  { 设置ReadBuffer的大小 }
  ReadBufferSize = 2400;
var
  Security: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  Start: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: Pchar;
  BytesRead: Dword;
  // aprun: Dword;
  buf: string;
  cmdstr: string;
begin
  cmdstr := str;
  if Trim(cmdstr) = '' then
    ExitThread(4);

  with Security do
  begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := True;
    lpsecuritydescriptor := nil;
  end;
  { 创建一个命名管道用来捕获console程序的输出 }
  if Createpipe(ReadPipe, WritePipe, @Security, 0) then
  begin
    Buffer := AllocMem(ReadBufferSize + 1);
    FillChar(Start, SizeOf(Start), #0);
    { 设置console程序的启动属性 }
    with Start do
    begin
      cb := SizeOf(Start);
      Start.lpReserved := nil;
      lpDesktop := nil;
      lpTitle := nil;
      dwX := 0;
      dwY := 0;
      dwXSize := 0;
      dwYSize := 0;
      dwXCountChars := 0;
      dwYCountChars := 0;
      dwFillAttribute := 0;
      cbReserved2 := 0;
      lpReserved2 := nil;
      hStdOutput := WritePipe; // 将输出定向到我们建立的WritePipe上
      hStdInput := ReadPipe; // 将输入定向到我们建立的ReadPipe上
      hStdError := WritePipe; // 将错误输出定向到我们建立的WritePipe上
      dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      wShowWindow := SW_HIDE; // 设置窗口为hide
    end;
    try // NORMAL_PRIORITY_CLASS
      { 创建一个子进程，运行console程序 }
      if CreateProcess(nil, Pchar(cmdstr), @Security, @Security, True, REALTIME_PRIORITY_CLASS, nil, nil, Start, ProcessInfo) then
      begin
        { 等待进程运行结束 }
        WaitForSingleObject(ProcessInfo.hProcess, WAIT_TIMEOUT); // INFINITE
        // 关闭输出...开始没有关掉它，结果如果没有输出的话，程序死掉了。
        CloseHandle(WritePipe);

        buf := '';
        // 读取console程序的输出
        repeat
          // application.ProcessMessages;
          BytesRead := 0;
          ReadFile(ReadPipe, Buffer[0], ReadBufferSize, BytesRead, nil);
          Buffer[BytesRead] := #0; // 字符串结束符
          // OemToAnsi(Buffer,Buffer);
          buf := buf + string(Buffer);
        until (BytesRead < ReadBufferSize);
        // When expression returns True, the repeat statement terminates.
        log(buf);

      end;
    finally
      FreeMem(Buffer);
      TerminateProcess(ProcessInfo.hProcess, 1);
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
      CloseHandle(ReadPipe);
      log(CmdDir + '>');
      ExitThread(4);
    end;
  end;
end;

procedure TOcComPortObj.NotifyCallBack();
begin
  if Assigned(FCallBackFun) then
    FCallBackFun();
end;

procedure TOcComPortObj.CloseDevice();
begin
  try
    close();
  except
    log('Can not close  ' + FComPortFullName);
  end;
  status := 0;

  try
    begin
      if FComUIHandleThread <> nil then
      begin
        FComUIHandleThread.Suspended := True;
        FComUIHandleThread.Terminate;
        FComUIHandleThread.Free;
      end;
    end;
  except
    log('Can not close  ' + FComPortFullName);
  end;
end;

procedure TOcComPortObj.Free();
begin
  // FComUIHandleThread.Suspended := True;
  CloseDevice();
  ClearLog;
  ClearInternalBuff();
  // LogMemo.Visible := false;
  // LogMemo.Parent := nil;
end;

Initialization

InitializeCriticalSection(Critical);

Finalization

DeleteCriticalSection(Critical);

end.
