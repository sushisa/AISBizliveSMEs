//
//  ForgetEmailViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetEmailViewController : UIViewController
{
    
    __weak IBOutlet UITextField *emailPlaceholder;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UIButton *resendEmail;
    __weak IBOutlet UIButton *doneButton;
}
- (IBAction)doneAction:(id)sender;
@end
