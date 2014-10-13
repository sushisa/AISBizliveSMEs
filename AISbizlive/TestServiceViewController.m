//
//  TestServiceViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TestServiceViewController.h"

@interface TestServiceViewController ()

@end

@implementation TestServiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)one:(id)sender {
}

- (IBAction)two:(id)sender {
}

- (IBAction)three:(id)sender {
}

- (IBAction)four:(id)sender {
}

- (IBAction)five:(id)sender {
}

- (IBAction)six:(id)sender {
}

- (IBAction)seven:(id)sender {
}
//CT01
-(void)callCT01{
    
}
- (void)getContactListSuccess:(ResponseGetContactList *)responseGetContactList{
    
}
- (void)getcontactListError:(ResultStatus *)status{
    
}

//CT02
-(void)callCT02{
    
}
- (void)addContactSuccess:(ContactDetail *)contactDetail{
    
}
- (void)addContactError:(ResultStatus *)status{
    
}

//CT03
-(void)callCT03{
    
}
- (void)editContactSuccess:(ContactDetail *)contactDetail{
    
}
- (void)editContactError:(ResultStatus *)status{
    
}

//CT04
-(void)callCT04{
    
}
- (void)deleteContactSuccess{
    
}
- (void)deleteContactError:(ResultStatus *)status{
    
}
//CT05
-(void)callCT05{
    
}
- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory{
    
}
- (void)contactMessageHistoryError:(ResultStatus *)status{
    
}
//CT06
-(void)callCT06{
    
}
- (void)getGroupContactListSuccess:(ResponseGetGroupContactList *)responseData{
    
}
- (void)getGroupContactListError:(ResultStatus *)status{
    
}
//CT07
-(void)callCT07{
    
}
- (void)addGroupContactSuccess:(GroupContactDetail *)groupContactDetail{
    
}
- (void)addGroupContactError:(ResultStatus *)status{
    
}
//CT08

-(void)callCT08{
    
}
- (void)groupMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory{
    
}
- (void)groupMessageHistoryError:(ResultStatus *)status{
    
}
//CT09
-(void)callCT09{

}
- (void)getContactListToEditGroupSuccess:(GroupContactDetail *)groupContactDetail{
    
}
- (void)getContactListToEditGroupError:(ResultStatus *)status{
    
}
//CT10
-(void)callCT10{
    
}

- (void)editGroupContactSuccess:(GroupContactDetail *)groupContactDetail{
    
}
- (void)editGroupContactError:(ResultStatus *)status{
    
}
//CT11
-(void)callCT11{
    
}

- (void)deleteGroupContactSuccess{
    
}
- (void)deleteGroupContactError:(ResultStatus *)status{
    
}
//CT12
-(void)callCT12{
    
}
- (void)importContactSuccess:(ResponseGetContactList *)responseGetContactList{
    
}
- (void)importContactError:(ResultStatus *)status{
    
}
//MS01
-(void)callMS01{
    
}
- (void)sendMessageSuccess{
    
}
- (void)sendMessageError:(ResultStatus *)resultStatus{
    
}

//MS02
-(void)callMS02{
    
}
- (void)saveScheduleSuccess{
    
}
- (void)saveScheduleError:(ResultStatus *)resultStatus{
    
}

//LG01
-(void)callLG01{
    
}
- (void)forgotPasswordSuccess{
    
}
- (void)forgotPasswordError:(ResultStatus *)resultStatus{
    
}
//LG02
-(void)callLG02{
    
}
- (void)signUpWithEmailSuccess{
    
}
- (void)signUpWithEmailError:(ResultStatus *)resultStatus{
    
}
//LG03
-(void)callLG03{
    
}
- (void)requestOtpVerificationSuccess{
    
}
- (void)requestOtpVerificationError:(ResultStatus *)resultStatus{
    
}
//LG04
-(void)callLG04{
    
}
- (void)requestEmailVerificationSuccess{
    
}
- (void)requestEmailVerificationError:(ResultStatus *)resultStatus{
    
}
//LG05
-(void)callLG05{
    
}
- (void)verifyByOtpSuccess{
    
}
- (void)verifyByOtpError:(ResultStatus *)resultStatus{
    
}
//LG06
-(void)callLG06{
    
}
- (void)verifyByEmailSuccess{
    
}
- (void)verifyByEmailError:(ResultStatus *)resultStatus{
    
}
//LG07
-(void)callLG07{
    
}
- (void)loginSuccess{
    
}
- (void)loginError:(ResultStatus *)resultStatus{
    
}
//RC01
-(void)callRC01{
    
}
- (void)getScheduleListSuccess:(MessageForm *)messageForm{
    
}
- (void)getScheduleListError:(ResultStatus *)resultStatus{
    
}
//RC02
-(void)callRC02{
    
}
- (void)deleteScheduleSuccess{
    
}
- (void)deleteScheduleError:(ResultStatus *)resultStatus{
    
}
//RC03
-(void)callRC03{
    
}
- (void)updateScheduleSuccess{
    
}
- (void)updateScheduleError:(ResultStatus *)resultStatus{
    
}
@end
