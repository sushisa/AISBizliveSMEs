//
//  DetailGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 7/1/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceCT08_GroupMessageHistory.h"
#import "ServiceCT11_DeleteGroupContact.h"
@class DetailGroupViewController;
@protocol DetailGroupViewControllerDelegate <NSObject>
- (void)didFinishDeleteGroup:(NSString *)groupsID;
@end
@interface DetailGroupViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,GroupMessageHistoryDelegate,DeleteGroupContactDelegate>
{
    
    __weak IBOutlet UIImageView *ProfilePicture;
    __weak IBOutlet UITextField *fullNameTextField;
    __weak IBOutlet UILabel *fullNameLabel;
    __weak IBOutlet UITableView *messageTable;
}
@property (nonatomic, weak) id <DetailGroupViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *arrayContactGroup;
@property (strong, nonatomic) NSString *nameGroup;
@property (strong, nonatomic) NSString *profileGroup;
@property (strong, nonatomic) NSString *idGroup;
@end
