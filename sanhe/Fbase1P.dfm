object fbase1: Tfbase1
  Left = 0
  Top = 0
  Caption = 'fbase1'
  ClientHeight = 473
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 734
    Height = 54
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    ButtonHeight = 52
    ButtonWidth = 45
    Caption = 'ToolBar1'
    Color = clGradientInactiveCaption
    Ctl3D = False
    DrawingStyle = dsGradient
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = False
    GradientEndColor = 14737632
    GradientStartColor = clBtnFace
    Images = duPub.ImageList1
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    object tb_Browse: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'Browse'
      ImageIndex = 0
    end
    object Tb_Edit: TToolButton
      Left = 46
      Top = 0
      AutoSize = True
      Caption = 'Edit'
      ImageIndex = 1
    end
    object tb_Append: TToolButton
      Left = 85
      Top = 0
      AutoSize = True
      Caption = 'Append'
      ImageIndex = 2
    end
    object tb_revise: TToolButton
      Left = 133
      Top = 0
      AutoSize = True
      Caption = 'Revise'
      ImageIndex = 3
    end
    object tb_Copy: TToolButton
      Left = 176
      Top = 0
      AutoSize = True
      Caption = 'Copy'
      ImageIndex = 4
    end
    object tb_Delete: TToolButton
      Left = 215
      Top = 0
      AutoSize = True
      Caption = 'Delete'
      ImageIndex = 5
    end
    object tb_Seperator1: TToolButton
      Left = 257
      Top = 0
      Width = 8
      Caption = 'tb_Seperator1'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object tb_Filter: TToolButton
      Left = 265
      Top = 0
      AutoSize = True
      Caption = 'Filter'
      ImageIndex = 6
      OnClick = tb_FilterClick
    end
    object tb_Unfilter: TToolButton
      Left = 304
      Top = 0
      AutoSize = True
      Caption = 'Unfilter'
      Enabled = False
      ImageIndex = 7
      OnClick = tb_UnfilterClick
    end
    object tb_Seperator2: TToolButton
      Left = 350
      Top = 0
      Width = 8
      Caption = 'tb_Seperator2'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tb_Save: TToolButton
      Left = 358
      Top = 0
      Caption = 'Save'
      ImageIndex = 9
    end
    object tbCancel: TToolButton
      Left = 403
      Top = 0
      Caption = 'Cancel'
      ImageIndex = 10
    end
    object tb_Seperator3: TToolButton
      Left = 448
      Top = 0
      Width = 8
      Caption = 'tb_Seperator3'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object tbRefresh: TToolButton
      Left = 456
      Top = 0
      Caption = 'Refresh'
      ImageIndex = 8
    end
    object tb_Exit: TToolButton
      Left = 501
      Top = 0
      Caption = 'Exit'
      ImageIndex = 11
      OnClick = tb_ExitClick
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 451
    Width = 734
    Height = 22
    Align = alBottom
    AutoSize = True
    ButtonWidth = 30
    Caption = 'ToolBar2'
    Ctl3D = False
    EdgeInner = esLowered
    Images = duPub.ImageListNav
    TabOrder = 1
    Transparent = True
    DesignSize = (
      734
      22)
    object nav_First: TToolButton
      Left = 0
      Top = 0
      Caption = 'nav_First'
      ImageIndex = 0
    end
    object nav_Proid: TToolButton
      Left = 30
      Top = 0
      Caption = 'nav_Proid'
      ImageIndex = 1
      Style = tbsTextButton
    end
    object rec_Edit: TEdit
      AlignWithMargins = True
      Left = 60
      Top = 0
      Width = 89
      Height = 22
      TabStop = False
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSelect = False
      BevelInner = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object nav_Next: TToolButton
      Left = 149
      Top = 0
      Caption = 'nav_Next'
      ImageIndex = 2
    end
    object nav_Last: TToolButton
      Left = 179
      Top = 0
      Caption = 'nav_Last'
      ImageIndex = 3
    end
    object ToolButton2: TToolButton
      Left = 209
      Top = 0
      Width = 7
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 54
    Width = 734
    Height = 91
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 2
    Visible = False
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 145
    Width = 734
    Height = 306
    Align = alClient
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dSource1: TDADataSource
    Left = 637
    Top = 9
  end
end
