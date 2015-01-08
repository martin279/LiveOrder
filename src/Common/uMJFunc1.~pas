

(*//
标题:UC函数单元
说明:通用函数
日期:2002-10-25
设计:Zswang
扩展：HongzhiK
扩展目期：2003-4-18
版权:Longmaster
//*)

//*******Begin 修改日志*******//
(*
扩展：HongzhiK
扩展目期：2003-6-28
内容:
    增加了快速字符串处理单元。大量的字符串处理函数。
*)
//*******End 修改日志*******//

unit uMJFunc1;

interface
//{$I Head.inc}
uses Windows, SysUtils, Graphics, Classes, registry, Forms, StdCtrls, Consts,
  Dialogs, Controls, ShlObj;

type
  TFileVersionInfomation = record
    rCommpanyName: string;
    rFileDescription: string;
    rFileVersion: string;
    rInternalName: string;
    rLegalCopyright: string;
    rLegalTrademarks: string;
    rOriginalFileName: string;
    rProductName: string;
    rProductVersion: string;
    rComments: string;
    rVsFixedFileInfo: VS_FIXEDFILEINFO;
    rDefineValue: string;
  end;

const
  cBoolChar: array[Boolean] of Char = ('F', 'T');
  cFrame = 1;
function HexToStr(mHex: string): string;
function StrToHex(mStr: string): string;

function StrLeft(const mStr: string; mDelimiter: string): string;
function StrRight(const mStr: string; mDelimiter: string): string;
function ListCount(mList: string; mDelimiter: string = ','): Integer;
function ListValue(mList: string; mIndex: Integer; mDelimiter: string = ','): string;

function SubStrConut(mStr: string; mSub: string): Integer;

function WideStringToLines(mStr: WideString): string;

function StringToDisplay(mString: string): string;
function DisplayToString(mDisplay: string): string;

function GetFileVersionInfomation(mFileName: TFileName;
  var nFileVersionInfomation: TFileVersionInfomation;
  mDefineName: string = ''): Boolean;


function IsFocusd(mHandle: THandle): Boolean; { 返回窗体是否具有焦点 }

function StrToSet(mStr: string): TSysCharSet;

type
  TOnOff = (TofOff, TofOn);
  TCharSegmentSet = set of 0 {1}..7;
  TCharSegment = TCharSegmentSet;


//////////自定义新涵数hongzhiK-start//////////
//显示数字在一个框里,类似于显示出电子表效果，超酷
//强列推建
procedure ShowDigiInRect(Canvas: TCanvas; mRect: TRect; str: string);
//////////快速位图翻转函数//////////
function Turnbmp1(mSource: TBitmap; Rotate: integer): Boolean;
function BitmapRotate90(mSource: TBitmap): Boolean;
function BitmapRotate180(mSource: TBitmap): Boolean;
function BitmapRotate270(mSource: TBitmap): Boolean;
//////////快速位图翻转函数//////////
//**********四国军棋内部用的**********//
function Turnbmp(mSource: TBitmap; Rotate: integer): Boolean;
{$IFNDEF K_CB5}
procedure DrawBlockFrameSiGuo(vleft, vtop, vright, vbuttom: integer; Canvas: TCanvas); overload; //画小块的边框
procedure DrawBlockFrameSiGuo(mRect: TRect; Canvas: TCanvas); overload; //画小块的边框
//**********四国军棋内部用的**********//
  //////////几个画块函数公用//////////
procedure DrawBlockFrameSmall(vleft, vtop, vright, vbuttom: integer; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框
procedure DrawBlockFrameSmall(mRect: TRect; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框

procedure DrawBlockFrameOnner(vleft, vtop, vright, vbuttom: integer; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框
procedure DrawBlockFrameOnner(mRect: TRect; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框
procedure DrawBlockFrameInner(vleft, vtop, vright, vbuttom: integer; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框
procedure DrawBlockFrameInner(mRect: TRect; DrawColor: TColor; Canvas: TCanvas); overload; //画小块的边框
  //////////几个画块函数//////////
{$ENDIF}
function GetColorA(chint: boolean; vcolor: TColor): TColor; //改变阴影的函数
function GetColor(chint: boolean; vcolor: TColor): TColor; //改变阴影的函数主要用于方块中
//////////几个字串转换函数//////////

function GetSubStr(Str: string; index: integer): string;
//  procedure StrToUser(str : string; var FUser : TVCLUser);
//  function UserToStr(FUser : TVCLUser): string;
function StrBinToStr(strbin: string): string; //二进制转为字串
function StrToStrBin(str: string): string; //字串转为二进制
//////////几个字串转换函数//////////
//////////新定义//////////
    //写入
function mMove(i: integer): string; overload;
function mMove(i: int64): string; overload;
function mMove(i: boolean): string; Overload;
function mMove(i: Word): string; Overload;
function mMove(i: Byte): string; Overload;
function mMove(p: Pchar; Size: integer): string; Overload;
  //读出
procedure mMove(var i: integer; var Source: string); overload;
procedure mMove(var i: int64; var Source: string); overload;
procedure mMove(var i: boolean; var Source: string); overload;
procedure mMove(var i: Word; var Source: string); overload;
procedure mMove(var i: Byte; var Source: string); overload;
function InputBoxEx(const ACaption, APrompt, ADefault: string): string;
function MaskForm(const imask: Byte): Byte;

//////////自定义新涵数hongzhiK-end;//////////
(**********又是几个新收集函数**********)


(**********又是几个新收集函数**********)
//////////快速字符串//////////
const
  cHexChars = '0123456789ABCDEF';

type
  TFastPosProc = function(const aSource, aFind; const aSourceLen, aFindLen: integer): Pointer;
  TFastPosIndexProc = function(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;

procedure FastCharMove(const Source; var Dest; Count: Integer);
function FastCharPos(const aSource: string; const C: Char; StartPos: Integer): Integer;
function FastCharPosNoCase(const aSource: string; C: Char; StartPos: Integer): Integer;
function FastPos(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
function FastPosNoCase(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
function FastPosBack(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
function FastPosBackNoCase(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
function FastReplace(const aSourceString: string; const aFindString, aReplaceString: string;
  CaseSensitive: Boolean = False): string;
function SmartPos(const SearchStr, SourceStr: string;
  const CaseSensitive: Boolean = TRUE;
  const StartPos: Integer = 1;
  const ForwardSearch: Boolean = TRUE): Integer;

//pointer routines, which are faster
function FastmemPos(const aSource, aFind; const aSourceLen, aFindLen: integer): Pointer;
function FastmemPosNC(const aSource, aFind; const aSourceLen, aFindLen: integer): Pointer;

function Decrypt(const S: string; Key: Word): string;
function Encrypt(const S: string; Key: Word): string;
function ExtractHTML(S: string): string;
function ExtractNonHTML(S: string): string;
function CopyStr(const aSourceString: string; aStart, aLength: Integer): string;
function GetValue(ValueName, Text: string): string;
function HexToInt(aHex: string): int64;
function LeftStr(const aSourceString: string; Size: Integer): string;
function StringMatches(Value, Pattern: string): Boolean;
function MissingText(Pattern, Source: string; SearchText: string = '?'): string;
function RandomFileName(aFilename: string): string;
function RandomStr(aLength: Longint): string;
function ReverseStr(const aSourceString: string): string;
function RightStr(const aSourceString: string; Size: Integer): string;
function RGBToColor(aRGB: string): TColor;
function StringCount(const aSourceString, aFindString: string; const CaseSensitive: Boolean = TRUE): Integer;
function UniqueFilename(aFilename: string): string;
function URLToText(aValue: string): string;
function WordAt(Text: string; Position: Integer): string;

procedure Split(aValue: string; aDelimiter: Char; Result: TStrings);

//////////快速字符串//////////
//////////新的字符串涵 数收集//////////
{========== String Utils ==========}

function slash(value: string): string;
{ensures that value has '\' as last character (for directory strings)}

function capfirst(value: string): string;
{Capitalise first character of each word, lowercase remaining chars}
{example: capfirst('bOrLANd delPHi FOR windOWs') = 'Borland Delphi For Windows'}

function striptags(value: string): string;
{strip HTML tags from value}
{example: striptags('<TR><TD Align="center">Hello World</TD>') = 'Hello World'}

function replace(str, s1, s2: string; casesensitive: boolean): string;
{replace all incidences of s1 in str with s2}
{example: replace('We know what we want','we','I',false) = 'I Know what I want'}

function CopyFromChar(s: string; c: char; l: integer): string;
{copy l characters from string s starting at first incidence of c}
{example: Copyfromchar('Borland Delphi','a',3) = 'and'}


{========== System Utils ==========}
function getwinsysdir: string;
{returns Windows System Path (inc drive)}
{example: getwinsysdir = 'C:\WINDOWS\SYSTEM\'}

function getwindir: string;
{returns windows directory path (inc Drive)}
{example: getwindir = 'C:\WINDOWS\'}

function getinstalldir: string;
{returns install directory of EXE using this library}
{example: getinstalldir = 'C:\PROGRAM FILES\BORLAND\DELPHI\DEMOS\'}

function getregvalue(root: integer; key, value: string): string;
{reads a registry value}
{example: getregvalue(HKEY_LOCAL_MACHINE,'network\logon\','username') = 'Eddie Bond'}

function getfiledate(filename: string): Tdatetime;
{returns a file's date in TDateTime format}


{========== Arithmetic Utils ==========}

function StrToFloatDef(const s: string; def: Extended): Extended;
{converts S into a number. If S is invalid, returns the number passed in Def.}
{example: strtofloatdef('$10.25',0) = 0}

function VolSphere(radius: single): extended;
{volume of sphere of given radius}

function AreaSphere(radius: single): extended;
{surface area of sphere of given radius}

function VolCylinder(radius, height: single): extended;
{volume of cylinder of given radius and height}

function AreaCylinder(radius, height: single): extended;
{surface area of cylinder of given radius and height}

function MinExt(const A: array of Extended): Extended;
{returns minimum value of an array of extended}

function MaxExt(const A: array of Extended): Extended;
{returns maximum value of an array of extended}

function MinInteger(const A: array of Integer): Integer;
{returns minimum value of an array of integers}

function MaxInteger(const A: array of integer): Integer;
{returns maximum value of an array of integers}

function InverseSum(const a: array of single): single;
{solves formulae of type 1/r = 1/a + 1/b +...1/n (eg electrical resistance in parallel)}

{========== Financial Utils ==========}

function MarkUp(profit: single): single;
{returns markup percentage required to return a profit of profit percent}
{example: MarkUp(25) = 20 }

function SellingPrice(net: double; markup: single): double;
{returns selling price after adding markup percent to net}
{example: SellingPrice(199.50,22.5) = 244.3875}

function NetPrice(gross: double; taxrate: single): double;
{returns the net value of an item of gross value containing tax at taxrate percent}
{example: NetPrice(199.99,17.5) = 170.204255319149}
//////////新的字符串涵 数收集//////////
//==========系统路径==========//
function GetApplicationExeName: string;
function GetApplicationShortExeName: string;
function GetWindowsDir: string; //c:\winnt
function GetSystemDir: string; //c:\winnt\system32
function GetTempDir: string; //应用程序的路径 如D:/winnt/temp
function GetApplicationPath: string; //应用程序的路径 如D:/feng/
function GetApplicationDir: string; //应用程序的路径 如D:/feng
function GetCurrentDir: string; //应用程序的路径 如D:/feng
function GetProgramsDir: string; //程序组目录
function GetMy_DocumentsDir: string; //我的文档       //如C:\My Documents
function GetFavoritesDir: string;
function GetSystemFolderDir(mFolder: Integer): string;
//==========系统路径==========//
var
  vModuleVersionInfomation: TFileVersionInfomation;

implementation

uses Math;

function IsFocusd(mHandle: THandle): Boolean;
var
  vHandle: THandle;
begin
  vHandle := GetFocus;
  while (mHandle <> vHandle) and (vHandle <> 0) do
    vHandle := GetParent(vHandle);
  Result := mHandle = vHandle;
end;

function StrToSet(mStr: string): TSysCharSet;
var
  I: Integer;
begin
  Result := [];
  for I := 1 to Length(mStr) do
    Include(Result, mStr[I]);
end; { StrToSet }

function HexToStr(mHex: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mHex) div 2 do
    Result := Result + Chr(StrToIntDef('$' + Copy(mHex, I * 2 - 1, 2), 0));
end; { HexToStr }

function StrToHex(mStr: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    Result := Format('%s%.2x', [Result, Ord(mStr[I])]);
end; { StrToHex }

function StrLeft(const mStr: string; mDelimiter: string): string;
{ 返回左分隔字符串 }
begin
  Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

function StrRight(const mStr: string; mDelimiter: string): string;
begin
  if Pos(mDelimiter, mStr) > 0 then
    Result := Copy(mStr, Pos(mDelimiter, mStr) + Length(mDelimiter), MaxInt)
  else
    Result := '';
end; { StrRight }

function ListCount(mList: string; mDelimiter: string = ','): Integer;
{ 返回列表数 }
var
  I, L: Integer;
begin
  Result := 0;
  if mList = '' then Exit;
  L := Length(mList);
  I := Pos(mDelimiter, mList);
  while I > 0 do
  begin
    mList := Copy(mList, I + Length(mDelimiter), L);
    I := Pos(mDelimiter, mList);
    Inc(Result);
  end;
  Inc(Result);
end; { ListCount }

function ListValue(mList: string; mIndex: Integer; mDelimiter: string = ','): string;
{ 返回列表指定位置的元素 }
var
  I, L, K: Integer;
begin
  L := Length(mList);
  I := Pos(mDelimiter, mList);
  K := 0;
  Result := '';
  while (I > 0) and (K <> mIndex) do
  begin
    mList := Copy(mList, I + Length(mDelimiter), L);
    I := Pos(mDelimiter, mList);
    Inc(K);
  end;
  if K = mIndex then Result := StrLeft(mList + mDelimiter, mDelimiter);
end; { ListValue }

function SubStrConut(mStr: string; mSub: string): Integer;
{ 返回子字符串出现的次数 }
begin
  Result := Length(mStr) - Length(StringReplace(mStr, mSub, '', [rfReplaceAll]));
end; { SubStrConut }

function WideStringToLines(mStr: WideString): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    Result := Result + #13#10 + mStr[I];
  Delete(Result, 1, 2);
end; { WideStringToLines }

function StringToDisplay(mString: string): string;
var
  I: Integer;
  S: string;
begin
  Result := '';
  S := '';
  for I := 1 to Length(mString) do
    if mString[I] in [#32..#127] then
      S := S + mString[I]
    else
    begin
      if S <> '' then
      begin
        Result := Result + QuotedStr(S);
        S := '';
      end;
      Result := Result + Format('#$%x', [Ord(mString[I])]);
    end;
  if S <> '' then Result := Result + QuotedStr(S);
end; { StringToDisplay }

function DisplayToString(mDisplay: string): string;
var
  I: Integer;
  S: string;
  B: Boolean;
begin
  Result := '';
  B := False;
  mDisplay := mDisplay;
  for I := 1 to Length(mDisplay) do
    if B then
      case mDisplay[I] of
        ' ':
          begin
            if S <> '' then
              Result := Result + StringReplace(S, '', '', [rfReplaceAll]);
                if Copy(mDisplay, I + 1, 1) = '' then Result := Result + '';
                S := '';
                B := False;
          end;
      else
        S := S + mDisplay[I];
      end
    else
      case mDisplay[I] of
        '#', ' ':
          begin
            if S <> '' then Result := Result + Chr(StrToIntDef(S, 0));
              S := '';
              B := mDisplay[I] = '';
          end;
        '$', '0'..'9', 'a'..'f', 'A'..'F': S := S + mDisplay[I];
      end;
  if (not B) and (S <> '') then Result := Result + Chr(StrToIntDef(S, 0));
end; { DisplayToString }

function GetFileVersionInfomation(mFileName: TFileName;
  var nFileVersionInfomation: TFileVersionInfomation;
  mDefineName: string = ''): Boolean;
  var
  vHandle: Cardinal;
  vInfoSize: Cardinal;
  vVersionInfo: Pointer;
  vTranslation: Pointer;
  vVersionValue: string;
  vInfoPointer: Pointer;
  begin
    Result := False;
    vInfoSize := GetFileVersionInfoSize(PChar(mFileName), vHandle); //取得文件版本信息空间及资源句柄
    FillChar(nFileVersionInfomation, SizeOf(nFileVersionInfomation), 0); //初始化返回信息
    if vInfoSize <= 0 then Exit; //安全检查

    GetMem(vVersionInfo, vInfoSize); //分配资源
    with nFileVersionInfomation do
    try
      if not GetFileVersionInfo(PChar(mFileName),
        vHandle, vInfoSize, vVersionInfo) then Exit;
      VerQueryValue(vVersionInfo, '\VarFileInfo\Translation',
        vTranslation, vInfoSize);
      vVersionValue := Format('\StringFileInfo\%.4x%.4x\',
        [LOWORD(Longint(vTranslation^)), HIWORD(Longint(vTranslation^))]);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'CompanyName'),
        vInfoPointer, vInfoSize);
      rCommpanyName := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileDescription'),
        vInfoPointer, vInfoSize);
      rFileDescription := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileVersion'),
        vInfoPointer, vInfoSize);
      rFileVersion := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'InternalName'),
        vInfoPointer, vInfoSize);
      rInternalName := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalCopyright'),
        vInfoPointer, vInfoSize);
      rLegalCopyright := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalTrademarks'),
        vInfoPointer, vInfoSize);
      rLegalTrademarks := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'OriginalFileName'),
        vInfoPointer, vInfoSize);
      rOriginalFileName := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductName'),
        vInfoPointer, vInfoSize);
      rProductName := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductVersion'),
        vInfoPointer, vInfoSize);
      rProductVersion := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, PChar(vVersionValue + 'Comments'),
        vInfoPointer, vInfoSize);
      rComments := PChar(vInfoPointer);
      VerQueryValue(vVersionInfo, '\', vInfoPointer, vInfoSize);
      rVsFixedFileInfo := TVSFixedFileInfo(vInfoPointer^);
      if mDefineName <> '' then begin
        VerQueryValue(vVersionInfo, PChar(vVersionValue + mDefineName),
        vInfoPointer, vInfoSize);
      rDefineValue := PChar(vInfoPointer);
    end
else
  rDefineValue := '';
  finally
  FreeMem(vVersionInfo, vInfoSize);
end;
Result := True;
end; { GetFileVersionInfomation }
//=======Begin 位图翻转函数

function Turnbmp(mSource: TBitmap; Rotate: integer): Boolean;
begin
  Result := false;
  case Rotate of
    1: if BitmapRotate90(mSource) then Result := true;
//    2: if BitmapRotate180(mSource) then Result := true;
    3: if BitmapRotate270(mSource) then Result := true;
  end;
end;

function Turnbmp1(mSource: TBitmap; Rotate: integer): Boolean;
begin
  Result := false;
  case Rotate of
    1: if BitmapRotate90(mSource) then Result := true;
    2: if BitmapRotate180(mSource) then Result := true;
    3: if BitmapRotate270(mSource) then Result := true;
  end;
end;

function BitmapRotate90(mSource: TBitmap): Boolean;
var
  I, J, BITS, SIZE: Integer;
  A: PByteArray;
  ms: TMemoryStream;
begin
  Result := False;
  if not Assigned(mSource) then Exit;
  case mSource.PixelFormat of
    pf8bit: BITS := 1;
    pf16bit: BITS := 2;
    pf24bit: BITS := 3;
    pf32bit: BITS := 4;
  else
    Exit;
  end;
  SIZE := mSource.Width;
  ms := TMemoryStream.Create;
  try
    for I := 0 to mSource.Height - 1 do
    begin
      A := mSource.ScanLine[I];
      ms.WriteBuffer(A^, SIZE * BITS);
    end;
    ms.Position := 0;
    mSource.Width := mSource.Height;
    mSource.Height := SIZE;
    for J := (mSource.Width - 1) downto 0 do
      for I := 0 to mSource.Height - 1 do
      begin
        A := mSource.ScanLine[I];
        ms.ReadBuffer(A[J * BITS], BITS);
      end;
  finally
    ms.Free;
  end;
  Result := True;
end; { BitmapRotate90 }

function BitmapRotate180(mSource: TBitmap): Boolean;
var
  I, J, BITS, SIZE: Integer;
  A: PByteArray;
  ms: TMemoryStream;
begin
  Result := False;
  if not Assigned(mSource) then Exit;
  case mSource.PixelFormat of
    pf8bit: BITS := 1;
    pf16bit: BITS := 2;
    pf24bit: BITS := 3;
    pf32bit: BITS := 4;
  else
    Exit;
  end;
  SIZE := mSource.Width;
  ms := TMemoryStream.Create;
  try
    for I := 0 to mSource.Height - 1 do
    begin
      A := mSource.ScanLine[I];
      ms.WriteBuffer(A^, SIZE * BITS);
    end;
    ms.Position := 0;
    for I := (mSource.Height - 1) downto 0 do
    begin
      A := mSource.ScanLine[I];
      for J := (mSource.Width - 1) downto 0 do
        ms.ReadBuffer(A[J * BITS], BITS);
    end;
  finally
    ms.free;
  end;
  Result := True;
end; { BitmapRotate180 }

function BitmapRotate270(mSource: TBitmap): Boolean;
var
  I, J, BITS, SIZE: Integer;
  A: PByteArray;
  ms: TMemoryStream;
begin
  Result := False;
  if not Assigned(mSource) then Exit;
  case mSource.PixelFormat of
    pf8bit: BITS := 1;
    pf16bit: BITS := 2;
    pf24bit: BITS := 3;
    pf32bit: BITS := 4;
  else
    Exit;
  end;
  SIZE := mSource.Width;
  ms := TMemoryStream.Create;
  try
    for I := 0 to mSource.Height - 1 do
    begin
      A := mSource.ScanLine[I];
      ms.WriteBuffer(A^, SIZE * BITS);
    end;
    ms.Position := 0;
    mSource.Width := mSource.Height;
    mSource.Height := SIZE;
    for J := 0 to mSource.Width - 1 do
      for I := (mSource.Height - 1) downto 0 do
      begin
        A := mSource.ScanLine[I];
        ms.ReadBuffer(A[J * BITS], BITS);
      end;
  finally
    ms.Free;
  end;
  Result := True;
end; { BitmapRotate270 }
//=======End 位图翻转函数

function StrBinToStr(strbin: string): string; //二进制转为字串
var
  c: byte;
  i, bindex: integer;
  str: string;
begin
  str := '';
    c := $0;
  i := Length(strbin) mod 8;
  if i <> 0 then
    for bindex := 1 to 8 - i do
      strbin := strbin + '0';
  bindex := 1;
  for i := 1 to Length(strbin) do
  begin
    if bindex > 8 then
    begin
      str := str + Char(c);
      c := $0;
      bindex := 1;
    end;
    c := byte(c shl 1);
    if strbin[i] = '1' then c := c or $1;
    Inc(bindex);
  end;
  if bindex <> 1 then str := str + Char(c);
  Result := str;
end;

function StrToStrBin(str: string): string; //字串转为二进制
var
  i, j: integer;
  binstr: string;
  c: Byte;
begin
  binstr := '';
    for i := 1 to Length(str) do
  begin
    c := Byte(str[i]);
    for j := 1 to 8 do
    begin
      if (c and $80) <> $00 then
        binstr := binstr + '1'
      else
        binstr := binstr + '0';
      c := Byte(c shl 1);
    end
  end;
  Result := binstr;
end;

procedure RGBtoHSL(R, G, B: Integer; var H, S, L: Integer);
var
  Delta: Double;
  CMax, CMin: Double;
  Red, Green, Blue, Hue, Sat, Lum: Double;
begin
  Red := R / 255;
  Green := G / 255;
  Blue := B / 255;
  CMax := Max(Red, Max(Green, Blue));
  CMin := Min(Red, Min(Green, Blue));
  Lum := (CMax + CMin) / 2;
  if CMax = CMin then
  begin
    Sat := 0;
    Hue := 0;
  end
  else
  begin
    if Lum < 0.5 then
      Sat := (CMax - CMin) / (CMax + CMin)
    else
      Sat := (cmax - cmin) / (2 - cmax - cmin);
    delta := CMax - CMin;
    if Red = CMax then
      Hue := (Green - Blue) / Delta
    else if Green = CMax then
      Hue := 2 + (Blue - Red) / Delta
    else
      Hue := 4.0 + (Red - Green) / Delta;
    Hue := Hue / 6;
    if Hue < 0 then Hue := Hue + 1;
  end;
  H := Round(Hue * 360);
  S := Round(Sat * 100);
  L := Round(Lum * 100);
end;

procedure HSLtoRGB(H, S, L: Integer; var R, G, B: Integer);
var
  Sat, Lum: Double;
begin
  R := 0;
  G := 0;
  B := 0;
  if (H < 360) and (H >= 0) and (S <= 100) and (S >= 0) and (L <= 100) and (L >= 0) then
  begin
    if H <= 60 then
    begin
      R := 255;
      G := Round((255 / 60) * H);
      B := 0;
    end
    else if H <= 120 then
    begin
      R := Round(255 - (255 / 60) * (H - 60));
      G := 255;
      B := 0;
    end
    else if H <= 180 then
    begin
      R := 0;
      G := 255;
      B := Round((255 / 60) * (H - 120));
    end
    else if H <= 240 then
    begin
      R := 0;
      G := Round(255 - (255 / 60) * (H - 180));
      B := 255;
    end
    else if H <= 300 then
    begin
      R := Round((255 / 60) * (H - 240));
      G := 0;
      B := 255;
    end
    else if H < 360 then
    begin
      R := 255;
      G := 0;
      B := Round(255 - (255 / 60) * (H - 300));
    end;

    Sat := Abs((S - 100) / 100);
    R := Round(R - ((R - 128) * Sat));
    G := Round(G - ((G - 128) * Sat));
    B := Round(B - ((B - 128) * Sat));

    Lum := (L - 50) / 50;
    if Lum > 0 then
    begin
      R := Round(R + ((255 - R) * Lum));
      G := Round(G + ((255 - G) * Lum));
      B := Round(B + ((255 - B) * Lum));
    end
    else if Lum < 0 then
    begin
      R := Round(R + (R * Lum));
      G := Round(G + (G * Lum));
      B := Round(B + (B * Lum));
    end;
  end;
end;


function GetSubStr(Str: string; index: integer): string;
var
  substr: string;
  i, j: integer;
begin
  if index < 0 then
  begin
    Result := '';
      exit;
  end;
  i := 0;
  substr := str;
  while i <= index do
  begin
    j := Pos(',', substr);
    if j = 0 then
    begin
      if i <> index then
        substr := '';
          break
    end
    else
    begin
      if i = index then
        substr := copy(substr, 1, j - 1)
      else
        delete(substr, 1, j); //删除
      Inc(i);
    end;
  end;
  Result := substr;
end;


function mMove(i: integer): string;
begin
  SetLength(Result, sizeof(i));
  Move(i, Result[1], sizeof(i));
end;

function mMove(i: int64): string;
begin
  SetLength(Result, sizeof(i));
  Move(i, Result[1], sizeof(i));
end;

function mMove(i: boolean): string;
begin
  SetLength(Result, sizeof(i));
  Move(i, Result[1], sizeof(i));
end;

function mMove(i: Word): string;
begin
  SetLength(Result, sizeof(i));
  Move(i, Result[1], sizeof(i));
end;

function mMove(i: Byte): string;
begin
  SetLength(Result, sizeof(i));
  Move(i, Result[1], sizeof(i));
end;

function mMove(p: Pchar; Size: integer): string;
begin
  SetLength(Result, size);
  Move(p[0], Result[1], size);
end;

procedure mMove(var i: integer; var Source: string);
begin
  Move(Source[1], i, sizeof(i));
  delete(Source, 1, sizeof(i));
end;

procedure mMove(var i: int64; var Source: string);
begin
  Move(Source[1], i, sizeof(i));
  delete(Source, 1, sizeof(i));
end;

procedure mMove(var i: boolean; var Source: string);
begin
  Move(Source[1], i, sizeof(i));
  delete(Source, 1, sizeof(i));
end;

procedure mMove(var i: Word; var Source: string);
begin
  Move(Source[1], i, sizeof(i));
  delete(Source, 1, sizeof(i));
end;

procedure mMove(var i: Byte; var Source: string);
begin
  Move(Source[1], i, sizeof(i));
  delete(Source, 1, sizeof(i));
end;

procedure StrToIntStr(var Data: string); //字串转整数
var
  i: integer;
begin
  for i := 1 to Length(Data) do
    Data[i] := Chr(Byte(Data[i]) - 48);
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do
    Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do
    Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

var
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0);

function MaskForm(const imask: Byte): Byte;
var
  Form: TForm;
  cbSys: TCheckBox;
  cbFont: TCheckBox;
  cbFace: TCheckBox;
  Button: TButton;
begin
  Result := 0;
  Form := TForm.Create(Application);
  with Form do
  try
    Font.Name := '宋体';
    Font.Size := 9;
    Canvas.Font := Font;
    BorderStyle := bsDialog;
    Caption := '屏蔽设置';
    Position := poScreenCenter;
    Width := 257;
    Height := 145;
    cbSys := TcheckBox.Create(Form);
    with cbSys do
    begin
      parent := Form;
      Left := 24;
      Top := 24;
      Caption := '屏蔽系统信息';
      ParentFont := true;
      if Bool(imask and $01) then Checked := true;
    end;
    cbFont := TcheckBox.Create(Form);
    with cbFont do
    begin
      parent := Form;
      Left := 136;
      Top := 24;
      Caption := '屏蔽字体设置';
      ParentFont := true;
      if Bool(imask and $02) then Checked := true;
    end;
    cbFace := TCheckBox.Create(Form);
    with cbFace do
    begin
      parent := Form;
      Left := 24;
      Top := 56;
      Caption := '屏蔽聊天表情';
      ParentFont := true;
      if Bool(imask and $04) then Checked := true;
    end;
    Button := TButton.Create(Form);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := '确定';
      ModalResult := mrOk;
      Default := True;
      Left := (parent.Width - Width) div 2;
      Top := parent.ClientHeight - Height - 10;
    end;
    if ShowModal = mrOk then
    begin
      if cbSys.Checked then Result := 1;
      if cbFont.Checked then Inc(Result, 2);
      if cbFace.Checked then Inc(Result, 4);
    end;
  finally
    Form.Free;
  end;
end;

function InputBoxEx(const ACaption, APrompt, ADefault: string): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := ADefault;

  Form := TForm.Create(Application);
  with Form do
  try
    Font.Name := '宋体';
    Font.Size := 9;
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      Caption := APrompt;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
      WordWrap := True;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := Prompt.Top + Prompt.Height + 5;
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      Text := Result;
      SelectAll;
    end;
    ButtonTop := Edit.Top + Edit.Height + 15;
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := '确定';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := '取消';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
        ButtonWidth, ButtonHeight);
      Form.ClientHeight := Top + Height + 13;
    end;
    if ShowModal = mrOk then
    begin
      Result := Edit.Text;
    end;
  finally
    Form.Free;
  end;
end;
//**********显示数字于一个框内start**********//

procedure DrawSegment(Canvas: TCanvas; dSegNum: Integer; const SegmentRect: TRect);
const
  cBorderGap = 1; //边界宽度
  cSegmentThickness = 2; //每个线条宽度
  cHorzMargine = 1; //水平线条边界缩进
  cVertMargine = 1; //竖直线条边界缩进
var
  Ht, Lt, Rt, Tp, Bt, VertCentre, SegHalf: Integer;
  fPoints: array[1..6] of TPoint;
begin
  Ht := SegmentRect.Bottom - SegmentRect.Top;
  Lt := SegmentRect.Left + cBorderGap;
  Rt := SegmentRect.Right - cBorderGap - 1 - (cSegmentThickness * 2); //move in a seg and a half
  Tp := SegmentRect.Top + cBorderGap;
  Bt := Ht - cBorderGap - 1 + SegmentRect.Top;

  VertCentre := ((Bt - Tp) div 2);
  SegHalf := (cSegmentThickness div 2);

  case dSegNum of
    0:
      begin
        fPoints[1].x := Rt + cSegmentThickness {SegHalf};
        fPoints[1].y := Bt - (VertCentre div 2); // - (cSegmentThickness * 2);

        fPoints[2].x := Rt + SegHalf + cSegmentThickness * 2; // - (SegHalf + cSegmentThickness);
        fPoints[2].y := Bt;

        Canvas.Ellipse(fPoints[1].x, fPoints[1].y, fPoints[2].x, fPoints[2].y);
      end;
    3:
      begin
        fPoints[1].x := Lt + cHorzMargine;
        fPoints[1].y := Tp;

        fPoints[2].x := Rt - cHorzMargine;
        fPoints[2].y := Tp;

        fPoints[3].x := fPoints[2].x - cSegmentThickness;
        fPoints[3].y := fPoints[2].y + cSegmentThickness;

        fPoints[4].x := fPoints[1].x + cSegmentThickness;
        fPoints[4].y := fPoints[1].y + cSegmentThickness;

        Canvas.Polygon(Slice(fPoints, 4));
      end;

    4:
      begin
        fPoints[1].x := Lt;
        fPoints[1].y := Tp + cVertMargine;

        fPoints[2].x := Lt;
        fPoints[2].y := Tp + VertCentre - cVertMargine;

        fPoints[3].x := fPoints[2].x + cSegmentThickness;
        fPoints[3].y := fPoints[2].y - cSegmentThickness;

        fPoints[4].x := fPoints[1].x + cSegmentThickness;
        fPoints[4].y := fPoints[1].y + cSegmentThickness;

        Canvas.Polygon(Slice(fPoints, 4));
      end;

    5:
      begin
        fPoints[1].x := Lt;
        fPoints[1].y := Tp + cVertMargine + VertCentre;

        fPoints[2].x := Lt;
        fPoints[2].y := Tp + VertCentre - cVertMargine + VertCentre;

        fPoints[3].x := fPoints[2].x + cSegmentThickness;
        fPoints[3].y := fPoints[2].y - cSegmentThickness;

        fPoints[4].x := fPoints[1].x + cSegmentThickness;
        fPoints[4].y := fPoints[1].y + cSegmentThickness;

        Canvas.Polygon(Slice(fPoints, 4));
      end;

    6:
      begin
        fPoints[1].x := Lt + cHorzMargine;
        fPoints[1].y := Tp + VertCentre + VertCentre;

        fPoints[2].x := Rt - cHorzMargine;
        fPoints[2].y := fPoints[1].y;

        fPoints[3].x := fPoints[2].x - cSegmentThickness;
        fPoints[3].y := fPoints[2].y - cSegmentThickness;

        fPoints[4].x := fPoints[1].x + cSegmentThickness;
        fPoints[4].y := fPoints[1].y - cSegmentThickness;

        Canvas.Polygon(Slice(fPoints, 4));
      end;

    2:
      begin

        fPoints[1].x := Rt;
        fPoints[1].y := Tp + cVertMargine;

        fPoints[2].x := fPoints[1].x;
        fPoints[2].y := Tp + VertCentre - cVertMargine;

        fPoints[3].x := fPoints[2].x - cSegmentThickness;
        fPoints[3].y := fPoints[2].y - cSegmentThickness;

        fPoints[4].x := fPoints[1].x - cSegmentThickness;
        fPoints[4].y := fPoints[1].y + cSegmentThickness;

        Canvas.Polygon(Slice(fPoints, 4));
      end;

    7:
      begin
        fPoints[1].x := Rt;
        fPoints[1].y := Tp + cVertMargine + VertCentre;

        fPoints[2].x := fPoints[1].x;
        fPoints[2].y := Tp + VertCentre - cVertMargine + VertCentre;

        fPoints[3].x := fPoints[2].x - cSegmentThickness;
        fPoints[3].y := fPoints[2].y - cSegmentThickness;

        fPoints[4].x := fPoints[1].x - cSegmentThickness;
        fPoints[4].y := fPoints[1].y + cSegmentThickness;
        Canvas.Polygon(Slice(fPoints, 4));
      end;

    1:
      begin
        fPoints[1].x := Lt + cHorzMargine;
        fPoints[1].y := Tp + VertCentre;

        fPoints[2].x := fPoints[1].x + SegHalf;
        fPoints[2].y := Tp + VertCentre - SegHalf; // 1 is Pen size

        fPoints[3].x := Rt - cHorzMargine - SegHalf;
        fPoints[3].y := fPoints[2].y;

        fPoints[4].x := Rt - cHorzMargine;
        fPoints[4].y := fPoints[1].y;

        fPoints[5].x := Rt - cHorzMargine - SegHalf;
        fPoints[5].y := Tp + VertCentre + SegHalf;

        fPoints[6].x := fPoints[2].x;
        fPoints[6].y := fPoints[5].y;

        Canvas.Polygon(fPoints);
      end;
  end;

end;

function Padr(s: string; numPad: Integer): string;
var
  i, l: Integer;
begin
  Result := '';
    l := numPad - Length(s);
  for i := 1 to l do
    Result := Result + ' ';
  Result := Result + s;
end;

procedure DrawSegments(Canvas: TCanvas; dSegment: TCharSegment; SegmentRect: TRect);
var
  i: Byte;
begin
  for i := 0 to 7 do
    if (byte(i) in dSegment) then
      DrawSegment(Canvas, i, SegmentRect);
end;
{
    3
    --
  4| 1 |2
    --
  5|   |7
    --  * 0
    6
}

procedure MakeSegments(dChar: Char; var dSegment: TCharSegment);
begin
  dSegment := [];
  case dChar of
    '1': dSegment := [2, 7];
    '2': dSegment := [3, 2, 1, 5, 6];
    '3': dSegment := [3, 2, 1, 7, 6];
    '4': dSegment := [4, 1, 2, 7];
    '5': dSegment := [3, 4, 1, 7, 6];
    '6': dSegment := [3, 4, 5, 6, 7, 1];
    '7': dSegment := [3, 2, 7];
    '8': dSegment := [3, 4, 5, 6, 7, 2, 1];
    '9': dSegment := [3, 4, 1, 2, 7];
    '0': dSegment := [3, 4, 5, 6, 7, 2];
    '-': dSegment := [1];
    '.': dSegment := [0];
  end;
end;

procedure ShowDigiInRect(Canvas: TCanvas; mRect: TRect; str: string); //显示数字在一个框里
const
  cNumChars = 2;
var
  MySeg: TCharSegment;
  xPos, i: Integer;
  MyRect: TRect;
  csize: Integer;
  s: string;
  clFront, clBack: TColor;
begin
  s := Padr(str, cNumChars);
  cSize := (mRect.Right - mRect.Left) div Length(s);
  xPos := 0;
  clFront := canvas.Pen.Color;
  clBack := canvas.Brush.Color;
  canvas.Brush.Color := clLime; // 添充色
  canvas.Pen.Color := clLime; //前景色

  for i := 1 to Length(s) do
  begin
    MakeSegments(s[i], MySeg);
    MyRect.Top := mRect.Top;
    MyRect.Bottom := mRect.Bottom;
    MyRect.Left := mRect.Left + (xPos) * cSize;
    MyRect.Right := MyRect.Left + cSize;
    DrawSegments(Canvas, MySeg, MyRect);
    Inc(xPos);
  end;
  Canvas.Pen.Color := clFront;
  Canvas.Brush.Color := clBack;
end;
//**********显示数字于一个框内start**********//

function GetColorA(chint: boolean; vcolor: Tcolor): TColor; //改变阴影的函数
var
  r, g, b, H, S, L: integer;
  fcolor: TColor;
begin
  fColor := ColorToRGB(vcolor);
  b := GetBValue(fColor);
  g := GetGValue(fColor);
  r := GetRValue(fColor);
  RGBtoHSL(r, g, b, h, s, l);
  if chint then
    l := l + 15
  else
    l := l - 15;
  HSLtoRGB(h, s, l, r, g, b);
  ReSult := RGB(r, g, b);
end;

function GetColor(chint: boolean; vcolor: Tcolor): TColor; //改变阴影的函数
var
  r, g, b, H, S, L: integer;
  fcolor: TColor;
begin
  fColor := ColorToRGB(vcolor);
  b := GetBValue(fColor);
  g := GetGValue(fColor);
  r := GetRValue(fColor);
  RGBtoHSL(r, g, b, h, s, l);
  if chint then
    l := l + 35
  else
    l := l - 35;
  HSLtoRGB(h, s, l, r, g, b);
  ReSult := RGB(r, g, b);
end;

{$IFNDEF K_CB5}

procedure DrawBlockFrameSmall(vleft, vtop, vright,
  vbuttom: integer; DrawColor: TColor; Canvas: TCanvas);
var
  vcolor: DWORD;
  mPen: TPen;
begin
  mPen := TPen.Create;
  try
    mPen.Assign(Canvas.Pen);
    with Canvas do
    begin
      Brush.Color := DrawColor;
      Pen.Width := cFrame;
      Pen.Style := psclear;
      Rectangle(vLeft, vtop, vright, vbuttom); //画主色哉
      vcolor := DWord(DrawColor);
      Pen.Style := psSolid;
      Pen.Color := GetColor(true, vcolor); //画亮线
      MoveTo(vRight - cFrame, vTop);
      LineTo(vLeft, vTop);
      LineTo(vLeft, vButtom - cFrame);
      Pen.Color := GetColor(false, vcolor); //画暗线
      MoveTo(vLeft, vButtom - cFrame);
      LineTo(vRight - cFrame, vButtom - cFrame);
      LineTo(vRight - cFrame, vTop);

      Pen.Width := 1;
    end;
    Canvas.Pen.Assign(mPen);
  finally
    mPen.Free;
  end;
end;

procedure DrawBlockFrameSmall(mRect: TRect; DrawColor: TColor; Canvas: TCanvas);
var
  vleft, vtop, vright, vbottom: integer;
begin
  vleft := mRect.Left;
  vtop := mRect.Top;
  vright := mRect.Right;
  vbottom := mRect.Bottom;
  DrawBlockFrameSmall(vleft, vtop, vright, vbottom, Drawcolor, Canvas);
end;

procedure DrawBlockFrameOnner(vleft, vtop, vright,
  vbuttom: integer; DrawColor: TColor; Canvas: TCanvas);
var
  vcolor: DWORD;
  mPen: TPen;
begin
  mPen := TPen.Create;
  try
    mPen.Assign(Canvas.Pen);
    with Canvas do
    begin
      Brush.Color := DrawColor;
      Pen.Width := cFrame;
      Pen.Style := psclear;
      Rectangle(vLeft, vtop, vright, vbuttom); //画主色哉
      vcolor := DWord(DrawColor);
      Pen.Style := psSolid;
      Pen.Color := GetColorA(true, vcolor); //画亮线
      MoveTo(vRight - cFrame, vTop);
      LineTo(vLeft, vTop);
      LineTo(vLeft, vButtom - cFrame);
      Pen.Color := GetColorA(false, vcolor); //画暗线
      MoveTo(vLeft, vButtom - cFrame);
      LineTo(vRight - cFrame, vButtom - cFrame);
      LineTo(vRight - cFrame, vTop);

      Pen.Width := 1;
    end;
    Canvas.Pen.Assign(mPen);
  finally
    mPen.Free;
  end;
end;

procedure DrawBlockFrameOnner(mRect: TRect; DrawColor: TColor; Canvas: TCanvas);
var
  vleft, vtop, vright, vbottom: integer;
begin
  vleft := mRect.Left;
  vtop := mRect.Top;
  vright := mRect.Right;
  vbottom := mRect.Bottom;
  DrawBlockFrameOnner(vleft, vtop, vright, vbottom, Drawcolor, Canvas);
end;

procedure DrawBlockFrameInner(mRect: TRect;
  DrawColor: TColor; Canvas: TCanvas);
var
  vleft, vtop, vright, vbottom: integer;
begin
  vleft := mRect.Left;
  vtop := mRect.Top;
  vright := mRect.Right;
  vbottom := mRect.Bottom;
  DrawBlockFrameInner(vleft, vtop, vright, vbottom, Drawcolor, Canvas);
end;

procedure DrawBlockFrameInner(vleft, vtop, vright,
  vbuttom: integer; DrawColor: TColor; Canvas: TCanvas);
var
  vcolor: DWORD;
  mPen: TPen;
begin
  mPen := TPen.Create;
  try
    mPen.Assign(Canvas.Pen);
    with Canvas do
    begin
      Brush.Color := DrawColor;
      Pen.Width := cFrame;
      Pen.Style := psclear;
      Rectangle(vLeft, vtop, vright, vbuttom); //画主色哉
      vcolor := DWord(DrawColor);
      Pen.Style := psSolid;
      Pen.Color := GetColor(false, vcolor); //画暗线
      MoveTo(vRight - cFrame, vTop);
      LineTo(vLeft, vTop);
      LineTo(vLeft, vButtom - cFrame);
      Pen.Color := GetColor(true, vcolor); //画亮线
      MoveTo(vLeft, vButtom - cFrame);
      LineTo(vRight - cFrame, vButtom - cFrame);
      LineTo(vRight - cFrame, vTop);

      Pen.Width := 1;
    end;
    Canvas.Pen.Assign(mPen);
  finally
    mPen.Free;
  end;
end;

procedure DrawBlockFrameSiGuo(vleft, vtop, vright,
  vbuttom: integer; Canvas: TCanvas);
var
  mPen: TPenReCall;
begin
  mPen := TPenReCall.Create(Canvas.Pen);
  try
    with Canvas do
    begin
      Pen.Width := cFrame;
      Pen.Color := $00323456;
      MoveTo(vLeft + 10, vTop + 1);
      LineTo(vLeft + 1, vTop + 1);
      LineTo(vLeft + 1, vTop + 10);
      MoveTo(vRight - 10, vButtom - 1);
      LineTo(vRight - 1, vButtom - 1);
      LineTo(vRight - 1, vButtom - 10);
    end;
  finally
    mPen.Free;
  end;
end;

procedure DrawBlockFrameSiGuo(mRect: TRect; Canvas: TCanvas);
var
  vleft, vtop, vright, vbottom: integer;
begin
  vleft := mRect.Left;
  vtop := mRect.Top;
  vright := mRect.Right;
  vbottom := mRect.Bottom;
  DrawBlockFrameSiGuo(vleft, vtop, vright, vbottom, Canvas);
end;

{$ENDIF}

var
  vBuffer: array[0..MAX_PATH] of Char;
//////////快速字符串//////////

const
  cDeltaSize = 1.5;

var
  GUpcaseTable: array[0..255] of char;
  GUpcaseLUT: Pointer;

//NOTE : FastCharPos and FastCharPosNoCase do not require you to pass the length
//       of the string, this was only done in FastPos and FastPosNoCase because
//       they are used by FastReplace many times over, thus saving a LENGTH()
//       operation each time.  I can't see you using these two routines for the
//       same purposes so I didn't do that this time !

function FastCharPos(const aSource: string; const C: Char; StartPos: Integer): Integer;
var
  L: Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);

  Result := 0;
  L := Length(aSource);
  if L = 0 then exit;
  if StartPos > L then exit;
  Dec(StartPos);
  asm
      PUSH EDI          //Preserve this register

      mov  EDI, aSource        //Point EDI at aSource
      add  EDI, StartPos
      mov  ECX, L          //Make a note of how many chars to search through
      sub  ECX, StartPos
      mov  AL,  C          //and which char we want
    @Loop:
      cmp  Al, [EDI]          //compare it against the SourceString
      jz   @Found
      inc  EDI
      dec  ECX
      jnz  @Loop
      jmp  @NotFound
    @Found:
      sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
      inc  EDI
      mov  Result,   EDI
    @NotFound:

      POP  EDI
  end;
end;

function FastCharPosNoCase(const aSource: string; C: Char; StartPos: Integer): Integer;
var
  L: Integer;
begin
  Result := 0;
  L := Length(aSource);
  if L = 0 then exit;
  if StartPos > L then exit;
  Dec(StartPos);
  if StartPos < 0 then StartPos := 0;

  asm
      PUSH EDI          //Preserve this register
      PUSH EBX
      mov  EDX, GUpcaseLUT

      mov  EDI, aSource        //Point EDI at aSource
      add  EDI, StartPos
      mov  ECX, L          //Make a note of how many chars to search through
      sub  ECX, StartPos

      xor  EBX, EBX
      mov  BL,  C
      mov  AL, [EDX+EBX]
    @Loop:
      mov  BL, [EDI]
      inc  EDI
      cmp  Al, [EDX+EBX]
      jz   @Found
      dec  ECX
      jnz  @Loop
      jmp  @NotFound
    @Found:
      sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
      mov  Result,   EDI
    @NotFound:

      POP  EBX
      POP  EDI
  end;
end;

function FastmemPos(const aSource, aFind; const aSourceLen, aFindLen: integer): Pointer;
asm
          push ESI
          push EDI
          push EBX

          mov  ESI, aFind
          mov  EDI, aSource
          mov  ECX, aSourceLen

  //Quick exit code
          mov  Result, 0
  //SourceLen < FindLen
          cmp  ECX, aFindLen
          jl   @TheEnd
  //FindLen < 1
          cmp  aFindLen, 1
          jl   @TheEnd

  //Now DEC aSourceLen by aFindLen-1
          sub  ECX, aFindLen
          inc  ECX

  //Get the first char of aFindString, note how it is done outside
  //of the main loop, as it never changes !
          Mov  Al, [ESI]
          jmp  @Scasb
  @FindNext:
          inc  EDI  //Done only when returning from CompareStrings
          dec  ECX
          jz   @NotFound

  //Now the FindFirstCharacter loop !
  @ScaSB:
  //Get the value of the current character in aSourceString
  //This is equal to ah := EDI^, that is what the [] are around [EDI]
  //compare this character with aDestString[1]
          cmp [EDI], al
  //If they are equal we compare the strings

          jz   @CompareStrings
          inc  EDI
          dec  ECX
          jnz  @ScaSB
          jmp  @NotFound

  @CompareStrings:
  //Put the length of aFindLen in EBX
          mov  EBX, aFindLen

  @CompareNext:
  //We DEC EBX to point to the end of the string, ie, we dont
  //want to add the whole length as this would point past the end of string
          dec  EBX
          jz   @FullMatch

  //here is another optimization tip !
  //People at this point usually PUSH ESI etc and then POP ESI etc
  //at the end, instead I opted not to change ESI etc at all.
  //This saves lots of pushing and popping !

  //Get aFindString character + aFindStringLength (the last char)
          mov  Ah, [ESI+EBX]

  //Get aSourceString character (current position + aFindStringLength)
  //Compare them
          cmp  Ah, [EDI+EBX]
          Jnz  @FindNext

          Jmp  @CompareNext

    @FullMatch:
          //Move the address of the *current* character in EDI
          //note, we have not altered EDI since the first char was found
          mov  Result, EDI
          jmp  @TheEnd
    @NotFound:
          //The substring was not found
          mov  Result, 0

  @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
end;

function FastmemPosNC(const aSource, aFind; const aSourceLen, aFindLen: integer): Pointer;
asm
          push ESI
          push EDI
          push EBX

          mov  ESI, aFind
          mov  EDI, aSource
          mov  ECX, aSourceLen

  //Quick exit code
          mov  Result, 0
  //SourceLen < FindLen
          cmp  ECX, aFindLen
          jl   @TheEnd
  //FindLen < 1
          cmp  aFindLen, 1
          jl   @TheEnd

  //Now DEC aSourceLen by aFindLen-1
          sub  ECX, aFindLen
          inc  ECX

  //Get the first char of aFindString, note how it is done outside
  //of the main loop, as it never changes !
          mov  EDX, GUpcaseLUT
          xor  EBX, EBX
          jmp  @FindFirst
  @FindNext:
          inc  EDI  //Done only when returning from CompareStrings
          dec  ECX
          jz   @NotFound
  @FindFirst:
          mov  Bl, [ESI]
          mov  AL, [EDX+EBX]

  //Now the FindFirstCharacter loop !
  @ScaSB:
  //Get the value of the current character in aSourceString
  //This is equal to ah := EDI^, that is what the [] are around [EDI]
  //compare this character with aDestString[1]
          mov  Bl, [EDI]
          cmp  Al, [EDX+EBX]
  //If they are equal we compare the strings

          jz   @CompareStrings
          inc  EDI
          dec  ECX
          jnz  @ScaSB
          jmp  @NotFound

  @CompareStrings:
  //Save ECX
          push ECX
          mov  ECX, aFindLen

  @CompareNext:
          dec  ECX
          jz   @FullMatch

          mov  Bl, [ESI+ECX]
          mov  Al, [EDX+EBX]

          mov  Bl, [EDI+ECX]
          cmp  Al, [EDX+EBX]
          jz   @KeepChecking

          POP  ECX
          jmp  @FindNext

    @KeepChecking:
          Jmp  @CompareNext

    @FullMatch:
          pop  ECX
          mov  Result, EDI
          jmp  @TheEnd

    @NotFound:
          mov  Result, 0

  @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
end;


//The first thing to note here is that I am passing the SourceLength and FindLength
//As neither Source or Find will alter at any point during FastReplace there is
//no need to call the LENGTH subroutine each time !

function FastPos(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);

  Result := Integer(FastmemPos(aSourceString[StartPos], aFindString[1], aSourceLen - (StartPos - 1), aFindLen));
  if Result > 0 then
    Result := Result - Integer(@aSourceString[1]) + 1;
end;

function FastPosNoCase(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
begin
  //If this assert failed, it is because you passed 0 for StartPos, lowest value is 1 !!
  Assert(StartPos > 0);

  Result := Integer(FastmemPosNC(aSourceString[StartPos], aFindString[1], aSourceLen - (StartPos - 1), aFindLen));
  if Result > 0 then
    Result := Result - Integer(@aSourceString[1]) + 1;
end;

function FastPosBack(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
var
  SourceLen: Integer;
begin
  if aFindLen < 1 then
  begin
    Result := 0;
    exit;
  end;
  if aFindLen > aSourceLen then
  begin
    Result := 0;
    exit;
  end;

  if (StartPos = 0) or (StartPos + aFindLen >= aSourceLen) then
    SourceLen := aSourceLen - (aFindLen - 1)
  else
    SourceLen := StartPos;

  asm
          push ESI
          push EDI
          push EBX

          mov EDI, aSourceString
          add EDI, SourceLen
          Dec EDI

          mov ESI, aFindString
          mov ECX, SourceLen
          Mov  Al, [ESI]

    @ScaSB:
          cmp  Al, [EDI]
          jne  @NextChar

    @CompareStrings:
          mov  EBX, aFindLen
          dec  EBX
          jz   @FullMatch

    @CompareNext:
          mov  Ah, [ESI+EBX]
          cmp  Ah, [EDI+EBX]
          Jnz  @NextChar

    @Matches:
          Dec  EBX
          Jnz  @CompareNext

    @FullMatch:
          mov  EAX, EDI
          sub  EAX, aSourceString
          inc  EAX
          mov  Result, EAX
          jmp  @TheEnd
    @NextChar:
          dec  EDI
          dec  ECX
          jnz  @ScaSB

          mov  Result,0

    @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
  end;
end;


function FastPosBackNoCase(const aSourceString, aFindString: string; const aSourceLen, aFindLen, StartPos: Integer): Integer;
var
  SourceLen: Integer;
begin
  if aFindLen < 1 then
  begin
    Result := 0;
    exit;
  end;
  if aFindLen > aSourceLen then
  begin
    Result := 0;
    exit;
  end;

  if (StartPos = 0) or (StartPos + aFindLen >= aSourceLen) then
    SourceLen := aSourceLen - (aFindLen - 1)
  else
    SourceLen := StartPos;

  asm
          push ESI
          push EDI
          push EBX

          mov  EDI, aSourceString
          add  EDI, SourceLen
          Dec  EDI

          mov  ESI, aFindString
          mov  ECX, SourceLen

          mov  EDX, GUpcaseLUT
          xor  EBX, EBX

          mov  Bl, [ESI]
          mov  Al, [EDX+EBX]

    @ScaSB:
          mov  Bl, [EDI]
          cmp  Al, [EDX+EBX]
          jne  @NextChar

    @CompareStrings:
          PUSH ECX
          mov  ECX, aFindLen
          dec  ECX
          jz   @FullMatch

    @CompareNext:
          mov  Bl, [ESI+ECX]
          mov  Ah, [EDX+EBX]
          mov  Bl, [EDI+ECX]
          cmp  Ah, [EDX+EBX]
          Jz   @Matches

    //Go back to findind the first char
          POP  ECX
          Jmp  @NextChar

    @Matches:
          Dec  ECX
          Jnz  @CompareNext

    @FullMatch:
          POP  ECX

          mov  EAX, EDI
          sub  EAX, aSourceString
          inc  EAX
          mov  Result, EAX
          jmp  @TheEnd
    @NextChar:
          dec  EDI
          dec  ECX
          jnz  @ScaSB

          mov  Result,0

    @TheEnd:
          pop  EBX
          pop  EDI
          pop  ESI
  end;
end;

//My move is not as fast as MOVE when source and destination are both
//DWord aligned, but certainly faster when they are not.
//As we are moving characters in a string, it is not very likely at all that
//both source and destination are DWord aligned, so moving bytes avoids the
//cycle penality of reading/writing DWords across physical boundaries

procedure FastCharMove(const Source; var Dest; Count: Integer);
asm
//Note:  When this function is called, delphi passes the parameters as follows
//ECX = Count
//EAX = Const Source
//EDX = Var Dest

        //If no bytes to copy, just quit altogether, no point pushing registers
        cmp   ECX,0
        Je    @JustQuit

        //Preserve the critical delphi registers
        push  ESI
        push  EDI

        //move Source into ESI  (generally the SOURCE register)
        //move Dest into EDI (generally the DEST register for string commands)
        //This may not actually be neccessary, as I am not using MOVsb etc
        //I may be able just to use EAX and EDX, there may be a penalty for
        //not using ESI, EDI but I doubt it, this is another thing worth trying !
        mov   ESI, EAX
        mov   EDI, EDX

        //The following loop is the same as repNZ MovSB, but oddly quicker !
    @Loop:
        //Get the source byte
        Mov   AL, [ESI]
        //Point to next byte
        Inc   ESI
        //Put it into the Dest
        mov   [EDI], AL
        //Point dest to next position
        Inc   EDI
        //Dec ECX to note how many we have left to copy
        Dec   ECX
        //If ECX <> 0 then loop
        Jnz   @Loop

        //Another optimization note.
        //Many people like to do this

        //Mov AL, [ESI]
        //Mov [EDI], Al
        //Inc ESI
        //Inc ESI

        //There is a hidden problem here, I wont go into too much detail, but
        //the pentium can continue processing instructions while it is still
        //working out the desult of INC ESI or INC EDI
        //(almost like a multithreaded CPU)
        //if, however, you go to use them while they are still being calculated
        //the processor will stop until they are calculated (a penalty)
        //Therefore I alter ESI and EDI as far in advance as possible of using them

        //Pop the critical Delphi registers that we have altered
        pop   EDI
        pop   ESI
    @JustQuit:
end;

//Point 1
//I pass CONST aSourceString rather than just aSourceString
//This is because I will just be passed a pointer to the data
//rather than a 10mb copy of the data itself, much quicker !

function FastReplace(const aSourceString: string; const aFindString, aReplaceString: string;
  CaseSensitive: Boolean = False): string;
var
  PResult: PChar;
  PReplace: PChar;
  PSource: PChar;
  PFind: PChar;
  PPosition: PChar;
  CurrentPos,
    BytesUsed,
    lResult,
    lReplace,
    lSource,
    lFind: Integer;
  Find: TFastPosProc;

  CopySize: Integer;
begin
  LSource := Length(aSourceString);
  if LSource = 0 then
  begin
    Result := aSourceString;
    exit;
  end;
  PSource := @aSourceString[1];

  LFind := Length(aFindString);
  if LFind = 0 then exit;
  PFind := @aFindString[1];

  LReplace := Length(aReplaceString);

  //Here we may get an Integer Overflow, or OutOfMemory, if so, we use a Delta

  try
    if LReplace <= LFind then
      SetLength(Result, lSource)
    else
      SetLength(Result, (LSource * LReplace) div LFind);
  except
    SetLength(Result, 0);
  end;

  LResult := Length(Result);
  if LResult = 0 then
  begin
    LResult := Trunc((LSource + LReplace) * cDeltaSize);
    SetLength(Result, LResult);
  end;


  PResult := @Result[1];


  if CaseSensitive then
    Find := FastmemPos
  else
    Find := FastmemPosNC;


  if LReplace > 0 then
  begin
    BytesUsed := 0;
    PReplace := @aReplaceString[1];
    repeat
      PPosition := Find(PSource^, PFind^, lSource, lFind);
      if PPosition = nil then break;

      CopySize := PPosition - PSource;
      Inc(BytesUsed, CopySize + LReplace);

      if BytesUsed >= LResult then
      begin
        //We have run out of space
        CurrentPos := Integer(PResult) - Integer(@Result[1]) + 1;
        LResult := Trunc(LResult * cDeltaSize);
        SetLength(Result, LResult);
        PResult := @Result[CurrentPos];
      end;

      FastCharMove(PSource^, PResult^, CopySize);
      Dec(lSource, CopySize + LFind);
      Inc(PSource, CopySize + LFind);
      Inc(PResult, CopySize);

      FastCharMove(PReplace^, PResult^, LReplace);
      Inc(PResult, LReplace);

    until lSource < lFind;
  end
  else
  begin
    repeat
      PPosition := Find(PSource^, PFind^, lSource, lFind);
      if PPosition = nil then break;

      CopySize := PPosition - PSource;
      FastCharMove(PSource^, PResult^, CopySize);
      Dec(lSource, CopySize + LFind);
      Inc(PSource, CopySize + LFind);
      Inc(PResult, CopySize);

    until lSource < lFind;
  end;

  FastCharMove(PSource^, PResult^, LSource);
  SetLength(Result, (PResult + LSource) - @Result[1]);
end;

function SmartPos(const SearchStr, SourceStr: string;
  const CaseSensitive: Boolean = TRUE;
  const StartPos: Integer = 1;
  const ForwardSearch: Boolean = TRUE): Integer;
begin
  // NOTE:  When using StartPos, the returned value is absolute!
  if (CaseSensitive) then
    if (ForwardSearch) then
      Result :=
        FastPos(SourceStr, SearchStr, Length(SourceStr), Length(SearchStr), StartPos)
    else
      Result :=
        FastPosBack(SourceStr, SearchStr, Length(SourceStr), Length(SearchStr), StartPos)
  else if (ForwardSearch) then
    Result :=
      FastPosNoCase(SourceStr, SearchStr, Length(SourceStr), Length(SearchStr), StartPos)
  else
    Result :=
      FastPosBackNoCase(SourceStr, SearchStr, Length(SourceStr), Length(SearchStr), StartPos)
end;

var
  I: Integer;

const
  cKey1 = 52845;
  cKey2 = 22719;

function StripHTMLorNonHTML(S: string; WantHTML: Boolean): string; forward;

//Encrypt a string

function Encrypt(const S: string; Key: Word): string;
var
  I: byte;
begin
  SetLength(result, length(s));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * cKey1 + cKey2;
  end;
end;

//Return only the HTML of a string

function ExtractHTML(S: string): string;
begin
  Result := StripHTMLorNonHTML(S, True);
end;

function CopyStr(const aSourceString: string; aStart, aLength: Integer): string;
var
  L: Integer;
begin
  L := Length(aSourceString);
  if L = 0 then exit;

  if aStart + (aLength - 1) > L then aLength := L - (aStart - 1);

  if (aStart < 1) then exit;

  SetLength(Result, aLength);
  FastCharMove(aSourceString[aStart], Result[1], aLength);
end;

//Take all HTML out of a string

function ExtractNonHTML(S: string): string;
begin
  Result := StripHTMLorNonHTML(S, False);
end;

//Decrypt a string encoded with Encrypt

function Decrypt(const S: string; Key: Word): string;
var
  I: byte;
begin
  SetLength(result, length(s));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * cKey1 + cKey2;
  end;
end;

//GetValue("age","name=pete password=pete age=27") would return 27

function GetValue(ValueName, Text: string): string;
var
  S: string;
  L,
    X,
    P: Integer;
  FoundEquals,
    WordStarted,
    InQuote: Boolean;
begin
  Result := '';
    S := UpperCase(Text);
  P := Pos(UpperCase(ValueName), S);
  if P = 0 then exit;

  Delete(Text, 1, P - 1);

  L := Length(S);
  WordStarted := False;
  FoundEquals := False;
  InQuote := False;

  for X := 1 to L do
    if Text[X] = '=' then
    begin
      FoundEquals := True;
      P := X;
      Break;
    end;

  if not FoundEquals then exit;

  for X := P + 1 to L do
    if Text[X] <> ' ' then
    begin
      WordStarted := True;
      P := X;
      Break;
    end;

  if not WordStarted then exit;

  if Text[X] in ['"', ' '] then
  begin
    InQuote := True;
    Inc(P);
  end;

  for X := P to L do
  begin
    if InQuote then
    begin
      if Text[X] in ['"', ' '] then
        Break
      else
        Result := Result + Text[X];
    end
    else
    begin
      if UpCase(Text[X]) in ['A'..'Z', '0'..'9', '\', '/', '.', '-', '_', ':'] then
        Result := Result + Text[X]
      else
        Break;
    end;
  end;
end;

//Convert a text-HEX value (FF0088 for example) to an integer

function HexToInt(aHex: string): int64;
var
  Multiplier: Int64;
  Position: Byte;
  Value: Integer;
begin
  Result := 0;
  Multiplier := 1;
  Position := Length(aHex);
  while Position > 0 do
  begin
    Value := FastCharPosNoCase(cHexChars, aHex[Position], 1) - 1;
    if Value = -1 then
      raise Exception.Create('Invalid hex character ' + aHex[Position]);

    Result := Result + (Value * Multiplier);
    Multiplier := Multiplier * 16;
    Dec(Position);
  end;
end;

//Get the left X amount of chars

function LeftStr(const aSourceString: string; Size: Integer): string;
begin
  if Size > Length(aSourceString) then
    Result := aSourceString
  else
  begin
    SetLength(Result, Size);
    Move(aSourceString[1], Result[1], Size);
  end;
end;

//Do strings match with wildcards, eg
//StringMatches('The cat sat on the mat', 'The * sat * the *') = True

function StringMatches(Value, Pattern: string): Boolean;
var
  NextPos,
    Star1,
    Star2: Integer;
  NextPattern: string;
begin
  Star1 := FastCharPos(Pattern, '*', 1);
  if Star1 = 0 then
    Result := (Value = Pattern)
  else
  begin
    Result := (Copy(Value, 1, Star1 - 1) = Copy(Pattern, 1, Star1 - 1));
    if Result then
    begin
      if Star1 > 1 then Value := Copy(Value, Star1, Length(Value));
      Pattern := Copy(Pattern, Star1 + 1, Length(Pattern));

      NextPattern := Pattern;
      Star2 := FastCharPos(NextPattern, '*', 1);
      if Star2 > 0 then NextPattern := Copy(NextPattern, 1, Star2 - 1);

      NextPos := pos(NextPattern, Value);
      if (NextPos = 0) and not (NextPattern = '') then
        Result := False
    else
    begin
      Value := Copy(Value, NextPos, Length(Value));
      if Pattern = '' then
        Result := True
  else
    Result := Result and StringMatches(Value, Pattern);
  end;
end;
end;
end;

//Missing text will tell you what text is missing, eg
//MissingText('the ? sat on the mat','the cat sat on the mat','?') = 'cat'

function MissingText(Pattern, Source: string; SearchText: string = '?'): string;
var
  Position: Longint;
  BeforeText,
    AfterText: string;
  BeforePos,
    AfterPos: Integer;
  lSearchText,
    lBeforeText,
    lAfterText,
    lSource: Longint;
begin
  Result := '';
    Position := Pos(SearchText, Pattern);
  if Position = 0 then exit;

  lSearchText := Length(SearchText);
  lSource := Length(Source);
  BeforeText := Copy(Pattern, 1, Position - 1);
  AfterText := Copy(Pattern, Position + lSearchText, lSource);

  lBeforeText := Length(BeforeText);
  lAfterText := Length(AfterText);

  AfterPos := lBeforeText;
  repeat
    AfterPos := FastPosNoCase(Source, AfterText, lSource, lAfterText, AfterPos + lSearchText);
    if AfterPos > 0 then
    begin
      BeforePos := FastPosBackNoCase(Source, BeforeText, AfterPos - 1, lBeforeText, AfterPos - (lBeforeText - 1));
      if (BeforePos > 0) then
      begin
        Result := Copy(Source, BeforePos + lBeforeText, AfterPos - (BeforePos + lBeforeText));
        Break;
      end;
    end;
  until AfterPos = 0;
end;

//Generates a random filename but preserves the original path + extension

function RandomFilename(aFilename: string): string;
var
  Path,
    Filename,
    Ext: string;
begin
  Result := aFilename;
  Path := ExtractFilepath(aFilename);
  Ext := ExtractFileExt(aFilename);
  Filename := ExtractFilename(aFilename);
  if Length(Ext) > 0 then
    Filename := Copy(Filename, 1, Length(Filename) - Length(Ext));
  repeat
    Result := Path + RandomStr(32) + Ext;
  until not FileExists(Result);
end;

//Makes a string of aLength filled with random characters

function RandomStr(aLength: Longint): string;
var
  X: Longint;
begin
  if aLength <= 0 then exit;
  SetLength(Result, aLength);
  for X := 1 to aLength do
    Result[X] := Chr(Random(26) + 65);
end;

function ReverseStr(const aSourceString: string): string;
var
  L: Integer;
  S,
    D: Pointer;
begin
  L := Length(aSourceString);
  SetLength(Result, L);
  if L = 0 then exit;

  S := @aSourceString[1];
  D := @Result[L];

  asm
    push ESI
    push EDI

    mov  ECX, L
    mov  ESI, S
    mov  EDI, D

  @Loop:
    mov  Al, [ESI]
    inc  ESI
    mov  [EDI], Al
    dec  EDI
    dec  ECX
    jnz  @Loop

    pop  EDI
    pop  ESI
  end;
end;

//Returns X amount of chars from the right of a string

function RightStr(const aSourceString: string; Size: Integer): string;
begin
  if Size > Length(aSourceString) then
    Result := aSourceString
  else
  begin
    SetLength(Result, Size);
    FastCharMove(aSourceString[Length(aSourceString) - (Size - 1)], Result[1], Size);
  end;
end;

//Converts a typical HTML RRGGBB color to a TColor

function RGBToColor(aRGB: string): TColor;
begin
  if Length(aRGB) < 6 then raise EConvertError.Create('Not a valid RGB value');
  if aRGB[1] = '#' then aRGB := Copy(aRGB, 2, Length(aRGB));
  if Length(aRGB) <> 6 then raise EConvertError.Create('Not a valid RGB value');

  Result := HexToInt(aRGB);
  asm
    mov   EAX, Result
    BSwap EAX
    shr   EAX, 8
    mov   Result, EAX
  end;
end;

//Splits a delimited text line into TStrings (does not account for stuff in quotes but it should)

procedure Split(aValue: string; aDelimiter: Char; Result: TStrings);
var
  X: Integer;
  S: string;
begin
  if Result = nil then Result := TStringList.Create;
  Result.Clear;
  S := '';
    for X := 1 to Length(aValue) do
  begin
    if aValue[X] <> aDelimiter then
      S := S + aValue[X]
    else
    begin
      Result.Add(S);
      S := '';
    end;
  end;
  if S <> '' then Result.Add(S);
end;

//counts how many times a substring exists within a string
//StringCount('XXXXX','XX') would return 2

function StringCount(const aSourceString, aFindString: string; const CaseSensitive: Boolean = TRUE): Integer;
var
  Find,
    Source,
    NextPos: PChar;
  LSource,
    LFind: Integer;
  Next: TFastPosProc;
begin
  Result := 0;
  LSource := Length(aSourceString);
  if LSource = 0 then exit;

  LFind := Length(aFindString);
  if LFind = 0 then exit;

  if CaseSensitive then
    Next := FastmemPos
  else
    Next := FastmemPosNC;

  Source := @aSourceString[1];
  Find := @aFindString[1];

  repeat
    NextPos := Next(Source^, Find^, LSource, LFind);
    if NextPos <> nil then
    begin
      Dec(LSource, (NextPos - Source) + LFind);
      Inc(Result);
      Source := NextPos + LFind;
    end;
  until NextPos = nil;
end;

//Used by ExtractHTML and ExtractNonHTML

function StripHTMLorNonHTML(S: string; WantHTML: Boolean): string;
var
  X,
    TagCnt: Integer;
begin
  S := StringReplace(S, ' ', ' ', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '&', '&', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '<', '<', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '>', '>', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(S, '"', '"', [rfReplaceAll, rfIgnoreCase]);
  TagCnt := 0;
  Result := '';
    for X := 1 to Length(S) do
  begin
    case S[X] of
      '<': Inc(TagCnt);
      '>': Dec(TagCnt);
    else
      case WantHTML of
        False:
          if TagCnt <= 0 then
          begin
            Result := Result + S[X];
            TagCnt := 0;
          end;
        True:
          if TagCnt >= 1 then
          begin
            Result := Result + S[X];
          end
          else if TagCnt < 0 then
            TagCnt := 0;
      end;
    end;
  end;
end;

//Generates a UniqueFilename, makes sure the file does not exist before returning a result

function UniqueFilename(aFilename: string): string;
var
  Path,
    Filename,
    Ext: string;
  Index: Integer;
begin
  Result := aFilename;
  if FileExists(aFilename) then
  begin
    Path := ExtractFilepath(aFilename);
    Ext := ExtractFileExt(aFilename);
    Filename := ExtractFilename(aFilename);
    if Length(Ext) > 0 then
      Filename := Copy(Filename, 1, Length(Filename) - Length(Ext));
    Index := 2;
    repeat
      Result := Path + Filename + IntToStr(Index) + Ext;
      Inc(Index);
    until not FileExists(Result);
  end;
end;

//Decodes all that %3c stuff you get in a URL

function URLToText(aValue: string): string;
var
  X: Integer;
begin
  Result := '';
    X := 1;
  while X <= Length(aValue) do
  begin
    if aValue[X] <> '%' then
      Result := Result + aValue[X]
    else
    begin
      Result := Result + Chr(HexToInt(Copy(aValue, X + 1, 2)));
      Inc(X, 2);
    end;
    Inc(X);
  end;
end;

//Returns the whole word at a position

function WordAt(Text: string; Position: Integer): string;
var
  L,
    X: Integer;
begin
  Result := '';
    L := Length(Text);

  for X := Position to L do
  begin
    if Upcase(Text[X]) in ['A'..'Z', '0'..'9'] then
      Result := Result + Text[X]
    else
      Break;
  end;

  for X := Position - 1 downto 1 do
  begin
    if Upcase(Text[X]) in ['A'..'Z', '0'..'9'] then
      Result := Text[X] + Result
    else
      Break;
  end;
end;

//////////快速字符串//////////
//////////新的字符串涵 数收集//////////

function slash(value: string): string;
begin
  if (value[length(value)] <> '\') then
    result := value + '\'
  else
    result := value;
end;


function capfirst(value: string): string;
var
  i: integer;
  s: string;
begin
  s := uppercase(value[1]);
  for i := 2 to length(value) do
    if (ord(value[i - 1]) < 33) then
      s := s + uppercase(value[i])
    else
      s := s + lowercase(value[i]);
  result := s;
end;

function striptags(value: string): string;
var
  i: integer;
  s: string;
begin
  i := 1;
  s := '';
    while i <= length(value) do
  begin
    if value[i] = '<' then
      repeat inc(i)until (value[i] = '>')
    else
      s := s + value[i];
    inc(i);
  end;
  result := s;
end;

function replace(str, s1, s2: string; casesensitive: boolean): string;
var
  i: integer;
  s, t: string;
begin
  s := '';
    t := str;
  repeat
    if casesensitive then
      i := pos(s1, t)
    else
      i := pos(lowercase(s1), lowercase(t));
    if i > 0 then
    begin
      s := s + Copy(t, 1, i - 1) + s2;
      t := Copy(t, i + Length(s1), MaxInt);
    end
    else
      s := s + t;
  until i <= 0;
  result := s;
end;

function CopyFromChar(s: string; c: char; l: integer): string;
var
  i: integer;
begin
  i := pos(c, s);
  result := copy(s, i, l);
end;

function getwinsysdir: string;
var
  p: pchar;
  z: integer;
begin
  z := 255;
  getmem(p, z);
  getsystemdirectory(p, z);
  result := slash(string(p));
  freemem(p, z);
end;

function getwindir: string;
var
  p: pchar;
  z: integer;
begin
  z := 255;
  getmem(p, z);
  getwindowsdirectory(p, z);
  result := slash(string(p));
  freemem(p, z);
end;

function getinstalldir: string;
begin
  result := slash(extractfiledir(paramstr(0)));
end;


function getregvalue(root: integer; key, value: string): string;
var
  rg: Tregistry;
begin
  rg := Tregistry.create;
  try
    rg.rootkey := root;
    if rg.OpenKey(key, false) then
      result := rg.readString(value)
    else
      result := '';
  finally
    rg.free;
  end;
end;

function getfiledate(filename: string): Tdatetime;
begin
  if fileexists(filename) then
    result := filedatetodatetime(fileage(filename))
  else
    result := maxint;
end;


function strtofloatdef(const s: string; def: Extended): Extended;
begin
  try
    result := strtofloat(s);
  except
    result := def;
  end;
end;

function volsphere(radius: single): extended;
begin
  result := ((4 / 3) * pi * radius * radius * radius);
end;

function areasphere(radius: single): extended;
begin
  result := (4 * pi * radius * radius);
end;

function volcylinder(radius, height: single): extended;
begin
  result := (pi * radius * radius * height);
end;

function areacylinder(radius, height: single): extended;
begin
  result := (2 * pi * radius * height);
end;

function MinExt(const A: array of Extended): Extended;
var
  i: integer;
begin
  Result := A[Low(A)];
  for i := Low(A) + 1 to High(A) do
    if A[i] < Result then Result := A[I];
end;

function MaxExt(const A: array of Extended): Extended;
var
  i: integer;
begin
  Result := A[Low(A)];
  for i := Low(A) + 1 to High(A) do
    if A[i] > Result then Result := A[I];
end;

function MinInteger(const A: array of Integer): Integer;
var
  i: integer;
begin
  Result := A[Low(A)];
  for i := Low(A) + 1 to High(A) do
    if A[i] < Result then Result := A[I];
end;

function MaxInteger(const A: array of integer): Integer;
var
  i: integer;
begin
  Result := A[Low(A)];
  for i := Low(A) + 1 to High(A) do
    if A[i] > Result then Result := A[I];
end;

function InverseSum(const a: array of single): single;
var
  i: integer;
begin
  result := 0;
  for i := low(a) to high(a) do
    result := result + (1 / a[i]);
  result := (1 / result);
end;

function MarkUp(profit: single): single;
begin
  result := (100 - (10000 / (100 + profit)));
end;

function SellingPrice(net: double; markup: single): double;
begin
  result := net + (net * markup / 100);
end;

function NetPrice(gross: double; taxrate: single): double;
begin
  result := gross - (gross * (taxrate) / (100 + taxrate));
end;

//////////新的字符串涵 数收集//////////
//////////得到系统路径//////////

function GetApplicationExeName: string;
begin
  Result := ParamStr(0);
end;

function GetApplicationShortExeName: string;
begin
  Result := ExtractFileName(ParamStr(0));
end;

function GetWindowsDir: string; //c:\winnt
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(vBuffer, MAX_PATH);
  Result := vBuffer;
end;

function GetSystemDir: string; //c:\winnt\system32
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetSysTemDirectory(vBuffer, MAX_PATH);
  Result := vBuffer;
end;

function GetTempDir: string; //应用程序的路径 如D:/winnt/temp
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, vBuffer);
  Result := vBuffer;
end;

function GetApplicationPath: string; //应用程序的路径 如D:/feng/
begin
  Result := ExtractFilePath(GetApplicationExeName);
end;

function GetApplicationDir: string; //应用程序的路径 如D:/feng
begin
  Result := ExtractFileDir(GetApplicationExeName);
end;

function GetCurrentDir: string; //应用程序的路径 如D:/feng
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetCurrentDirectory(MAX_PATH, vBuffer);
  Result := vBuffer;
end;

//程序组目录

function GetProgramsDir: string;
begin
  Result := GetSystemFolderDir(CSIDL_PROGRAMS);
end;

//我的文档       //如C:\My Documents

function GetMy_DocumentsDir: string;
begin
  Result := GetSystemFolderDir(CSIDL_PERSONAL);
end;

function GetFavoritesDir: string;
begin
  Result := GetSystemFolderDir(CSIDL_FAVORITES);
end;

function GetSystemFolderDir(mFolder: Integer): string;
{ 返回获取系统文件或系统目录}
{
 CSIDL_BITBUCKET 回收站
 CSIDL_DESKTOP          = $0000; 桌面
 CSIDL_INTERNET          = $0001;
 CSIDL_PROGRAMS          = $0002;  程序组 D:\Documents and Settings\Administrator\「开始」菜单\程序
 CSIDL_CONTROLS          = $0003;  控制面板
 CSIDL_PRINTERS          = $0004;  打印机
 CSIDL_PERSONAL          = $0005;  我的文档
 CSIDL_FAVORITES          = $0006;  收藏夹
 CSIDL_STARTUP          = $0007; 启动
 CSIDL_RECENT          = $0008;  最近文档
 CSIDL_SENDTO          = $0009;  发送到
 CSIDL_BITBUCKET          = $000a; 回收站
 CSIDL_STARTMENU          = $000b; 开始菜单
 CSIDL_DESKTOPDIRECTORY          = $0010; 桌面目录
 CSIDL_DRIVES          = $0011; 我的电脑
 CSIDL_NETWORK          = $0012;  网上邻居
 CSIDL_NETHOOD          = $0013;  网上邻居目录
 CSIDL_FONTS          = $0014;  字体
 CSIDL_TEMPLATES          = $0015; //模版
 CSIDL_COMMON_STARTMENU          = $0016;  //公用的开始菜单
 CSIDL_COMMON_PROGRAMS          = $0017;
 CSIDL_COMMON_STARTUP          = $0018;
 CSIDL_COMMON_DESKTOPDIRECTORY       = $0019;
 CSIDL_APPDATA          = $001a; //D:\Documents and Settings\Administrator\Application Data
 CSIDL_PRINTHOOD          = $001b; //D:\Documents and Settings\Administrator\PrintHood
 CSIDL_ALTSTARTUP          = $001d;         // DBCS
 CSIDL_COMMON_ALTSTARTUP         = $001e;         // DBCS
 CSIDL_COMMON_FAVORITES          = $001f;
 CSIDL_INTERNET_CACHE          = $0020;  D:\Documents and Settings\Administrator\Local Settings\Temporary Internet Files
 CSIDL_COOKIES          = $0021;   Cook文件夹
 CSIDL_HISTORY          = $0022;   历史文件夹
 CSIDL_COMMON_APPDATA          = $0023;
          = $0024;   D:\WINNT
          = $0025;   D:\WINNT\system32
          = $0026    D:\Program Files
          = $0027    D:\Documents and Settings\Administrator\My Documents\My Pictures
          = $0028    D:\Documents and Settings\Administrator
          = $0029    D:\WINNT\system32
}
var
  vItemIDList: PItemIDList;
  vBuffer: array[0..MAX_PATH] of Char;
begin
  SHGetSpecialFolderLocation(0, mFolder, vItemIDList);
  SHGetPathFromIDList(vItemIDList, vBuffer); //转换成文件系统的路径
  Result := vBuffer;
end;
//////////得到系统路径//////////
initialization
  GetModuleFileName(HInstance, vBuffer, MAX_PATH); //读取模块所在文件
  GetFileVersionInfomation(vBuffer, vModuleVersionInfomation); //读取模块版本信息
//////////快速字符串//////////
  for I := 0 to 255 do
    GUpcaseTable[I] := Chr(I);
  CharUpperBuff(@GUpcaseTable[1], 256);
  GUpcaseLUT := @GUpcaseTable[0];
//////////快速字符串//////////
finalization

end.

