//
//  SettingViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 10/22/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ServiceST01_SettingProfile.h"

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SettingProfileDelegate>
{
    //Label
    
    IBOutlet UITableView *packageTable;
    __weak IBOutlet UILabel *bathLabel;
    __weak IBOutlet UILabel *message1Label;
    __weak IBOutlet UILabel *message2Label;
    __weak IBOutlet UILabel *message3Label;
    
    __weak IBOutlet UILabel *yourBalanceLabel;
    __weak IBOutlet UILabel *numberSMSLabel;
    __weak IBOutlet UILabel *usedSMSLabel;
    __weak IBOutlet UILabel *smsBalanceLabel;
    __weak IBOutlet UILabel *yourPackageLabel;
    
    //LabelValue
    
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *mobileLabel;
    __weak IBOutlet UILabel *balanceLabel;
    __weak IBOutlet UILabel *totalSMSLabel;
    __weak IBOutlet UILabel *usedLabel;
    __weak IBOutlet UILabel *smsbalanceLabel;
    //Button
    
    __weak IBOutlet UIButton *changPasswordButton;
}
@end
