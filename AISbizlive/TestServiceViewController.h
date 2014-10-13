//
//  TestServiceViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceCT01_GetContactList.h"
#import "ServiceCT02_AddContact.h"
#import "ServiceCT03_EditContact.h"
#import "ServiceCT04_DeleteContact.h"
#import "ServiceCT05_ContactMessageHistory.h"
#import "ServiceCT06_GetGroupContactList.h"
#import "ServiceCT07_AddGroupContact.h"
#import "ServiceCT08_GroupMessageHistory.h"
#import "ServiceCT09_GetContactListToEditGroup.h"
#import "ServiceCT10_EditGroupContact.h"
#import "ServiceCT11_DeleteGroupContact.h"
#import "ServiceCT12_ImportContact.h"
#import "ServiceLG01_ForgotPassword.h"
#import "ServiceLG02_SignUpWithEmail.h"
#import "ServiceLG03_RequestOtpVerification.h"
#import "ServiceLG04_RequestEmailVerification.h"
#import "ServiceLG05_VerifyByOtp.h"
#import "ServiceLG06_VerifyByEmail.h"
#import "ServiceLG07_Login.h"
#import "ServiceMS01_SendMessage.h"
#import "ServiceMS02_SaveSchedule.h"
#import "ServiceRC01_GetScheduleList.h"
#import "ServiceRC02_DeleteSchedule.h"
#import "ServiceRC03_UpdateSchedule.h"

@interface TestServiceViewController : UIViewController
<GetContactListDelegate,AddContactListDelegate,EditContactDelegate,DeleteContactDelegate,ContactMessageHistoryDelegate,GetGroupContactListDelegate,AddGroupContactListDelegate,GroupMessageHistoryDelegate,GetContactListToEditGroupDelegate,EditGroupContactDelegate,DeleteGroupContactDelegate,ImportContactDelegate,ForgotPasswordDelegate,SignUpWithEmailDelegate,RequestOtpVerificationDelegate,RequestEmailVerificationDelegate,VerifyByOtpDelegate,VerifyByEmailDelegate,LoginDelegate,SendMessageDelegate,SaveScheduleDelegate,GetScheduleListDelegate,DeleteScheduleDelegate,UpdateScheduleDelegate>
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;

@end
