//
//  TemplateViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 3/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "ServiceTP04_DeleteTemplate.h"
#import "ServiceTP02_GetTemplateList.h"
#import "AddTemplateViewController.h"
@class TemplateViewController;
@protocol TemplateViewControllerDelegate <NSObject>
- (void)didFinishSelectedTemplate:(NSString *)templatesMessage;
@end
@interface TemplateViewController : UITableViewController<SWTableViewCellDelegate,DeleteTemplateDelegate,AddTemplateViewControllerDelegate,GetTemplateListDelegate>{
    
    IBOutlet UITableView *messageTable;
}
@property (nonatomic, weak) id <TemplateViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *templeSelected;
@end
