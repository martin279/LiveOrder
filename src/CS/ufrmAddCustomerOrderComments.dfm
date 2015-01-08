inherited frmAddCustomerOrderComments: TfrmAddCustomerOrderComments
  Left = 457
  Top = 187
  Width = 645
  Height = 407
  Caption = 'frmAddCustomerOrderComments'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 13
    Top = 31
    Width = 40
    Height = 13
    Caption = 'Order ID'
  end
  object Label14: TLabel
    Left = 110
    Top = 31
    Width = 59
    Height = 13
    Caption = 'Order States'
  end
  object dbedtCustomerOrderID: TDBEditEh
    Left = 55
    Top = 28
    Width = 49
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderID'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 0
    Visible = True
    OnChange = dbedtCustomerOrderIDChange
  end
  object dbedtOrderStates: TDBEditEh
    Left = 174
    Top = 28
    Width = 80
    Height = 21
    Color = clBtnFace
    DataField = 'CustomerOrderStatesName'
    DataSource = ds_active
    EditButtons = <>
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object gboxOrder: TGroupBox
    Left = 8
    Top = 56
    Width = 281
    Height = 82
    Caption = 'Order Information'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 19
      Width = 72
      Height = 13
      Caption = 'Customer Code'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 75
      Height = 13
      Caption = 'Customer Name'
    end
    object Label4: TLabel
      Left = 8
      Top = 61
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object dbtxtCustomerCode: TDBText
      Left = 93
      Top = 19
      Width = 184
      Height = 17
      DataField = 'CustomerNumber'
      DataSource = ds_active
    end
    object dbtxtCustomerName: TDBText
      Left = 93
      Top = 40
      Width = 184
      Height = 17
      DataField = 'CustomerName'
      DataSource = ds_active
    end
    object dbtxtCONumber: TDBText
      Left = 93
      Top = 61
      Width = 184
      Height = 17
      DataField = 'CustomerOrderNumber'
      DataSource = ds_active
    end
  end
  object gboxComments: TGroupBox
    Left = 293
    Top = 26
    Width = 330
    Height = 156
    TabOrder = 3
    object gridComments: TDBGridEh
      Left = 2
      Top = 15
      Width = 326
      Height = 139
      Align = alClient
      DataSource = ds_comments
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = gridCommentsEnter
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CustomerOrderCommentsID'
          Footers = <>
          Title.Caption = 'ID'
          Width = 23
        end
        item
          EditButtons = <>
          FieldName = 'CustomerOrderCommentsTypeName'
          Footers = <>
          Title.Caption = 'Type'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'CustomerOrderCommentsSubCategory'
          Footers = <>
          Title.Caption = 'SubCategory'
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'CommentsContent'
          Footers = <>
          Title.Caption = 'Content'
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'UpdateTime'
          Footers = <>
          Title.Caption = 'Update Time'
          Width = 82
        end>
    end
  end
  object gboxAddComments: TGroupBox
    Left = 8
    Top = 144
    Width = 282
    Height = 217
    Caption = 'Add Comments Type'
    TabOrder = 4
    object Label6: TLabel
      Left = 7
      Top = 49
      Width = 37
      Height = 13
      Caption = 'Content'
    end
    object Label1: TLabel
      Left = 7
      Top = 20
      Width = 24
      Height = 13
      Caption = 'Type'
    end
    object memoContent: TMemo
      Left = 52
      Top = 47
      Width = 225
      Height = 125
      TabOrder = 0
    end
    object dbcbbCommentsType: TDBLookupComboboxEh
      Left = 53
      Top = 20
      Width = 225
      Height = 21
      DropDownBox.Columns = <
        item
          FieldName = 'CustomerOrderCommentsTypeName'
          Title.Caption = 'Type'
        end
        item
          FieldName = 'CustomerOrderCommentsSubCategory'
          Title.Caption = 'SubCategory'
          Width = 304
        end>
      DropDownBox.SortLocal = True
      DropDownBox.UseMultiTitle = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'CustomerOrderCommentsTypeID'
      ListField = 'CustomerOrderCommentsSubCategory'
      ListSource = ds_type
      TabOrder = 1
      Visible = True
    end
    object btnSave: TButton
      Left = 24
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnExit: TButton
      Left = 160
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Exit'
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  object gboxCommentsAttach: TGroupBox
    Left = 294
    Top = 184
    Width = 330
    Height = 177
    TabOrder = 5
    object gridCommentsAttach: TDBGridEh
      Left = 2
      Top = 32
      Width = 326
      Height = 143
      Align = alClient
      DataSource = ds_attach
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = gridCommentsAttachEnter
      Columns = <
        item
          EditButtons = <>
          FieldName = 'AttachmentName'
          Footers = <>
          Title.Caption = 'Attachment Name'
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Attachment'
          Footers = <>
          Width = 100
        end>
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 15
      Width = 326
      Height = 17
      Align = alTop
      TabOrder = 1
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 302
    Top = 4
    Width = 225
    Height = 22
    DataSource = ds_active
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 6
  end
  object ds_active: TDataSource
    Left = 50
    Top = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 452
    Top = 1
  end
  object adt_comments: TADODataSet
    AfterScroll = adt_commentsAfterScroll
    Parameters = <>
    Left = 156
    Top = 1
    object adt_commentsCustomerOrderCommentsID: TAutoIncField
      FieldName = 'CustomerOrderCommentsID'
      ReadOnly = True
    end
    object adt_commentsCustomerOrderID: TIntegerField
      FieldName = 'CustomerOrderID'
    end
    object adt_commentsCustomerOrderCommentsTypeID: TIntegerField
      FieldName = 'CustomerOrderCommentsTypeID'
    end
    object adt_commentsCommentsContent: TStringField
      FieldName = 'CommentsContent'
      Size = 500
    end
    object adt_commentsUpdateTime: TDateTimeField
      FieldName = 'UpdateTime'
    end
    object adt_commentsCustomerOrderCommentsTypeName: TStringField
      FieldName = 'CustomerOrderCommentsTypeName'
      Size = 50
    end
    object adt_commentsCustomerOrderCommentsSubCategory: TStringField
      FieldName = 'CustomerOrderCommentsSubCategory'
      Size = 50
    end
  end
  object ds_comments: TDataSource
    DataSet = adt_comments
    Left = 196
    Top = 1
  end
  object adt_type: TADODataSet
    Parameters = <>
    Left = 90
    Top = 1
  end
  object adt_attach: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from CustomerOrderCommentsAttachment'
    Parameters = <>
    Left = 244
    Top = 1
    object adt_attachCustomerOrderCommentsAttachID: TAutoIncField
      FieldName = 'CustomerOrderCommentsAttachID'
      ReadOnly = True
    end
    object adt_attachCustomerOrderCommentsID: TIntegerField
      FieldName = 'CustomerOrderCommentsID'
    end
    object adt_attachAttachmentName: TStringField
      FieldName = 'AttachmentName'
      Size = 50
    end
    object adt_attachAttachment: TBlobField
      FieldName = 'Attachment'
    end
  end
  object ds_type: TDataSource
    DataSet = adt_type
    Left = 122
    Top = 1
  end
  object ds_attach: TDataSource
    DataSet = adt_attach
    Left = 276
    Top = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 522
    Top = 4
    object MenuUploadAttachment: TMenuItem
      Caption = 'Upload Attachment'
      OnClick = MenuUploadAttachmentClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuDeleteComments: TMenuItem
      Caption = 'Delete Comments'
      OnClick = MenuDeleteCommentsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuDowloadAttachment: TMenuItem
      Caption = 'Dowload Attachment'
      OnClick = MenuDowloadAttachmentClick
    end
    object MenuOpenAttachment: TMenuItem
      Caption = 'Open Attachment'
      OnClick = MenuOpenAttachmentClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuDeleteAttachment: TMenuItem
      Caption = 'Delete Attachment'
      OnClick = MenuDeleteAttachmentClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 484
    Top = 1
  end
end
