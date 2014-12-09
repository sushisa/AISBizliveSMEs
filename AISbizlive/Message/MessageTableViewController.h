//
//  MessageTableViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateViewController.h"
#import "ServiceTP02_GetTemplateList.h"
#import "ServiceMS01_SendMessage.h"
#import "ServiceMS02_SaveSchedule.h"
#import "ServiceRC03_UpdateSchedule.h"
#import "ServiceST01_SettingProfile.h"
#import "ContactViewController.h"
#import "TITokenField.h"
@interface MessageTableViewController : UITableViewController <UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,TemplateViewControllerDelegate,GetTemplateListDelegate,SendMessageDelegate,SaveScheduleDelegate,SettingProfileDelegate,ContactViewControllerDelegate,TITokenFieldDelegate,UpdateScheduleDelegate>
{
    //Table
    IBOutlet UITableView *myTableView;
    
    //Cell
    
    __weak IBOutlet UITableViewCell *startDateCell;
    __weak IBOutlet UITableViewCell *endDateCell;
    __weak IBOutlet UITableViewCell *sendTimeCell;
    __weak IBOutlet UITableViewCell *detailImmediatelyCell;
    
    __weak IBOutlet UITableViewCell *dateCell;
    __weak IBOutlet UITableViewCell *onetimeCell;
    __weak IBOutlet UILabel *onetimeLabel;
    __weak IBOutlet UIView *onetimeViewCell;
    
    __weak IBOutlet UITableViewCell *everydayCell;
    __weak IBOutlet UILabel *everydayLabel;
    __weak IBOutlet UIView *everydayViewCell;
    __weak IBOutlet UITableViewCell *weekCell;
    __weak IBOutlet UILabel *weekLabel;
    __weak IBOutlet UIView *weekView;
    __weak IBOutlet UITableViewCell *monthCell;
    __weak IBOutlet UIView *weekViewCell;
    __weak IBOutlet UILabel *monthLabel;
    __weak IBOutlet UIView *monthViewCell;
    __weak IBOutlet UIView *monthView;
    __weak IBOutlet UITableViewCell *totalCell;
    
    //ImageCell
    __weak IBOutlet UIImageView *oneTimeImage;
    __weak IBOutlet UIImageView *everydayImage;
    __weak IBOutlet UIImageView *monthImage;
    __weak IBOutlet UIImageView *weekImage;
    
    //ViewCheck
    __weak IBOutlet UIView *scheduleView;
    __weak IBOutlet UIView *immediatelyView;
    
    //ImageViewCheck
    __weak IBOutlet UIImageView *scheduleImage;
    __weak IBOutlet UIImageView *immediatelyImage;
    
    //TextView
    __weak IBOutlet UITextView *messageTextField;
    __weak IBOutlet UIView *messageView;
    
    IBOutlet TITokenFieldView *contactView;
//    __weak IBOutlet UIView *contactView;
    __weak IBOutlet UILabel *toLabel;
    
//    __weak IBOutlet UIView *addTagView;
    __weak IBOutlet UIScrollView *scrollContactView;
    //Label
    __weak IBOutlet UILabel *scheduleLabel;
    __weak IBOutlet UILabel *immediatelyLabel;
    __weak IBOutlet UILabel *totalSMSSchedule;
    
    //Open Picker
    __weak IBOutlet UIView *startDate;
    __weak IBOutlet UIView *endDate;
    __weak IBOutlet UIView *sendTime;
    
    
    __weak IBOutlet UILabel *expTimeLabel;
    __weak IBOutlet UILabel *startDateLabel;
    __weak IBOutlet UILabel *startDateTitle;
    
    __weak IBOutlet UILabel *endDateLabel;
    __weak IBOutlet UILabel *endDateTitle;
    
    __weak IBOutlet UILabel *sendTimeLabel;
    __weak IBOutlet UILabel *sendTimeTitle;
    
    
    //DetailMessage
    
    __weak IBOutlet UILabel *expTimeTitle;
    
    __weak IBOutlet UILabel *bytesLabel;
    
    __weak IBOutlet UILabel *messageNoLabel;
    __weak IBOutlet UILabel *messageNoTitle;
     //Button
    __weak IBOutlet UIButton *selectTemplate;
    __weak IBOutlet UIButton *saveTemplate;
    __weak IBOutlet UIButton *variableSMS;
   
    IBOutlet UILabel *balanceSMS;
}
- (IBAction)variableSMSBtn:(id)sender;
- (IBAction)popupDetailMessage:(id)sender;

@property (strong, nonatomic) NSArray *arrayContact;
@property (strong, nonatomic) NSMutableArray *arraySchedule;

- (IBAction)empTimeBtn:(id)sender;
- (IBAction)sendTimeBtn:(id)sender;
- (IBAction)endDateBtn:(id)sender;
- (IBAction)startDateBtn:(id)sender;
@end
