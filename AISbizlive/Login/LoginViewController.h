//
//  LoginViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/12/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    
    __weak IBOutlet UIButton *forgetPassButton;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UIButton *signinButton;
    __weak IBOutlet UITextField *passwordField;
}
- (IBAction)signIn:(id)sender;

@end
