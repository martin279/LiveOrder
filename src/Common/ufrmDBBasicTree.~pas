unit ufrmDBBasicTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasic, PropFilerEh, ComCtrls, DB, ADODB, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, DBCtrls,
  ToolWin, ExtCtrls, Buttons;

type
  TfrmDBBasicTree = class(TfrmDBBasic)
    TreeView1: TTreeView;
    pnlBodyLeft: TPanel;
    pnlBodyLeftTop: TPanel;
    cbbTreeType: TComboBox;
    sbtnRefresh: TSpeedButton;
    Splitter1: TSplitter;
    N2: TMenuItem;
    procedure sbtnRefreshClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure cbbTreeTypeChange(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); virtual;
  public
    { Public declarations }
  end;


implementation


{$R *.dfm}

procedure TfrmDBBasicTree.InitializeForm;
begin
  inherited;
  LoadTreeView(cbbTreeType.Text);
end;

procedure TfrmDBBasicTree.DestoryForm;
begin
  inherited;
end;

procedure TfrmDBBasicTree.SetData;
begin
  inherited;
end;

procedure TfrmDBBasicTree.SetUI;
begin
  inherited;
  TreeView1.ReadOnly := true;
end;

procedure TfrmDBBasicTree.SetAccess;
begin
  inherited;
end;

procedure TfrmDBBasicTree.LoadTreeView(nodeName: string);
begin
  TreeView1.Items.Clear;
  TreeView1.Font.Size := 10;
  GroupBox1.Font.Style := [fsBold, fsItalic];
  GroupBox1.Font.Size := 12;
  gridData.ReadOnly := true;
  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
end;

procedure TfrmDBBasicTree.sbtnRefreshClick(Sender: TObject);
begin
  LoadTreeView(cbbTreeType.Text);
end;

procedure TfrmDBBasicTree.cbbTreeTypeChange(Sender: TObject);
begin
  inherited;
  sbtnRefresh.Click;
end;

procedure TfrmDBBasicTree.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  if Node = nil then exit;
  GroupBox1.Caption := Node.Text;
  RecoverGrid(gridData, ds_active);
end;

end.

