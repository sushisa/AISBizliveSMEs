//
//  MessageTableViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "MessageTableViewController.h"
#import "AISGlobal.h"
#import "AISImageGlobal.h"
#import "AppDelegate.h"
#import "TemplateViewController.h"
@interface MessageTableViewController ()
{
    NSMutableArray *checkHeightCell;
    UITableViewCell *tstCell;
    UIView *spinnerView;
    UIDatePicker *datePicker;
    NSUInteger i;
}
@end

@implementation MessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    i = 3;
     checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"110",@"227",@"40",@"120",@"56",@"56",@"56",@"56",@"40", nil];
    self.navigationItem.rightBarButtonItem = [self MessageRightButton];
    self.navigationItem.leftBarButtonItem = [self MessageLeftButton];
    
    //Immediately
    UITapGestureRecognizer *ImmediatelyTap = [[UITapGestureRecognizer alloc]
                                              initWithTarget: self
                                              action: @selector(immediatelySelected:)];
    [ImmediatelyTap setNumberOfTouchesRequired:1];
    [immediatelyView addGestureRecognizer:ImmediatelyTap];
    immediatelyImage.image = [UIImage imageNamed:OK_GREEN];
    immediatelyView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    
    //Schedule
    UITapGestureRecognizer *ScheduleTap = [[UITapGestureRecognizer alloc]
                   initWithTarget: self
                   action: @selector(ScheduleSelected:)];
    [ScheduleTap setNumberOfTouchesRequired:1];
    [scheduleView addGestureRecognizer:ScheduleTap];
    scheduleImage.image = [UIImage imageNamed:OK_GREY];
    
    //Start Date
    UITapGestureRecognizer *startDateTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(startDateSelect:)];
    [startDateTap setNumberOfTouchesRequired:1];
    [startDate addGestureRecognizer:startDateTap];
    
    //End Date
    UITapGestureRecognizer *endDateTap = [[UITapGestureRecognizer alloc]
                                            initWithTarget: self
                                            action: @selector(endDateSelect:)];
    [endDateTap setNumberOfTouchesRequired:1];
    [endDate addGestureRecognizer:endDateTap];
    
    //Send Time
    UITapGestureRecognizer *sendTimeTap = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self
                                          action: @selector(sendTimeSelect:)];
    [sendTimeTap setNumberOfTouchesRequired:1];
    [sendTime addGestureRecognizer:sendTimeTap];
    [self hideScheduleCell];
    
    [self setTextLangague];
    [self.tabBarController setSelectedIndex:2];
}
-(void)setTextLangague{
        self.title = [AISString commonString:TITLE :@"MESSAGE"];
        [self.navigationItem setTitle:[AISString commonString:TITLE :@"MESSAGE"]];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
-(void)hideScheduleCell{
    
//    [checkHeightCell replaceObjectAtIndex:1 withObject:@"40"];
//    [myTableView reloadData];
    [detailImmediatelyCell setHidden:NO];
    [myTableView setContentOffset:CGPointMake(myTableView.contentOffset.x, 0) animated:YES];
//    [myTableView setScrollEnabled:NO];
    [dateCell setHidden:YES];
    [onetimeCell setHidden:YES];
    [everydayCell setHidden:YES];
    [weekCell setHidden:YES];
    [monthCell setHidden:YES];
    [totalCell setHidden:YES];
    
    [checkHeightCell replaceObjectAtIndex:2 withObject:@"40"];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"0"];
    [myTableView reloadData];
}
-(void)showScheduleCell{
    [detailImmediatelyCell setHidden:YES];
    [myTableView setScrollEnabled:YES];
    [dateCell setHidden:NO];
    [onetimeCell setHidden:NO];
    [everydayCell setHidden:NO];
    [weekCell setHidden:NO];
    [monthCell setHidden:NO];
    [totalCell setHidden:NO];
    
    [checkHeightCell replaceObjectAtIndex:2 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"120"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"56"];
    [myTableView reloadData];
}
- (void)immediatelySelected:(UITapGestureRecognizer *)sender {
    scheduleImage.image = [UIImage imageNamed:OK_GREY];
    immediatelyImage.image = [UIImage imageNamed:OK_GREEN];
    immediatelyView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    scheduleView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [self hideScheduleCell];
}
- (void)ScheduleSelected:(UITapGestureRecognizer *)sender{
    immediatelyImage.image = [UIImage imageNamed:OK_GREY];
    scheduleImage.image = [UIImage imageNamed:OK_GREEN];
    scheduleView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    immediatelyView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [self showScheduleCell];
}
- (void)startDateSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"startDate":102];
}
- (void)endDateSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"endDate":103];
}
- (void)sendTimeSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"sendTime":104];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSUInteger numLines = textView.contentSize.height/textView.font.lineHeight;
    NSString *oldHeight = [checkHeightCell objectAtIndex:0];
    if([text isEqualToString:@"\n"]){
        if (i < 3) {
            i += 1;
        }

        if ([oldHeight isEqualToString:@"170"]) {
            return YES;
        }
        else {
            [messageView setFrame:CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y, messageView.frame.size.width, messageView.frame.size.height+20)];
          
            int old = [oldHeight intValue] + 20;
            [checkHeightCell replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",old]];
            [myTableView beginUpdates];
            [myTableView endUpdates];
            return YES;
        }
    }
    else if([text isEqualToString:@""]){
        if ([oldHeight isEqualToString:@"110"]) {
            return YES;
        }
        else {
                if (numLines < 4) {
                    if (i == numLines) {
                        [messageView setFrame:CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y, messageView.frame.size.width, messageView.frame.size.height-20)];
                        int old = [oldHeight intValue] - 20;
                        [checkHeightCell replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",old]];
                        [myTableView beginUpdates];
                        [myTableView endUpdates];
                        i -= 1;
                        return YES;
                    }
                }
        }
    }
    return YES;
}

-(void)openPicker : (NSString *)withLabel : (int)withTag{
    CGFloat positionY = [[UIScreen mainScreen] bounds].size.height - 215;
//
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,positionY, [[UIScreen mainScreen] bounds].size.width, 100)];
    datePicker.backgroundColor = [UIColor whiteColor];
//    if()
    if ([withLabel isEqualToString:@"sendTime"]) {
        [datePicker setDatePickerMode:UIDatePickerModeTime];
    }
    else{
        [datePicker setDatePickerMode:UIDatePickerModeDate];
    }
//    [datePicker setDate:[NSDate date]];  //This is the default
    [datePicker setHidden:NO];
    //    [myTableView setContentOffset:CGPointMake(0, 200)];
    //    [self.storyboard ]
    UIWindow* mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    
    // Create a full-screen subview
   spinnerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, datePicker.frame.origin.y-40 , [[UIScreen mainScreen] bounds].size.width, 40)];
    newView.backgroundColor = [[UIColor alloc] initWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(newView.frame.size.width-70, 0, 70, 40)];
    [btn setTitle:@"Done" forState:UIControlStateNormal];
    [btn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
    [btn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateHighlighted];
    [btn setTag:withTag];
    [btn addTarget:self
            action:@selector(addToLabel:)
     forControlEvents:UIControlEventTouchUpInside];
    [newView addSubview:btn];
    // Set up some properties of the subview
    spinnerView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.5f];
    [datePicker setAlpha:0.3f];
   [newView setAlpha:0.3f];
    [spinnerView addSubview:datePicker];
    [spinnerView addSubview:newView];
    // Add the subview to the main window
//    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
//        UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:[[TemplateViewController alloc] init]];
//        [popOver delegate];
//        [popOver presentPopoverFromRect:CGRectMake(0, 0, 320, 100) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
//    }
//    else{
        [mainWindow addSubview:spinnerView];
    [UIView animateWithDuration:.3f animations:^{
        [newView setAlpha:1.0f];
        [datePicker setAlpha:1.0f];
    }];
//    }
}
-(void)addToLabel:(id)sender{
    UIButton *button = (UIButton*) sender;
    NSLog(@"%ld",(long)button.tag);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy - MM - dd"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"h:mm a"];
    switch (button.tag) {
        case 102: {
            startDateLabel.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:[datePicker date]]];
            break;
        }
        case 103: {
            endDateLabel.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:[datePicker date]]];
            break;
        }
        case 104: {
            sendTimeLabel.text = [NSString stringWithFormat:@"%@",[timeFormat stringFromDate:[datePicker date]]];
            break;
        }
            
        default:
            break;
    }
    [spinnerView removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIBarButtonItem *)MessageRightButton{
    UIBarButtonItem *contactAddBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    [contactAddBtn setTintColor:[AISColor lightgreenColor]];
    return contactAddBtn;
}
-(UIBarButtonItem *)MessageLeftButton{
    UIBarButtonItem *contactDeleteBtn = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:nil];
    [contactDeleteBtn setTintColor:[AISColor lightgrayColor]];
    
    return contactDeleteBtn;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return [[checkHeightCell objectAtIndex:indexPath.row] floatValue];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    tstCell = [myTableView cellForRowAtIndexPath:indexPath];
    
    [toTextField resignFirstResponder];
    [messageTextField resignFirstResponder];
    switch (indexPath.row) {
        case 4:
            oneTimeImage.image = [UIImage imageNamed:OK_GREEN];
            break;
        case 5:
            everydayImage.image = [UIImage imageNamed:OK_GREEN];
            break;
        case 6:
            weekImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"142"];
            break;
        case 7:
            monthImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"250"];
            break;
        default:
            break;
    }
    [tableView beginUpdates];
    [tableView endUpdates];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 4:
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            break;
        case 5:
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            break;
        case 6:
            weekImage.image = [UIImage imageNamed:OK_GREY];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
            break;
        case 7:
            monthImage.image = [UIImage imageNamed:OK_GREY];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
            break;
        default:
            break;
    }
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (IBAction)sendTimeBtn:(id)sender {
    [self openPicker:@"sendTime":104];
}
- (IBAction)endDateBtn:(id)sender {
    [self openPicker:@"endDate":103];
}
- (IBAction)startDateBtn:(id)sender {
    [self openPicker:@"startDate":102];
}

- (IBAction)saveTemplate:(id)sender {
    NSLog(@"Save Template");
}

- (IBAction)selectTemplate:(id)sender {
    [self performSegueWithIdentifier:@"messageSelectTemplate" sender:self];
}
- (IBAction)addContactTo:(id)sender {
    NSLog(@"Add Contact To");
}

@end
