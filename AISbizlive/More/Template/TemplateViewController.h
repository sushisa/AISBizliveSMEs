//
//  TemplateViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 3/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateViewController : UITableViewController{
    
    IBOutlet UITableView *messageTable;
}
@property (strong, nonatomic) NSString *templeSelected;
@end
