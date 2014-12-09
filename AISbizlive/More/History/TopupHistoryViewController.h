//
//  TopupHistoryViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceHT02_Topup.h"
#import "topupHistoryCell.h"
@interface TopupHistoryViewController : UITableViewController<TopupDelegate>
{
    IBOutlet UITableView *myTable;
    
}
@end
