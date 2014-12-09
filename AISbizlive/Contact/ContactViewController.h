//
//  ContactViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWTableViewCell.h"

#import "ServiceCT01_GetContactList.h"
#import "ServiceCT06_GetGroupContactList.h"
#import "ServiceCT04_DeleteContact.h"
#import "ServiceCT11_DeleteGroupContact.h"
#import "AddPeopleViewController.h"
#import "DetailPeopleViewController.h"
#import "AddGroupViewController.h"
#import "DetailGroupViewController.h"
@class ContactViewController;
@protocol ContactViewControllerDelegate <NSObject>
- (void)didFinishSelectedContact:(NSMutableArray *)contactsArray Group:(NSMutableArray *)groupsArray;
@end
@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,SWTableViewCellDelegate,GetContactListDelegate,DeleteContactDelegate,GetGroupContactListDelegate,DeleteGroupContactDelegate,AddPeopleViewControllerDelegate,DetailPeopleViewControllerDelegate,AddGroupViewControllerDelegate,DetailGroupViewControllerDelegate>
{
    
    IBOutlet UILabel *nameLogin;
    __weak IBOutlet UITextField *seachTextField;
    __weak IBOutlet UISegmentedControl *selectPeopleAndGroup;
    IBOutlet UITableView *testTable;
}
- (IBAction)actionSelect:(id)sender;
@property (nonatomic, strong)NSMutableArray *messagegroupsArray;
@property (nonatomic, strong)NSMutableArray *messagecontactsArray;
@property (nonatomic, weak) id <ContactViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *contactSelect;

@end
