unit ufrmTip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMan, Buttons, StdCtrls;

type
  TfrmTip = class(TForm)
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    LabelContent1: TLabel;
    LabelContent2: TLabel;
    LabelTitle: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    ShowBeginTime: TDateTime;
  public
    { Public declarations }
    Step: Integer;
  end;

implementation

uses ufrmMain;


{$R *.dfm}

procedure TfrmTip.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
    EXStyle := EXStyle or WS_EX_TOPMOST or WS_EX_NOACTIVATE;
    wndParent := frmMain.Handle;
  end;
end;

procedure TfrmTip.Timer1Timer(Sender: TObject);
begin
  {Form2.AlphaBlend:=True;
  Form2.AlphaBlendValue:=Form2.AlphaBlendValue-5;
  Form1.ListBox1.Items.Append(inttostr(Form2.AlphaBlendValue));
  if Form2.AlphaBlendValue=0 then begin Timer1.Enabled:=False;end;  }
  case Step of
    1:
      begin
        Self.Top := Self.Top - 1; Self.Height := Self.Height + 1;
        Self.Left := Screen.WorkAreaWidth - Self.Width - 1;
        if Self.Top <= Screen.WorkAreaHeight - 180 then
        begin
          Canvas.MoveTo(Self.Width - 1, Self.Height - 1);
          Canvas.LineTo(0, Self.Height - 1);
          ShowBeginTime := Now;
          Step := 2;
        end;
      end;
    2:
      begin
        Canvas.MoveTo(Self.Width - 1, Self.Height - 1); //添加最下行
        Canvas.LineTo(0, Self.Height - 1); //添加最下行
        if StrToInt(FormatDateTime('s', Now - ShowBeginTime)) >= 16 then
        begin
          Self.AlphaBlendValue := 255;
          //Step := 3;
        end;
      end;
    3:
      begin
        Canvas.MoveTo(Self.Width - 1, Self.Height - 1); //添加最下行
        Canvas.LineTo(0, Self.Height - 1); //添加最下行
        Self.AlphaBlend := true;
        Self.AlphaBlendValue := Self.AlphaBlendValue - 5;
        if Self.AlphaBlendValue = 0 then
        begin
          Timer1.Enabled := false;
        end;
      end;
  end;
  //Timer1.Enabled := false;
end;

procedure TfrmTip.FormPaint(Sender: TObject);
begin
  Canvas.MoveTo(0, Self.Height - 1);
  Canvas.LineTo(0, 0); //绘制左边线
  Canvas.LineTo(Self.Width - 1, 0); //绘制上边线
  Canvas.LineTo(Self.Width - 1, Self.Height); //绘制右边线
end;

procedure TfrmTip.FormResize(Sender: TObject);
begin
  Repaint;
end;

procedure TfrmTip.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTip.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Timer1.Enabled = false then
  begin
    ReleaseCapture; //无标题窗体移动
    SendMessage(Self.Handle, WM_SYSCOMMAND, SC_MOVE + HTCAPTION, 0);
  end; //无标题窗体移动
end;

end.
