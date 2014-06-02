//
//  MessageTableViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 5/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewController : UITableViewController <UITextViewDelegate>
{
    //Table
    IBOutlet UITableView *myTableView;
    
    //Cell
    
    __weak IBOutlet UITableViewCell *detailImmediatelyCell;
    
    __weak IBOutlet UITableViewCell *dateCell;
    __weak IBOutlet UITableViewCell *onetimeCell;
    __weak IBOutlet UITableViewCell *everydayCell;
    __weak IBOutlet UITableViewCell *weekCell;
    __weak IBOutlet UITableViewCell *monthCell;
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
    __weak IBOutlet UITextField *toTextField;
    __weak IBOutlet UITextView *messageTextField;
    __weak IBOutlet UIView *messageView;
    
    //Open Picker
    __weak IBOutlet UIView *startDate;
    __weak IBOutlet UIView *endDate;
    __weak IBOutlet UIView *sendTime;
    
    __weak IBOutlet UILabel *startDateLabel;
    __weak IBOutlet UILabel *endDateLabel;
    __weak IBOutlet UILabel *sendTimeLabel;
    
}
- (IBAction)sendTimeBtn:(id)sender;
- (IBAction)endDateBtn:(id)sender;
- (IBAction)startDateBtn:(id)sender;
- (IBAction)saveTemplate:(id)sender;
- (IBAction)selectTemplate:(id)sender;
- (IBAction)addContactTo:(id)sender;
@end
