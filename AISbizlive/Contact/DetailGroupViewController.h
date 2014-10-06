//
//  DetailGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 7/1/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceCT08_GroupMessageHistory.h"
@interface DetailGroupViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,GroupMessageHistoryDelegate>
{
    
    __weak IBOutlet UIImageView *ProfilePicture;
    __weak IBOutlet UITextField *fullNameTextField;
    __weak IBOutlet UITableView *messageTable;
}
@property (strong, nonatomic) NSString *nameGroup;
@property (strong, nonatomic) NSString *profileGroup;
@property (strong, nonatomic) NSString *idGroup;
@property (strong, nonatomic) NSMutableArray *GroupContact;
@end
