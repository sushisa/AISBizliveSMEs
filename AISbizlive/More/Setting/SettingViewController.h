//
//  SettingViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UITableViewController
{
    //Label
    
    __weak IBOutlet UILabel *bathLabel;
    __weak IBOutlet UILabel *message1Label;
    __weak IBOutlet UILabel *message2Label;
    __weak IBOutlet UILabel *message3Label;
    
    __weak IBOutlet UILabel *yourBalanceLabel;
    __weak IBOutlet UILabel *numberSMSLabel;
    __weak IBOutlet UILabel *usedSMSLabel;
    __weak IBOutlet UILabel *smsBalanceLabel;
    __weak IBOutlet UILabel *yourPackageLabel;
    
    //Button
    
    __weak IBOutlet UIButton *changPasswordButton;
}
@end
