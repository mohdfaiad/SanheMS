unit fPartnerP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Fbase1P, Data.DB, uDAFields,
  uDADataTable, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, uDAWhere,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls;

type
  TfPartner = class(Tfbase1)
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    cxGrid1DBTableView1RecID: TcxGridDBColumn;
    cxGrid1DBTableView1code: TcxGridDBColumn;
    cxGrid1DBTableView1company: TcxGridDBColumn;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1address: TcxGridDBColumn;
    cxGrid1DBTableView1phone: TcxGridDBColumn;
    cxGrid1DBTableView1emailAdd: TcxGridDBColumn;
    cxGrid1DBTableView1partnerType: TcxGridDBColumn;
    cxGrid1DBTableView1memo: TcxGridDBColumn;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    procedure tb_AppendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tb_BrowseClick(Sender: TObject);
    procedure Tb_EditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tb_UnfilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPartner: TfPartner;

implementation

{$R *.dfm}
uses
fPartnerAddP,fPartnerDetailP, fPartnerEditP,
duPubP
;

procedure TfPartner.Button1Click(Sender: TObject);
var
userCode : String;
company : String;
userName : String;
phone : String;
userType : String;
selectList : TStringList;
begin
  inherited;
    userCode := Edit1.Text;
    company := Edit2.Text;
    userName := Edit3.Text;
    phone := Edit4.Text;
    userType := ComboBox1.Text;
    selectList := TStringList.Create;

    if userCode <> '' then
      dupub.setSelectData(selectList,'code','%'+userCode+'%',dboLike);
    if company <> '' then
      dupub.setSelectData(selectList,'company','%'+company+'%',dboLike);
    if userName <> '' then
      dupub.setSelectData(selectList,'name','%'+userName+'%',dboLike);
    if phone <> '' then
      dupub.setSelectData(selectList,'phone','%'+phone+'%',dboLike);
    if userType <> '' then
      dupub.setSelectData(selectList,'partnerType',userType,dboEqual);

    duPub.getSelectData(duPub.tbl_p_partners,selectList,'p_partners',dboAnd);
end;

procedure TfPartner.FormCreate(Sender: TObject);
begin
  inherited;
    duPub.tbl_p_partners.Close;
    duPub.tbl_p_partners.Open;
end;

procedure TfPartner.tb_AppendClick(Sender: TObject);
begin
  inherited;
   fPartnerAdd:=TfPartnerAdd.Create(self);
    fPartnerAdd.ShowModal;
end;

procedure TfPartner.tb_BrowseClick(Sender: TObject);
begin
  inherited;
    fPartnerDetail:=TfPartnerDetail.Create(self);
    fPartnerDetail.ShowModal;
end;

procedure TfPartner.Tb_EditClick(Sender: TObject);
begin
  inherited;
   fPartnerEdit:=TfPartnerEdit.Create(self);
    fPartnerEdit.ShowModal;
end;

procedure TfPartner.tb_UnfilterClick(Sender: TObject);
begin
  inherited;
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    ComboBox1.Text := '';
    duPub.getSelectData(duPub.tbl_p_partners,TStringList.Create,'p_partners',dboAnd);
end;

end.
