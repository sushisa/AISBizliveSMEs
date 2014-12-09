//
//  NewsViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 3/17/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceNW01_GetNews.h"
@interface NewsViewController : UITableViewController<GetNewsDelegate>
{
    IBOutlet UITableView *myTable;
}
@end
