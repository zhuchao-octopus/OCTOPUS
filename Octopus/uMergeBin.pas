unit uMergeBin;

interface

uses
  System.UITypes, System.IOUtils, Winapi.ShlObj, Winapi.ActiveX, System.Win.ComObj, System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Math, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, StrUtils,
  Vcl.ComCtrls,
  uOcComPortObj;

type
  // Metadata structure written to each APP segment's end
  // [magic (4 bytes), size (4 bytes), crc32 (4 bytes), reserved (4 bytes)]
  TFlashBankInfo = packed record
    BankMagic: UInt32;
    BankModel: UInt32;
    BankAddress: UInt32;
    BankSize: UInt32;
    BankCRC32: UInt32;
  end;

  TMetaInfo = packed record
    bank0: TFlashBankInfo;
    bank1: TFlashBankInfo;
    bank2: TFlashBankInfo;
  end;

  TMergeBinFrm = class(TForm)
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button02: TButton;
    Button03: TButton;
    Button04: TButton;
    Button05: TButton;
    Button06: TButton;
    Button9: TButton;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Button09: TButton;
    Button08: TButton;
    ComboBox01: TComboBox;
    Button07: TButton;
    LabeledEditB: TLabeledEdit;
    LabeledEdit04: TLabeledEdit;
    LabeledEdit02: TLabeledEdit;
    LabeledEdit03: TLabeledEdit;
    LabeledEdit01: TLabeledEdit;
    Button01: TButton;
    LabeledEditA: TLabeledEdit;
    procedure Button04Click(Sender: TObject);
    procedure Button02Click(Sender: TObject);
    procedure Button03Click(Sender: TObject);
    procedure Button08Click(Sender: TObject);
    procedure Button06Click(Sender: TObject);
    procedure Button05Click(Sender: TObject);
    procedure Button09Click(Sender: TObject);
    procedure ComboBox01DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button07Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button01Click(Sender: TObject);
  private
    { Private declarations }
    function MergeBinFiles(const BinLPath, BinAPath, BinBPath, OutputPath: string; OffsetA, OffsetB: Integer): TMetaInfo;
    function GetMagiecNumberName(MagicNumber: UInt32): String;
    procedure SendFileAsBin(OcComPortObj: TOcComPortObj; FileName: String);
    procedure UpdateComboBoxList();
    procedure LogAppInfo(const AppName: string; const Info: TFlashBankInfo);
  public
    { Public declarations }
    OcComPortObj: TOcComPortObj;
  end;

const
  APP_INFO_MAGIC = $DEADBEEF;
  FIELD_FMT = '%-22s: %s';

var
  MergeBinFrm: TMergeBinFrm;

implementation

uses uOcProtocol, uCRC;

{$R *.dfm}

function GetMergeFilesOutputFileName(const FileL, FileA, FileB: string): string;
var
  Dir, Timestamp, BaseName, Ext: string;
  // Index: Integer;
begin
  // 使用 FileL 的目录作为输出目录
  Dir := ExtractFilePath(FileL);
  Ext := '_';
  // 生成时间戳
  Timestamp := FormatDateTime('yyyymmddhhnnss', Now);
  if FileL <> '' then
  begin
    Ext := Ext + 'l';
    Dir := ExtractFilePath(FileL);
  end
  else
  begin
    Ext := Ext + 'x';
  end;

  if FileA <> '' then
  begin
    Ext := Ext + 'a';
    Dir := ExtractFilePath(FileA);
  end
  else
  begin
    Ext := Ext + 'ax';
  end;

  if FileB <> '' then
  begin
    Ext := Ext + 'b';
    Dir := ExtractFilePath(FileB);
  end
  else
  begin
    Ext := Ext + 'x';
  end;
  // 构建基本文件名
  BaseName := 'MCU_' + Timestamp + Ext; // 默认编号001，可以根据需要做自动递增

  // 拼接完整路径并使用 oupg 扩展名
  Result := IncludeTrailingPathDelimiter(Dir) + BaseName + '.oupg';
end;

procedure PaddingFile(FileOut: TFileStream; PaddingSize: Integer);
var
  Buffer: array [0 .. 8191] of Byte; // 8KB 缓冲
  WriteSize: Integer;
begin
  if PaddingSize <= 0 then
  begin
    MergeBinFrm.Memo1.Lines.Add(Format('Warning: Desired offset 0x%.8X < current position 0x%.8X. Padding skipped.', [PaddingSize, FileOut.Position]));
    Exit;
  end;

  FillChar(Buffer, SizeOf(Buffer), $FF);

  while PaddingSize > 0 do
  begin
    WriteSize := Min(PaddingSize, SizeOf(Buffer));
    FileOut.Write(Buffer[0], WriteSize);
    Dec(PaddingSize, WriteSize);
  end;
end;

function FNV1aHash32(const S: string): Cardinal;
const
  FNV_OFFSET_BASIS = 2166136261;
  FNV_PRIME = 16777619;
var
  i: Integer;
  c: Byte;
  hash: Cardinal;
begin
  hash := FNV_OFFSET_BASIS;
  for i := 1 to Length(S) do
  begin
    c := Ord(S[i]) and $FF; // 只保留低8位
    hash := hash xor c;
    hash := hash * FNV_PRIME;
  end;
  Result := hash;
end;

// Calculate CRC32 (you can link to existing CRC32 implementation)
function CalculateCRC32(const Buf: TBytes; Len: Integer): UInt32;
begin
  Result := UpdateCRC32(Buf, 0, Len, $FFFFFFFF) xor $FFFFFFFF;
end;

// Create a TAppInfo record for given app
function MakeAppInfo(BankMagic, Address, AppSize, CRC32: UInt32): TFlashBankInfo;
begin
  Result.BankMagic := APP_INFO_MAGIC;
  Result.BankModel := BankMagic;
  Result.BankSize := AppSize;
  Result.BankCRC32 := CRC32;
  Result.BankAddress := Address;
end;

function FileSizeByName(const FileName: string): Integer;
var
  FS: TFileStream;
begin
  FS := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    Result := FS.Size;
  finally
    FS.Free;
  end;
end;

procedure GetBinFileOffset(const BinPath: string; out LoadAddress: Integer);
var
  FS: TFileStream;
  VectorTable: array [0 .. 1] of Cardinal; // [0]=MSP, [1]=Reset_Handler
begin
  LoadAddress := -1;

  if not FileExists(BinPath) then
  begin
    // ShowMessage('找不到 BIN 文件：' + BinPath);
    Exit;
  end;

  FS := TFileStream.Create(BinPath, fmOpenRead or fmShareDenyNone);
  try
    if FS.Size < 8 then
    begin
      ShowMessage('无效的BIN文件(文件太小)，无法读取向量表!!!');
      Exit;
    end;

    FS.ReadBuffer(VectorTable, 8);
    LoadAddress := VectorTable[1]; // Reset_Handler 地址即为推测的起始 Load Address
  finally
    FS.Free;
  end;
end;

procedure TMergeBinFrm.UpdateComboBoxList();
var
  FilePath: string;
  SL: TStringList;
begin
  // 指定文件路径（你可以改成用户选择的路径、固定路径、程序目录等）
  FilePath := ExtractFilePath(Application.ExeName) + 'McuModelList.txt';

  // 创建字符串列表来读取文件
  SL := TStringList.Create;
  try
    if FileExists(FilePath) then
    begin
      SL.LoadFromFile(FilePath, TEncoding.UTF8); // 如果是 ANSI 文件可省略第二个参数

      ComboBox01.Items.BeginUpdate;
      try
        ComboBox01.Items.Assign(SL); // 加载所有行到 ComboBox
      finally
        ComboBox01.Items.EndUpdate;
      end;
    end
    else
      Memo1.Lines.Add('未找到文件：' + FilePath);
  finally
    SL.Free;
    if ComboBox01.ItemIndex = -1 then
      ComboBox01.ItemIndex := 0;
  end;
end;

function TMergeBinFrm.GetMagiecNumberName(MagicNumber: UInt32): String;
var
  i: Integer;
  name: String;
  data: TBytes;
  MagicCrc: UInt32;
begin
  Result := '';
  for i := 0 to ComboBox01.Items.Count - 1 do
  begin
    name := ComboBox01.Items[i];
    data := TEncoding.ASCII.GetBytes(Trim(ComboBox01.Text)); // 或 UTF8，根据需要
    MagicCrc := CalculateCRC32(data, Length(data));
    if MagicCrc = MagicNumber then
    begin
      Result := name;
      break;
    end;
  end;
end;

procedure TMergeBinFrm.Button01Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LabeledEdit01.Text := OpenDialog1.FileName;
  LabeledEdit04.Text := GetMergeFilesOutputFileName(LabeledEdit01.Text, LabeledEdit02.Text, LabeledEdit03.Text);
end;

procedure TMergeBinFrm.Button02Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LabeledEdit02.Text := OpenDialog1.FileName;

  LabeledEdit04.Text := GetMergeFilesOutputFileName(LabeledEdit01.Text, LabeledEdit02.Text, LabeledEdit03.Text);
end;

procedure TMergeBinFrm.Button03Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LabeledEdit03.Text := OpenDialog1.FileName;
  LabeledEdit04.Text := GetMergeFilesOutputFileName(LabeledEdit01.Text, LabeledEdit02.Text, LabeledEdit03.Text);
end;

procedure TMergeBinFrm.Button04Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    // if not AnsiStartsText('MCUAB_', ExtractFileName(SaveDialog1.FileName)) then
    // LabeledEdit3.Text := IncludeTrailingPathDelimiter(ExtractFilePath(SaveDialog1.FileName)) + 'MCUAB_' + ExtractFileName(SaveDialog1.FileName)
    // else
    LabeledEdit04.Text := SaveDialog1.FileName;
  end;
end;

procedure TMergeBinFrm.Button06Click(Sender: TObject);
begin
  close;
end;

procedure TMergeBinFrm.Button05Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TMergeBinFrm.Button09Click(Sender: TObject);
var
  BinFileC: string;
  FileStream: TFileStream;
  Meta: TMetaInfo;
  MetaPos: Int64;
  MagicName: String;
begin
  BinFileC := Trim(LabeledEdit04.Text);

  if not FileExists(BinFileC) then
  begin
    Memo1.Lines.Add('BIN file not found: ' + BinFileC);
    Exit;
  end;

  try
    FileStream := TFileStream.Create(BinFileC, fmOpenRead or fmShareDenyNone);
    try
      if FileStream.Size < SizeOf(TMetaInfo) then
      begin
        Memo1.Lines.Add('File too small, no META info found.');
        Exit;
      end;

      MetaPos := FileStream.Size - SizeOf(TMetaInfo);
      FileStream.Seek(MetaPos, soBeginning);
      FileStream.ReadBuffer(Meta, SizeOf(TMetaInfo));

      if (Meta.bank1.BankMagic <> APP_INFO_MAGIC) or (Meta.bank2.BankMagic <> APP_INFO_MAGIC) then
      begin
        Memo1.Lines.Add('Invalid META signature.');
        Exit;
      end;

      LogAppInfo('App0', Meta.bank0);
      LogAppInfo('App1', Meta.bank1);
      LogAppInfo('App2', Meta.bank2);
      Memo1.Lines.Add('');
    finally
      FileStream.Free;
    end;
  except
    on E: Exception do
    begin
      Memo1.Lines.Add('Error reading META: ' + E.Message);
    end;
  end;
end;

function RemoveHighNibble(Value: Cardinal): Cardinal;
begin
  Result := Value and $00FFFFFF; // 屏蔽掉最高 nibble（即去掉“8”）
end;

function AlignUp(Value, Alignment: Cardinal): Cardinal;
begin
  Result := (Value + Alignment - 1) and not(Alignment - 1);
end;

function AlignDown(Value, Alignment: Cardinal): Cardinal;
begin
  Result := Value and not(Alignment - 1);
end;

procedure TMergeBinFrm.Button07Click(Sender: TObject);
var
  LoadAddress, RealStartAddr, RealStartBddr: Integer;
begin
  GetBinFileOffset(Trim(LabeledEdit02.Text), RealStartAddr);
  LoadAddress := AlignDown(RealStartAddr, 256);
  LabeledEditA.Text := '0x' + IntToHex(LoadAddress, 8);

  GetBinFileOffset(Trim(LabeledEdit03.Text), RealStartBddr);
  LoadAddress := AlignDown(RealStartBddr, 256);
  LabeledEditB.Text := '0x' + IntToHex(LoadAddress, 8);
end;

procedure TMergeBinFrm.Button9Click(Sender: TObject);
var
  // OcComPortObj: TOcComPortObj;
  FileStream: TFileStream;
  FileNameLoaded: String;
begin
  /// GetDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if OcComPortObj = nil then
  begin
    // OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  if not OcComPortObj.Connected then
  begin
    OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  FileNameLoaded := Trim(LabeledEdit04.Text); // OpenDialog1.FileName;
  if FileExists(FileNameLoaded) then
  begin
    FileStream := ReadFileToStream(FileNameLoaded);
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
  end
  else
  begin
    OcComPortObj.Log('Do not exist the file ' + FileNameLoaded);
    Exit;
  end;

  OcComPortObj.SendFormat := Ord(S_OctopusProtocol);
  SendFileAsBin(OcComPortObj, FileNameLoaded);
end;

procedure TMergeBinFrm.ComboBox01DropDown(Sender: TObject);
begin
  UpdateComboBoxList();
end;

procedure TMergeBinFrm.FormShow(Sender: TObject);
begin
  UpdateComboBoxList();
end;

procedure TMergeBinFrm.LogAppInfo(const AppName: string; const Info: TFlashBankInfo);
var
  model: String;
begin
  model := GetMagiecNumberName(Info.BankModel);
  Memo1.Lines.Add(Format(FIELD_FMT, [AppName + ' Magic', '0x' + IntToHex(Info.BankMagic, 8)]));
  Memo1.Lines.Add(Format(FIELD_FMT, [AppName + ' Model', '0x' + IntToHex(Info.BankModel, 8) + '(' + model + ')']));
  Memo1.Lines.Add(Format(FIELD_FMT, [AppName + ' Start Address', '0x' + IntToHex(Info.BankAddress, 8)]));
  Memo1.Lines.Add(Format(FIELD_FMT, [AppName + ' Size', IntToStr(Info.BankSize) + ' bytes']));
  Memo1.Lines.Add(Format(FIELD_FMT, [AppName + ' CRC32', '0x' + IntToHex(Info.BankCRC32, 8)]));
  Memo1.Lines.Add('');
end;

procedure TMergeBinFrm.Button08Click(Sender: TObject);
var
  BinFileL, BinFileA, BinFileB, BinFileC: string;
  OffsetStrA, OffsetStrB: string;
  OffsetA, OffsetB: Integer;
  FileLStream, FileAStream, FileBStream: TFileStream;
  SizeL, SizeA, SizeB, SizeMatas: Int64;
  MetaInfo: TMetaInfo;
begin
  Memo1.Clear;
  BinFileL := Trim(LabeledEdit01.Text);
  BinFileA := Trim(LabeledEdit02.Text);
  BinFileB := Trim(LabeledEdit03.Text);
  BinFileC := Trim(LabeledEdit04.Text);
  OffsetStrA := Trim(LabeledEditA.Text);
  OffsetStrB := Trim(LabeledEditB.Text);

  OffsetA := 0;
  OffsetB := 0;
  FileLStream := nil;
  FileAStream := nil;
  FileBStream := nil;
  SizeL := 0;
  SizeA := 0;
  SizeB := 0;

  // 解析偏移
  try
    if Pos('0x', LowerCase(OffsetStrA)) = 1 then
      OffsetA := StrToInt('$' + Copy(OffsetStrA, 3, MaxInt))
    else
      OffsetA := StrToInt(OffsetStrA);
    OffsetA := RemoveHighNibble(OffsetA);

    if Pos('0x', LowerCase(OffsetStrB)) = 1 then
      OffsetB := StrToInt('$' + Copy(OffsetStrB, 3, MaxInt))
    else
      OffsetB := StrToInt(OffsetStrB);
    OffsetB := RemoveHighNibble(OffsetB);
  except
    Memo1.Lines.Add('偏移地址无效，必须为十进制或 0x 开头的十六进制整数');
    Exit;
  end;

  // 输入检查
  if (BinFileL <> '') and (not FileExists(BinFileL)) then
    Memo1.Lines.Add('警告: BIN 文件 L 不存在: ' + BinFileL);

  if (BinFileA = '') or (not FileExists(BinFileA)) then
  begin
    Memo1.Lines.Add('警告: BIN 文件 A 不存在: ' + BinFileA);
    Exit;
  end;

  if (BinFileB <> '') and (not FileExists(BinFileB)) then
    Memo1.Lines.Add('警告: BIN 文件 B 不存在: ' + BinFileB);

  if BinFileC = '' then
  begin
    Memo1.Lines.Add('警告: 请输入输出文件路径！');
    Exit;
  end;

  if ComboBox01.ItemIndex < 0 then
  begin
    Memo1.Lines.Add('警告: 请选择合适的MCU型号！');
    Exit;
  end;

  // 打开文件
  if FileExists(BinFileL) then
    FileLStream := TFileStream.Create(BinFileL, fmOpenRead or fmShareDenyWrite);
  if FileExists(BinFileA) then
    FileAStream := TFileStream.Create(BinFileA, fmOpenRead or fmShareDenyWrite);
  if FileExists(BinFileB) then
    FileBStream := TFileStream.Create(BinFileB, fmOpenRead or fmShareDenyWrite);

  if FileLStream <> nil then
    SizeL := FileLStream.Size;
  if FileAStream <> nil then
    SizeA := FileAStream.Size;
  if FileBStream <> nil then
    SizeB := FileBStream.Size;
  SizeMatas := SizeOf(TMetaInfo);

  // 偏移冲突检查
  if (SizeL > 0) and (OffsetA < SizeL) then
  begin
    Memo1.Lines.Add(Format('警告: 偏移地址 OffsetA=0x%.8X 小于 L 文件大小=0x%.8X，可能覆盖！', [OffsetA, SizeL]));
    Exit;
  end;

  if (SizeA > 0) and (OffsetB < OffsetA + SizeA) then
  begin
    Memo1.Lines.Add(Format('警告: 偏移地址 OffsetB=0x%.8X 小于 A 文件结束地址=0x%.8X，可能覆盖！', [OffsetB, OffsetA + SizeA]));
    Exit;
  end;

  try
    // 调用合并函数
    MetaInfo := MergeBinFiles(BinFileL, BinFileA, BinFileB, BinFileC, OffsetA, OffsetB);

    // 日志输出
    Memo1.Lines.Add('Start merging files...');
    Memo1.Lines.Add(Format('%-10s: %s', ['文件 L', BinFileL]));
    Memo1.Lines.Add(Format('%-10s: %d bytes', ['大小', SizeL]));
    Memo1.Lines.Add(Format('%-10s: 0x%.8X', ['地址', 0]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format('%-10s: %s', ['文件 A', BinFileA]));
    Memo1.Lines.Add(Format('%-10s: %d bytes', ['大小', SizeA]));
    Memo1.Lines.Add(Format('%-10s: 0x%.8X', ['地址', OffsetA]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format('%-10s: %s', ['文件 B', BinFileB]));
    Memo1.Lines.Add(Format('%-10s: %d bytes', ['大小', SizeB]));
    Memo1.Lines.Add(Format('%-10s: 0x%.8X', ['地址', OffsetB]));
    Memo1.Lines.Add('--------------------------------------------------------------------');

    LogAppInfo('App0', MetaInfo.bank0);
    LogAppInfo('App1', MetaInfo.bank1);
    LogAppInfo('App2', MetaInfo.bank2);

    Memo1.Lines.Add('');
    Memo1.Lines.Add(Format('%-10s: %d bytes', ['Metas Size', SizeMatas]));
    Memo1.Lines.Add(Format('%-10s: %d bytes', ['Total Size', (SizeL + SizeA + SizeB + SizeMatas)]));
    Memo1.Lines.Add('--------------------------------------------------------------------');

    Memo1.Lines.Add('');
    Memo1.Lines.Add('Output file: ' + BinFileC);
    Memo1.Lines.Add('Merge completed successfully! ');

  finally
    FreeAndNil(FileAStream);
    FreeAndNil(FileBStream);
    FreeAndNil(FileLStream);
  end;
end;

// Merge two BIN files into one with offset + metadata block at the end
function TMergeBinFrm.MergeBinFiles(const BinLPath, BinAPath, BinBPath, OutputPath: string; OffsetA, OffsetB: Integer): TMetaInfo;
var
  FileL, FileA, FileB, FileOut: TFileStream;
  Buffer: array [0 .. 1023] of Byte;
  ReadSize, PaddingSize, FileLSize, FileASize, FileBSize: Integer;
  FileLCRC, FileACRC, FileBCRC: UInt32;
  App0Data, App1Data, App2Data: TBytes;
  ModdelMagicNumber: Integer;
  MetaInfo: TMetaInfo;
  App0Info, App1Info, App2Info: TFlashBankInfo;
  data: TBytes;
begin
  FileA := nil;
  FileB := nil;
  FileL := nil;
  FileLSize := 0;
  FileASize := 0;
  FileBSize := 0;
  FileLCRC := 0;
  FileACRC := 0;
  FileBCRC := 0;
  FillChar(App0Info, SizeOf(App0Info), 0);
  FillChar(App1Info, SizeOf(App1Info), 0);
  FillChar(App2Info, SizeOf(App2Info), 0);

  data := TEncoding.ASCII.GetBytes(Trim(ComboBox01.Text)); // 或 UTF8，根据需要
  ModdelMagicNumber := CalculateCRC32(data, Length(data));

  if FileExists(BinLPath) then
  begin
    FileL := TFileStream.Create(BinLPath, fmOpenRead or fmShareDenyWrite);
    FileLSize := FileL.Size;
  end;

  if FileExists(BinAPath) then
  begin
    FileA := TFileStream.Create(BinAPath, fmOpenRead or fmShareDenyWrite);
    FileASize := FileA.Size;
  end;

  if FileExists(BinBPath) then
  begin
    FileB := TFileStream.Create(BinBPath, fmOpenRead or fmShareDenyWrite);
    FileBSize := FileB.Size;
  end;

  if (FileL = nil) and (FileA = nil) and (FileB = nil) then
    Exit;
  if (FileLSize = 0) and (FileASize = 0) and (FileBSize = 0) then
    Exit;

  FileOut := TFileStream.Create(OutputPath, fmCreate);
  FileOut.Position := 0; // fmCreate这一步其实不需要，已经在开头。
  // 如果用 fmOpenWrite，就要自己调用 FileOut.Position := 0;，否则默认光标会在文件末尾。

  try
    if (FileL <> nil) and (FileLSize > 0) then
    begin
      SetLength(App0Data, FileLSize);
      FileL.ReadBuffer(App0Data[0], FileLSize);
      FileLCRC := CalculateCRC32(App0Data, FileLSize);
      FileOut.WriteBuffer(App0Data[0], FileLSize);
    end;

    if (FileA <> nil) and (FileASize > 0) then
    begin
      PaddingFile(FileOut, OffsetA - FileOut.Position);
      SetLength(App1Data, FileASize);
      FileA.ReadBuffer(App1Data[0], FileASize);
      FileACRC := CalculateCRC32(App1Data, FileASize);
      FileOut.WriteBuffer(App1Data[0], FileASize);
    end;

    if (FileB <> nil) and (FileBSize > 0) then
    begin
      PaddingFile(FileOut, OffsetB - FileOut.Position);
      SetLength(App2Data, FileBSize);
      FileB.ReadBuffer(App2Data[0], FileBSize);
      FileBCRC := CalculateCRC32(App2Data, FileBSize);
      FileOut.WriteBuffer(App2Data[0], FileBSize);
    end;

    PaddingFile(FileOut, SizeOf(TMetaInfo));
    App0Info := MakeAppInfo(ModdelMagicNumber, 0, FileLSize, FileLCRC);
    App1Info := MakeAppInfo(ModdelMagicNumber, OffsetA, FileASize, FileACRC);
    App2Info := MakeAppInfo(ModdelMagicNumber, OffsetB, FileBSize, FileBCRC);
    MetaInfo.bank0 := App0Info;
    MetaInfo.bank1 := App1Info;
    MetaInfo.bank2 := App2Info;
    FileOut.WriteBuffer(MetaInfo, SizeOf(TMetaInfo));
    Result := MetaInfo;
  finally
    if FileL <> nil then
      FileL.Free;
    if FileA <> nil then
      FileA.Free;
    if FileB <> nil then
      FileB.Free;
    if FileOut <> nil then
      FileOut.Free;
  end;
end;

procedure TMergeBinFrm.SendFileAsBin(OcComPortObj: TOcComPortObj; FileName: String);
const
  BLOCK_SIZE = 48; // 每次发送的数据长度
var
  FS: TFileStream;
  Frame: TOctopusUARTFrame;
  DynamicData: array of Byte;
  ReadAddress, BankAddress, MappingAdress: UInt32;
  TotalLength: Integer;
  TotalCRC: Cardinal;
  Buffer: array [0 .. BLOCK_SIZE - 1] of Byte;
  BytesRead: Integer;
  SendCount: Integer;
  StatusOK: Boolean;
begin
  if not FileExists(FileName) then
  begin
    ShowMessage('BIN file does not exist: ' + FileName);
    Exit;
  end;

  if not OcComPortObj.Connected then
  begin
    ShowMessage('Device is not connected.');
    Exit;
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
      Exit;

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
      Exit;
    end;

    FS.Position := 0;
    ReadAddress := 0;
    while FS.Position < FS.Size do
    begin
      BytesRead := FS.Read(Buffer, BLOCK_SIZE);
      if BytesRead <= 0 then
        break;

      Inc(SendCount);

      SetLength(DynamicData, 4 + BytesRead);
      MappingAdress := BankAddress + ReadAddress;
      Move(MappingAdress, DynamicData[0], 4); // 前4字节是地址
      Move(Buffer, DynamicData[4], BytesRead); // 后续为数据

      Frame := OcComPortObj.OctopusUartProtocol.BuildUARTFrame(SOC_TO_MCU_MOD_UPDATE, FRAME_CMD_UPDATE_SEND_FW_DATA, DynamicData, Length(DynamicData));

      StatusOK := OcComPortObj.SendProtocolPackageWaitACKCommand(@Frame, Ord(FRAME_CMD_UPDATE_REQUEST_FW_DATA), Ord(MCU_UPDATE_STATE_RECEIVING), SendCount);
      if not StatusOK then
      begin
        OcComPortObj.Log('Transmission failed at offset: ' + IntToStr(ReadAddress));
        FS.Free;
        Exit;
      end;

      TotalCRC := UpdateCRC32(DynamicData, 4, BytesRead, TotalCRC); // 从地址后数据部分开始计算
      Inc(ReadAddress, BytesRead);
      // StatusBar1DrawProgress(ReadAddress, TotalLength);
      ProgressBar1.Max := TotalLength;
      ProgressBar1.Position := ReadAddress;
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

end.
