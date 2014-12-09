//
//  AddGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "ServiceCT07_AddGroupContact.h"
#import "ServiceCT10_EditGroupContact.h"
#import "DetailPeopleGroupViewController.h"
@class AddGroupViewController;
@protocol AddGroupViewControllerDelegate <NSObject>
- (void)didFinishAddGroup:(NSDictionary *)groupsDict;
- (void)didFinishUpdateGroup:(NSDictionary *)groupsDict;
@end
@interface AddGroupViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate,AddGroupContactListDelegate,EditGroupContactDelegate,DetailPeopleGroupViewControllerDelegate>
{
    IBOutlet UITextField *searchTextField;
    __weak IBOutlet UITextField *nameGroupTextField;
    IBOutlet UILabel *nameGroupLabel;
    IBOutlet UITableView *myTable;
    __weak IBOutlet UILabel *contactLabel;
    __weak IBOutlet UIButton *profileImage;
}

@property (nonatomic, weak) id <AddGroupViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *nameGroup;
@property (strong, nonatomic) NSString *profileGroup;
@property (strong, nonatomic) NSString *idGroup;
@property (strong, nonatomic) NSMutableArray *contactList;
@property (strong, nonatomic) NSMutableArray *IDContactGroup;

- (IBAction)addPeopleToGroup:(id)sender;

@end
