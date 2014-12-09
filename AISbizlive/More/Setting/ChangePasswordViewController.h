//
//  ChangePasswordViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceST02_ChangePassword.h"
@interface ChangePasswordViewController : UIViewController<ChangePasswordDelegate>
{
    __weak IBOutlet UILabel *newPasswordLabel;
    __weak IBOutlet UILabel *oldPasswordLabel;
    
    __weak IBOutlet UITextField *oldPasswordTextField;
    
    __weak IBOutlet UITextField *newPasswordTextField;
    
    __weak IBOutlet UITextField *reNewPasswordTextField;
    __weak IBOutlet UIButton *doneButton;
}
- (IBAction)doneAction:(id)sender;
@end
