//
//  ScheduleViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 3/19/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceRC01_GetScheduleList.h"
#import "ServiceRC02_DeleteSchedule.h"
#import "SWTableViewCell.h"
@interface ScheduleViewController : UITableViewController<SWTableViewCellDelegate,GetScheduleListDelegate,DeleteScheduleDelegate>
{
    
    IBOutlet UITableView *mytable;
}
@end
