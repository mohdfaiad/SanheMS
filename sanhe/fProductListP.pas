unit fProductListP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,uDAWhere,
  cxDBLookupComboBox, uRODynamicRequest, uDAFields, uDADelta, uROComponent,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable;

type
  TfProductList = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1RecID: TcxGridDBColumn;
    cxGrid1DBTableView1Style: TcxGridDBColumn;
    cxGrid1DBTableView1Spec: TcxGridDBColumn;
    cxGrid1DBTableView1color: TcxGridDBColumn;
    cxGrid1DBTableView1unit: TcxGridDBColumn;
    selectBox: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    cxGrid1DBTableView1productCode: TcxGridDBColumn;
    cxGrid1DBTableView1productName: TcxGridDBColumn;
    cxGrid1DBTableView1price: TcxGridDBColumn;
    cxGrid1DBTableView1kind: TcxGridDBColumn;
    ds_st_product: TDADataSource;
    tbl_st_product: TDAMemDataTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getListId(id : String);
    procedure delListId(id : String);
    procedure setDataList();
  end;

var
  fProductList: TfProductList;
  ListID: TStringList;
  intoType : Integer;
  tempList : TStringList;

implementation

{$R *.dfm}
uses
duPubP,fPU_OrderAddP
;

procedure TfProductList.getListId(id : String);

begin
    ListID.Sorted := True;  //需要先指定排序
    ListID.Duplicates := dupIgnore;  //如有重复值则放弃
    ListID.Add(id+'='+id);
end;

procedure TfProductList.delListId(id : String);
var
i : Integer;
key : String;
begin
    for I := 0 to ListID.Count - 1 do
  begin
       key := ListID.Names[i];
       if id = ListID.Values[key] then
       begin
            ListID.Delete(i);
            exit;
       end;
  end;
end;

procedure TfProductList.setDataList();
var
i : Integer;
begin
     if intoType = 0 then
     begin
       tempList := fPU_OrderAdd.addList;
     end else if intoType = 1 then
     begin
       // tempList := inResultDataList;
     end else if intoType = 2 then
     begin
       // tempList := seResultDataList;
     end
     ;
     for I := 0 to ListID.Count - 1 do
  begin
       tempList.Sorted := True;  //需要先指定排序
       tempList.Duplicates := dupIgnore;  //如有重复值则放弃
       tempList.add(ListID[i]);
  end;

  if intoType = 0 then
     begin
       fPU_OrderAdd.addList := tempList;
     end else if intoType = 1 then
     begin
        //inResultDataList := tempList;
     end else if intoType = 2 then
     begin
        //seResultDataList := tempList;
     end
     ;
end;

procedure TfProductList.Button1Click(Sender: TObject);
var
  prName:String;
  prKind:Integer;
  index:Integer;
  puDataList : TStringList;
begin
    puDataList := TStringList.Create;

  //获取商品名称并判断加入查询条件
  prName := Edit1.Text;
  if prName <> '' then
  begin
     dupub.setSelectData(puDataList,'productName','%'+prName+'%',dboLike);
  end;
  //获取商品类别并判断加入查询条件
  index := ComboBox1.ItemIndex;
  if index <> -1 then
  begin
      prKind := Integer(ComboBox1.Items.Objects[index]);
      dupub.setSelectData(puDataList,'kind',intToStr(prKind),dboEqual);
  end;
  dupub.setSelectData(puDataList,'productType','材料',dboEqual);
  duPub.getSelectData(self.tbl_st_product,puDataList,'st_product',dboAnd);
end;

procedure TfProductList.Button2Click(Sender: TObject);
begin
     setDataList();
    duPub.getDobInData(fPU_OrderAdd.tbl_st_product,tempList,'st_product','productId');
    self.Close;
end;

procedure TfProductList.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  Row : Integer;
begin
  inherited;
    Row := cxGrid1DBTableView1.DataController.FocusedRecordIndex;
    if cxGrid1DBTableView1.ViewData.Records[Row].Values[1] = true then
    begin
       cxGrid1DBTableView1.ViewData.Records[Row].Values[1] := false ;
       delListId(self.tbl_st_product.FieldByName('productId').AsString);
    end
    else
    begin
       cxGrid1DBTableView1.ViewData.Records[Row].Values[1] := true;
       getListId(self.tbl_st_product.FieldByName('productId').AsString);
    end;

end;

procedure TfProductList.FormCreate(Sender: TObject);
var
list : TStringList;
begin
     duPub.getKind(ComboBox1);
     ListID := TStringList.Create;
     tempList := TStringList.Create;
     list := TStringList.Create;
     dupub.setSelectData(list,'productType','材料',dboEqual);
     duPub.getSelectData(self.tbl_st_product,list,'st_product',dboEqual);

end;

end.
