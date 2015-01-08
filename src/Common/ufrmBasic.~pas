unit ufrmBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmBasic = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExitExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitializeForm; virtual;
    procedure DestoryForm; virtual;
    procedure SetData; virtual;
    procedure SetUI; virtual;
    procedure SetAccess; virtual;
    procedure SetScreenScale;
  public
    { Public declarations }
  end;


implementation

uses uMJ, uDMManager;

{$R *.dfm}

procedure TfrmBasic.FormCreate(Sender: TObject);
begin
  InitializeForm;
end;

procedure TfrmBasic.FormDestroy(Sender: TObject);
begin
  DestoryForm;
end;

procedure TfrmBasic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBasic.InitializeForm;
begin
  SetData;
  SetUI;
  SetAccess;
  if LowerCase(gVars.SetScreenScale) = 'yes' then
    SetScreenScale;
end;

procedure TfrmBasic.SetScreenScale;
var
  ScreenWidth, ScreenHeight: integer;
begin
  scaled := true;
  ScreenWidth := StrToInt(gVars.ScreenWidth);
  ScreenHeight := StrToInt(gVars.ScreenHeight);
  if (screen.width <> ScreenWidth) then
  begin
    height := longint(height) * longint(screen.height) div ScreenHeight;
    width := longint(width) * longint(screen.width) div ScreenWidth;
    scaleBy(screen.width, ScreenWidth);
  end;
end;

procedure TfrmBasic.DestoryForm;
begin

end;

procedure TfrmBasic.SetData;
begin

end;

procedure TfrmBasic.SetUI;
begin
  Font.Name := 'Arial';
  Font.Height := 14;
  //FormStyle := fsMDIChild;
  //WindowState := wsMaximized;
  Caption := Copy(ClassName, 5, length(ClassName));
end;

procedure TfrmBasic.SetAccess;
begin
  case objCurUser.AccessLevel of
    0: //viewer
      begin
      end;
    1: //admin
      begin
        //
      end;
    2: //cs
      begin
        //
      end;
    3: //scheduler
      begin
      end;
    4: //planner
      begin
      end;
    5: //warehouse
      begin
      end;
  end;     
  Position := poMainFormCenter;
end;

procedure TfrmBasic.actExitExecute(Sender: TObject);
begin
  Close();
end;

end.

