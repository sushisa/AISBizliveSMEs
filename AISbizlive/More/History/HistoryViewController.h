//
//  HistoryViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 3/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UITableViewController
{
    __weak IBOutlet UILabel *sendHistory;
    
    __weak IBOutlet UILabel *balanceHistory;
    __weak IBOutlet UILabel *topupHistory;
}
@end
