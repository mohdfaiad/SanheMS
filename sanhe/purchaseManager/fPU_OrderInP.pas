unit fPU_OrderInP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Fbase1P, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, uDAFields,
  uDADataTable, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, cxContainer, dxCore, cxDateUtils, cxTextEdit, uDAWhere,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBLookupComboBox;

type
  TfPU_OrderIn = class(Tfbase1)
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    ComboBox3: TComboBox;
    Button1: TButton;
    Label4: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    cxDateEdit1: TcxDateEdit;
    Label6: TLabel;
    cxDateEdit2: TcxDateEdit;
    Label7: TLabel;
    ComboBox4: TComboBox;
    cxGrid1DBTableView1RecID: TcxGridDBColumn;
    cxGrid1DBTableView1inCode: TcxGridDBColumn;
    cxGrid1DBTableView1inType: TcxGridDBColumn;
    cxGrid1DBTableView1locationId: TcxGridDBColumn;
    cxGrid1DBTableView1companyId: TcxGridDBColumn;
    cxGrid1DBTableView1inDate: TcxGridDBColumn;
    cxGrid1DBTableView1consignee: TcxGridDBColumn;
    cxGrid1DBTableView1operatorDate: TcxGridDBColumn;
    cxGrid1DBTableView1operator: TcxGridDBColumn;
    cxGrid1DBTableView1inState: TcxGridDBColumn;
    cxGrid1DBTableView1oddNo: TcxGridDBColumn;
    cxGrid1DBTableView1department: TcxGridDBColumn;
    cxGrid1DBTableView1memo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure tb_AppendClick(Sender: TObject);
    procedure tb_BrowseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tb_UnfilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPU_OrderIn: TfPU_OrderIn;

implementation

{$R *.dfm}
uses
duPubP,fPU_OrderInAddP,fPU_OrderInDetailP
;

procedure TfPU_OrderIn.Button1Click(Sender: TObject);
var
orderNum : String;
locationIndex : Integer;
companyIndex : Integer;
locationId : Integer;
companyId : Integer;


userIndex : Integer;
userId : Integer;
beginDate : String;
endDate : String;
selectList : TStringList;
begin
  inherited;
     orderNum := Edit1.Text;
     locationIndex := ComboBox1.ItemIndex;
     companyIndex := ComboBox3.ItemIndex;
     userIndex := ComboBox4.ItemIndex;
     beginDate := datetimetostr(cxDateEdit1.Date);
     endDate := datetimetostr(cxDateEdit2.Date);
     selectList := TStringList.Create;

     if orderNum <> '' then
        dupub.setSelectData(selectList,'inCode','%'+orderNum+'%',dboLike);

     if locationIndex <> -1 then
     begin
         locationId := Integer(ComboBox1.Items.Objects[locationIndex]);
         dupub.setSelectData(selectList,'locationId',intToStr(locationId),dboEqual);
     end;
     if companyIndex <> -1 then
     begin
         companyId := Integer(ComboBox3.Items.Objects[companyIndex]);
         dupub.setSelectData(selectList,'companyId',intToStr(companyId),dboEqual);
     end;
     if userIndex <> -1 then
     begin
         userId := Integer(ComboBox4.Items.Objects[userIndex]);
         dupub.setSelectData(selectList,'consignee',intToStr(userId),dboEqual);
     end;

     if beginDate = '0000/0/0' then
        beginDate := '2000/01/01';
     if endDate = '0000/0/0' then
        endDate := DateToStr(now);



     dupub.setSelectData(selectList,'inDate',beginDate,dboGreaterOrEqual);
     dupub.setSelectData(selectList,'inDate',endDate,dboLessOrEqual);
     duPub.getSelectData(duPub.tbl_st_instorage,selectList,'st_instorage',dboAnd);
end;

procedure TfPU_OrderIn.FormCreate(Sender: TObject);
begin
  inherited;
    duPub.getLocation(ComboBox1);
    duPub.getCompany(ComboBox3);
    duPub.getUser(ComboBox4);
    duPub.tbl_st_instorage.Open;
end;

procedure TfPU_OrderIn.tb_AppendClick(Sender: TObject);
begin
  inherited;
    fPU_OrderInAdd := TfPU_OrderInAdd.Create(self);
    fPU_OrderInAdd.ShowModal;
end;

procedure TfPU_OrderIn.tb_BrowseClick(Sender: TObject);
begin
  inherited;
    fPU_OrderInDetail := TfPU_OrderInDetail.Create(self);
    fPU_OrderInDetail.ShowModal;
end;

procedure TfPU_OrderIn.tb_UnfilterClick(Sender: TObject);
begin
  inherited;
    Edit1.Text := '';
    ComboBox1.Text := '';
    ComboBox3.Text := '';
    ComboBox4.Text := '';
    cxDateEdit1.Text := '';
    cxDateEdit2.Text := '';
    duPub.getSelectData(duPub.tbl_st_instorage,TStringList.Create,'st_instorage',dboAnd);
end;

end.
