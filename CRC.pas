unit CRC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  StdCtrls;




  var
  //���ɶ���ʽ��ֵ������ʽ���ӣ�
  //ע�⣺CRC16���������ĸ�λ�ȼ��㣬����ʽ���Ӳ���
  //��CRC32��CRC8�����������ĵ�λ�ȼ��㣬���Զ���ʽ���ӵĸ�/��λ�Ե�
  //����CRC32��$04C11DB7��Ϊ$EDB88320��CRC8��$31��Ϊ$8C
  GenPoly32: DWord; // CRC-32 = X32+X26+X23+X22+X16+X12+X11+X10+X8+X7+X5+X4+X2+X1+1
                    // 00000100 11000001 00011101 10110111($04C11DB7) ��λ����($EDB88320)
  GenPoly16: Word;  // CRC-CCITT16 = X16+X12+X5+1, 00010000 00100001($1021) ��λ����
                    // CRC-16      = X16+X15+X2+1, 10000000 00000101($8005) ��λ����
  GenPoly8:  Byte;  // CRC-8 = X8+X5+X4+1, 00110001($31) ��λ����($8C)
  GenPoly4:  Byte;  // CRC-4 = X4+X1+1, 0011($03)

  CRC32Tab: array [0..255] of DWord; // CRC32���ټ�����
  CRC16Tab: array [0..255] of Word;  // CRC16���ټ�����
  CRC8Tab : array [0..255] of Byte;  // CRC8 ���ټ�����


  function CalCRC8(data, crc, genpoly: Byte): Byte;
  function QuickCRC8(data, crc: Byte): Byte;

  procedure InitCRC8Tab(genpoly: DWord);


implementation



///////////////////////////////////////////////////////////
// 16λCRC����λ���㣬�ٶ�������ռ�ÿռ�����
// ע���������Ǹ�λ����
///////////////////////////////////////////////////////////
function CalCRC16(data, crc, genpoly: Word): Word;
var i: Integer;
begin
  // ����1��ժ��XMODEMЭ��
  crc := crc xor (data shl 8);
  for i:=0 to 7 do
    if (crc and $8000) <> 0 then // ֻ�������λ
      crc := (crc shl 1) xor genpoly // ���λΪ1����λ�������
    else crc := crc shl 1;           // ����ֻ��λ����2��
  Result := crc;
{
  // ����2���㷨��Щ��ͬ���������ͬ
  data := data shl 8; // �Ƶ����ֽ�
  for i:=7 downto 0 do
  begin
    if ((data xor crc) and $8000) <> 0 then // ֻ�������λ
      crc := (crc shl 1) xor genpoly // ���λΪ1����λ�������
    else crc := crc shl 1;           // ����ֻ��λ����2��
    data := data shl 1; // ������һλ
  end;
  Result := crc;

  // ����3��ժ��<<CRC�㷨ԭ��C����ʵ��>>
  for i:=7 downto 0 do
  begin
    if (crc and $8000) <> 0 then
      crc := (crc*2) xor genpoly // ��ʽCRC����2����CRC
    else crc := crc*2;
    if (data and (1 shl i)) <> 0 then
      crc := crc xor genpoly; // �ټ��ϱ�λ��CRC
  end;
  Result := crc;
}
{
; MCS51��CRC-16���㺯��(����ʽ����Ϊ$1021, ��λ����)
; ���ã�CRC16H/CRC16L=ԭCRC16ֵ(16λ����ʼֵΪ0000h)��A=����������(8λ)
; �����CRC16H/CRC16L=������CRC16ֵ(16λ)
CalCRC16:
        push  00h          ; Save R0
        push  acc          ; Save Acc
        mov   r0,#08       ; 8 Bits In A Byte
        xrl   CRC16H,a     ; CRC16H ^= Data
lp1:    clr   c            ; 0 Into Low Bit
        mov   a,CRC16L     ; CRC16H/CRC16L <<= 1
        rlc   a
        mov   CRC16L,a
        mov   a,CRC16H
        rlc   a
        mov   CRC16H,a
        jnc   lp2          ; Skip If Bit 15 Wasn't Set
        xrl   CRC16H,#10h  ; CRC16H/CRC16L ^= $1021
        xrl   CRC16L,#21h
lp2:    djnz  r0,lp1       ; Repeat R0 More Times
        pop   acc          ; Recover Acc
        pop   00h          ; Recover R0
        ret
}
end;

///////////////////////////////////////////////////////////
// 16λCRC������CRC16��(256��)�����ڿ��ٲ�����
// �ڳ����ʼ��ʱ���ȵ��ã�Ԥ������CRC16Tab[256]�������
///////////////////////////////////////////////////////////
procedure InitCRC16Tab(genpoly: DWord);
var i: Integer;
begin
  for i:=0 to 255 do
    CRC16Tab[i] := CalCRC16(i,0,genpoly);
end;

///////////////////////////////////////////////////////////
// 16λCRC��ͨ�������ټ��㣬�ٶȿ죬ռ�ÿռ��
// ҪԤ������CRCTab[256]�������
///////////////////////////////////////////////////////////
function QuickCRC16(data, crc: Word): Word;
begin
  // ����1�����ֽڼ���CRC��ͨ�����(256��)���ټ���
  //        �ٶ���죬ռ�ÿռ���࣬��Ҫ256�����ݵı��ռ�
  crc := CRC16Tab[(crc shr 8) xor data] xor (crc shl 8);
  Result := crc;
{
  // ����2�������ֽڼ���CRC��ͨ�����(16��)���ټ���
  //        �ٶȱȽϿ죬ռ�ÿռ�Ҳ�Ƚ��٣�ֻ��Ҫ����ǰ16������
  crc := CRCTab[(crc shr 12) xor (data shr 4)] xor (crc shl 4);
  crc := CRCTab[(crc shr 12) xor (data and $0F)] xor (crc shl 4);
  Result := crc;
}
{
; MCS51��CRC-16���ٲ����㺯��
; ҪԤ������CRC16������ݣ���ʼ��ַCRC16Tab������/���ֽ�˳����(512�ֽ�)
; ���ã�CRC16H/CRC16L=ԭCRC16ֵ(16λ����ʼֵΪ0000h)��A=����������(8λ)
; �����CRC16H/CRC16L=������CRC16ֵ(16λ)
QuickCRC16:
        push  dph             ; Save DPH
        push  dpl             ; Save DPL
        push  acc             ; Save Acc
        mov   dptr,#CRC16Tab  ; Point To Table
        xrl   a,CRC16H        ; XOR High Of CRC With Character
        call  UTIL_ADCAD      ; Add 'A' To 'DPTR'
        call  UTIL_ADCAD      ; Add 'A' To 'DPTR' (Yes, Twice)
        clr   a               ; Get High Byte From Table Entry
        movc  a,@a+dptr
        xrl   a,CRC16L        ; XOR With Low
        mov   CRC16H,a        ; Store To High Of CRC
        clr   a               ; Get Low Byte From Table Entry
        inc   dptr
        movc  a,@a+dptr
        mov   CRC16L,a        ; Store To Low Of CRC
        pop   acc             ; Recover Acc
        pop   dpl             ; Recover DPL
        pop   dph             ; Recover DPH
        ret
}
end;



///////////////////////////////////////////////////////////////////////////////////////////

Function CalXOR8(data, crc: Byte): Byte;
begin
    result:= data xor crc;
end;
Function CalXOR82(databuffer:array of Byte;crcStart: Byte;Length:Integer): Byte;
var
 i:Integer;
 co:Byte;
begin
  co:=co xor crcStart;
  for i:=0 to Length-1 do
  begin
      co:= databuffer[i] xor co;
  end;
  result:=co;
end;

///////////////////////////////////////////////////////////
// 8λCRC����λ���㣬�ٶ�������ռ�ÿռ�����
// ע���������ǵ�λ���У���16λCRC�෴
///////////////////////////////////////////////////////////
function CalCRC8(data, crc, genpoly: Byte): Byte;
var i: Integer;
begin
  // ����1��ժ��XMODEMЭ��, ģ��CRC16���㷽��, ���ǵ�λ����
  crc := crc xor data;
  for i:=0 to 7 do
    if (crc and $01) <> 0 then // ֻ�������λ
      crc := (crc shr 1) xor genpoly // ���λΪ1����λ�������
    else crc := crc shr 1;           // ����ֻ��λ����2��
  Result := crc;
{
  // ����2���㷨��Щ��ͬ���������ͬ
  for i:=0 to 7 do
  begin
    if ((data xor crc) and $01) <> 0 then // ֻ�������λ
      crc := (crc shr 1) xor genpoly // ���λΪ1����λ�������
    else crc := crc shr 1;           // ����ֻ��λ����2��
    data := data shr 1; // ������һλ
  end;
  Result := crc;
}
{
; MCS51��CRC-8���㺯��(����ʽ����Ϊ$8C, ��λ����)
; ���ã�B=ԭCRC8ֵ(8λ����ʼֵΪ00h)��A=����������(8λ)
; �����B=������CRC8ֵ(8λ)
CalCRC8:
        push  00h          ; Save R0
        push  acc          ; Save Acc
        mov   r0,#08       ; 8 Bits In A Byte
        xrl   b,a          ; CRC8 ^= Data
lp1:    clr   c            ; 0 Into High Bit
        mov   a,b          ; CRC8 >>= 1
        rrc   a
        mov   b,a
        jnc   lp2          ; Skip If Bit 0 Wasn't Set
        xrl   b,#8Ch       ; CRC8 ^= $8C
lp2:    djnz  r0,lp1       ; Repeat R0 More Times
        pop   acc          ; Recover Acc
        pop   00h          ; Recover R0
        ret
}
end;

///////////////////////////////////////////////////////////
// 8λCRC������CRC8��(256��)�����ڿ��ٲ�����
// �ڳ����ʼ��ʱ���ȵ��ã�Ԥ������CRC8Tab[256]�������
///////////////////////////////////////////////////////////
procedure InitCRC8Tab(genpoly: DWord);
var i: Integer;
begin
  for i:=0 to 255 do
    CRC8Tab[i] := CalCRC8(i,0,genpoly);
end;

///////////////////////////////////////////////////////////
// 8λCRC��ͨ�������ټ��㣬�ٶȿ죬ռ�ÿռ��
// ע���������ǵ�λ���У���16λCRC�෴
// ҪԤ������CRC8Tab[256]�������
///////////////////////////////////////////////////////////
function QuickCRC8(data, crc: Byte): Byte;
begin
  crc := CRC8Tab[crc xor data];
  Result := crc;
{
; MCS51��CRC-8���ٲ����㺯��
; ҪԤ������CRC8������ݣ���ʼ��ַCRC8Tab����˳����(256�ֽ�)
; ���ã�B=ԭCRC8ֵ(8λ����ʼֵΪ00h)��A=����������(8λ)
; �����B=������CRC8ֵ(8λ)
QuickCRC8:
        push  dph             ; Save DPH
        push  dpl             ; Save DPL
        push  acc             ; Save Acc
        mov   dptr,#CRC8Tab   ; Point To Table
        xrl   a,b             ; XOR In CRC
        movc  a,@a+dptr       ; Get New CRC Byte
        mov   b,a             ; Store Back
        pop   acc             ; Recover Acc
        pop   dpl             ; Recover DPL
        pop   dph             ; Recover DPH
        ret
}
end;



/////////////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////
// 32λCRC����λ���㣬�ٶ�������ռ�ÿռ�����
// ע���������ǵ�λ���У���16λCRC�෴
///////////////////////////////////////////////////////////
function CalCRC32(data, crc, genpoly: DWord): DWord;
var i: Integer;
begin
  // ����1��ժ��XMODEMЭ��, ģ��CRC16���㷽��, ���ǵ�λ����
  crc := crc xor data;
  for i:=0 to 7 do
    if (crc and $01) <> 0 then // ֻ�������λ
      crc := (crc shr 1) xor genpoly // ���λΪ1����λ�������  //ȥ����λ
    else crc := crc shr 1;           // ����ֻ��λ����2��
  Result := crc;
end;

///////////////////////////////////////////////////////////
// 32λCRC������CRC32��(256��)�����ڿ��ٲ�����
// �ڳ����ʼ��ʱ���ȵ��ã�Ԥ������CRC32Tab[256]�������
///////////////////////////////////////////////////////////
procedure InitCRC32Tab(genpoly: DWord);
var i: Integer;
begin
  for i:=0 to 255 do
    CRC32Tab[i] := CalCRC32(i,0,genpoly);
end;

///////////////////////////////////////////////////////////
// 32λCRC��ͨ�������ټ��㣬�ٶȿ죬ռ�ÿռ��
// ע���������ǵ�λ���У���16λCRC�෴
// ҪԤ������CRC32Tab[256]�������
///////////////////////////////////////////////////////////
function QuickCRC32(data, crc: DWord): DWord;
begin
  crc := CRC32Tab[Byte(crc xor data)] xor (crc shr 8);
  Result := crc;
end;



///////////////////////////////////////////////////////////////////////////////////////////


end.
