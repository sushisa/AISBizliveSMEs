//
//  DetailPeopleViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 6/6/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ServiceCT05_ContactMessageHistory.h"
#import "ServiceCT04_DeleteContact.h"

@class DetailPeopleViewController;
@protocol DetailPeopleViewControllerDelegate <NSObject>
- (void)didFinishDeleteContact:(NSString *)contactsID;
@end
@interface DetailPeopleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ContactMessageHistoryDelegate,DeleteContactDelegate>
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

@property (nonatomic, weak) id <DetailPeopleViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *profile;
@property (strong, nonatomic) NSString *ID;

@end
