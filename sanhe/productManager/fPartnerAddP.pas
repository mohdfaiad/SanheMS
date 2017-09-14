unit fPartnerAddP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfPartnerAdd = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initData();
  end;

var
  fPartnerAdd: TfPartnerAdd;
  checkType : String;

implementation

{$R *.dfm}
uses
duPubP
;

procedure TfPartnerAdd.initData();
begin
    with duPub.adoquery1 do
    begin
          close;
          sql.Clear;
          parameters.Clear;
          sql.Add('exec partnerGetNum :@orderType,:@userID,:@resultCode output');//这就是调用存储过程
          parameters.Items[0].Value := 'SHPA';
          parameters.Items[1].Value := '123';
          execsql;
          Edit1.Text := parameters.Items[2].Value;
     end;
end;

procedure TfPartnerAdd.RadioButton1Click(Sender: TObject);
begin
     RadioButton1.Checked := true;
     RadioButton2.Checked := false;
     checkType := '供应商';
end;

procedure TfPartnerAdd.RadioButton2Click(Sender: TObject);
begin
    RadioButton1.Checked := false;
     RadioButton2.Checked := true;
     checkType := '客户';
end;

procedure TfPartnerAdd.Button1Click(Sender: TObject);
var
company : String;
userName : String;
address : String;
phone : String;
emailAdd : String;
memo : String;
begin
    company := Edit2.Text;
    userName := Edit3.Text;
    phone := Edit4.Text;
    address := Edit5.Text;
    emailAdd := Edit6.Text;
    memo := Edit7.Text;


    if company='' then
    begin
        showmessage('公司名称不能为空');
        exit;
    end;
    if userName='' then
    begin
        showmessage('联系人不能为空');
        exit;
    end;
    if phone='' then
    begin
        showmessage('联系电话不能为空');
        exit;
    end;

    duPub.tbl_p_partners.Close;
    duPub.tbl_p_partners.Open;
    duPub.tbl_p_partners.Append;
    duPub.tbl_p_partners.fieldbyname('code').AsString:=Edit1.Text;
    duPub.tbl_p_partners.fieldbyname('company').AsString:=company;
    duPub.tbl_p_partners.fieldbyname('name').AsString:=userName;
    duPub.tbl_p_partners.fieldbyname('address').AsString:=address;
    duPub.tbl_p_partners.fieldbyname('phone').AsInteger:=strToInt(phone);
    duPub.tbl_p_partners.fieldbyname('emailAdd').AsString:=emailAdd;
    duPub.tbl_p_partners.fieldbyname('partnerType').AsString:=checkType;
    duPub.tbl_p_partners.fieldbyname('memo').AsString:=memo;
    duPub.tbl_p_partners.applyupdates(false,false);
    self.Close;

end;

procedure TfPartnerAdd.Button2Click(Sender: TObject);
begin
    self.Close;
end;

procedure TfPartnerAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    duPub.delNum(Edit1.text);
end;

procedure TfPartnerAdd.FormCreate(Sender: TObject);
begin
    initData();
    checkType := '供应商';
end;



end.
