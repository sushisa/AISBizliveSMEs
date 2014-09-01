//
//  ContactViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <startup_sdk/ServiceBizLive.h>
#import "SWTableViewCell.h"
@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate,ServiceBizLiveDelegate>
{
    
    __weak IBOutlet UITextField *seachTextField;
    __weak IBOutlet UISegmentedControl *selectPeopleAndGroup;
    __weak IBOutlet UITableView *testTable;
}
- (IBAction)actionSelect:(id)sender;

@property (strong, nonatomic) NSString *contactSelect;

@end
