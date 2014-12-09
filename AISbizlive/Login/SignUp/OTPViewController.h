//
//  OTPViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceLG05_VerifyByOtp.h"
#import "ServiceLG03_RequestOtpVerification.h"
@interface OTPViewController : UIViewController <UITextFieldDelegate,VerifyByOtpDelegate,RequestOtpVerificationDelegate>
{
    
    __weak IBOutlet UIView *otpView;
    __weak IBOutlet UILabel *OTPLabel;
    __weak IBOutlet UIButton *resendOTPButton;
    __weak IBOutlet UIButton *doneButton;
    __weak IBOutlet UITextField *otpTextField;
}

@property (strong, nonatomic) NSString *emailAddress;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *userId;
- (IBAction)confirmOTP:(id)sender;

- (IBAction)resendOTP:(id)sender;
@end
