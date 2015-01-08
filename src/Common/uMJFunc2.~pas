unit uMJFunc2;
//original: unit skyPublic

interface

uses
  Windows,SysUtils,Classes,Controls,Dialogs,ShellApi,Menus,StdCtrls,
  registry,Forms,Graphics,Math,DateUtils;

type
  TQuarter = 1..4;

  TChinaNumFormat = (cnfBig,cnfSmall,cnfArab);

  TChinaBigFormat = (cbfFull,cbfBlank);

  TNumChar='0'..'9';

  TStringArray = array of string;

  TCharSet = set of Char;

  TFontRecord = record
    CharSet:Byte;
    Color:Integer;
    Name:string;
    Size:Integer;
    Style:Byte;
    PixelsPerInch:Integer;
    Pitch:0..2;
    Height:Integer;
  end;

const
  CR = #13;
  LF = #10;
  NumCharSet=['0'..'9'];
  NameCharSet = ['A'..'Z','a'..'z','0'..'9','_'];

var
  MimaFileName:string;
  PositionMima:array [0..2] of Integer = (91,92,93);

{*****************************类操作******************************}
{显示类及其继承信息函数}
function ShowClassName(Obj:TObject):string;
procedure GetClassInfos(Obj:TComponent;StrList:TStringList);
procedure SaveClassInfos(Obj:TComponent;FileName:string);

{*****************************文件操作******************************}
{建文件夹}
function CreateDirs(APath:string):Boolean;
{拷贝}
function FileCopy(From, Dest: string;S:Integer=0;Dialog:Boolean=True):Boolean;
{移动}
procedure FileMove(From, Dest: string);
{删除}
procedure FileDelete(ADirName: string);
{更名}
function FileRename(From, Dest: string):Boolean;

{***************************控件操作********************************}
{TStrings，在Combobox中添加或者删除一个字符串}
procedure StringsOperation(ComboBox:TComboBox;IsAdd:Boolean;No:string='');

{***************************日期操作********************************}
{返回头尾日期}
procedure GetHeadTailDate(const SelfDate:TDate;var HeadDate,TailDate:TDate);overload;
procedure GetHeadTailDate(const Year,Month:Integer;var HeadDate,TailDate:TDate);overload;
{返回一月有多少天}
function ReturnHowDay(const AYear,AMonth:word):Word;
{返回季度头尾日期}
procedure GetQuarter(AYear:Word;AQuarter:TQuarter;var HeadDate,TailDate:TDate);overload;
procedure GetQuarter(SelfDate:TDate;var HeadDate,TailDate:TDate);overload;
procedure GetAccYearMonth(ADate:TDateTime;var Y,M:Word);

{**************************字符串操作*******************************}
{**************************string Function*******************************}
{得到1个字符在字符串中的个数}
function GetCharNum(const Ch:Char; const Str: string):Integer;
{Ini字符串和String字符串互相转换}
function IniStrToStr(const Str: string): string;
function StrToIniStr(const Str: string): string;
{给字符串加一个'\'}
function AddBackSlash(const S: string): string;
{减少字符串的长度}
procedure DecStrLen(var S: string; DecBy: Integer);
{返回有回车换行的字符串Position位置所在的字符串}
function GetCurLine(const S: string; Position: Integer): string;
{返回给定字符串的内存分配大小}
function GetStrAllocSize(const S: string): Longint;
{ 得到字符串的基准数 }
function GetStrRefCount(const S: string): Longint;
{清除A中指定的字符}
function KillChars(const S: string; A: array of Char; CaseSensitive: Boolean):string;
{ 返回子字符串在字符串中最后一个位置 }
function LastPos(const SubStr, S: string): Integer;
{ 设置字符串的实际长度 }
procedure RealizeLength(var S: string);
{ 移去字符串末尾的'\'}
function RemoveBackSlash(const S: string): string;
{移去字符串空格}
function RemoveSpaces(const S: string): string;
{字符串取反}
function ReverseStr(const S: string): string;
{除去前后回车}
function TrimEnterLeft(S:string):string;
function TrimEnterRight(S:string):string;
function TrimEnter(S:string):string;
{******************************PChar Function***************************}
procedure StrGetCurLine(StartPos, CurPos: PChar; TotalLen: integer;
  var LineStart: PChar; var LineLen: integer);
{ 返回最后一个指定字符串及其以后的字符 }
function StrLastPos(Str1, Str2: PChar): PChar;
{截取第一个指定字符串及其以后的字符,大小写不敏感}
function StrIPos(Str1, Str2: PChar): PChar;
{截取第一个指定字符及其以后的字符,大小写不敏感}
function StrIScan(Str: PChar; Chr: Char): PChar;
{ 字符串取反 }
procedure StrReverse(P: PChar);

{返回中文大写数字}
function GetChinaNum(Num:TNumChar;ChinaNumFormat:TChinaNumFormat=cnfBig):string;
{将数字变成中文大写}
function FloatToChinaBig(Num:Double;ChinaBigFormat:TChinaBigFormat=cbfFull;Blanks:Byte=0):string;
function FloatToChnStr(Value: Real; ClearZero: Boolean; full:Boolean=False): String;
{将数字变成英文}
function FloatToEnglish(Num:Double):string;
{日期用英文}
function DateToEng(ADate:TDate;th:Boolean=False):string;
{取得SQL日期字符串等}
function DateToSQLDateStr(ADate:TDateTime):string;
function StrToSQLDateStr(Str:string):string;
function TimeToSQLTimeStr(ATime:TDateTime):string;
function StrToSQLTimeStr(Str:string):string;
function DateTimeToSQLDateTimeStr(ADateTime:TDateTime):string;
function StrToSQLDateTimeStr(Str:string):string;
{返回有逗号的金额字符串}
function FloatToMoneyStr(Num:Double;const HasSymbol:Boolean=False):string;
{Bool与字符串的转换}
function StrToBool(const Str:string):Boolean;
function BoolToStr(const Bool:Boolean):string;
{判断是否日期等}
function IsDate(const CheckString:string):Boolean;
function IsDateTime(const CheckString:string):Boolean;
function IsTime(const CheckString:string):Boolean;
function IsInteger(const CheckString:string):Boolean;
function IsFloat(const CheckString:string):Boolean;
{多字符串ShowMessage}
procedure ShowMessages(const Strings:array of string);
{新名称}
function NameToNewName(const Str:string):string;
{FloatTo%百分比}
function FloatToRate(Num:Double;Pos:Word):string;
{字体存贮}
procedure FontRecordToFont(FontRecord:TFontRecord;Font:TFont);
function FontToFontRecord(Font:TFont):TFontRecord;
function FontStylesToInt(FontStyles:TFontStyles):Byte;
function IntToFontStyles(FontInteger:Byte):TFontStyles;

{****************************数学*********************************}
{n次方}
function Power(X,Y:Extended):Extended;
{N的阶层}
function Order(N: Word): Extended;//（用Pascal写的N的阶层）
{得到小数点位数}
function GetFloatPointNum(Fl:Double):Integer;
{小数点位数，四舍五入法}
function FloatToNewFloat(AValue:Double):Double;
function FloatToNewFloatN(AValue:Double;N:Word=4):Double;

{******************************系统操作*******************************}
{关闭计算机}
function WinExit (iFlags: integer) : Boolean;
{防止开启多个应用程序}
procedure PreventMany(Name:string);
{得到应用程序的路径}
function GetApplicationDir(AppName:string):string;
{加到启动}
function RegAddToRun(Name,Value:string):Boolean;
procedure DeleteOneItem(Name:string);
{得到Delphi路径}
function GetDelphiDir:string;
{得到系统路径}
function GetSystemDir:string;
{得到windows路径}
function GetWindowsDir:string;
{得到计算机名}
function GetComputerNameD:string;
{设置计算机名}
function SetComputerNameD(Name:string):Boolean;
{执行一个文件}
function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;

implementation

{显示类及其继承信息函数}
function ShowClassName(Obj:TObject):string;
var
  Str:string;
  K:TClass;
begin
  K:=Obj.ClassType;
  while not K.ClassNameIs('TObject') do
  begin
    Str:=K.ClassParent.ClassName+'——>'+Str;
    K:=K.ClassParent;
  end;
  Result:=Str+Obj.ClassName;
end;

procedure GetClassInfos(Obj:TComponent;StrList:TStringList);
var
  i:Integer;
  S:string;
begin
  StrList.Clear;
  for I:=0 to Obj.ComponentCount-1 do
  begin
    S:='类名：'+Obj.Components[I].ClassName+' '+'名称：'+Obj.Components[I].Name;
    StrList.Add(S);
  end;
end;

procedure SaveClassInfos(Obj:TComponent;FileName:string);
var
  i:Integer;
  S:string;
  StrList:TStringList;
begin
  StrList:=TStringList.Create;
  try
    for I:=0 to Obj.ComponentCount-1 do
    begin
      S:='类名：'+Obj.Components[I].ClassName+' '+'名称：'+Obj.Components[I].Name;
      StrList.Add(S);
    end;
    StrList.SaveToFile(FileName);
  finally
    StrList.Free;
  end;
end;

{建文件夹}
function  CreateDirs(APath:string):Boolean;
var
  CurrentPath:string;
  UsePath:string;
begin
  CurrentPath:=GetCurrentDir;
  UsePath:=Trim(APath);
  if Pos('\',UsePath)=1 then
  begin
    UsePath:=Copy(CurrentPath,1,2)+UsePath;
  end
  else if Pos(':',UsePath)<>2 then UsePath:=CurrentPath+'\'+UsePath;
  Result:=ForceDirectories(UsePath);
end;

{拷贝}{0:如果有同文件名则改名。1：如果同文件名则覆盖。}
function FileCopy(From, Dest: string;S:Integer=0;Dialog:Boolean=True):Boolean;
var
  T: TSHFileOpStruct;
  FromDir:PChar;
  ToDir:PChar;
begin
  GetMem(FromDir,Length(From)+2);
  try
    GetMem(ToDir,Length(Dest)+2);
    try
      FillChar(FromDir^,Length(From)+2,0);
      FillChar(ToDir^,Length(Dest)+2,0);

      StrCopy(FromDir,PChar(From));
      StrCopy(ToDir,PChar(Dest));

      with T do
      begin
        Wnd    :=0;
        wFunc  :=FO_COPY;
        pFrom  :=FromDir;
        pTo    :=ToDir;
        if S=0 then
          fFlags :=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION
        else fFlags :=FOF_NOCONFIRMATION;
        if not Dialog then
          fFlags:=fFlags or FOF_SILENT;
        fAnyOperationsAborted:=False;
        hNameMappings:=nil;
        lpszProgressTitle:=nil;
        if SHFileOperation(T)=0 then
          Result:=True
        else Result:=False;
      end;
    finally
      FreeMem(ToDir,Length(Dest)+2);
    end;
  finally
    FreeMem(FromDir,Length(From)+2);
  end;
end;

{移动}
procedure FileMove(From, Dest: string);
var
  T: TSHFileOpStruct;
  FromDir:PChar;
  ToDir:PChar;
begin
  GetMem(FromDir,Length(From)+2);
  try
    GetMem(ToDir,Length(Dest)+2);
    try
      FillChar(FromDir^,Length(From)+2,0);
      FillChar(ToDir^,Length(Dest)+2,0);

      StrCopy(FromDir,PChar(From));
      StrCopy(ToDir,PChar(Dest));

      with T do
      begin
        Wnd    :=0;
        wFunc  :=FO_MOVE;
        pFrom  :=FromDir;
        pTo    :=ToDir;
        fFlags :=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
        fAnyOperationsAborted:=False;
        hNameMappings:=nil;
        lpszProgressTitle:=nil;
        if SHFileOperation(T)<>0 then
          raise Exception.Create('移动文件操作不成功！');
      end;
    finally
      FreeMem(ToDir,Length(Dest)+2);
    end;
  finally
    FreeMem(FromDir,Length(From)+2);
  end;
end;

{删除}
procedure FileDelete(ADirName: string);
var
  SHFileOpStruct:TSHFileOpStruct;
  DirName:PChar;
begin
  Getmem(DirName,Length(ADirName)+2);
  try
    FillChar(Dirname^,Length(ADirName)+2,0);
    StrCopy(DirName,PChar(ADirName));

    with SHFileOpStruct do
    begin
      Wnd:=0;
      wFunc:=FO_DELETE;
      pFrom:=DirName;
      pTo:=nil;
      fFlags :=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;

      fAnyOperationsAborted:=False;
      hNameMappings:=nil;
      lpszProgressTitle:=nil;
    end;

    if SHfileOperation(SHFileOpStruct)<>0 then
      raise Exception.Create('删除文件操作不成功！');
  finally
    FreeMem(DirName,Length(ADirName)+2);
  end;
end;

{更名}
function FileRename(From, Dest: string):Boolean;
//var
//  T: TSHFileOpStruct;
//  FromDir:PChar;
//  ToDir:PChar;
//  FromDirectory,DestDirectory:string;
begin
  Dest:=ExtractFileName(Dest);
  Result:=RenameFile(From,Dest);
end;

{得到应用程序的路径}
function GetApplicationDir(AppName:string):string;
var
  AppPath:string;
  reg:TRegistry;
  Name:string;
  ExtName:string;
begin
  ExtName:=Copy(AppName,Length(AppName)-3,4);
  if ExtName[1]<>'.' then AppName:=AppName+'.exe';
  Name:='Software\Microsoft\Windows\CurrentVersion\App Paths\'+AppName;
  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_LOCAL_MACHINE;
    reg.OpenKey(Name,False);
    AppPath:=reg.ReadString('path');
    AppPath:=AddBackSlash(AppPath);
    reg.CloseKey;
  finally
    reg.Free;
  end;
  Result:=AppPath;
end;

{加到启动}
function RegAddToRun(Name,Value:string):Boolean;
var
  Reg:TRegistry;
  Values:string;
begin
  Result:=False;
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('software\microsoft\windows\currentversion\run\',False);
    Values:=Reg.ReadString(Name);
    if Values<>Value then
    begin
      Reg.WriteString(Name,Value);
      Result:=True;
    end;
  finally
    Reg.Free;
  end;
end;
procedure DeleteOneItem(Name:string);
var
  Reg:TRegistry;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('software\microsoft\windows\currentversion\run\',False);
    if Reg.ValueExists(Name) then
      Reg.DeleteValue(Name)
  finally
    Reg.Free;
  end;
end;

{得到delphi路径}
function GetDelphiDir:string;
begin
  Result:=GetApplicationDir('Delphi32.exe');
end;

{得到系统路径}
function GetSystemDir:string;
var
  Buffer: array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, Buffer, GetSystemDirectory(Buffer,SizeOf(Buffer)));
end;

{得到windows路径}
function GetWindowsDir:string;
var
  Buffer: array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, Buffer, GetWindowsDirectory(Buffer,SizeOf(Buffer)));
end;

{得到计算机名}
function GetComputerNameD:string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  BSize:Cardinal;
begin
  BSize:=SizeOf(Buffer);
  if  GetComputerName(Buffer,BSize) then
  begin
    Result:=Buffer;
  end
  else Result:='';
end;

{设置计算机名}
function SetComputerNameD(Name:string):Boolean;
begin
  if Length(Name)>MAX_COMPUTERNAME_LENGTH then
  Name:=Copy(Name,1,MAX_COMPUTERNAME_LENGTH);
  Result:=False;
  if SetComputerName(PChar(Name)) then
    Result:=True;
end;

function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..120] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

{返回头尾日期}
procedure GetHeadTailDate(const SelfDate:TDate;var HeadDate,TailDate:TDate);overload;
const
  AHeadDay=1;
var
  AYear,AMonth,ATailDay,ASelfDay:Word;
begin
  DecodeDate(SelfDate,AYear,AMonth,ASelfDay);
  ATailDay:=ReturnHowDay(AYear,AMonth);
  HeadDate:=EncodeDate(AYear,AMonth,AHeadDay);
  TailDate:=EncodeDate(AYear,AMonth,ATailDay);
end;

procedure GetHeadTailDate(const Year,Month:Integer;var HeadDate,TailDate:TDate);overload;
const
  HeadDay=1;
var
  TailDay:Word;
begin
  TailDay:=ReturnHowDay(Year,Month);
  HeadDate:=EncodeDate(Year,Month,HeadDay);
  TailDate:=EncodeDate(Year,Month,TailDay);
end;

{返回一月有多少天}
function ReturnHowDay(const AYear,AMonth:word):Word;
begin
  case AMonth of
    1,3,5,7,8,10,12:Result:=31;
    4,6,9,11:Result:=30;
    2:begin
      if IsLeapYear(AYear) then
        Result:=29
      else Result:=28;
    end;
    else Result:=0;
  end;
end;

{返回季度头尾日期}
procedure GetQuarter(AYear:Word;AQuarter:TQuarter;var HeadDate,TailDate:TDate);overload;
var
  AHeadDate,ATailDate:TDate;
  HeadMonth,TailMonth:Word;
begin
  HeadMonth:=1;
  TailMonth:=1;
  case AQuarter of
    1:begin
        HeadMonth:=1;
        TailMonth:=3;
    end;
    2:begin
        HeadMonth:=4;
        TailMonth:=6;
    end;
    3:begin
        HeadMonth:=7;
        TailMonth:=9;
    end;
    4:begin
        HeadMonth:=10;
        TailMonth:=12;
    end;
  end;
  GetHeadTailDate(AYear,HeadMonth,AHeadDate,ATailDate);
  HeadDate:=AHeadDate;
  GetHeadTailDate(AYear,TailMonth,AHeadDate,ATailDate);
  TailDate:=ATailDate;
end;

procedure GetQuarter(SelfDate:TDate;var HeadDate,TailDate:TDate);overload;
var
  AYear,AMonth,ADay:Word;
  AQuarter:TQuarter;
begin
  AQuarter:=1;
  DecodeDate(SelfDate,AYear,AMonth,ADay);
  case AMonth of
    1..3:AQuarter:=1;
    4..6:AQuarter:=2;
    7..9:AQuarter:=3;
    10..12:AQuarter:=4;
  end;
  GetQuarter(AYear,AQuarter,HeadDate,TailDate);
end;

procedure GetAccYearMonth(ADate:TDateTime;var Y,M:Word);
var
  D:Word;
begin
  DecodeDate(ADate,Y,M,D);
  if M=1 then
  begin
    Y:=Y-1;
    M:=12;
  end
  else begin
    M:=M-1;
  end;
end;

{  *** Pascal string functions *** }
function GetCharNum(const Ch:Char; const Str: string):Integer;
var
  S:PChar;
begin
  S:=PChar(Str);
  Result:=0;
  while S^<>#0 do
  begin
    if S^=Ch then
    Inc(Result);
    Inc(S);
  end;
end;

function IniStrToStr(const Str: string): string;
var
  Buffer: array[0..4095] of Char;
  B, S: PChar;
begin
  if Length(Str) > SizeOf(Buffer) then
    raise Exception.Create('String to read from an INI file');
  S := PChar(Str);
  B := Buffer;
  while S^ <> #0 do
    if (S[0] = '\') and (S[1] = 'n') then
    begin
	 B^ := #13;
	 Inc(B);
	 B^ := #10;
	 Inc(B);
	 Inc(S);
	 Inc(S);
    end
    else
    begin
	 B^ := S^;
	 Inc(B);
	 Inc(S);
    end;
  B^ := #0;
  Result := Buffer;
end;

function StrToIniStr(const Str: string): string;
var
  Buffer: array[0..4095] of Char;
  B, S: PChar;
begin
  if Length(Str) > SizeOf(Buffer) then
    raise Exception.Create('String to large to save in INI file');
  S := PChar(Str);
  B := Buffer;
  while S^ <> #0 do
    case S^ of
      #13, #10:
        begin
          if (S^ = #13) and (S[1] = #10) then Inc(S)
          else if (S^ = #10) and (S[1] = #13) then Inc(S);
          B^ := '\';
          Inc(B);
          B^ := 'n';
          Inc(B);
          Inc(S);
        end;
    else
      B^ := S^;
      Inc(B);
      Inc(S);
    end;
  B^ := #0;
  Result := Buffer;
end;

function AddBackSlash(const S: string): string;
begin
  Result := S;
  if S<>'' then
  begin
    if Result[Length(Result)] <> '\' then  // if last char isn't a backslash...
      Result := Result + '\';              // make it so
  end;
end;

procedure DecStrLen(var S: string; DecBy: Integer);
begin
  SetLength(S, Length(S) - DecBy);       // decrement string length by DecBy
end;

function GetCurLine(const S: string; Position: Integer): string;
var
  ResP: PChar;
  ResLen: integer;
begin
  StrGetCurLine(PChar(S), PChar(Longint(S) + Position - 1), Length(S), ResP,
    ResLen);
  SetString(Result, ResP, ResLen);
end;

function GetStrAllocSize(const S: string): Longint;
var
  P: ^Longint;
begin
  P := Pointer(S);                        // pointer to string structure
  dec(P, 3);                              // 12-byte negative offset
  Result := P^ and not $80000000 shr 1;   // ignore bits 0 and 31
end;

function GetStrRefCount(const S: string): Longint;
var
  P: ^Longint;
begin
  P := Pointer(S);                        // pointer to string structure
  dec(P, 2);                              // 8-byte negative offset
  Result := P^;
end;

function KillChars(const S: string; A: array of Char; CaseSensitive: Boolean):
  string;
var
  CharSet: TCharSet;
  i, count: integer;
begin
  CharSet := [];                         // empty character set
  for i := Low(A) to High(A) do begin
    Include(CharSet, A[i]);              // fill set with array items
    if not CaseSensitive then begin      // if not case sensitive, then also
      if A[i] in ['A'..'Z'] then
        Include(CharSet, Chr(Ord(A[i]) + 32))  // include lower cased or
      else if A[i] in ['a'..'z'] then
        Include(CharSet, Chr(Ord(A[i]) - 32))  // include upper cased character
    end;
  end;
  SetLength(Result, Length(S));          // set length to prevent realloc
  count := 0;
  for i := 1 to Length(S) do begin       // iterate over string S
    if not (S[i] in CharSet) then begin  // add good chars to Result
      Result[count + 1] := S[i];
      inc(Count);                        // keep track of num chars copies
    end;
  end;
  SetLength(Result, count);              // set length to num chars copied
end;

function LastPos(const SubStr, S: string): Integer;
var
  FoundStr: PChar;
begin
  Result := 0;
  FoundStr := StrLastPos(PChar(S), PChar(SubStr));
  if FoundStr <> nil then
    Result := (Cardinal(Length(S)) - StrLen(FoundStr)) + 1;
end;

procedure RealizeLength(var S: string);
begin
  SetLength(S, StrLen(PChar(S)));
end;

function RemoveBackSlash(const S: string): string;
begin
  Result := S;
  if Result[Length(Result)] = '\' then   // if last character is a backslash...
    DecStrLen(Result, 1);                // decrement string length
end;

function RemoveSpaces(const S: string): string;
begin
  Result := KillChars(S, [' '], True);
end;

function ReverseStr(const S: string): string;
begin
  Result := S;
  StrReverse(PChar(Result));
end;

{除去前后回车}
function TrimEnterLeft(S:string):string;
begin
  S:=ReverseStr(S);
  S:=TrimEnterRight(S);
  S:=ReverseStr(S);
  Result:=S;
end;

function TrimEnterRight(S:string):string;
begin
  while ((Length(S)>1)and((S[Length(S)]=#10)and(S[Length(S)-1]=#13)))or
   ((Length(S)>1)and((S[Length(S)]=#13)and(S[Length(S)-1]=#10))) do
  begin
    S:=Copy(S,1,Length(S)-2);
  end;
  Result:=S;
end;

function TrimEnter(S:string):string;
begin
  S:=TrimEnterLeft(S);
  S:=TrimEnterRight(S);
  Result:=S;
end;

{  *** PChar string functions ***  }
procedure StrGetCurLine(StartPos, CurPos: PChar; TotalLen: integer;
                        var LineStart: PChar; var LineLen: integer);
var
  FloatPos, EndPos: PChar;
begin
  FloatPos := CurPos;
  LineStart := nil;
  repeat
    if FloatPos^ = LF then
    begin
      dec(FloatPos);
      if FloatPos^ = CR then
      begin
        inc(FloatPos, 2);
        LineStart := FloatPos;
      end;
    end
    else
      dec(FloatPos);
  until (FloatPos <= StartPos) or (LineStart <> nil);
  if LineStart = nil then LineStart := StartPos;
  FloatPos := CurPos;
  EndPos := StartPos;
  inc(EndPos, TotalLen - 1);
  LineLen := 0;
  repeat
    if FloatPos^ = CR then
    begin
      inc(FloatPos);
      if FloatPos^ = LF then
      begin
        dec(FloatPos, 2);
        LineLen := FloatPos - LineStart + 1;
      end;
    end
    else
      inc(FloatPos);
  until (FloatPos >= EndPos) or (LineLen <> 0);
  if LineLen = 0 then
    LineLen := integer(EndPos) - integer(LineStart)+1;
end;

function StrIPos(Str1, Str2: PChar): PChar;
{ Warning: this function is slow for very long strings. }
begin
  Result := Str1;
  dec(Result);
  repeat
    inc(Result);
    Result := StrIScan(Result, Str2^);
  until (Result = nil) or (StrLIComp(Result, Str2, StrLen(Str2)) = 0);
end;

function StrIScan(Str: PChar; Chr: Char): PChar;
asm
  push  edi                 // save edi
  push  eax                 // save eax (Str addr)
  mov   edi, Str            // store Str in edi
  mov   ecx, $FFFFFFFF      // max counter
  xor   al, al              // null char in al
  repne scasb               // search for null
  not   ecx                 // ecx = length of Str
  pop   edi                 // restore Str in edi
  mov   al, Chr             // put Chr in al
  cmp   al, 'a'             // if al is lowercase...
  jb    @@1
  cmp   al, 'z'
  ja    @@1
  sub   al, $20             // force al to uppercase
@@1:
  mov   ah, byte ptr [EDI]  // put char from Str in ah
  cmp   ah, 'a'             // if al is lowercase...
  jb    @@2
  cmp   ah, 'z'
  ja    @@2
  sub   ah, $20             // force al to uppercase
@@2:
  inc   edi                 // inc to next char in string
  cmp   al, ah              // are chars the same?
  je    @@3                 // jump if yes
  loop  @@1                 // loop if no
  mov   eax, 0              // if char is not in string...
  jne   @@4                 // go to end of proc
@@3:                        // if char is in string...
  mov   eax, edi            // move char position into eax
  dec   eax                 // go back one character because of inc edi
@@4:
  pop   edi                 // restore edi
end;

function StrLastPos(Str1, Str2: PChar): PChar;
var
  Found: Boolean;
begin
  if (Str1 <> nil) and (Str2 <> nil) and (StrLen(Str1) >= StrLen(Str2)) then
  begin
    Found := False;
    Result := Str1;
    inc(Result, StrLen(Str1) - StrLen(Str2));
    repeat
      if StrPos(Result, Str2) <> nil then
        Found := True
      else
        dec(Result);
    until (Result <= Str1) or Found;
    if not Found then Result := nil;
  end
  else
    Result := nil;
end;

procedure StrReverse(P: PChar);
var
  E: PChar;
  c: char;
begin
  if StrLen(P) > 1 then begin
    E := P;
    inc(E, StrLen(P) - 1);          // E -> last char in P
    repeat
      c := P^;                      // store beginning char in temp
      P^ := E^;                     // store end char in beginning
      E^ := c;                      // store temp char in end
      inc(P);                       // increment beginning
      dec(E);                       // decrement end
    until abs(Integer(P) - Integer(E)) <= 1;
  end;
end;

{返回中文大写数字}
function GetChinaNum(Num:TNumChar;ChinaNumFormat:TChinaNumFormat=cnfBig):string;
begin
  case ChinaNumFormat of
    cnfArab:begin
      case Num of
        '0':Result:='0';
        '1':Result:='1';
        '2':Result:='2';
        '3':Result:='3';
        '4':Result:='4';
        '5':Result:='5';
        '6':Result:='6';
        '7':Result:='7';
        '8':Result:='8';
        '9':Result:='9';
      end;
    end;
    cnfBig:begin
      case Num of
        '0':Result:='零';
        '1':Result:='壹';
        '2':Result:='贰';
        '3':Result:='叁';
        '4':Result:='肆';
        '5':Result:='伍';
        '6':Result:='陆';
        '7':Result:='柒';
        '8':Result:='捌';
        '9':Result:='玖';
      end;
    end;
    cnfSmall:begin
      case Num of
        '0':Result:='零';
        '1':Result:='一';
        '2':Result:='二';
        '3':Result:='三';
        '4':Result:='四';
        '5':Result:='五';
        '6':Result:='六';
        '7':Result:='七';
        '8':Result:='八';
        '9':Result:='九';
      end;
    end;
  end;
end;

{将数字变成中文大写}
function FloatToChinaBig(Num:Double;ChinaBigFormat:TChinaBigFormat=cbfFull;Blanks:Byte=0):string;
var
  Str:string;
  AgainstStr:string;
  NumStr:string;
  i,j:Integer;
  AllNumLength:Integer;
  TempStr:string;
begin
  if Blanks>15 then Blanks:=17;
  NumStr:=CurrToStrF(Num,ffFixed,2);
  Delete(NumStr,Pos('.',NumStr),1);
  AllNumLength:=Length(NumStr);
  if Blanks<=AllNumLength then Blanks:=AllNumLength
  else begin
    TempStr:='';
    for i:=1 to Blanks-AllNumLength do
    begin
      TempStr:=TempStr+'0';
    end;
    NumStr:=TempStr+NumStr;
  end;
  NumStr:=ReverseStr(NumStr);
  Str:=FormatFloat('0佰0拾0万0仟0佰0拾0亿0仟0佰0拾0万0仟0佰0拾0圆.0角0分',Num);
  Delete(Str,Pos('.',Str),1);
  AgainstStr:=ReverseStr(Str);
  AgainstStr:=Copy(AgainstStr,1,3*Blanks);
  if ChinaBigFormat=cbfBlank then
  begin
    AgainstStr:='';
    for i:=1 to Blanks do
      AgainstStr:=AgainstStr+'  '+NumStr[i];
  end;
  j:=0;
  for i:=1 to Blanks do
  begin
    Insert(ReverseStr(GetChinaNum(AgainstStr[3*i+2*j])),AgainstStr,3*i+2*j);
    Inc(j);
  end;
  j:=0;
  for i:=1 to Blanks do
  begin
    Delete(AgainstStr,5*i-j,1);
    Inc(j);
  end;
  Result:=ReverseStr(AgainstStr);
end;

function FloatToChnStr(Value: Real; ClearZero: Boolean; full:Boolean=False): String;
const
  ChnUnit: array[0..13] of string = ('分', '角', '元', '拾', '佰', '仟', '万', '拾', '佰', '仟', '亿', '拾', '佰', '仟');
  ChnNum : array[0..9]  of string = ('零', '壹','贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖');
var
  I: Integer;
  StrValue, StrNum: String;
  ValueLen: Integer;
begin
  if Value <= 0 then
  begin
    Result := '输入参数应大于零。';
    Exit;
  end;
  value:=RoundTo(Value,-2);
  StrValue := IntToStr(Round(Value * 100));
  ValueLen := Length(StrValue);
  Result := '';
  for I := 1 to ValueLen do
  begin
    StrNum := StrValue[I];
    Result := Result + ChnNum[StrToInt(StrNum)] + ChnUnit[ValueLen - I];
  end;
  if ClearZero then
  begin
    Result := StringReplace(Result, '零分', '',   [rfReplaceAll]);
    if Frac(Value)>0.009999 then
      Result := StringReplace(Result, '零角', '零',   [rfReplaceAll])
    else
      Result := StringReplace(Result, '零角', '',   [rfReplaceAll]);
    Result := StringReplace(Result, '零元', '元', [rfReplaceAll]);
    Result := StringReplace(Result, '零拾', '零',   [rfReplaceAll]);
    Result := StringReplace(Result, '零佰', '零',   [rfReplaceAll]);
    Result := StringReplace(Result, '零仟', '零',   [rfReplaceAll]);
    Result := StringReplace(Result, '零万', '万', [rfReplaceAll]);
    Result := StringReplace(Result, '零零', '零',   [rfReplaceAll]);
    Result := StringReplace(Result, '零零', '零',   [rfReplaceAll]);
  end;
  if full then
  begin
    if Frac(Value)<0.009999 then
      Result:=Result+'整';
  end;
end;

{将数字变成英文}
function FloatToEnglish(Num:Double):string;
var
  StrList:TStringList;
  i:Integer;
  StrTemp1,StrTemp2:String;
  NumArray:array [0..3] of Integer;
  NumCount:Integer;
  ResultStr:string;
  Tmp,Tmp1,Tmp2,TmpXiao:Integer;

  function OneNumToEng(Num:Integer;TWO:Integer=0):string;
  begin
    if Two=0 then
    begin
      case Num of
        0:Result:='ZERO';
        1:Result:='ONE';
        2:Result:='TWO';
        3:Result:='THREE';
        4:Result:='FOUR';
        5:Result:='FIVE';
        6:Result:='SIX';
        7:Result:='SEVEN';
        8:Result:='EIGHT';
        9:Result:='NINE';
      end;
    end
    else if Two=1 then
    begin
      case Num of
        1:Result:='TEN';
        2:Result:='TWENTY';
        3:Result:='THIRTY';
        4:Result:='FORTY';
        5:Result:='FIFTY';
        6:Result:='SIXTY';
        7:Result:='SEVENTY';
        8:Result:='EIGHTY';
        9:Result:='NINETY';
      end;
    end
    else if Two=2 then
    begin
      case Num of
        0:Result:='';
        1:Result:='ONE';
        2:Result:='TWO';
        3:Result:='THREE';
        4:Result:='FOUR';
        5:Result:='FIVE';
        6:Result:='SIX';
        7:Result:='SEVEN';
        8:Result:='EIGHT';
        9:Result:='NINE';
      end;
    end;
  end;

  function TwoNumToEng(Num:Integer):string;
  var
    NStr:string;
    One:string;
    Two:string;
    S:string;
  begin
    NStr:=IntToStr(Num);
    if Num<10 then
      Result:=OneNumToEng(Num)
    else begin
      case Num of
        10:Result:='TEN';
        11:Result:='ELEVEN';
        12:Result:='TWELVE';
        13:Result:='THIRTEEN';
        14:Result:='FOURTEEN';
        15:Result:='FIFTEEN';
        16:Result:='SIXTEEN';
        17:Result:='SEVENTEEN';
        18:Result:='EIGHTEEN';
        19:Result:='NINETEEN';
        20:Result:='TWENTY';
        30:Result:='THIRTY';
        40:Result:='FORTY';
        50:Result:='FIFTY';
        60:Result:='SIXTY';
        70:Result:='SEVENTY';
        80:Result:='EIGHTY';
        90:Result:='NINETY';
        else begin
          One:=NStr[1];
          Two:=NStr[2];
          S:=OneNumToEng(StrToInt(One),1);
          S:=S+'-'+OneNumToEng(StrToInt(Two),2);
          Result:=S;
        end;
      end;
    end;
  end;

  function ThreeNumToEng(Num:Integer;Hasand:Boolean=False):string;
  var
    Nstr:string;
    S:string;
    H:Integer;
    R:Integer;
  begin
    Nstr:=IntToStr(Num);
    if Num>=100 then
    begin
      H:=Num div 100;
      R:=Num mod 100;
      if R=0 then
      begin
        S:=OneNumToEng(H)+' '+'HUNDRED';
      end
      else begin
        S:=OneNumToEng(H)+' '+'HUNDRED'+' AND '+TwoNumToEng(R);
      end;
    end
    else begin
      S:=TwoNumToEng(Num);
    end;
    if Hasand then
    begin
      if S='ZERO' then
       Result:='' else
      Result:='AND '+S
    end
    else Result:=S;
  end;

begin

{0               nought;zero;O
1               one
2               two
3               three
4               four
5               five
6               six
7               seven
8               eight
9               nine
10              ten
11              eleven
12              twelve
13              thirteen
14              fourteen
15              fifteen
16              sixteen
17              seventeen
18              eighteen
19              nineteen
20              twenty
21              twenty-one
22              twenty-two
23              twenty-three
30              thirty
32              thirty-two
40              forty
50              fifty
60              sixty
70              seventy
80              eighty
90              ninety
100             one hundred
101             one hundred and one
156             one hundred and fifty-six
192             one hundred and ninety-two
200             two hundred
300             three hundred
400             four hundred
500             five hundred
600             six hundred
700             seven hundred
800             eight hundred
900             nine hundred
1,000           one thousand
1,001           one thousand and one
1,300           thirteen hundred;one thousand and three hundred
2,000           two thousand
2,034           two thousand and thirty-four
6,502           six thousand five hundred and two
38,000          thirty-eight thousand
45,672          forty-five thousand six hundred and seventy-two
500,000         five hundred thousand
1,000,000       one million
3,123,400       three million,one hundred and twenty-three thousand and four hundred
8,000,000       eight million
47,000,000      forty-seven million
900,000,000     nine hundred million
1,000,000,000   a milliard,one milliard(美作:a billion,one billion)
1,050,000,000   one billion and fifty million
10,000,000,000  ten billion
200,000,000,000 two hundred billion
1,000,000,000,000       a billion,one billion(美作:a trillion,one trillion)
6,000,000,000,000       six million million}
  if Num>2000000000 then Raise Exception.Create('数值太大');
  StrList:=TStringList.Create;
  try
    Tmp:=Trunc(Num);
    TmpXiao:=Round((Num-Tmp)*100);
//    ShowMessage(IntToStr(Tmpxiao));
    Tmp1:=Tmp div 1000;
    Tmp2:=Tmp mod 1000;
    while Tmp1>0 do
    begin
      Tmp:=Tmp1;
      StrList.Add(IntToStr(Tmp2));
      Tmp1:=Tmp div 1000;
      Tmp2:=Tmp mod 1000;
    end;
    StrList.Add(IntToStr(Tmp2));
    NumCount:=StrList.Count;
    for i:=0 to NumCount-1 do
    begin
      NumArray[i]:=StrToInt(StrList[i]);
    end;
    case NumCount of
      1:ResultStr:=ThreeNumToEng(NumArray[0]);
      2:ResultStr:=ThreeNumToEng(NumArray[1])+' THOUSAND '+ThreeNumToEng(NumArray[0],True);
      3:begin
        StrTemp1:=ThreeNumToEng(NumArray[1],True);
        if StrTemp1<>'' then
          ResultStr:=ThreeNumToEng(NumArray[2])+' MILLION '+
            StrTemp1+' THOUSAND '+
            ThreeNumToEng(NumArray[0],True)
        else ResultStr:=ThreeNumToEng(NumArray[2])+' MILLION '+
            ThreeNumToEng(NumArray[0],True);
      end;
      4:begin
        StrTemp2:=ThreeNumToEng(NumArray[3])+' BILLION ';
        StrTemp1:=ThreeNumToEng(NumArray[2],True);
        if StrTemp1<>'' then
          StrTemp2:=StrTemp2+StrTemp1;
        StrTemp1:=ThreeNumToEng(NumArray[1],True);
        if StrTemp1<>'' then
          StrTemp2:=StrTemp2+StrTemp1;
        ResultStr:=StrTemp2+ThreeNumToEng(NumArray[0],True);
      end;
    end;
    StrTemp1:=ThreeNumToEng(TmpXiao,True);
    if StrTemp1<>'' then
      ResultStr:=ResultStr+' AND CENTS '+Copy(StrTemp1,5,Length(StrTemp1)-4);
    Result:=ResultStr;
  finally
    StrList.Free;
  end;
end;

{日期用英文}
function DateToEng(ADate:TDate;th:Boolean=False):string;
var
  AYear,AMonth,ADay:Word;
  SYear,SMonth,SDay:string;
begin
  DecodeDate(ADate,AYear,AMonth,ADay);
  case AMonth of
    1:SMonth:='JAN';
    2:SMonth:='FEB';
    3:SMonth:='MAR';
    4:SMonth:='APR';
    5:SMonth:='MAY';
    6:SMonth:='JUN';
    7:SMonth:='JUL';
    8:SMonth:='AUG';
    9:SMonth:='SEP';
    10:SMonth:='OCT';
    11:SMonth:='NOV';
    12:SMonth:='DEC';
  end;
  SDay:=IntToStr(ADay);
  if th then
  begin
    case ADay of
      1,21,31:SDay:=SDay+'st';
      2,22,23:SDay:=SDay+'nd';
      3:SDay:=SDay+'rd';
      4..20:SDay:=SDay+'th';
      24..30:SDay:=SDay+'st';
    end;
  end;
  SYear:=IntToStr(AYear);
  Result:=SMonth+' '+SDay+','+SYear;
end;

{字符串取反}
{function GetAgainstStr(Str:string):string;
var
  i,StrLength:Integer;
  TmpStr:string;
begin
  StrLength:=Length(Str);
  SetLength(TmpStr,StrLength);
  for i:=1 to StrLength do TmpStr[i]:=Str[StrLength+1-i];
  Result:=TmpStr;
end;}

{取得SQL日期字符串}
function DateToSQLDateStr(ADate:TDateTime):string;
begin
  Result:=FormatDateTime('mm"/"dd"/"yyyy',ADate);
end;

function StrToSQLDateStr(Str:string):string;
var
  StrDate:TDateTime;
begin
  StrDate:=StrToDateTime(Str);
  Result:=DateToSQLDateStr(StrDate);
end;

function TimeToSQLTimeStr(ATime:TDateTime):string;
begin
  Result:=FormatDateTime('hh":"nn":"ss',ATime);
end;

function StrToSQLTimeStr(Str:string):string;
var
  StrTime:TDateTime;
begin
  StrTime:=StrToDateTime(Str);
  Result:=TimeToSQLTimeStr(StrTime);
end;

function DateTimeToSQLDateTimeStr(ADateTime:TDateTime):string;
begin
  Result:=FormatDateTime('mm"/"dd"/"yyyy hh":"nn":"ss',ADateTime);
end;

function StrToSQLDateTimeStr(Str:string):string;
var
  StrDateTime:TDateTime;
begin
  StrDateTime:=StrToDateTime(Str);
  Result:=DateTimeToSQLDateTimeStr(StrDateTime);
end;

{返回有逗号的金额字符串}
function FloatToMoneyStr(Num:Double;const HasSymbol:Boolean=False):string;
begin
  if HasSymbol then Result:=CurrToStrF(Num,ffCurrency,2)
  else Result:=CurrToStrF(Num,ffNumber,2);
end;

{Bool与字符串的转换}
function StrToBool(const Str:string):Boolean;
begin
  if CompareText('True',Str)=0 then Result:=True
  else Result:=False;
end;

function BoolToStr(const Bool:Boolean):string;
begin
  if Bool then Result:='True'
  else Result:='False';
end;

{判断是否日期等}
type
  TDateOrder = (doMDY, doDMY, doYMD);

function CurrentYear: Word;
var
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  Result := SystemTime.wYear;
end;

function DoEncodeTime(Hour, Min, Sec, MSec: Word; var Time: TDateTime): Boolean;
begin
  Result := False;
  if (Hour < 24) and (Min < 60) and (Sec < 60) and (MSec < 1000) then
  begin
    Time := (Hour * 3600000 + Min * 60000 + Sec * 1000 + MSec) / MSecsPerDay;
    Result := True;
  end;
end;

function DoEncodeDate(Year, Month, Day: Word; var Date: TDateTime): Boolean;
var
  I: Integer;
  DayTable: PDayTable;
begin
  Result := False;
  DayTable := @MonthDays[IsLeapYear(Year)];
  if (Year >= 1) and (Year <= 9999) and (Month >= 1) and (Month <= 12) and
    (Day >= 1) and (Day <= DayTable^[Month]) then
  begin
    for I := 1 to Month - 1 do Inc(Day, DayTable^[I]);
    I := Year - 1;
    Date := I * 365 + I div 4 - I div 100 + I div 400 + Day - DateDelta;
    Result := True;
  end;
end;

procedure ScanBlanks(const S: string; var Pos: Integer);
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(S)) and (S[I] = ' ') do Inc(I);
  Pos := I;
end;

function ScanNumber(const S: string; var Pos: Integer;
  var Number: Word; var CharCount: Byte): Boolean;
var
  I: Integer;
  N: Word;
begin
  Result := False;
  CharCount := 0;
  ScanBlanks(S, Pos);
  I := Pos;
  N := 0;
  while (I <= Length(S)) and (S[I] in ['0'..'9']) and (N < 1000) do
  begin
    N := N * 10 + (Ord(S[I]) - Ord('0'));
    Inc(I);
  end;
  if I > Pos then
  begin
    CharCount := I - Pos;
    Pos := I;
    Number := N;
    Result := True;
  end;
end;

function ScanString(const S: string; var Pos: Integer;
  const Symbol: string): Boolean;
begin
  Result := False;
  if Symbol <> '' then
  begin
    ScanBlanks(S, Pos);
    if AnsiCompareText(Symbol, Copy(S, Pos, Length(Symbol))) = 0 then
    begin
      Inc(Pos, Length(Symbol));
      Result := True;
    end;
  end;
end;

function ScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean;
begin
  Result := False;
  ScanBlanks(S, Pos);
  if (Pos <= Length(S)) and (S[Pos] = Ch) then
  begin
    Inc(Pos);
    Result := True;
  end;
end;

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'E': Result := doYMD;
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;

procedure ScanToNumber(const S: string; var Pos: Integer);
begin
  while (Pos <= Length(S)) and not (S[Pos] in ['0'..'9']) do
  begin
    if S[Pos] in LeadBytes then Inc(Pos);
    Inc(Pos);
  end;
end;

function GetEraYearOffset(const Name: string): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(EraNames) to High(EraNames) do
  begin
    if EraNames[I] = '' then Break;
    if AnsiStrPos(PChar(EraNames[I]), PChar(Name)) <> nil then
    begin
      Result := EraYearOffsets[I];
      Exit;
    end;
  end;
end;

function ScanDate(const S: string; var Pos: Integer;
  var Date: TDateTime): Boolean;
var
  DateOrder: TDateOrder;
  N1, N2, N3, Y, M, D: Word;
  L1, L2, L3, YearLen: Byte;
  EraName : string;
  EraYearOffset: Integer;
  CenturyBase: Integer;

  function EraToYear(Year: Integer): Integer;
  begin
    if SysLocale.PriLangID = LANG_KOREAN then
    begin
      if Year <= 99 then
        Inc(Year, (CurrentYear + Abs(EraYearOffset)) div 100 * 100);
      if EraYearOffset > 0 then
        EraYearOffset := -EraYearOffset;
    end
    else
      Dec(EraYearOffset);
    Result := Year + EraYearOffset;
  end;

begin
  Y := 0;
  M := 0;
  D := 0;
  YearLen := 0;
  Result := False;
  DateOrder := GetDateOrder(ShortDateFormat);
  EraYearOffset := 0;
  if ShortDateFormat[1] = 'g' then  // skip over prefix text
  begin
    ScanToNumber(S, Pos);
    EraName := Trim(Copy(S, 1, Pos-1));
    EraYearOffset := GetEraYearOffset(EraName);
  end
  else
    if AnsiPos('e', ShortDateFormat) > 0 then
      EraYearOffset := EraYearOffsets[1];
  if not (ScanNumber(S, Pos, N1, L1) and ScanChar(S, Pos, DateSeparator) and
    ScanNumber(S, Pos, N2, L2)) then Exit;
  if ScanChar(S, Pos, DateSeparator) then
  begin
    if not ScanNumber(S, Pos, N3, L3) then Exit;
    case DateOrder of
      doMDY: begin Y := N3; YearLen := L3; M := N1; D := N2; end;
      doDMY: begin Y := N3; YearLen := L3; M := N2; D := N1; end;
      doYMD: begin Y := N1; YearLen := L1; M := N2; D := N3; end;
    end;
    if EraYearOffset > 0 then
      Y := EraToYear(Y)
    else if (YearLen <= 2) then
    begin
      CenturyBase := CurrentYear - TwoDigitYearCenturyWindow;
      Inc(Y, CenturyBase div 100 * 100);
      if (TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
        Inc(Y, 100);
    end;
  end else
  begin
    Y := CurrentYear;
    if DateOrder = doDMY then
    begin
      D := N1; M := N2;
    end else
    begin
      M := N1; D := N2;
    end;
  end;
  ScanChar(S, Pos, DateSeparator);
  ScanBlanks(S, Pos);
  if SysLocale.FarEast and (System.Pos('ddd', ShortDateFormat) <> 0) then
  begin     // ignore trailing text
    if ShortTimeFormat[1] in ['0'..'9'] then  // stop at time digit
      ScanToNumber(S, Pos)
    else  // stop at time prefix
      repeat
        while (Pos <= Length(S)) and (S[Pos] <> ' ') do Inc(Pos);
        ScanBlanks(S, Pos);
      until (Pos > Length(S)) or
        (AnsiCompareText(TimeAMString, Copy(S, Pos, Length(TimeAMString))) = 0) or
        (AnsiCompareText(TimePMString, Copy(S, Pos, Length(TimePMString))) = 0);
  end;
  Result := DoEncodeDate(Y, M, D, Date);
end;

function ScanTime(const S: string; var Pos: Integer;
  var Time: TDateTime): Boolean;
var
  BaseHour: Integer;
  Hour, Min, Sec, MSec: Word;
  Junk: Byte;
begin
  Result := False;
  BaseHour := -1;
  if ScanString(S, Pos, TimeAMString) or ScanString(S, Pos, 'AM') then
    BaseHour := 0
  else if ScanString(S, Pos, TimePMString) or ScanString(S, Pos, 'PM') then
    BaseHour := 12;
  if BaseHour >= 0 then ScanBlanks(S, Pos);
  if not ScanNumber(S, Pos, Hour, Junk) then Exit;
  Min := 0;
  if ScanChar(S, Pos, TimeSeparator) then
    if not ScanNumber(S, Pos, Min, Junk) then Exit;
  Sec := 0;
  if ScanChar(S, Pos, TimeSeparator) then
    if not ScanNumber(S, Pos, Sec, Junk) then Exit;
  MSec := 0;
  if ScanChar(S, Pos, DecimalSeparator) then
    if not ScanNumber(S, Pos, MSec, Junk) then Exit;
  if BaseHour < 0 then
    if ScanString(S, Pos, TimeAMString) or ScanString(S, Pos, 'AM') then
      BaseHour := 0
    else
      if ScanString(S, Pos, TimePMString) or ScanString(S, Pos, 'PM') then
        BaseHour := 12;
  if BaseHour >= 0 then
  begin
    if (Hour = 0) or (Hour > 12) then Exit;
    if Hour = 12 then Hour := 0;
    Inc(Hour, BaseHour);
  end;
  ScanBlanks(S, Pos);
  Result := DoEncodeTime(Hour, Min, Sec, MSec, Time);
end;

function IsDate(const CheckString:string):Boolean;
var
  Pos: Integer;
  Date:TDateTime;
begin
  Pos := 1;
  Result:=ScanDate(CheckString, Pos, Date) or (Pos <= Length(CheckString)); 
end;

function IsDateTime(const CheckString:string):Boolean;
var
  Pos,Pos1: Integer;
  Date, Time: TDateTime;
  DateTime:TDateTime;
begin
  Pos := 1;
  Pos1:=1;
  Time := 0;
  Result:=ScanDate(CheckString,Pos,Date) or not ((Pos > Length(CheckString)) or
    ScanTime(CheckString, Pos, Time)) or
      (ScanTime(CheckString, Pos1, DateTime) or (Pos1 <= Length(CheckString)));
end;

function IsTime(const CheckString:string):Boolean;
var
  Pos: Integer;
  v:TDateTime;
begin
  Pos := 1;
  Result:=ScanTime(CheckString, Pos, v) or (Pos <= Length(CheckString))
end;

{$HINTS OFF}
function IsInteger(const CheckString:string):Boolean;
var
  V,Code:Integer;
begin
  Val(CheckString,V,Code);
  Result := code = 0;
end;
{$HINTS ON}

function IsFloat(const CheckString:string):Boolean;
var
  V:Extended;
begin
  Result:=TextToFloat(PChar(CheckString), V, fvExtended);
end;

{多字符串ShowMessage}
procedure ShowMessages(const Strings:array of string);
var
  i:Integer;
  S:string;
begin
  for i:=Low(Strings) to High(Strings) do
  begin
    S:=S+Strings[i]+#13#10;
  end;
  ShowMessage(S);
end;

{新名称}
function NameToNewName(const Str:string):string;
var
  StrPart,NumPart:string;
  i,LengStr:Integer;
begin
  LengStr:=Length(Str);
  i:=LengStr;
  if Str[i] in ['0'..'9'] then
  begin
    NumPart:=Str[i]+NumPart;
    Dec(i);
    while Str[i] in ['1'..'9'] do
    begin
      NumPart:=Str[i]+NumPart;
      Dec(i);
    end;
  end;
  StrPart:=Copy(Str,1,i);
  if Length(NumPart)=0 then NumPart:='1'
  else NumPart:=IntToStr(StrToInt(NumPart)+1);
  Result:=StrPart+NumPart;
end;

{FloatTo%百分比}
function FloatToRate(Num:Double;Pos:Word):string;
var
  TempNum:Double;
  Str:string;
begin
  TempNum:=100*Num;
  Str:=FloatToStrF(TempNum,ffGeneral,Pos,15);
  Str:=Str+'%';
  Result:=Str;
end;

function Power(X,Y:Extended):Extended;
begin
  Result:=Exp(Y*LN(X));
end;

{关闭计算机}
function WinExit (iFlags: integer) : Boolean;
{0:注销
 1:关闭计算机
 2:重新启动计算机
 4:强制注销(不保存状态)
 8:关闭电源
 16:注销}

  function SetPrivilege (sPrivilegeName: string; bEnabled: Boolean) : Boolean;
  var
    TPPrev,TP: TTokenPrivileges;
    Token    : THandle;
    dwRetLen : DWORD;
  begin
    result := False;
    OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, Token);
    TP.PrivilegeCount := 1;
    if LookupPrivilegeValue (nil, PChar (sPrivilegeName), TP.Privileges[0].LUID) then
    begin
      if bEnabled then TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
      else TP.Privileges[0].Attributes := 0;
      dwRetLen := 0;
      result := AdjustTokenPrivileges(Token, False, TP, SizeOf (TPPrev), TPPrev,dwRetLen);
    end;
    CloseHandle(Token);
  end;

begin
  Result:=False;
  if SetPrivilege ('SeShutdownPrivilege', true) then
  begin
    if  ExitWindowsEx(iFlags, 0) then result:=True;
    SetPrivilege ('SeShutdownPrivilege', False);
  end
end;

{防止开启多个应用程序}
procedure PreventMany(Name:string);
begin
  CreateMutex(Nil,false,PChar(Name));
  if GetLastError=Error_ALREADY_EXISTS then
  begin
    SendMessage(HWND_BROADCAST,RegisterWindowMessage(PChar(Name)),0,0);
    Halt(0);
  end;
end;

{TStrings，在Combobox中添加或者删除一个字符串}
procedure StringsOperation(ComboBox:TComboBox;IsAdd:Boolean;No:string='');
var
  I:Integer;
begin
  if IsAdd then
  begin
    ComboBox.Items.Add(No);
    ComboBox.ItemIndex:=ComboBox.Items.IndexOf(No);
  end
  else begin
    I:=ComboBox.ItemIndex;
    if I>-1 then
    begin
      ComboBox.Items.Delete(i);
      if ComboBox.Items.Count>0 then
      begin
        if i=ComboBox.Items.Count then
          i:=i-1;
        ComboBox.ItemIndex:=i;
      end
    end;
  end;
end;

function FloatToNewFloat(AValue:Double):Double;
var
  IntPart,PointPart:Integer;
begin
  IntPart:=Trunc(AValue);
  PointPart:=Round(10000*(AValue-IntPart));
  if (PointPart>=1)and(PointPart<99) then
  begin
    AValue:=RoundTo(AValue,-4);
  end
  else if (PointPart>=100)and(PointPart<999) then
  begin
    AValue:=RoundTo(AValue,-3);
  end
  else if (PointPart>=1000)and(PointPart<9999) then
  begin
    AValue:=RoundTo(AValue,-2);
  end;
  Result:=AValue;
end;

function FloatToNewFloatN(AValue:Double;N:Word=4):Double;
var
  IntPart,PointPart:Integer;
  NN:Word;
  K:Integer;

  function EE(T:Word):Word;
  var
    PP:Word;
    KK:Word;
  begin
    PP:=1;
    KK:=0;
    Repeat
      PP:=PP*10;
      Inc(KK);
    until KK>=T;
    Result:=PP;
  end;
begin
  NN:=EE(N);
  IntPart:=Trunc(AValue);
  PointPart:=Round(NN*(AValue-IntPart));
  K:=N;
  while K>2 do
  begin
    if (PointPart>NN+1-EE(K))and(PointPart<NN-1-EE(K-1)) then
    begin
      AValue:=RoundTo(AValue,-K);
      Break;
    end
    else K:=K-1;
  end;
  Result:=AValue;
end;

function Order(N: Word): Extended;
begin
  if N>1754 then
    raise Exception.Create('数值太大');
  if N>1 then
    Result:=N * Order(N-1)
  else
    Result:=1;
end;

function GetFloatPointNum(Fl:Double):Integer;
var
  S:string;
begin
  S:=FloatToStr(Fl+1);
  Result:=Length(S)-Pos('.',S);
end;

procedure FontRecordToFont(FontRecord:TFontRecord;Font:TFont);
begin
  with FontRecord do
  begin
    Font.Charset:=CharSet;
    Font.Color:=Color;
    Font.Name:=Name;
    Font.Size:=Size;
    case Pitch of
      0:Font.Pitch:=fpDefault;
      1:Font.Pitch:=fpVariable;
      2:Font.Pitch:=fpFixed;
    end;
    Font.Style:=IntToFontStyles(Style);
  end;
end;

function FontToFontRecord(Font:TFont):TFontRecord;
begin
  with Font do
  begin
    Result.CharSet:=Charset;
    Result.Color:=Color;
    Result.Height:=Height;
    Result.Name:=Name;
    case Pitch of
      fpDefault:Result.Pitch:=0;
      fpVariable:Result.Pitch:=1;
      fpFixed:Result.Pitch:=2;
    end;
    Result.Size:=Size;
    Result.PixelsPerInch:=PixelsPerInch;
    Result.Style:=FontStylesToInt(Style);
  end;
end;

function FontStylesToInt(FontStyles:TFontStyles):Byte;
var
  T:Integer;
begin
  T:=0;
  if fsBold in FontStyles then
    T:=T+8;
  if fsItalic in FontStyles then
    T:=T+4;
  if fsUnderline in FontStyles then
    T:=T+2;
  if fsStrikeOut in FontStyles then
    T:=T+1;
  Result:=T;
end;

function IntToFontStyles(FontInteger:Byte):TFontStyles;
var
  FontT:TFontStyles;
begin
  if (FontInteger>15) then
  begin
    Result:=[];
    Exit;
  end;
  FontT:=[];
  if FontInteger>=8 then
  begin
    FontT:=FontT+[fsBold];
    FontInteger:=FontInteger-8;
  end;
  if FontInteger>=4 then
  begin
    FontT:=FontT+[fsItalic];
    FontInteger:=FontInteger-4;
  end;
  if FontInteger>=2 then
  begin
    FontT:=FontT+[fsUnderline];
    FontInteger:=FontInteger-2;
  end;
  if FontInteger>=1 then
    FontT:=FontT+[fsStrikeOut];
  Result:=FontT;
end;

end.


