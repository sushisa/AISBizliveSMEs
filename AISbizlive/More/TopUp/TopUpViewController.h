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
    
    __weak IBOutlet UILabel *mobileLabel;
    __weak IBOutlet UILabel *currentLabel;
}

@property (strong, nonatomic) NSString *checkPackage;
@end
