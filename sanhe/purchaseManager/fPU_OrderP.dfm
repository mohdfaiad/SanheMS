inherited fPU_Order: TfPU_Order
  Caption = #37319#36141#35746#21333
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited tb_Browse: TToolButton
      OnClick = tb_BrowseClick
    end
    inherited Tb_Edit: TToolButton
      OnClick = Tb_EditClick
    end
    inherited tb_Append: TToolButton
      OnClick = tb_AppendClick
    end
    inherited tb_revise: TToolButton
      Visible = False
    end
    inherited tb_Copy: TToolButton
      Visible = False
    end
    inherited tb_Delete: TToolButton
      OnClick = tb_DeleteClick
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
  end
  inherited Panel1: TPanel
    Height = 131
    ExplicitHeight = 131
    object Label4: TLabel
      Left = 25
      Top = 17
      Width = 60
      Height = 16
      Caption = #35746#21333#32534#21495
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
      Width = 60
      Height = 16
      Caption = #35746#21333#29366#24577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 97
      Width = 60
      Height = 16
      Caption = #37319#36141#26102#38388
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
      Caption = #37319#36141#20154#21592
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
      Width = 53
      Height = 16
      Caption = #20379' '#24212' '#21830
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 218
      Top = 97
      Width = 12
      Height = 16
      Caption = #8212
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
    object ComboBox2: TComboBox
      Left = 99
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 1
      Items.Strings = (
        #24453#23457#26680
        #24453#25910#36135
        #24050#20837#24211)
    end
    object ComboBox1: TComboBox
      Left = 378
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 2
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
      TabOrder = 3
      OnClick = Button1Click
    end
    object ComboBox3: TComboBox
      Left = 378
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 4
      Items.Strings = (
        #26448#26009
        #25104#21697)
    end
    object cxDateEdit1: TcxDateEdit
      Left = 99
      Top = 97
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 110
    end
    object cxDateEdit2: TcxDateEdit
      Left = 236
      Top = 97
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 110
    end
  end
  inherited cxGrid1: TcxGrid
    Top = 185
    Height = 266
    ExplicitTop = 185
    ExplicitHeight = 266
    inherited cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = duPub.ds_pu_order
      object cxGrid1DBTableView1RecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object cxGrid1DBTableView1puOrderNum: TcxGridDBColumn
        DataBinding.FieldName = 'puOrderNum'
      end
      object cxGrid1DBTableView1partnerId: TcxGridDBColumn
        DataBinding.FieldName = 'partnerId'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListSource = duPub.ds_p_partners
        Width = 92
      end
      object cxGrid1DBTableView1puStatus: TcxGridDBColumn
        DataBinding.FieldName = 'puStatus'
        Width = 106
      end
      object cxGrid1DBTableView1puOrderDate: TcxGridDBColumn
        DataBinding.FieldName = 'puOrderDate'
      end
      object cxGrid1DBTableView1puOrderUser: TcxGridDBColumn
        DataBinding.FieldName = 'puOrderUser'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'fullName'
          end>
        Properties.ListSource = duPub.ds_p_user
        Width = 99
      end
      object cxGrid1DBTableView1puOutAddress: TcxGridDBColumn
        DataBinding.FieldName = 'puOutAddress'
      end
      object cxGrid1DBTableView1amountPay: TcxGridDBColumn
        DataBinding.FieldName = 'amountPay'
      end
      object cxGrid1DBTableView1memo: TcxGridDBColumn
        DataBinding.FieldName = 'memo'
      end
    end
  end
end
