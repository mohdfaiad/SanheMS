unit duPubP;

{$I RemObjects.inc}
{$I DataAbstract.inc}
interface

uses
  {vcl:} SysUtils, Classes, DB, Dialogs,Vcl.StdCtrls,
  {RemObjects:} uROChannelAwareComponent, uROMessage, uROComponent, uROBaseConnection,
  uROTransportChannel, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHttpChannel,
  {Data Abstract:} uDAInterfaces, DataAbstract4_Intf, uDADataAdapter, uDARemoteDataAdapter,
  uDAScriptingProvider, uDAEcmaScriptEngine, uDASpiderMonkeyScriptProvider,
  uDADataStreamer, uDABin2DataStreamer, uDAFields, uDADataTable, uDAMemDataTable, uDAReconcileDialog,
  uROAsync, uROServerLocator, System.TypInfo, uDADelta, uROTypes,uDAWhere,uDACore,
  uRODynamicRequest, uDAScriptingInterfaces, uROBaseHTTPClient, cxGraphics,
  System.ImageList, Vcl.ImgList, Vcl.Controls, Data.Win.ADODB;

type
  TduPub = class(TDataModule)
    RemoteService: TRORemoteService;
    Message: TROBinMessage;
    RemoteDataAdapter: TDARemoteDataAdapter;
    ReconcileProvider: TDAVCLReconcileProvider;
    ClientChannel: TROWinInetHTTPChannel;
    DataStreamer: TDABin2DataStreamer;
    tbl_p_module: TDAMemDataTable;
    ds_p_module: TDADataSource;
    sp_tbl_p_module: TDASpiderMonkeyScriptProvider;
    tbl_p_partners: TDAMemDataTable;
    ds_p_partners: TDADataSource;
    sp_tbl_p_partners: TDASpiderMonkeyScriptProvider;
    sp_tbl_p_user: TDASpiderMonkeyScriptProvider;
    tbl_p_usergroup: TDAMemDataTable;
    ds_p_usergroup: TDADataSource;
    sp_tbl_p_usergroup: TDASpiderMonkeyScriptProvider;
    ImageList1: TImageList;
    ImageListNav: TcxImageList;
    ADOQuery1: TADOQuery;
    tbl_st_kind: TDAMemDataTable;
    ds_st_kind: TDADataSource;
    tbl_st_product: TDAMemDataTable;
    ds_st_product: TDADataSource;
    tbl_st_company: TDAMemDataTable;
    ds_st_company: TDADataSource;
    tbl_st_location: TDAMemDataTable;
    ds_st_location: TDADataSource;
    tbl_pu_order: TDAMemDataTable;
    ds_pu_order: TDADataSource;
    tbl_pu_orderDt: TDAMemDataTable;
    ds_pu_orderDt: TDADataSource;
    DAMemDataTable1: TDAMemDataTable;
    DADataSource1: TDADataSource;
    tbl_p_user: TDAMemDataTable;
    ds_p_user: TDADataSource;
    tbl_pu_orderDtProduct: TDAMemDataTable;
    ds_pu_orderDtProduct: TDADataSource;
    tbl_st_instorage: TDAMemDataTable;
    ds_st_instorage: TDADataSource;
    tbl_st_instorageDt: TDAMemDataTable;
    ds_st_instorageDt: TDADataSource;
    tbl_st_repertory: TDAMemDataTable;
    ds_st_repertory: TDADataSource;
    tbl_st_repertoryDt: TDAMemDataTable;
    ds_st_repertoryDt: TDADataSource;
    tbl_st_stock: TDAMemDataTable;
    ds_st_stock: TDADataSource;
    tbl_pu_orderpay: TDAMemDataTable;
    ds_pu_orderpay: TDADataSource;
    tbl_pu_orderpaydt: TDAMemDataTable;
    ds_pu_orderpaydt: TDADataSource;
    tbl_tr_tradingProof: TDAMemDataTable;
    ds_tr_tradingProof: TDADataSource;
    tbl_tr_tradingProofDt: TDAMemDataTable;
    ds_tr_tradingProofDt: TDADataSource;

    procedure ClientChannel_OnLoginNeeded(Sender: TROTransportChannel; anException: Exception; var aRetry: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    fIsLoggedOn: Boolean;
    fUserId: String;
    fisInit:Boolean;
    procedure InitLogin;
    function CreateConnectionstring(aUser, aPassword: string): string;
  protected
    procedure Loaded; override;
  public
    { Public declarations }
    function LogOn(user: String;  password: String): Boolean;
    procedure LogOff();
    procedure delNum(num : String);
    procedure getDobInData(table : TDAMemDataTable;dataList : TStringList;tableName : String;fieldName : String);
    procedure getSelectData(table : TDAMemDataTable;dataList : TStringList;tableName : String;anOp : TDABinaryOperator);
    procedure setSelectData(selectList : TStringList;fieldName : String;aValue : String;anOp : TDABinaryOperator);
    procedure getKind(box : TComboBox);
    procedure getPartner(box : TComboBox);
    procedure getLocation(box : TComboBox);
    procedure getCompany(box : TComboBox);
    procedure getUser(box : TComboBox);
    function showUser(id : String) : String;
    function showPartner(id : String) : String;
    function showLocation(id : String) : String;
    function showCompany(id : String) : String;
    procedure showInsertNum(proName : String;getNum : String;editText : TEdit);
  end;

var
  duPub: TduPub;

type
TSelectData = class(TObject)
var
   fieldName : String;
   aValue : String;
   anOp : TDABinaryOperator;
   Private

    Protected

    Public

end;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$R *.dfm}

uses
  fLogOnForm;

var
  gUserId: string = '';
  gPassword: string = '';
  gStorePassword: boolean = True;
const
  ConnectionString: String = 'User Id=%s;Password="%s"';

procedure TduPub.ClientChannel_OnLoginNeeded(Sender: TROTransportChannel; anException: Exception; var aRetry: Boolean);
var
  lUserId: String;
  lPassword: String;
  lStorePassword: Boolean;
begin
  // Performing login
  if (Self.LogOn(gUserId, gPassword))  then  begin
    aRetry := true;
//    e.LoginSuccessful := true;
    Exit;
  end;

  lUserId := '';
  lPassword := '';
  lStorePassword := gStorePassword;
  if not Login(lUserId,lPassword, lStorePassword) then ShowMessage('Login cancelled');
  gUserId := lUserId;
  if lStorePassword then gPassword := lPassword else gPassword := '';
  gStorePassword := lStorePassword;

  if Self.LogOn(lUserId, lPassword)  then  begin
    aRetry := true;
//    e.LoginSuccessful := true;
  end
  else begin
    ShowMessage('Login failed');
  end;
end;


procedure TduPub.LogOff;
begin
  if (not fIsLoggedOn) then exit;

  (TBaseLoginService_Proxy.Create('LoginService',Message, ClientChannel) as IBaseLoginService).Logout;
  fIsLoggedOn := false;
end;

function TduPub.LogOn(user, password: String): Boolean;
begin
  Result := False;
  if user = '' then Exit;
  fIsLoggedOn := (TBaseLoginService_Proxy.Create('LoginService', Message, ClientChannel) as IBaseLoginService).LoginEx({$IFDEF CODEGEN4_LEGACYSTRINGS}UTF8Encode{$ENDIF}(CreateConnectionString(user,password)));
  if fIsLoggedOn then fUserId := user;
  Result := fIsLoggedOn;
end;

function TduPub.CreateConnectionstring(aUser, aPassword: string): string;
begin
  Result := Format(ConnectionString, [aUser, aPassword]);
end;

procedure TduPub.DataModuleCreate(Sender: TObject);
begin
  InitLogin;
  inherited;
end;

procedure TduPub.InitLogin;
begin
  if not fisInit then
  begin
    fisInit := True;
    fIsLoggedOn := False;
  end;
end;

procedure TduPub.Loaded;
begin
  InitLogin;
  inherited;
end;

//添加查询条件
procedure TduPub.setSelectData(selectList : TStringList;fieldName : String;aValue : String;anOp : TDABinaryOperator);
var
s : TSelectData;
begin
     s := TSelectData.Create;
     s.fieldName := fieldName;
     s.aValue := aValue;
     s.anOp := anOp;
     selectList.AddObject('data',s);
end;
//根据查询条件获取数据
procedure TduPub.getSelectData(table : TDAMemDataTable;dataList : TStringList;tableName : String;anOp : TDABinaryOperator);
var
  lDynWhere: TDAWhereBuilder;
  expressions : array of TDAWhereExpression;
  i : integer;
//  aFieldName : String;
  aValue : String;
  secondValue : String;
  firstValue : String;

s : TSelectData;
begin
  table.Close;
  lDynWhere := table.DynamicWhere;
  lDynWhere.Clear;
  SetLength(expressions,dataList.Count);
  for I := 0 to dataList.Count - 1 do
  begin
     s := TSelectData(dataList.Objects[i]);
//     if s.anOp = dboAddition then
//     begin
//         aValue := s.aValue;
//         firstValue := aValue.Substring(0,aValue.IndexOf('-'));
//         secondValue := aValue.Substring(aValue.IndexOf('-')+1,avalue.Length);
//         expressions[i] := lDynWhere.NewBetweenExpression(
//                lDynWhere.NewField(tableName, s.fieldName),
//                lDynWhere.NewConstant(firstValue),lDynWhere.NewConstant(secondValue));
//     end
//     else
      expressions[i] := lDynWhere.NewBinaryExpression(tableName,s.fieldName,s.anOp,s.aValue);
  end;

  lDynWhere.Expression := lDynWhere.NewBinaryExpressionList(expressions,anOp);
  table.Open;
  lDynWhere.Clear;
end;

procedure TduPub.getDobInData(table : TDAMemDataTable;dataList : TStringList;tableName : String;fieldName : String);
var
  lDynWhere: TDAWhereBuilder;
  expressions : array of TDAWhereExpression;
  i : integer;
  idShow : String;
begin
   table.Close;
    lDynWhere := table.DynamicWhere;
    lDynWhere.Clear;
    if dataList.Count > 0 then
    begin
         SetLength(expressions,dataList.Count);
        for I := 0 to dataList.Count - 1 do
        begin
          idShow := dataList.Values[dataList.Names[i]];
          expressions[i] := lDynWhere.NewConstant(idShow,datString);
        end;
    end
    else
    begin
        SetLength(expressions,1);
        idShow := '0';
       expressions[0] := lDynWhere.NewConstant(idShow,datString);
    end;


    lDynWhere.Expression := lDynWhere.NewBinaryExpression(
    lDynWhere.NewField(tableName,fieldName),lDynWhere.NewList(expressions),dboIn);
    table.Open;
end;

//获取自增长编号
procedure TduPub.showInsertNum(proName : String;getNum : String;editText : TEdit);
begin

with duPub.adoquery1 do
    begin
          close;
          sql.Clear;
          parameters.Clear;
          sql.Add('exec '+proName+' :@orderType,:@userID,:@resultCode output');//这就是调用存储过程
          parameters.Items[0].Value := getNum;
          parameters.Items[1].Value := '123';
          execsql;
          editText.Text := parameters.Items[2].Value;
     end;

end;

//根据编号把不需要再用到的数据清除掉
procedure TduPub.delNum(num : String);
begin
     with duPub.adoquery1 do
    begin
          close;
          sql.Clear;
          parameters.Clear;
          sql.Add('exec DelNum :@code');
          parameters.Items[0].Value := num;
          execsql;
     end;
end;

//获取商品类别
procedure TduPub.getKind(box : TComboBox);
begin
  duPub.tbl_st_kind.Close;
  duPub.tbl_st_kind.Open;
  box.Clear;
  duPub.tbl_st_kind.First;
  if duPub.tbl_st_kind.RecordCount > 0 then
  begin
    while  not  duPub.tbl_st_kind.EOF do
    begin
      box.Items.AddObject(duPub.tbl_st_kind.fieldByName('KindName').AsString,
      TObject(duPub.tbl_st_kind.fieldByName('id').AsInteger));

      duPub.tbl_st_kind.next;
    end;
  end;
end;

//获取合作伙伴的名称
procedure TduPub.getPartner(box : TComboBox);
begin
  duPub.tbl_p_partners.Close;
  duPub.tbl_p_partners.Open;
  box.Clear;
  duPub.tbl_p_partners.First;
  if duPub.tbl_p_partners.RecordCount > 0 then
  begin
    while  not  duPub.tbl_p_partners.EOF do
    begin
      box.Items.AddObject(duPub.tbl_p_partners.fieldByName('name').AsString,
      TObject(duPub.tbl_p_partners.fieldByName('id').AsInteger));

      duPub.tbl_p_partners.next;
    end;
  end;
end;

//获取用户名称
procedure TduPub.getUser(box : TComboBox);
begin
  duPub.tbl_p_user.Close;
  duPub.tbl_p_user.Open;
  box.Clear;
  duPub.tbl_p_user.First;
  if duPub.tbl_p_user.RecordCount > 0 then
  begin
    while  not  duPub.tbl_p_user.EOF do
    begin
      box.Items.AddObject(duPub.tbl_p_user.fieldByName('fullName').AsString,
      TObject(duPub.tbl_p_user.fieldByName('id').AsInteger));

      duPub.tbl_p_user.next;
    end;
  end;
end;

//获取仓库编号
procedure TduPub.getLocation(box : TComboBox);
begin
  duPub.tbl_st_location.Close;
  duPub.tbl_st_location.Open;
  box.Clear;
  duPub.tbl_st_location.First;
  if duPub.tbl_st_location.RecordCount > 0 then
  begin
    while  not  duPub.tbl_st_location.EOF do
    begin
      box.Items.AddObject(duPub.tbl_st_location.fieldByName('locationName').AsString,
      TObject(duPub.tbl_st_location.fieldByName('id').AsInteger));

      duPub.tbl_st_location.next;
    end;
  end;

end;

//获取归属公司
procedure TduPub.getCompany(box : TComboBox);
begin
  duPub.tbl_st_company.Close;
  duPub.tbl_st_company.Open;
  box.Clear;
  duPub.tbl_st_company.First;
  if duPub.tbl_st_company.RecordCount > 0 then
  begin
    while  not  duPub.tbl_st_company.EOF do
    begin
      box.Items.AddObject(duPub.tbl_st_company.fieldByName('CompanyName').AsString,
      TObject(duPub.tbl_st_company.fieldByName('id').AsInteger));

      duPub.tbl_st_company.next;
    end;
  end;
end;


function TduPub.showUser(id : String) : String;
begin
     if id = '' then
      exit;
     duPub.tbl_p_user.Close;
     duPub.tbl_p_user.Open;
     if duPub.tbl_p_user.Active then
     begin
         duPub.tbl_p_user.Filter:='ID='+id;
         duPub.tbl_p_user.Filtered := true;
         result := duPub.tbl_p_user.fieldByName('fullName').AsString;
         duPub.tbl_p_user.Filtered := false;
     end;
end;

function TduPub.showPartner(id : String) : String;
begin
     if id = '' then
      exit;
     duPub.tbl_p_user.Close;
     duPub.tbl_p_user.Open;
     if duPub.tbl_p_user.Active then
     begin
         duPub.tbl_p_user.Filter:='ID='+id;
         duPub.tbl_p_user.Filtered := true;
         result := duPub.tbl_p_user.fieldByName('fullName').AsString;
         duPub.tbl_p_user.Filtered := false;
     end;
end;

function TduPub.showLocation(id : String) : String;
begin
     if id = '' then
      exit;
     duPub.tbl_st_location.Close;
     duPub.tbl_st_location.Open;
     if duPub.tbl_st_location.Active then
     begin
         duPub.tbl_st_location.Filter:='ID='+id;
         duPub.tbl_st_location.Filtered := true;
         result := duPub.tbl_st_location.fieldByName('locationName').AsString;
         duPub.tbl_st_location.Filtered := false;
     end;
end;

function TduPub.showCompany(id : String) : String;
begin
     if id = '' then
      exit;
     duPub.tbl_st_company.Close;
     duPub.tbl_st_company.Open;
     if duPub.tbl_st_company.Active then
     begin
         duPub.tbl_st_company.Filter:='ID='+id;
         duPub.tbl_st_company.Filtered := true;
         result := duPub.tbl_st_company.fieldByName('CompanyName').AsString;
         duPub.tbl_st_company.Filtered := false;
     end;
end;
end.
