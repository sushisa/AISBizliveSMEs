//
//  AddGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGroupViewController : UIViewController<UITextFieldDelegate>
{
    __weak IBOutlet UITextField *nameGroupTextField;
    __weak IBOutlet UILabel *contactLabel;
    __weak IBOutlet UIButton *profileImage;
}
@property (strong, nonatomic) NSString *nameGroup;
@property (strong, nonatomic) NSString *profileGroup;
@property (strong, nonatomic) NSString *idGroup;

@end
