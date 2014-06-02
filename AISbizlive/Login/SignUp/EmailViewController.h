//
//  EmailViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailViewController : UIViewController
{
    __weak IBOutlet UIButton *Donebtn;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UIButton *resendEmailButton;
    __weak IBOutlet UITextField *emailTextField;
}
- (IBAction)Donebtn:(id)sender;
- (IBAction)resendEmail:(id)sender;
@end
