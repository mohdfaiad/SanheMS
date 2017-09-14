program sanhe;

uses
  uROComInit,
  Forms,
  fClientForm in 'fClientForm.pas' {ClientForm},
  fLogOnForm in 'fLogOnForm.pas' {LoginForm},
  duPubP in 'duPubP.pas' {duPub: TDAClientDataModule},
  sanhe_Intf in 'sanhe_Intf.pas',
  sanhe_ServerAccess in 'sanhe_ServerAccess.pas' {ServerAccess_sanhe: TDataModule},
  fLoginP in 'fLoginP.pas' {fLogin},
  Fbase1P in 'Fbase1P.pas' {fbase1},
  fPartnerP in 'productManager\fPartnerP.pas' {fPartner},
  fMainP in 'fMainP.pas' {fMain},
  fPartnerDetailP in 'productManager\fPartnerDetailP.pas' {fPartnerDetail},
  fPartnerAddP in 'productManager\fPartnerAddP.pas' {fPartnerAdd},
  fPartnerEditP in 'productManager\fPartnerEditP.pas' {fPartnerEdit},
  fBA_SetKindP in 'baseManager\fBA_SetKindP.pas' {fBA_SetKind},
  fBA_CompanyP in 'baseManager\fBA_CompanyP.pas' {fBA_Company},
  fBA_LocationP in 'baseManager\fBA_LocationP.pas' {fBA_Location},
  fPR_ProductInfoP in 'productManager\fPR_ProductInfoP.pas' {fPR_ProductInfo},
  fPR_ProductAddP in 'productManager\fPR_ProductAddP.pas' {fPR_ProductAdd},
  fPR_ProductEditP in 'productManager\fPR_ProductEditP.pas' {fPR_ProductEdit},
  fPR_ProductDetailP in 'productManager\fPR_ProductDetailP.pas' {fPR_ProductDetail},
  fPU_OrderP in 'purchaseManager\fPU_OrderP.pas' {fPU_Order},
  fPU_OrderAddP in 'purchaseManager\fPU_OrderAddP.pas' {fPU_OrderAdd},
  fProductListP in 'fProductListP.pas' {fProductList},
  fBA_UserP in 'baseManager\fBA_UserP.pas' {fBA_User},
  fBA_UserAddP in 'baseManager\fBA_UserAddP.pas' {fBA_UserAdd},
  fPU_OrderDetailP in 'purchaseManager\fPU_OrderDetailP.pas' {fPU_OrderDetail},
  fPU_OrderEditP in 'purchaseManager\fPU_OrderEditP.pas' {fPU_OrderEdit},
  fSY_UserManagerP in 'systemManager\fSY_UserManagerP.pas' {fSY_UserManager},
  fPU_OrderInP in 'purchaseManager\fPU_OrderInP.pas' {fPU_OrderIn},
  fPU_OrderInAddP in 'purchaseManager\fPU_OrderInAddP.pas' {fPU_OrderInAdd},
  fPU_OrderInListP in 'purchaseManager\fPU_OrderInListP.pas' {fPU_OrderInList},
  fPU_OrderInDetailP in 'purchaseManager\fPU_OrderInDetailP.pas' {fPU_OrderInDetail},
  fPU_OrderPayP in 'purchaseManager\fPU_OrderPayP.pas' {fPU_OrderPay},
  fPU_OrderPayAddP in 'purchaseManager\fPU_OrderPayAddP.pas' {fPU_OrderPayAdd},
  fPU_OrderPayListP in 'purchaseManager\fPU_OrderPayListP.pas' {fPU_OrderPayList},
  fPU_OrderPayDetailP in 'purchaseManager\fPU_OrderPayDetailP.pas' {fPU_OrderPayDetail},
  fST_StoageProductP in 'stoageManager\fST_StoageProductP.pas' {fST_StoageProduct};

{$R *.res}

begin


  Application.Initialize;
  Application.CreateForm(TduPub, duPub);
  {$IFDEF ShowLogin}
  fLogin:=TFlogin.Create(nil);
  if Flogin.ShowModal=mrOK  then
  begin
   application.CreateForm(Tfmain,fMain);
  fmain.Show;
  Application.Run;
  end
  else
  begin
    dupub.Free;
  application.Terminate;
  end;
  {$ELSE}
   application.CreateForm(Tfmain,fMain);
   fmain.Show;
   application.Run;
  {$ENDIF}
end.