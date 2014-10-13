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
@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate,GetContactListDelegate,DeleteContactDelegate,GetGroupContactListDelegate>
{
    
    __weak IBOutlet UITextField *seachTextField;
    __weak IBOutlet UISegmentedControl *selectPeopleAndGroup;
    __weak IBOutlet UITableView *testTable;
}
- (IBAction)actionSelect:(id)sender;

@property (strong, nonatomic) NSString *contactSelect;

@end
