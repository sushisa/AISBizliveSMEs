//
//  DetailPeopleGroupViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 9/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceCT01_GetContactList.h"
@interface DetailPeopleGroupViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,GetContactListDelegate>
{

}
@property (strong, nonatomic) NSMutableArray *GroupContact;
@property (strong, nonatomic) NSString *GroupName;
@end
