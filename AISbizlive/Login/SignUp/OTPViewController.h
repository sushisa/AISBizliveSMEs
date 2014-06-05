//
//  OTPViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTPViewController : UIViewController <UITextFieldDelegate>
{
    
    __weak IBOutlet UIView *otpView;
    __weak IBOutlet UILabel *OTPLabel;
    __weak IBOutlet UIButton *resendOTPButton;
    __weak IBOutlet UIButton *doneButton;
    __weak IBOutlet UITextField *otpTextField;
}

@property (strong, nonatomic) NSString *emailAddress;
@property (strong, nonatomic) NSString *phoneNumber;
- (IBAction)confirmOTP:(id)sender;

- (IBAction)resendOTP:(id)sender;
@end
