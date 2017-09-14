object fPU_OrderInList: TfPU_OrderInList
  Left = 0
  Top = 0
  Caption = #37319#36141#35746#21333#21015#34920
  ClientHeight = 362
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 187
    Width = 784
    Height = 119
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = duPub.ds_pu_orderDtProduct
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1RecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
      end
      object cxGrid1DBTableView1puOrderNum: TcxGridDBColumn
        DataBinding.FieldName = 'puOrderNum'
      end
      object cxGrid1DBTableView1productName: TcxGridDBColumn
        DataBinding.FieldName = 'productName'
      end
      object cxGrid1DBTableView1qty: TcxGridDBColumn
        DataBinding.FieldName = 'qty'
      end
      object cxGrid1DBTableView1price: TcxGridDBColumn
        DataBinding.FieldName = 'price'
      end
      object cxGrid1DBTableView1kind: TcxGridDBColumn
        DataBinding.FieldName = 'kind'
      end
      object cxGrid1DBTableView1style: TcxGridDBColumn
        DataBinding.FieldName = 'style'
      end
      object cxGrid1DBTableView1spec: TcxGridDBColumn
        DataBinding.FieldName = 'spec'
      end
      object cxGrid1DBTableView1color: TcxGridDBColumn
        DataBinding.FieldName = 'color'
      end
      object cxGrid1DBTableView1unit: TcxGridDBColumn
        DataBinding.FieldName = 'unit'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 155
    Align = alTop
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 782
      Height = 32
      Align = alTop
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 8
        Width = 60
        Height = 16
        Caption = #35746#21333#21015#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 411
        Top = 6
        Width = 5
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 33
      Width = 782
      Height = 121
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = cxGridDBTableView1CellClick
        DataController.DataSource = dSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object cxGridDBTableView1RecID: TcxGridDBColumn
          DataBinding.FieldName = 'RecID'
          Visible = False
        end
        object cxGridDBTableView1puOrderNum: TcxGridDBColumn
          DataBinding.FieldName = 'puOrderNum'
        end
        object cxGridDBTableView1partnerId: TcxGridDBColumn
          DataBinding.FieldName = 'partnerId'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = duPub.ds_p_partners
        end
        object cxGridDBTableView1puStatus: TcxGridDBColumn
          DataBinding.FieldName = 'puStatus'
        end
        object cxGridDBTableView1puOrderDate: TcxGridDBColumn
          DataBinding.FieldName = 'puOrderDate'
        end
        object cxGridDBTableView1puOrderUser: TcxGridDBColumn
          DataBinding.FieldName = 'puOrderUser'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'fullName'
            end>
          Properties.ListSource = duPub.ds_p_user
        end
        object cxGridDBTableView1puCreator: TcxGridDBColumn
          DataBinding.FieldName = 'puCreator'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'fullName'
            end>
          Properties.ListSource = duPub.ds_p_user
        end
        object cxGridDBTableView1puCreateDate: TcxGridDBColumn
          DataBinding.FieldName = 'puCreateDate'
        end
        object cxGridDBTableView1puOutAddress: TcxGridDBColumn
          DataBinding.FieldName = 'puOutAddress'
        end
        object cxGridDBTableView1amountPay: TcxGridDBColumn
          DataBinding.FieldName = 'amountPay'
        end
        object cxGridDBTableView1memo: TcxGridDBColumn
          DataBinding.FieldName = 'memo'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 306
    Width = 784
    Height = 56
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 25
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#23450
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 129
      Top = 16
      Width = 75
      Height = 25
      Caption = #21462#28040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 155
    Width = 784
    Height = 32
    Align = alTop
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object Label9: TLabel
      Left = 24
      Top = 8
      Width = 60
      Height = 16
      Caption = #21015#34920#26126#32454
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object dSource1: TDADataSource
    DataSet = tbl_pu_order.Dataset
    DataTable = tbl_pu_order
    Left = 693
    Top = 17
  end
  object tbl_pu_order: TDAMemDataTable
    Fields = <
      item
        Name = 'id'
        DataType = datAutoInc
        GeneratorName = 'pu_order'
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'puOrderNum'
        DataType = datWideString
        Size = 20
        Required = True
      end
      item
        Name = 'partnerId'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'puStatus'
        DataType = datWideString
        Size = 10
        Required = True
      end
      item
        Name = 'puOrderDate'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'puOrderUser'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'puCreator'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'puCreateDate'
        DataType = datDateTime
        Required = True
      end
      item
        Name = 'puOutAddress'
        DataType = datWideString
        Size = 50
      end
      item
        Name = 'amountPay'
        DataType = datDecimal
        DecimalPrecision = 18
        DecimalScale = 4
        Required = True
      end
      item
        Name = 'memo'
        DataType = datWideString
        Size = 50
      end>
    LogicalName = 'pu_order'
    Params = <>
    RemoteDataAdapter = duPub.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming, soDisableFiltering]
    IndexDefs = <>
    Left = 552
    Top = 32
  end
end
