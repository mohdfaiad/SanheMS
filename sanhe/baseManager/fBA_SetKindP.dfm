inherited fBA_SetKind: TfBA_SetKind
  Caption = #21830#21697#35774#32622
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited tb_Browse: TToolButton
      Visible = False
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
    inherited tb_Filter: TToolButton
      Visible = False
    end
    inherited tb_Unfilter: TToolButton
      Visible = False
    end
    inherited tb_Seperator2: TToolButton
      Visible = False
    end
    inherited tb_Save: TToolButton
      OnClick = tb_SaveClick
    end
    inherited tbCancel: TToolButton
      OnClick = tbCancelClick
    end
    inherited tbRefresh: TToolButton
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Height = 59
    ExplicitHeight = 59
  end
  inherited cxGrid1: TcxGrid
    Top = 113
    Height = 338
    ExplicitTop = 113
    ExplicitHeight = 338
    inherited cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = duPub.ds_st_kind
      OptionsData.Editing = False
      OptionsSelection.CellSelect = True
      object cxGrid1DBTableView1RecID: TcxGridDBColumn
        DataBinding.FieldName = 'RecID'
        Visible = False
      end
      object cxGrid1DBTableView1KindName: TcxGridDBColumn
        Caption = #21830#21697#31181#31867
        DataBinding.FieldName = 'KindName'
        Options.Filtering = False
        Options.Sorting = False
        Width = 211
      end
    end
  end
end
