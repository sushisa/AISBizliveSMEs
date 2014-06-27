//
//  DetailPeopleViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 6/6/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPeopleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //Field
    __weak IBOutlet UIImageView *profileImage;
    __weak IBOutlet UITextField *lastNameField;
    __weak IBOutlet UITextField *firstNameField;
    __weak IBOutlet UITextField *phoneNumberField;
    __weak IBOutlet UITableView *messageTable;
    
    //Label
    
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *lastNameLabel;
    __weak IBOutlet UILabel *mobileLabel;
    __weak IBOutlet UIButton *deleteButton;
}
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *profile;


@end
