unit uMergeBin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Math, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, StrUtils,
  OcComPortObj, Vcl.ComCtrls;

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
    bank1: TFlashBankInfo;
    bank2: TFlashBankInfo;
  end;

  TMergeBinFrm = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit3: TLabeledEdit;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    LabeledEdit4: TLabeledEdit;
    Memo1: TMemo;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    ComboBox1: TComboBox;
    Button8: TButton;
    Button9: TButton;
    ProgressBar1: TProgressBar;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
    App1Info, App2Info: TFlashBankInfo;
    procedure MergeBinFiles(const BinAPath, BinBPath, OutputPath: string; OffsetB: Integer);
    procedure SendFileAsBin(OcComPortObj: TOcComPortObj; FileName: String);
    procedure updateComboBoxList();
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

uses Winapi.ShellAPI, System.UITypes, System.IOUtils, Winapi.ShlObj, Winapi.ActiveX, System.Win.ComObj,
  OcProtocol, uCRC;

{$R *.dfm}

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
function MakeAppInfo(BankMagic, Adress, AppSize, CRC32: UInt32): TFlashBankInfo;
begin
  Result.BankMagic := APP_INFO_MAGIC;
  Result.BankModel := BankMagic;
  Result.BankSize := AppSize;
  Result.BankCRC32 := CRC32;
  Result.BankAddress := Adress;
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
    ShowMessage('找不到 BIN 文件：' + BinPath);
    Exit;
  end;

  FS := TFileStream.Create(BinPath, fmOpenRead or fmShareDenyNone);
  try
    if FS.Size < 8 then
    begin
      ShowMessage('BIN 文件太小，无法读取向量表');
      Exit;
    end;

    FS.ReadBuffer(VectorTable, 8);
    LoadAddress := VectorTable[1]; // Reset_Handler 地址即为推测的起始 Load Address
  finally
    FS.Free;
  end;
end;

procedure TMergeBinFrm.updateComboBoxList();
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

      ComboBox1.Items.BeginUpdate;
      try
        ComboBox1.Items.Assign(SL); // 加载所有行到 ComboBox
      finally
        ComboBox1.Items.EndUpdate;
      end;
    end
    else
      Memo1.Lines.Add('未找到文件：' + FilePath);
  finally
    SL.Free;
    if ComboBox1.ItemIndex = -1 then
      ComboBox1.ItemIndex := 0;
  end;
end;

procedure TMergeBinFrm.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LabeledEdit1.Text := OpenDialog1.FileName;
end;

procedure TMergeBinFrm.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LabeledEdit2.Text := OpenDialog1.FileName;
end;

procedure TMergeBinFrm.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if not AnsiStartsText('MCUAB_', ExtractFileName(SaveDialog1.FileName)) then
      LabeledEdit3.Text := IncludeTrailingPathDelimiter(ExtractFilePath(SaveDialog1.FileName)) + 'MCUAB_' + ExtractFileName(SaveDialog1.FileName)
    else
      LabeledEdit3.Text := SaveDialog1.FileName;
  end;
end;

procedure TMergeBinFrm.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TMergeBinFrm.Button6Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TMergeBinFrm.Button7Click(Sender: TObject);
var
  BinFileC: string;
  FileStream: TFileStream;
  Meta: TMetaInfo;
  MetaPos: Int64;
begin
  BinFileC := Trim(LabeledEdit3.Text);

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

      Memo1.Lines.Add('');
      Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Magic', '0x' + IntToHex(Meta.bank1.BankMagic, 8)]));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Start Address', '0x' + IntToHex(Meta.bank1.BankAddress, 8)]));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Size', IntToStr(Meta.bank1.BankSize) + ' bytes']));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App1 CRC32', '0x' + IntToHex(Meta.bank1.BankCRC32, 8)]));
      Memo1.Lines.Add('');
      Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Magic', '0x' + IntToHex(Meta.bank2.BankMagic, 8)]));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Start Address', '0x' + IntToHex(Meta.bank2.BankAddress, 8)]));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Size', IntToStr(Meta.bank2.BankSize) + ' bytes']));
      Memo1.Lines.Add(Format(FIELD_FMT, ['App2 CRC32', '0x' + IntToHex(Meta.bank2.BankCRC32, 8)]));
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

procedure TMergeBinFrm.Button8Click(Sender: TObject);
var
  LoadAddress, RealStartAddr: Integer;
begin
  GetBinFileOffset(Trim(LabeledEdit2.Text), RealStartAddr);
  LoadAddress := AlignDown(RealStartAddr, 256);
  LabeledEdit4.Text := '0x' + IntToHex(LoadAddress, 8);
end;

procedure TMergeBinFrm.Button9Click(Sender: TObject);
var
  OcComPortObj: TOcComPortObj;
  FileStream: TFileStream;
  FileNameLoaded: String;
begin
  /// GetDeciceByFullName(ComboBoxEx1.Items[ComboBoxEx1.ItemIndex]);
  if OcComPortObj = nil then
  begin
    OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  if not OcComPortObj.Connected then
  begin
    OcComPortObj.Log('No device is found,please open a device.');
    MessageBox(Application.Handle, 'No device is found,please open a device.', PChar(Application.Title), MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  FileNameLoaded := Trim(LabeledEdit3.Text); // OpenDialog1.FileName;
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

  /// ComboBox301.ItemIndex := 0;
  /// ComboBox2.ItemIndex := Ord(OctopusProtocol);
  /// ComboBox2.OnChange(Self);
  /// if IsBinFile(FileNameLoaded) then
  /// begin
  OcComPortObj.SendFormat := Ord(S_OctopusProtocol);
  SendFileAsBin(OcComPortObj, FileNameLoaded);
  /// end
  /// else
  /// begin
  /// SendFileAsCommon(OcComPortObj);
  /// end;
end;

procedure TMergeBinFrm.ComboBox1DropDown(Sender: TObject);
begin
  updateComboBoxList();
end;

procedure TMergeBinFrm.FormShow(Sender: TObject);
begin
  updateComboBoxList();
end;

procedure TMergeBinFrm.Button3Click(Sender: TObject);
var
  BinFileA, BinFileB, BinFileC, OffsetStr: String;
  OffsetB: Integer;
  FileAStream, FileBStream: TFileStream;
  SizeA, SizeB: Int64;
begin
  Memo1.Clear;

  BinFileA := Trim(LabeledEdit1.Text);
  BinFileB := Trim(LabeledEdit2.Text);
  BinFileC := Trim(LabeledEdit3.Text);
  OffsetStr := Trim(LabeledEdit4.Text);

  // 检查输入路径
  if not FileExists(BinFileA) then
  begin
    Memo1.Lines.Add('BIN 文件 A 不存在: ' + BinFileA);
    Exit;
  end;

  if not FileExists(BinFileB) then
  begin
    Memo1.Lines.Add('BIN 文件 B 不存在: ' + BinFileB);
    Exit;
  end;

  if BinFileC = '' then
  begin
    Memo1.Lines.Add('请输入输出文件路径！');
    Exit;
  end;

  if ComboBox1.ItemIndex < 0 then
  begin
    Memo1.Lines.Add('请选择合适的MCU型号！');
    Exit;
  end;

  // 获取 OffsetB
  if OffsetStr = '' then
    OffsetB := 65536
  else
  begin
    try
      // 支持 0x 前缀的十六进制
      if Pos('0x', LowerCase(OffsetStr)) = 1 then
        OffsetB := StrToInt('$' + Copy(OffsetStr, 3, MaxInt)) // 转成 Delphi 支持的格式
      else
        OffsetB := StrToInt(OffsetStr); // 十进制
      OffsetB := RemoveHighNibble(OffsetB);
    except
      Memo1.Lines.Add('偏移地址无效，必须为十进制或 0x 开头的十六进制整数');
      Exit;
    end;
  end;

  // 获取文件大小
  FileAStream := TFileStream.Create(BinFileA, fmOpenRead or fmShareDenyWrite);
  FileBStream := TFileStream.Create(BinFileB, fmOpenRead or fmShareDenyWrite);
  try
    SizeA := FileAStream.Size;
    SizeB := FileBStream.Size;

    // 冲突检查
    if OffsetB < SizeA then
    begin
      Memo1.Lines.Add(Format('偏移地址 %d 小于文件 A 大小 %d，可能发生覆盖！', [OffsetB, SizeA]));
      Exit;
    end;

    // 执行合并
    MergeBinFiles(BinFileA, BinFileB, BinFileC, OffsetB);

    // 输出详细日志

    Memo1.Lines.Add(Format('%-8s: %s', ['文件 A', BinFileA]));
    Memo1.Lines.Add(Format('%-8s: %s', ['大小', IntToStr(SizeA) + ' bytes']));
    Memo1.Lines.Add(Format('%-8s: %s', ['起始地址', '0x00000000']));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format('%-8s: %s', ['文件 B', BinFileB]));
    Memo1.Lines.Add(Format('%-8s: %s', ['大小', IntToStr(SizeB) + ' bytes']));
    Memo1.Lines.Add(Format('%-8s: %s', ['起始地址', '0x' + Format('%.8X', [OffsetB])]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format('%-8s: %s', ['输出文件', BinFileC]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Magic', '0x' + IntToHex(App1Info.BankMagic, 8)]));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Model', '0x' + IntToHex(App1Info.BankModel, 8)]));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Start Address', '0x00000000']));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Size', IntToStr(App1Info.BankSize) + ' bytes']));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 CRC32', '0x' + IntToHex(App1Info.BankCRC32, 8)]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Magic', '0x' + IntToHex(App2Info.BankMagic, 8)]));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App1 Model', '0x' + IntToHex(App2Info.BankModel, 8)]));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Start Address', '0x' + IntToHex(OffsetB, 8)]));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App2 Size', IntToStr(App2Info.BankSize) + ' bytes']));
    Memo1.Lines.Add(Format(FIELD_FMT, ['App2 CRC32', '0x' + IntToHex(App2Info.BankCRC32, 8)]));
    Memo1.Lines.Add('');

    Memo1.Lines.Add('Merge Completed.');

  finally
    FileAStream.Free;
    FileBStream.Free;
  end;
end;

// Merge two BIN files into one with offset + metadata block at the end
procedure TMergeBinFrm.MergeBinFiles(const BinAPath, BinBPath, OutputPath: string; OffsetB: Integer);
var
  FileA, FileB, FileOut: TFileStream;
  Buffer: array [0 .. 1023] of Byte;
  ReadSize, PaddingSize: Integer;
  App1Size, App2Size: Integer;
  CRC1, CRC2: UInt32;
  App1Data, App2Data: TBytes;
  MagicNumber: Integer;
  Meta: TMetaInfo;
  data: TBytes;
begin
  FileA := TFileStream.Create(BinAPath, fmOpenRead or fmShareDenyWrite);
  FileB := TFileStream.Create(BinBPath, fmOpenRead or fmShareDenyWrite);
  FileOut := TFileStream.Create(OutputPath, fmCreate);

  try
    // Step 1: Read entire BIN A and compute info
    SetLength(App1Data, FileA.Size);
    FileA.ReadBuffer(App1Data[0], FileA.Size);
    App1Size := Length(App1Data);
    CRC1 := CalculateCRC32(App1Data, App1Size);

    // Step 2: Write BIN A to output
    FileOut.WriteBuffer(App1Data[0], App1Size);

    // Step 3: Pad with 0xFF if needed before BIN B
    PaddingSize := OffsetB - FileOut.Size;
    if PaddingSize > 0 then
    begin
      FillChar(Buffer, SizeOf(Buffer), $FF);
      while PaddingSize > 0 do
      begin
        ReadSize := Min(PaddingSize, SizeOf(Buffer));
        FileOut.Write(Buffer, ReadSize);
        Dec(PaddingSize, ReadSize);
      end;
    end;

    // Step 4: Read entire BIN B and compute info
    SetLength(App2Data, FileB.Size);
    FileB.ReadBuffer(App2Data[0], FileB.Size);
    App2Size := Length(App2Data);
    CRC2 := CalculateCRC32(App2Data, App2Size);

    // Step 5: Write BIN B to output
    FileOut.WriteBuffer(App2Data[0], App2Size);

    // Step 6: Create and append metadata
    // MagicNumber := FNV1aHash32(Trim(ComboBox1.Text));
    data := TEncoding.ASCII.GetBytes(Trim(ComboBox1.Text)); // 或 UTF8，根据需要
    MagicNumber := CalculateCRC32(data, Length(data));
    App1Info := MakeAppInfo(MagicNumber, 0, App1Size, CRC1);
    App2Info := MakeAppInfo(MagicNumber, OffsetB, App2Size, CRC2);

    Meta.bank1 := App1Info;
    Meta.bank2 := App2Info;
    FileOut.WriteBuffer(Meta, SizeOf(Meta));

  finally
    FileA.Free;
    FileB.Free;
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
