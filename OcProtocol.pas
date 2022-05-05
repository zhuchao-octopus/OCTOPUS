unit OcProtocol;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  IdHashMessageDigest,
  ComObj,
  StrUtils,
  Octopus_CRC;

// type OCCOMPROTOCAL_STATUS=();
const
  OCCOMPROTOCAL_HEAD = $0101; // $55AA;
  OCCOMPROTOCAL_END = $7E; // $AA55;

  OCCOMPROTOCAL_START = 10; // ���ӣ�Ҫ��Է��ظ� ״̬�Ƿ��������
  OCCOMPROTOCAL_ACK = 11; // һ����Ӧ��Ҫ��Է���Ӧ��ǰ״̬
  OCCOMPROTOCAL_READY = 12; // ׼���������
  OCCOMPROTOCAL_OVER = 13; // ����������
  OCCOMPROTOCAL_GOT = $0E00; // 14; //���ݰ�ȷ�ϱ���յ���� ,�����ڸ��ֽ�

  OCCOMPROTOCAL_I2C_READ = 50;
  OCCOMPROTOCAL_I2C_WRITE = 51;
  OCCOMPROTOCAL_SPI_READ = 52;
  OCCOMPROTOCAL_SPI_WRITE = 53;
  OCCOMPROTOCAL_WIFI_READ = 54;
  OCCOMPROTOCAL_WIFI_WRITE = 55;
  OCCOMPROTOCAL_UART_READ = 56;
  OCCOMPROTOCAL_UART_WRITE = 57;

  OCCOMPROTOCAL_DATA1 = 101; // ��׼Э������ �������512�ֽ�
  OCCOMPROTOCAL_DATA2 = 102; // �Ǳ�׼Э���ʾ�����������ģ�û�зְ�������˵ֻ��һ����

  OCCOMPROTOCAL_ERROR = $FFFF;
  OCCOMPROTOCAL_NONE = $0000;
  OCCOMPROTOCAL_PACK_RING_BUFFER_HIGHT = 1023;

  OCCOMPROTOCAL_WM_ACK = WM_APP + 100;

  OCCOMPROTOCAL_PACK_PACKPAYLOAD_MAX_LENGTH = 500;
  OCCOMPROTOCAL_PACK_MAX_LENGTH = 512;
type

  POcComPack = ^TOcComPack;

  TOcComPack = packed record // 12+512 =524
    Head: WORD; // ͷ��ʶ���� 2
    PID: WORD; // ��������  2
    Index: byte; // ��������  2
    Length: WORD; // ʵ�����ݳ���
    data: array [0 .. OCCOMPROTOCAL_PACK_PACKPAYLOAD_MAX_LENGTH] of byte; // �����������
    //CRC: byte; // CRCУ��    2
    //EndFlag:byte;
  end;

  TOcComPackHead = packed record // ����ͷ��ʶ��
    Head: WORD; // ͷ��ʶ���� 4
    PID: WORD; // ��������  1
    Index: byte; // ��������  2
    Length: WORD; // �����ܳ��� 2
  end;

type
  TCallBackFun = Procedure(OcComPack: TOcComPack) of object;

  TOcComProtocal = class
  private
    FPackList_RB: Array [0 .. OCCOMPROTOCAL_PACK_RING_BUFFER_HIGHT]
      of TOcComPack;
    FPackList_RB_Top: integer;
    FPackList_RB_Count: integer;
    FNeedCRC16: Boolean;
    FCallBackFun: TCallBackFun;
  public

    Constructor Create();
    destructor Destroy;
    function AddPackToPackList(OcComPack: POcComPack):Integer;
    function CreatePack(Id: byte): TOcComPack;
    function ParserPack(buff: PByte; Len: integer): integer;
    function GetPackByIndex(i: integer): TOcComPack;
    function GetBytesValue(i: integer): Int64;
    procedure ClearPacks();
    function CheckPackMinLength(p: POcComPack; Len: integer): Boolean;
    function CheckPackLength(p: POcComPack; Len: integer): Boolean;
    function CheckPackCRC(p: POcComPack; Len: integer): Boolean;
    function IsParserComplete(): Boolean;
    function WaitingForACK(OcComPack: TOcComPackHead; timeOut: integer): Boolean;
    function GetLastPackHead(): TOcComPackHead;
    function GetLastPack(): TOcComPack;
    function CalCRC16(AData: array of byte; Length: integer): WORD; // ���㷨

    property CallBackFun: TCallBackFun read FCallBackFun write FCallBackFun;
    property PackList_RB_Top: integer read FPackList_RB_Top;
    property PackList_RB_Count: integer read FPackList_RB_Count;
    property NeedCRC16: Boolean read FNeedCRC16 write FNeedCRC16;

  end;

function EncryptInt(d: integer): string;
function DecryptInt(ks: string): integer;

implementation

Constructor TOcComProtocal.Create();
begin
  FPackList_RB_Top := 0;
  FPackList_RB_Count := 0;
  ZeroMemory(@FPackList_RB, SizeOf(TOcComPack) * Length(FPackList_RB));
end;

Destructor TOcComProtocal.Destroy;
begin

end;

function TOcComProtocal.IsParserComplete: Boolean;
//var
// PackSize:Integer;
begin
  Result := false;
  //PackSize := SizeOf(TOcComPackHead) + p.Length + 2;//����ʵ����Ч����
  //if (((GetLastPackHead.Total - GetLastPackHead.Index) = 1) and
  //  (GetLastPackHead.PID > OCCOMPROTOCAL_DATA1)) or
  //  (GetLastPackHead.PID = OCCOMPROTOCAL_OVER) then
  //if(GetLastPack.EndFlag = OCCOMPROTOCAL_END) then
  Result := True; // ���������һ�����ˣ� ȷ�Ͻ�����ɣ��м��п��ܶ�������,���߿ͻ��˷����˽�������
end;

function TOcComProtocal.GetLastPackHead(): TOcComPackHead;
begin
  Result.PID := OCCOMPROTOCAL_ERROR;
  CopyMemory(@Result, @FPackList_RB[FPackList_RB_Top], SizeOf(TOcComPackHead));
end;


function TOcComProtocal.GetLastPack(): TOcComPack;
begin
  CopyMemory(@Result, @FPackList_RB[FPackList_RB_Top], SizeOf(TOcComPack));
end;

function TOcComProtocal.WaitingForACK(OcComPack: TOcComPackHead;
  timeOut: integer): Boolean;
var
  Oc: TOcComPack;
  Start: real;
begin
  Result := false;
  Start := GetTickCount;
  while (True) do
  begin
    if (GetTickCount - Start) > timeOut then
    begin
      break; // ��ʱ�Ƴ�
    end;

    Oc := FPackList_RB[FPackList_RB_Top];
    if (Oc.Head = OcComPack.Head) and (Oc.PID = byte(OcComPack.PID)) and
      (Oc.Index = OcComPack.Index) {and (Oc.Total = OcComPack.Total)} and
      (Oc.Length = OcComPack.Length) and
      ((Oc.PID and $FF00) = OCCOMPROTOCAL_GOT) then // ��ʾ������յ�
    begin
      Result := True;
      break;
    end;
  end;
end;

function TOcComProtocal.AddPackToPackList(OcComPack: POcComPack):Integer;
  var PackSize:Integer;
begin
  PackSize := SizeOf(TOcComPackHead) + OcComPack.Length + 2;//����ʵ����Ч����
  INC(FPackList_RB_Top);
  if FPackList_RB_Top > OCCOMPROTOCAL_PACK_RING_BUFFER_HIGHT then
    FPackList_RB_Top := 0; // Ring buffer
  CopyMemory(@FPackList_RB[FPackList_RB_Top], OcComPack, PackSize);
  INC(FPackList_RB_Count);
  Result:= PackSize;
end;

function TOcComProtocal.CreatePack(Id: byte): TOcComPack;
var
  OcComPack: TOcComPack;
begin
  OcComPack.Length := SizeOf(TOcComPackHead);
  OcComPack.Head := OCCOMPROTOCAL_HEAD;
  OcComPack.PID := Id;
  Result := OcComPack;
end;

function TOcComProtocal.CheckPackMinLength(p: POcComPack; Len: integer): Boolean;
begin
  Result := True;
  if Len < (SizeOf(TOcComPackHead) + 2) then // ���Ȳ�����С����С������
    Result := false;
end;

function TOcComProtocal.CheckPackLength(p: POcComPack; Len: integer): Boolean;
// ���������Ƿ�����ȴ�
var
  PackSize :Integer;
begin
  Result := True;
  PackSize := SizeOf(TOcComPackHead) + p.Length + 2;//����ʵ����Ч����
  if (Len < PackSize) { �յ������ݲ��� }
  then
  begin // �������ĳ���ҪС�ڵ����������İ�����
    Result := false; // ˵�����ݲ�ȫ�������ȴ�����
  end;
  if(Len > OCCOMPROTOCAL_PACK_PACKPAYLOAD_MAX_LENGTH) { �����ǺϷ���,���ܳ��������� } then
  begin
    Result:=false;
  end;
end;

function TOcComProtocal.CheckPackCRC(p: POcComPack; Len: integer): Boolean;
// ���������������Ƿ�����Ƿ�Ҫ����
var
  CRC1: WORD;//CRC
  CRC2: WORD;//END_FLAG
  PackSize: integer;
begin
  Result := false;
  //PackSize := SizeOf(TOcComPackHead) + p.Length + 2;//����ʵ����Ч����
  {CRC2 := p.data[p.Length - SizeOf(TOcComPackHead) - 1]; // ��Χ����
  CRC2 := CRC2 SHL 8 + p.data[p.Length - SizeOf(TOcComPackHead) - 2];
  if (CRC2 <> OCCOMPROTOCAL_END) then // ��β����ʧ
  begin
    CRC1 := CalCRC16(p.data, p.Length - SizeOf(TOcComPackHead) - 2);
    if CRC1 <> CRC2 then // CRC ����
      Result := false;
  end;}

  if((p.Length + SizeOf(TOcComPackHead)) >= len) then
   Exit;

  CRC1 := p.data[p.Length];
  CRC2 := p.data[p.Length + 1];
  if(CRC2 = OCCOMPROTOCAL_END) then
    Result:=true;
end;

function TOcComProtocal.ParserPack(buff: PByte; Len: integer): integer;
var
  i: integer;
  p: POcComPack;
  //p2: TOcComPackHead;
  //pw: PByte;
begin
  i := 0;
  if Len < SizeOf(TOcComPackHead) then // ���ݰ���С������֤ �����ݲ����������ȵ��µ�����
  begin
     Exit;
  end;
  while (True) do
  begin
    Result := i;
    p := @buff[i];

    if(CheckPackMinLength(p,Len - i) = false) then
    begin
      break;//���ݲ����������ȵ��µ�����
    end;

    if p^.Head = OCCOMPROTOCAL_HEAD then //�԰�ͷ
    begin
      //if CheckPackLength(p, Len) = false then // ���ݰ��Ϸ��������������⣬���ز�ȫ �����ȴ��µ�����
      //begin
      //  break; // ���ز�ȫ���ȴ���������
      //end;
      if CheckPackCRC(p, Len - i) then //�Ұ�Χ Len - iʣ�೤��
      begin
        i:= i+ AddPackToPackList(p);
        if Assigned(FCallBackFun) then
        begin
          FCallBackFun(GetLastPack());
        end;
      end
      else
      begin
        break; // ���ز�ȫ���ȴ���������
      end;
    end
    else
    begin
      INC(i); // ����Ѱ��
    end;
  end;
end;

function TOcComProtocal.GetPackByIndex(i: integer): TOcComPack;
begin
  Result := FPackList_RB[i];
end;

function TOcComProtocal.GetBytesValue(i: integer): Int64;
var
  j: integer;
  // b:byte;
begin
  Result := 0;
  // b:=
  for j := 0 to self.GetPackByIndex(i).Length - SizeOf(TOcComPackHead) - 1 do
  begin
    // str := str + Format('%.02x ', [self.FOcComProtocal.GetPackByIndex(i).data[j]]);
    Result := (Result shl 8) + GetPackByIndex(i).data[j];
  end;

end;

procedure TOcComProtocal.ClearPacks();
begin
  FPackList_RB_Top := 0;
  FPackList_RB_Count := 0;
  ZeroMemory(@FPackList_RB, SizeOf(TOcComPack) * Length(FPackList_RB));
end;

function GetGUI(): String;
var
  FGuid: TGUID;
begin
  CreateGUID(FGuid);
  Result := GUIDToString(FGuid);
  Result := Result + ' ' + IntToStr(Length(Result));
  Result := Copy(GUIDToString(FGuid), 2, 36);
end;

function GetGUID(): String;
var
  AGuid: TGUID;
  sGUID: string;
begin
  sGUID := CreateClassID;
  Delete(sGUID, 1, 1);
  Delete(sGUID, Length(sGUID), 1);
  sGUID := StringReplace(sGUID, '-', '', [rfReplaceAll]);
  Result := sGUID;
end;

function GetMD5(Str: String): String;
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  Result := MD5.HashStringAsHex(Str);
end;

// Encrypt integer to str
function EncryptInt(d: integer): string;
var
  i: integer;
  cd: array [0 .. 7] of byte;
begin
  cd[1] := Random(256);
  cd[4] := Random(cd[1]);
  cd[6] := Random(cd[1] + cd[4]);
  cd[2] := (((d div $10000) mod $100) + cd[1]) xor cd[4];
  cd[3] := (((d div $100) mod $100) - cd[2]) xor (cd[1] - cd[4]);
  cd[5] := ((d mod $100) - cd[6]) xor (cd[1] + cd[3]);
  cd[7] := ((d div $1000000) mod $100) + cd[1] + cd[5];
  cd[0] := ((cd[1] xor cd[2]) xor cd[3]) + (cd[4] or cd[5]) + (cd[6] and cd[7]);
  Result := '';
  for i := 0 to 7 do
    Result := Result + IntToHex(cd[i], 2);
end;

function DecryptInt(ks: string): integer;
var
  i: integer;
  cd: array [0 .. 7] of byte;
  s: string;
begin
  for i := 0 to 7 do
  begin
    s := '$' + ks[i + i + 1] + ks[i + i + 2];
    cd[i] := StrToInt(s);
  end;

  if cd[0] <> byte(((cd[1] xor cd[2]) xor cd[3]) + (cd[4] or cd[5]) +
    (cd[6] and cd[7])) then
  begin
    Result := 0;
    Exit;
  end;
  cd[7] := cd[7] - cd[1] - cd[5];
  cd[5] := (cd[5] xor (cd[1] + cd[3])) + cd[6];
  cd[3] := (cd[3] xor (cd[1] - cd[4])) + cd[2];
  cd[2] := (cd[2] xor cd[4]) - cd[1];
  Result := cd[7] * $1000000 + cd[2] * $10000 + cd[3] * $100 + cd[5];
end;

function TOcComProtocal.CalCRC16(AData: array of byte; Length: integer): WORD;
// ���㷨
const
  GENP = $A001;
var
  CRC: WORD;
  i: integer;
  tmp: byte;
  procedure CalOneByte(AByte: byte); // ����1���ֽڵ�У����
  var
    j: integer;
  begin
    CRC := CRC xor AByte; // ��������CRC�Ĵ����ĵ�8λ�������
    for j := 0 to 7 do // ��ÿһλ����У��
    begin
      tmp := CRC and 1; // ȡ�����λ
      CRC := CRC shr 1; // �Ĵ���������һλ
      CRC := CRC and $7FFF; // �����λ��0
      if tmp = 1 then // ����Ƴ���λ�����Ϊ1����ô�����ʽ���
        CRC := CRC xor GENP;
      CRC := CRC and $FFFF;
    end;
  end;

begin
  CRC := $FFFF; // �������趨ΪFFFF
  for i := 0 to Length - 1 do // ��ÿһ���ֽڽ���У��
    CalOneByte(AData[i]);
  Result := CRC;
end;

end.
