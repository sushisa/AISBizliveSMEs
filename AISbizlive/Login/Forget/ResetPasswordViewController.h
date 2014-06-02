//
//  ResetPasswordViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController
{
    
    __weak IBOutlet UITextField *reenterplaceholder;
    __weak IBOutlet UITextField *enterplaceholder;
}
- (IBAction)doneAction:(id)sender;
@end
