unit ufrmDBBasicPrn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasic, PropFilerEh, PropStorageEh, PrnDbgeh, Menus, DB,
  ADODB, ActnList, ImgList, GridsEh, DBGridEh, StdCtrls, DBCtrls, ComCtrls,
  ToolWin, ExtCtrls, PrViewEh;

type
  TfrmDBBasicPrn = class(TfrmDBBasic)
    PreviewSetupPanel: TPanel;
    lPageinfo: TLabel;
    bPrint: TButton;
    bPrinterSetup: TButton;
    bPrevPage: TButton;
    bNextPage: TButton;
    bStop: TButton;
    bClosePreview: TButton;
    PreviewBox1: TPreviewBox;
    PrintDBGridEh1: TPrintDBGridEh;
    ppmPreview: TMenuItem;
    ppmInplacepreview: TMenuItem;
    procedure PreviewBox1PrinterPreviewChanged(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure bPrinterSetupClick(Sender: TObject);
    procedure bPrevPageClick(Sender: TObject);
    procedure bNextPageClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure bClosePreviewClick(Sender: TObject);
    procedure ppmPreviewClick(Sender: TObject);
    procedure ppmInplacepreviewClick(Sender: TObject);
  private
    { Private declarations }
    DBGridEhPreviewIndicatorMenuItem: TDBGridEhMenuItem;
  protected
    procedure SetUI; override;
  public
    { Public declarations }
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
    procedure InplacePreviewSetupDialog(Sender: TObject);
    procedure MenuEditClick(Sender: TObject);
    procedure BuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu);
  end;


implementation

uses DataModule;

{$R *.dfm}

procedure TfrmDBBasicPrn.SetUI;
begin
  inherited SetUI;
  PreviewBox1.Align := alClient;
  DBGridEhCenter.IndicatorTitleMenus :=
    [itmVisibleColumnsEh, itmCut, itmCopy, itmPaste, itmDelete, itmSelectAll];
  DBGridEhCenter.OnBuildIndicatorTitleMenu := BuildIndicatorTitleMenu;
end;

procedure TfrmDBBasicPrn.ApplicationIdle(Sender: TObject;
  var Done: Boolean);
begin
  // Under Delphi 4 and upper better to user Actions to determine
  // enablitity buttons and menus
  try
    //bbCopy.Enabled := gridData.Selection.SelectionType <> gstNon;
    if ActiveControl is TDBGridEh then
      with TDBGridEh(ActiveControl) do
      begin
        ppmCut.Enabled := CheckCutAction and (geaCutEh in EditActions);
        ppmCopy.Enabled := CheckCopyAction and (geaCopyEh in EditActions);
        ppmPaste.Enabled := CheckPasteAction and (geaPasteEh in EditActions);
        ppmDelete.Enabled := CheckDeleteAction and (geaDeleteEh in EditActions);
        ppmSelectAll.Enabled := CheckSelectAllAction and (geaSelectAllEh in EditActions);
        ppmSaveSelection.Enabled := CheckCopyAction and (geaCopyEh in EditActions);
        ppmPreview.Enabled := True;
      end;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmDBBasicPrn.PreviewBox1PrinterPreviewChanged(Sender: TObject);
begin
  bStop.Enabled := PreviewBox1.Printer.Printing;
  bClosePreview.Enabled := not PreviewBox1.Printer.Printing;
  bPrint.Enabled := not PreviewBox1.Printer.Printing;
  bPrinterSetup.Enabled := not PreviewBox1.Printer.Printing;
  bPrevPage.Enabled := PreviewBox1.PageIndex > 1;
  bNextPage.Enabled := PreviewBox1.PageIndex < PreviewBox1.PageCount;
  lPageInfo.Caption := 'Page ' + IntToStr(PreviewBox1.PageIndex) + ' of ' + IntToStr(PreviewBox1.PageCount);
end;

procedure TfrmDBBasicPrn.bPrintClick(Sender: TObject);
begin
  PreviewBox1.PrintDialog;
end;

procedure TfrmDBBasicPrn.bPrinterSetupClick(Sender: TObject);
begin
  PreviewBox1.PrinterSetupDialog;
end;

procedure TfrmDBBasicPrn.bPrevPageClick(Sender: TObject);
begin
  PreviewBox1.PageIndex := Pred(PreviewBox1.PageIndex);
end;

procedure TfrmDBBasicPrn.bNextPageClick(Sender: TObject);
begin
  PreviewBox1.PageIndex := Succ(PreviewBox1.PageIndex);
end;

procedure TfrmDBBasicPrn.bStopClick(Sender: TObject);
begin
  PreviewBox1.Printer.Abort;
end;

procedure TfrmDBBasicPrn.bClosePreviewClick(Sender: TObject);
begin
  PreviewBox1.Visible := False;
  PreviewSetupPanel.Visible := False;
  gridData.Visible := True;
end;

procedure TfrmDBBasicPrn.InplacePreviewSetupDialog(Sender: TObject);
begin
  PreviewBox1.Printer.OnPrinterSetupDialog := InplacePreviewSetupDialog;
  PreviewBox1.Printer.PrinterSetupOwner := gridData;
  if PrintDBGridEh1.PrinterSetupDialog then
    PrintDBGridEh1.PrintTo(PreviewBox1.Printer);
end;

procedure TfrmDBBasicPrn.MenuEditClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := TDBGridEh(TDBGridEhMenuItem(Sender).Grid);
  PrintDBGridEh1.SetSubstitutes(['%[Today]', DateToStr(Now)]);
  PrintDBGridEh1.Preview;
end;

procedure TfrmDBBasicPrn.ppmPreviewClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
  begin
    PrintDBGridEh1.DBGridEh := TDBGridEh(ActiveControl);
    PrintDBGridEh1.SetSubstitutes(['%[Today]', DateToStr(Now)]);
    PrintDBGridEh1.Preview;
  end;
end;

procedure TfrmDBBasicPrn.ppmInplacepreviewClick(Sender: TObject);
begin
  gridData.Visible := False;
  PreviewBox1.Visible := True;
  PreviewBox1.Align := alClient;
  PreviewSetupPanel.Visible := True;
  PreviewBox1.Printer.PrinterSetupOwner := gridData;
  PreviewBox1.Printer.OnPrinterSetupDialog := InplacePreviewSetupDialog;
  PrintDBGridEh1.DBGridEh := gridData;
  PrintDBGridEh1.PrintTo(PreviewBox1.Printer);
end;

procedure TfrmDBBasicPrn.BuildIndicatorTitleMenu(Grid: TCustomDBGridEh;
  var PopupMenu: TPopupMenu);
begin
  inherited;
  if DBGridEhPreviewIndicatorMenuItem = nil then
    DBGridEhPreviewIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    gmi := TDBGridEhMenuItem.Create(PopupMenu);
  DBGridEhPreviewIndicatorMenuItem.Caption := 'Preview';
  DBGridEhPreviewIndicatorMenuItem.OnClick := MenuEditClick;
  DBGridEhPreviewIndicatorMenuItem.Enabled := True;
//  DBGridEhCopyIndicatorMenuItem.TitleMenu := itmCopy;
  DBGridEhPreviewIndicatorMenuItem.Grid := Grid;
  PopupMenu.Items.Insert(PopupMenu.Items.IndexOf(DBGridEhSelectAllIndicatorMenuItem) + 1, DBGridEhPreviewIndicatorMenuItem);
end;



end.
