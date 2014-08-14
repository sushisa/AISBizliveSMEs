//
//  TopUpViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopUpViewController : UIViewController
{
    
    __weak IBOutlet UILabel *topupLabel;
    __weak IBOutlet UILabel *mobileLabel;
    __weak IBOutlet UILabel *currentLabel;
    __weak IBOutlet UILabel *descriptionCurrent;
    __weak IBOutlet UILabel *currentBahtLabel;
    __weak IBOutlet UILabel *phoneLabel;
    __weak IBOutlet UILabel *serialLabel;
    __weak IBOutlet UITextField *serialTextfield;
}

@property (strong, nonatomic) NSString *checkPackage;
@end
