//
//  ViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageView/PageContentViewController.h"
#import <FacebookSDK/FacebookSDK.h>
@interface StartViewController : UIViewController <UIPageViewControllerDataSource,FBLoginViewDelegate>
{
    __weak IBOutlet UIButton *btnFB;
    __weak IBOutlet UISwitch *BtnchangeLanguage;
    __weak IBOutlet UIButton *btnSignUpEmail;
    __weak IBOutlet UIButton *btnSignUpFacebook;
    __weak IBOutlet UIButton *btnSignIn;
}
//- (IBAction)SignClick:(id)sender;
- (IBAction)ChangeLanguage:(id)sender;
- (IBAction)FacebookLogin:(id)sender;
- (IBAction)SignupEmail:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;
@end
