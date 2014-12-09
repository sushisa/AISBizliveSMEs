//
//  LoginViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/12/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceLG07_Login.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate,LoginDelegate>{
    
    __weak IBOutlet UIButton *forgetPassButton;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UIButton *signinButton;
    __weak IBOutlet UITextField *passwordField;
    __weak IBOutlet UILabel *passwordLabel;
}
- (IBAction)signIn:(id)sender;

@end
