//
//  MessageHistoryViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceHT01_SendMessage.h"
#import "messageHistoryCell.h"
@interface MessageHistoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPickerViewDataSource,SendMessageHistoryDelegate>
{
    IBOutlet UITableView *myTable;
    IBOutlet UIView *fillterView;
    IBOutlet UIButton *fillterButton;
    IBOutlet UILabel *fillterLabel;
    IBOutlet UITextField *searchTextField;
}
@end
