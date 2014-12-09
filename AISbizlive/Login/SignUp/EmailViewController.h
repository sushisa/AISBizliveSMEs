//
//  EmailViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceLG06_VerifyByEmail.h"
#import "ServiceLG04_RequestEmailVerification.h"
@interface EmailViewController : UIViewController <VerifyByEmailDelegate,RequestEmailVerificationDelegate>
{
    __weak IBOutlet UIView *emailView;
    __weak IBOutlet UIButton *Donebtn;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UIButton *resendEmailButton;
    __weak IBOutlet UITextField *emailTextField;
}
@property (strong, nonatomic) NSString *emailAddress;
@property (strong, nonatomic) NSString *phoneNumber;
- (IBAction)Donebtn:(id)sender;
- (IBAction)resendEmail:(id)sender;
@end
