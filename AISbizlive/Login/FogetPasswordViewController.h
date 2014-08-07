//
//  FogetPasswordViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FogetPasswordViewController : UIViewController{
    
    __weak IBOutlet UILabel *forgetPassLabel;
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UIButton *doneButton;
}
- (IBAction)doneAction:(id)sender;
@end
