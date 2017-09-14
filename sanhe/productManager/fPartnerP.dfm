inherited fPartner: TfPartner
  Caption = #21512#20316#21830
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited tb_Browse: TToolButton
      OnClick = tb_BrowseClick
      ExplicitWidth = 46
    end
    inherited Tb_Edit: TToolButton
      OnClick = Tb_EditClick
      ExplicitWidth = 39
    end
    inherited tb_Append: TToolButton
      OnClick = tb_AppendClick
      ExplicitWidth = 48
    end
    inherited tb_revise: TToolButton
      Visible = False
      ExplicitWidth = 43
    end
    inherited tb_Copy: TToolButton
      Visible = False
      ExplicitWidth = 39
    end
    inherited tb_Delete: TToolButton
      ExplicitWidth = 42
    end
    inherited tb_Filter: TToolButton
      ExplicitWidth = 39
    end
    inherited tb_Unfilter: TToolButton
      ExplicitWidth = 46
    end
    inherited tb_Save: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited tb_Seperator3: TToolButton
      Visible = False
    end
    inherited tbRefresh: TToolButton
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Height = 131
    ExplicitHeight = 131
    object Label4: TLabel
      Left = 25
      Top = 17
      Width = 60
      Height = 16
      Caption = #23458#25143#32534#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 25
      Top = 57
      Width = 53
      Height = 16
      Caption = #32852' '#31995' '#20154
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 304
      Top = 17
      Width = 60
      Height = 16
      Caption = #20844#21496#21517#31216
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 304
      Top = 57
      Width = 60
      Height = 16
      Caption = #32852#31995#30005#35805
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 25
      Top = 97
      Width = 60
      Height = 16
      Caption = #23458#25143#31867#22411
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 99
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 584
      Top = 14
      Width = 75
      Height = 25
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 378
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 99
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 3
    end
    object Edit4: TEdit
      Left = 378
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 4
    end
    object ComboBox1: TComboBox
      Left = 99
      Top = 96
      Width = 145
      Height = 21
      TabOrder = 5
      Items.Strings = (
        #20379#24212#21830
        #23458#25143)
    end
  end
  inherited cxGrid1: TcxGrid
    Top = 185
    Height = 266
    ExplicitTop = 185
    ExplicitHeight = 266
    inherited cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = duPub.ds_p_partners
      object cxGrid1DBTableView1RecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object cxGrid1DBTableView1code: TcxGridDBColumn
        DataBinding.FieldName = 'code'
        Options.Filtering = False
      end
      object cxGrid1DBTableView1company: TcxGridDBColumn
        DataBinding.FieldName = 'company'
        Options.Filtering = False
      end
      object cxGrid1DBTableView1name: TcxGridDBColumn
        DataBinding.FieldName = 'name'
        Options.Filtering = False
        Options.Sorting = False
      end
      object cxGrid1DBTableView1partnerType: TcxGridDBColumn
        DataBinding.FieldName = 'partnerType'
        Options.Filtering = False
        Options.Sorting = False
        Width = 109
      end
      object cxGrid1DBTableView1address: TcxGridDBColumn
        DataBinding.FieldName = 'address'
        Options.Filtering = False
        Options.Sorting = False
        Width = 245
      end
      object cxGrid1DBTableView1phone: TcxGridDBColumn
        DataBinding.FieldName = 'phone'
        Options.Filtering = False
        Options.Sorting = False
        Width = 166
      end
      object cxGrid1DBTableView1emailAdd: TcxGridDBColumn
        DataBinding.FieldName = 'emailAdd'
        Options.Filtering = False
        Options.Sorting = False
        Width = 221
      end
      object cxGrid1DBTableView1memo: TcxGridDBColumn
        DataBinding.FieldName = 'memo'
        Options.Filtering = False
        Options.Sorting = False
        Width = 246
      end
    end
  end
end
