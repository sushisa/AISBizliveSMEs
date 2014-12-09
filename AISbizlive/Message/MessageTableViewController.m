
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
#import "AddTemplateViewController.h"
#import "ContactViewController.h"
@interface MessageTableViewController ()
{
    NSMutableArray *checkHeightCell;
    NSMutableArray *weekDetail;
    NSMutableArray *hour;
    UITableViewCell *tstCell;
    UIView *spinnerView;
    UIDatePicker *datePicker;
    NSUInteger i;
    NSUInteger checkLine;
    UIPickerView *hourPicker;
    UITextView *toText;
    float checkLineTo;
    float fixHeight;
    int tagTag;
    UIView *addTagView;
    UIView *tagView;
    int lineTo;
    
    //
    NSDictionary *templateDict;
    NSMutableArray *templateArray;
    NSMutableArray *groupArray;
    NSMutableArray *contactArray;
    NSMutableArray *mobileNoArray;
    NSMutableArray *weekyArray;
    NSMutableArray *monthArray;
    NSDate *alldateFormString;
    int checkType;
    int selectIndex;
    int oldIndex;
    
    AISAlertView *alertView;
}
@end

@implementation MessageTableViewController
@synthesize arraySchedule;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Load
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDataDefault];
    [self.tabBarController setSelectedIndex:2];
}
-(void)setDataDefault{
    i = 3;
    checkLine = 1;
    lineTo = 0;
    checkType = 1;
    selectIndex = 1;
    checkLineTo = 0.0f;
    fixHeight = 0.0f;
    tagTag = 1000;
    alertView = [[AISAlertView alloc] init];
    contactArray = [[NSMutableArray alloc] init];
    groupArray = [[NSMutableArray alloc] init];
    mobileNoArray = [[NSMutableArray alloc] init];
    weekyArray = [[NSMutableArray alloc] init];
    monthArray = [[NSMutableArray alloc] init];
    templateArray = [[NSMutableArray alloc] init];
    hour = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
    checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"60",@"120",@"150",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"50", nil];
    weekDetail = [[NSMutableArray alloc] initWithArray:[AISString commonArray:@"WEEK_DETAIL"]];


    [messageTextField setText:[AISString commonString:typePlacehoder KeyOfValue:@"MESSAGE"]];
    [messageTextField setTextColor:[AISColor lightgrayColor]];
//    contactView = [[TITokenFieldView alloc] init];
    [contactView.tokenField removeAllTokens];
    [contactView setSourceArray:[AISpList getContactListArray]];
    [contactView.tokenField setDelegate:self];
    [contactView setShouldSearchInBackground:NO];
    [contactView setShouldSortResults:NO];
    [contactView.tokenField addTarget:self action:@selector(tokenFieldFrameDidChange:) forControlEvents:TITokenFieldControlEventFrameDidChange];
    [contactView.tokenField setTokenizingCharacters:[NSCharacterSet characterSetWithCharactersInString:@",;."]]; // Default is a comma
    [contactView.tokenField setPromptText:@"To:"];
    [contactView.tokenField addTarget:self action:@selector(tokenFieldChangedEditing:) forControlEvents:UIControlEventEditingDidBegin];
    [contactView.tokenField addTarget:self action:@selector(tokenFieldChangedEditing:) forControlEvents:UIControlEventEditingDidEnd];
    [bytesLabel setText:@"0/160"];
    [messageNoLabel setText:@"0"];
    [sendTimeLabel setText:@""];
    [startDateLabel setText:@""];
    [endDateLabel setText:@""];
    [expTimeLabel setText:@"1"];
    [self setViewGesture];
    [self setTextLangague];
    if (self.arraySchedule.count > 0) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction)  withTarget:self];
        [self showScheduleCell];
        [self setScheduleData];
    }else{
        
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] ClearButtonWithAction:@selector(clearAction)  withTarget:self];
            self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(sendMessage)  withTarget:self];
        [self showImmediately];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    [self setTextLangague];
    [self setViewGesture];
    [self callSetting];
    if ([[AISpList getTemplateListArray] count] == 0) {
        [self callGetTemplateList];
    }
}
-(void)returnFormSelectTemplate{
   
}
-(void)setScheduleData{
    NSDictionary * dict = [NSDictionary dictionaryWithObject:self.arraySchedule forKey:@"dict"];
    int index = 0;
    if ([[[dict objectForKey:@"dict"] objectForKey:RES_KEY_RECURRING_TYPE] isEqualToString:@"3"]) {
        index = 9;
        if ([[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MONTHLY] count] == 32) {
            for (int tagBTN = 1; tagBTN < 34; tagBTN++) {
                UIButton *checkBtn = (UIButton *)[monthView viewWithTag:tagBTN];
                [checkBtn setSelected:YES];
            }
            for (int addArr = 0; addArr < 32; addArr++) {
                 [monthArray addObject:[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MONTHLY] objectAtIndex:addArr]];
            }
        }
        else{
            for (int k = 0; k < [[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MONTHLY] count]; k++) {
            
            UIButton *checkBtn = (UIButton *)[monthView viewWithTag:[[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MONTHLY] objectAtIndex:k] intValue]];
            [checkBtn setSelected:YES];
                [monthArray addObject:[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MONTHLY] objectAtIndex:k]];
            }
        }
    }
    else if ([[[dict objectForKey:@"dict"] objectForKey:RES_KEY_RECURRING_TYPE] isEqualToString:@"2"]) {
        index = 8;
        for (int k = 0; k < [[[dict objectForKey:@"dict"] objectForKey:RES_KEY_WEEKLY] count]; k++) {
            UIButton *checkBtn = (UIButton *)[weekView viewWithTag:[[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_WEEKLY] objectAtIndex:k] intValue]];
            [checkBtn setSelected:YES];
            [weekyArray addObject:[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_WEEKLY] objectAtIndex:k]];
        }
    }
    else if ([[[dict objectForKey:@"dict"] objectForKey:RES_KEY_RECURRING_TYPE] isEqualToString:@"1"]){
        index = 7;
    }
    else{
        index = 6;
    }
    contactArray = [[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_LIST];
    groupArray = [[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_GROUP_LIST];
    mobileNoArray = [[dict objectForKey:@"dict"] objectForKey:RES_KEY_MOBILE_LIST];
    for (int contactCount = 0; contactCount < [[[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_LIST] count]; contactCount ++) {
        TIToken * token = [contactView.tokenField addTokenWithTitle:[[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_LIST] objectAtIndex:contactCount] objectForKey:RES_KEY_CONTACT_NAME]];
        [token setTintColor:[AISColor lightgreenColor]];
        [contactView.tokenField layoutTokensAnimated:YES];
    }
    for (int groupCount = 0; groupCount < [[[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_GROUP_LIST] count]; groupCount ++) {
        TIToken * token = [contactView.tokenField addTokenWithTitle:[[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_CONTACT_GROUP_LIST] objectAtIndex:groupCount] objectForKey:RES_KEY_GROUP_NAME]];
        [token setTintColor:[AISColor lightgreenColor]];
        [contactView.tokenField layoutTokensAnimated:YES];
    }
    for (int mobileCount = 0; mobileCount < [[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MOBILE_LIST] count]; mobileCount ++) {
        TIToken * token = [contactView.tokenField addTokenWithTitle:[[[dict objectForKey:@"dict"] objectForKey:RES_KEY_MOBILE_LIST] objectAtIndex:mobileCount]];
        [token setTintColor:[AISColor lightgreenColor]];
        [contactView.tokenField layoutTokensAnimated:YES];
    }
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    [self tableView:myTableView didSelectRowAtIndexPath:indexPath];
    [myTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    startDateLabel.text = [AISString dateFormat:[[dict objectForKey:@"dict"] objectForKey:RES_KEY_START_DATE]];
    messageTextField.textColor = [UIColor blackColor];
    messageTextField.text = [[dict objectForKey:@"dict"] objectForKey:RES_KEY_MESSAGE];
    sendTimeLabel.text =  [[dict objectForKey:@"dict"] objectForKey:RES_KEY_SEND_TIME];
    if ([[dict objectForKey:@"dict"] objectForKey:RES_KEY_END_DATE] == nil) {
        endDateLabel.text =  @"";
    }else{
        endDateLabel.text =  [AISString dateFormat:[[dict objectForKey:@"dict"] objectForKey:RES_KEY_END_DATE]];
    }
    expTimeLabel.text =  [NSString stringWithFormat:@"%@",[[dict objectForKey:@"dict"] objectForKey:RES_KEY_TIME_EXPIRE]];
    if ([[[dict objectForKey:@"dict"] objectForKey:RES_KEY_SCHEDULE_EDIT_EXPIRE] isEqualToString:@"Y"]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(callUpdateSchedule)];
        self.navigationItem.rightBarButtonItem.tintColor = [AISColor grayColor];
    }
    [bytesLabel setText:[AISSMSCharacter bytesString:messageTextField.text]];
    [messageNoLabel setText:[AISSMSCharacter messageNumber]];
}
-(void)viewWillDisappear:(BOOL)animated{
//    [self setDataDefault];
//    self.arrayContact = nil;
//    checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"60",@"120",@"150",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"50", nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Gesture
-(void)setViewGesture{
    //Immediately
    UITapGestureRecognizer *ImmediatelyTap = [[UITapGestureRecognizer alloc]
                                              initWithTarget: self
                                              action: @selector(immediatelySelected:)];
    [ImmediatelyTap setNumberOfTouchesRequired:1];
    [immediatelyView addGestureRecognizer:ImmediatelyTap];
    //Schedule
    UITapGestureRecognizer *ScheduleTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(ScheduleSelected:)];
    [ScheduleTap setNumberOfTouchesRequired:1];
    [scheduleView addGestureRecognizer:ScheduleTap];
    
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
}

#pragma mark - Langague In View
-(void)setTextLangague{
        self.title = [AISString commonString:typeTitle KeyOfValue :@"MESSAGE"];
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"MESSAGE"]];
//    [messageTextField]
//    [selectTemplate setTitle:[AISString commonString:typeButton KeyOfValue :@"SELECT_TEMPLATE"] forState:UIControlStateNormal];
    if ([templateArray count] == 0) {
        [templateArray addObjectsFromArray:[AISpList getTemplateListArray]];
        [selectTemplate setTitle:[NSString stringWithFormat:@"%@ (%d)",[AISString commonString:typeButton KeyOfValue :@"SELECT_TEMPLATE"],[templateArray count]] forState:UIControlStateNormal];
    }
    [saveTemplate setTitle:[AISString commonString:typeButton KeyOfValue :@"SAVE_TEMPLATE"] forState:UIControlStateNormal];
    [variableSMS setTitle:[AISString commonString:typeButton KeyOfValue :@"VARIABLE_SMS"] forState:UIControlStateNormal];
    [messageNoTitle setText:[AISString commonString:typeLabel KeyOfValue :@"MESSAGE_NO"]];
    [expTimeTitle setText:[AISString commonString:typeLabel KeyOfValue :@"EXP_TIME"]];
    [scheduleLabel setText:[AISString commonString:typeButton KeyOfValue :@"SCHEDULE"]];
    [immediatelyLabel setText:[AISString commonString:typeButton KeyOfValue :@"IMMEDIATELY"]];
    [startDateTitle setText:[AISString commonString:typeLabel KeyOfValue :@"START_DATE"]];
    [endDateTitle setText:[AISString commonString:typeLabel KeyOfValue :@"END_DATE"]];
    [sendTimeTitle setText:[AISString commonString:typeLabel KeyOfValue :@"SEND_TIME"]];
    
    [onetimeLabel setText:[AISString commonString:typeLabel KeyOfValue :@"ONE_TIME"]];
    
    [everydayLabel setText:[AISString commonString:typeLabel KeyOfValue :@"EVERY_DAY"]];
    
    [weekLabel setText:[AISString commonString:typeLabel KeyOfValue :@"WEEK"]];
    
    [monthLabel setText:[AISString commonString:typeLabel KeyOfValue :@"MONTH"]];
    [totalSMSSchedule setText:[AISString commonString:typeLabel KeyOfValue :@"TOTALSMS"]];
    myTableView.rowHeight = UITableViewAutomaticDimension;

}

#pragma mark - Immediately

- (void)immediatelySelected:(UITapGestureRecognizer *)sender {
    [self showImmediately];
//    [myTableView setContentSize:CGSizeMake(myTableView.frame.size.width, 387)];
}
-(void)showImmediately{
    checkType = 1;
    scheduleImage.image = [UIImage imageNamed:OK_GREY];
    immediatelyImage.image = [UIImage imageNamed:OK_GREEN];
    immediatelyView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    scheduleView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [detailImmediatelyCell setHidden:NO];
    [myTableView setContentOffset:CGPointMake(myTableView.contentOffset.x, 0) animated:NO];
    [startDateCell setHidden:YES];
    [endDateCell setHidden:YES];
    [sendTimeCell setHidden:YES];
    [dateCell setHidden:YES];
    [onetimeCell setHidden:YES];
    [everydayCell setHidden:YES];
    [weekCell setHidden:YES];
    [monthCell setHidden:YES];
    //
    [startDateLabel setText:@""];
    [endDateLabel setText:@""];
    [sendTimeLabel setText:@""];
    //
    oneTimeImage.image = [UIImage imageNamed:OK_GREY];
    onetimeViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
    everydayImage.image = [UIImage imageNamed:OK_GREY];
    everydayViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
    weekImage.image = [UIImage imageNamed:OK_GREY];
    weekViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
    monthImage.image = [UIImage imageNamed:OK_GREY];
    monthViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [myTableView beginUpdates];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:8 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:9 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:10 withObject:@"50"];
    [myTableView endUpdates];
}
#pragma mark - Schedule

- (void)ScheduleSelected:(UITapGestureRecognizer *)sender{
    [self showScheduleCell];
//    [self callSendMessage];
}
-(void)showScheduleCell{
    checkType = 2;
    immediatelyImage.image = [UIImage imageNamed:OK_GREY];
    scheduleImage.image = [UIImage imageNamed:OK_GREEN];
    scheduleView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    immediatelyView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [myTableView setScrollEnabled:YES];
    [dateCell setHidden:NO];
    [onetimeCell setHidden:NO];
    [everydayCell setHidden:NO];
    [weekCell setHidden:NO];
    [monthCell setHidden:NO];
    [self loadWeekView];
    [self loadMonthView];
    [myTableView beginUpdates];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:8 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:9 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:10 withObject:@"50"];
    [myTableView endUpdates];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:6 inSection:0];
    [self tableView:myTableView didSelectRowAtIndexPath:indexPath];
    [myTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}
-(void)loadWeekView{
    int row = 3;
    int column = 3;
    float originWidth = 92.0f;
    float originHeight = 28.0f;
    int valueOfWeek = 0;
    int weekTag = 1;
    NSArray *viewsToRemove = [weekView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    for (int l = 1; l <= row; l ++) {
        for (int j = 1; j <= column; j ++) {
            if (valueOfWeek == 7) {
                break;
            }
            UIButton *weekButton = [UIButton buttonWithType:UIButtonTypeCustom];
            //    [dateMonth setTitle:@" TEST" forState:UIControlStateNormal];
            [weekButton setTitle:[NSString stringWithFormat:@"%@",[weekDetail objectAtIndex:valueOfWeek]] forState:UIControlStateNormal];
            [weekButton setTitleColor:[AISColor lightgrayColor] forState:UIControlStateNormal];
            [weekButton setTitleColor:[AISColor lightgreenColor] forState:UIControlStateSelected];
            [weekButton setTitle:[NSString stringWithFormat:@"%@",[weekDetail objectAtIndex:valueOfWeek]] forState:UIControlStateSelected];
            [weekButton.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
            [weekButton setImage:[UIImage imageNamed:@"CheckBox.png"] forState:UIControlStateNormal];
             [weekButton setImage:[UIImage imageNamed:@"CheckBox_True.png"] forState:UIControlStateSelected];
            [weekButton  setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0)];
            [weekButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            weekButton.titleEdgeInsets = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 0.0f);
            [weekButton setFrame:CGRectMake((originWidth * (j - 1))+5, (originHeight * (l - 1))+(8 * (l - 1)), originWidth, originHeight)];
            [weekButton setTag:weekTag];
            [weekButton addTarget:self
                       action:@selector(weekDetailClick:)
             forControlEvents:UIControlEventTouchUpInside];
            weekTag += 1;
            [weekView addSubview:weekButton];
            valueOfWeek += 1;
        }
    }
    
    //Week View
    UITapGestureRecognizer *weekViewTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(viewCellSelect:)];
    [weekViewTap setNumberOfTouchesRequired:1];
    [weekView addGestureRecognizer:weekViewTap];
}
- (void)viewCellSelect:(UITapGestureRecognizer *)sender {
//FakeView
    
}
-(void) weekDetailClick:(id)sender
{
    
    UIButton *button = (UIButton *)sender;
        [button setSelected:!button.selected];
    if (button.selected) {
        if (selectIndex == 8) {
            [monthArray removeAllObjects];
            if ([weekyArray count] == 0) {
                [weekyArray addObject:[NSString stringWithFormat:@"%d",button.tag]];
            }
            for (int l = 0; l < [weekyArray count]; l++) {
                if (![[weekyArray objectAtIndex:l] isEqualToString:[NSString stringWithFormat:@"%d",button.tag]]) {
                    [weekyArray addObject:[NSString stringWithFormat:@"%d",button.tag]];
                }
            }
        }
        else if (selectIndex == 9){
            [weekyArray removeAllObjects];
            if (button.tag == 33) {
                [monthArray removeAllObjects];
                for (int btnTag = 1; btnTag < 33; btnTag++) {
                    UIButton *checkBtn = (UIButton *)[monthView viewWithTag:btnTag];
                    [checkBtn setSelected:YES];
                    [monthArray addObject:[NSString stringWithFormat:@"%d",btnTag]];
                    
                }
            }
            else{
                if ([monthArray count] == 0) {
                    [monthArray addObject:button.titleLabel.text];
                }
                for (int l = 0; l < [monthArray count]; l++) {
                    if (![[monthArray objectAtIndex:l] isEqualToString:[NSString stringWithFormat:@"%d",button.tag]]) {
                        [monthArray addObject:[NSString stringWithFormat:@"%d",button.tag]];
                    }
                }
            }
        }
    }
    else{
        if (selectIndex == 8) {
            [monthArray removeAllObjects];
            if ([weekyArray count] != 0) {
                for (int l = 0; l < [weekyArray count]; l++) {
                    if ([[weekyArray objectAtIndex:l] isEqualToString:[NSString stringWithFormat:@"%d",button.tag]]) {
                        [weekyArray removeObjectAtIndex:l];
                    }
                }
            }
        }
        else if (selectIndex == 9){
            [weekyArray removeAllObjects];
            if (button.tag == 33) {
                [monthArray removeAllObjects];
                for (int btnTag = 1; btnTag < 33; btnTag++) {
                    UIButton *checkBtn = (UIButton *)[monthView viewWithTag:btnTag];
                    [checkBtn setSelected:NO];
                }
            }
            else{
                if ([monthArray count] != 0) {
                    for (int l = 0; l < [monthArray count]; l++) {
                        if ([[monthArray objectAtIndex:l] isEqualToString:[NSString stringWithFormat:@"%d",button.tag]]) {
                            [monthArray removeObjectAtIndex:l];
                        }
                    }
                }
            }
        }
    }
}
-(void)loadMonthView{
    int row = 7 ;
    int column = 5;
    int day = 1;
    float originWidth = 50.0f;
    float originHeight = 30.0f;
    NSArray *viewsToRemove = [monthView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    for (int l = 1; l <= row; l ++) {
        for (int j = 1; j <= column; j ++) {
            UIButton *dateMonth = [UIButton buttonWithType:UIButtonTypeCustom];
            [dateMonth setTitleColor:[AISColor lightgrayColor] forState:UIControlStateNormal];
            [dateMonth setTitleColor:[AISColor lightgreenColor] forState:UIControlStateSelected];
            [dateMonth.titleLabel setFont:[UIFont systemFontOfSize:11.0f]];
            [dateMonth setImage:[UIImage imageNamed:@"CheckBox.png"] forState:UIControlStateNormal];
            [dateMonth setImage:[UIImage imageNamed:@"CheckBox_True.png"] forState:UIControlStateSelected];
            [dateMonth  setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0)];
            [dateMonth setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            dateMonth.titleEdgeInsets = UIEdgeInsetsMake(0.0f, 3.0f, 0.0f, 0.0f);
            if (day <= 31) {
                [dateMonth setTitle:[NSString stringWithFormat:@"%d",day] forState:UIControlStateNormal];
                ;
                [dateMonth setTitle:[NSString stringWithFormat:@"%d",day] forState:UIControlStateSelected];
                [dateMonth setFrame:CGRectMake((originWidth * (j - 1))+(5 * j), (originHeight * (l - 1))+(8 * (l - 1)), originWidth, originHeight)];
            }
            else if (day == 32) {
                //END
                [dateMonth setTitle:[NSString stringWithFormat:@"%@",[AISString commonString:typeLabel KeyOfValue :@"MONTH_END_MONTH"]] forState:UIControlStateNormal];
                ;
                [dateMonth setTitle:[NSString stringWithFormat:@"%@",[AISString commonString:typeLabel KeyOfValue :@"MONTH_END_MONTH"]] forState:UIControlStateSelected];
                [dateMonth setFrame:CGRectMake(60, 228, 140, originHeight)];
            }
            else if (day == 33){
                //ALL
                [dateMonth setTitle:[NSString stringWithFormat:@"%@",[AISString commonString:typeLabel KeyOfValue :@"MONTH_ALL"]] forState:UIControlStateNormal];
                ;
                [dateMonth setTitle:[NSString stringWithFormat:@"%@",[AISString commonString:typeLabel KeyOfValue :@"MONTH_ALL"]] forState:UIControlStateSelected];
                [dateMonth setFrame:CGRectMake(225, 228, originWidth, originHeight)];
                [dateMonth addTarget:self
                              action:@selector(weekDetailClick:)
                    forControlEvents:UIControlEventTouchUpInside];
                [dateMonth setTag:day];
                [monthView addSubview:dateMonth];
                break;
            }
            
            [dateMonth addTarget:self
                           action:@selector(weekDetailClick:)
                 forControlEvents:UIControlEventTouchUpInside];
            [dateMonth setTag:day];
            [monthView addSubview:dateMonth];
             day += 1;
        }
    }
    
    //Week View
    UITapGestureRecognizer *monthViewTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(viewCellSelect:)];
    [monthViewTap setNumberOfTouchesRequired:1];
    [monthView addGestureRecognizer:monthViewTap];
}

#pragma mark - Text View data source
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
        NSUInteger numLines = textView.contentSize.height/textView.font.lineHeight;
        
        NSString *oldHeight = [checkHeightCell objectAtIndex:1];
        if([text isEqualToString:@"\n"] || (numLines > checkLine)){
            
            if (i < 3) {
                i += 1;
            }
            
            if ([oldHeight intValue] < 190) {
                checkLine += 1;
                [messageView setFrame:CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y, messageView.frame.size.width, messageView.frame.size.height+20)];
                
                int old = [oldHeight intValue] + 20;
                [checkHeightCell replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%d",old]];
                [myTableView beginUpdates];
                [myTableView endUpdates];
            }
        }
        else if([text isEqualToString:@""]){
            if ([oldHeight intValue] > 110) {
                if (numLines < 4) {
                    if (i == numLines) {
                        checkLine -= 1;
                        [messageView setFrame:CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y, messageView.frame.size.width, messageView.frame.size.height-20)];
                        int old = [oldHeight intValue] - 20;
                        [checkHeightCell replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%d",old]];
                        [myTableView beginUpdates];
                        [myTableView endUpdates];
                        i -= 1;
                    }
                }
            }
        }
    return YES;
}
-(void)textViewDidChange:(UITextView *)textView{
    [bytesLabel setText:[AISSMSCharacter bytesString:messageTextField.text]];
    [messageNoLabel setText:[AISSMSCharacter messageNumber]];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView isEqual:messageTextField]) {
     
    if ([textView.text isEqualToString:[AISString commonString:typePlacehoder KeyOfValue:@"MESSAGE"]]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
        [textView becomeFirstResponder];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView isEqual:messageTextField]) {
        
    if ([textView.text isEqualToString:@""]) {
        textView.text = [AISString commonString:typePlacehoder KeyOfValue:@"MESSAGE"];
        textView.textColor = [AISColor lightgrayColor]; //optional
    }
    [textView resignFirstResponder];
    }
}
#pragma mark - Open Picker View
- (void)startDateSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"startDate":102];
}
- (void)endDateSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"endDate":103];
}
- (void)sendTimeSelect:(UITapGestureRecognizer *)sender {
    [self openPicker:@"sendTime":104];
}
- (IBAction)empTimeBtn:(id)sender {
    
    [self openPicker:@"empTime":105];
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

-(void)openPicker : (NSString *)withLabel : (int)withTag{
    CGFloat positionY = [[UIScreen mainScreen] bounds].size.height - 215;
    if ([withLabel isEqualToString:@"empTime"]){
        
        hourPicker =  [[UIPickerView alloc] initWithFrame:CGRectMake(0,positionY+55, [[UIScreen mainScreen] bounds].size.width, 100)];
        hourPicker.backgroundColor = [UIColor whiteColor];
        hourPicker.delegate = self;
        hourPicker.dataSource = self;
        [hourPicker setHidden:NO];
    }
    else {
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,positionY, [[UIScreen mainScreen] bounds].size.width, 100)];
        datePicker.backgroundColor = [UIColor whiteColor];
        if ([withLabel isEqualToString:@"sendTime"]) {
            [datePicker setDatePickerMode:UIDatePickerModeTime];
            [datePicker setLocale:[NSLocale systemLocale]];
        }
        else{
            [datePicker setDatePickerMode:UIDatePickerModeDate];
            [datePicker setMinimumDate:[NSDate date]];
        }
        
        [datePicker setHidden:NO];
    }
    
    UIWindow* mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    
    // Create a full-screen subview
   spinnerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    UIView *newView;
    
    if ([withLabel isEqualToString:@"empTime"]){
         newView = [[UIView alloc] initWithFrame:CGRectMake(0, hourPicker.frame.origin.y-40 , [[UIScreen mainScreen] bounds].size.width, 40)];
    }
    else {
        newView = [[UIView alloc] initWithFrame:CGRectMake(0, datePicker.frame.origin.y-40 , [[UIScreen mainScreen] bounds].size.width, 40)];
    }
    newView.backgroundColor = [[UIColor alloc] initWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 70, 40)];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateHighlighted];
//    [cancelBtn setTag:withTag];
    [cancelBtn addTarget:self
            action:@selector(cancelPicker)
  forControlEvents:UIControlEventTouchUpInside];
    [newView addSubview:cancelBtn];
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
    [hourPicker setAlpha:0.3f];
    if ([withLabel isEqualToString:@"empTime"]){
        [spinnerView addSubview:hourPicker];
        UITapGestureRecognizer *hourTap = [[UITapGestureRecognizer alloc]
                                               initWithTarget: self
                                               action: @selector(hourSelect:)];
        [hourTap setNumberOfTouchesRequired:1];
        [spinnerView addGestureRecognizer:hourTap];
    }
    else{
        [spinnerView addSubview:datePicker];
    }
    [spinnerView addSubview:newView];
        [mainWindow addSubview:spinnerView];
//    NSLog(@"%@",newView);
    [UIView animateWithDuration:.3f animations:^{
        [newView setAlpha:1.0f];
        [datePicker setAlpha:1.0f];
        [hourPicker setAlpha:1.0f];
    }];
}

-(void)cancelPicker{
    
    [spinnerView removeFromSuperview];
}
- (void)hourSelect:(UITapGestureRecognizer *)sender {
    //FakeView
    
    [spinnerView removeFromSuperview];
}
-(void)addToLabel:(id)sender{
    UIButton *button = (UIButton*) sender;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd / MM / yyyy"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH.mm"];
    
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
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [hour count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [hour objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    expTimeLabel.text = [NSString stringWithFormat:@"%@",[hour objectAtIndex:row]];
}
-(void)clearAction{
    [self setDataDefault];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)sendMessage{
    [messageTextField resignFirstResponder];
    [contactView.tokenField resignFirstResponder];
    if([contactView.tokenTitles count] == 0){
        [self alert:[AISString commonString:typePopup KeyOfValue:@"TONO"]];
    }else if ([messageTextField.text isEqualToString:[AISString commonString:typePlacehoder KeyOfValue:@"MESSAGE"]]) {
        [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGENO"]];
    }
    else{
        if (checkType == 1) {
            [self callSendMessage];
        }
        else {
            if (startDateLabel.text.length <= 0) {
                [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGE_NO_DATE"]];
            }
            else if (sendTimeLabel.text.length <= 0){
                [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGE_NO_SENDTIME"]];
            }
            else if (oldIndex != 6 && endDateLabel.text.length <= 0 ){
                [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGE_NO_ENDDATE"]];
            }
            else{
                [self callSaveMessage];
            }
        }
    }
}
#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   return [[checkHeightCell objectAtIndex:indexPath.row] floatValue];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    tstCell = [myTableView cellForRowAtIndexPath:indexPath];
    
    [toText resignFirstResponder];
    [messageTextField resignFirstResponder];
    [contactView.tokenField resignFirstResponder];
    selectIndex = indexPath.row;
    
    NSIndexPath *checkPath=[NSIndexPath indexPathForRow:oldIndex inSection:0];
    switch (indexPath.row) {
        case 6:
            //
            oldIndex = 6;
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            weekImage.image = [UIImage imageNamed:OK_GREY];
            monthImage.image = [UIImage imageNamed:OK_GREY];
            //
            oneTimeImage.image = [UIImage imageNamed:OK_GREEN];
            
            everydayViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            weekViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            monthViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            onetimeViewCell.layer.borderColor = [AISColor lightgreenColor].CGColor;
            [checkHeightCell replaceObjectAtIndex:3 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:4 withObject:@"0"];
            [checkHeightCell replaceObjectAtIndex:5 withObject:@"44"];
            [tableView beginUpdates];
            [tableView endUpdates];
            [startDateCell setHidden:NO];
            [endDateCell setHidden:YES];
            [endDateLabel setText:@""];
            [sendTimeCell setHidden:NO];
            break;
        case 7:
            oldIndex = 7;
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            weekImage.image = [UIImage imageNamed:OK_GREY];
            monthImage.image = [UIImage imageNamed:OK_GREY];
            everydayImage.image = [UIImage imageNamed:OK_GREEN];
            everydayViewCell.layer.borderColor = [AISColor lightgreenColor].CGColor;
            onetimeViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            weekViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            monthViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            [checkHeightCell replaceObjectAtIndex:3 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:4 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:5 withObject:@"44"];
            [tableView beginUpdates];
            [tableView endUpdates];
            [startDateCell setHidden:NO];
            [endDateCell setHidden:NO];
            [sendTimeCell setHidden:NO];
            break;
        case 8:
            
            oldIndex = 8;
            for (int k = 1; k < 34; k++) {
                UIButton *checkBtn = (UIButton *)[monthView viewWithTag:k];
                [checkBtn setSelected:NO];
            }
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            monthImage.image = [UIImage imageNamed:OK_GREY];
            weekImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"160"];
            [checkHeightCell replaceObjectAtIndex:3 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:4 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:5 withObject:@"44"];
            
            weekViewCell.layer.borderColor = [AISColor lightgreenColor].CGColor;
            onetimeViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            everydayViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            monthViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            [tableView beginUpdates];
            [tableView endUpdates];
            [startDateCell setHidden:NO];
            [endDateCell setHidden:NO];
            [sendTimeCell setHidden:NO];
            break;
        case 9:
            
            oldIndex = 9;
            for (int k = 1; k < 8; k++) {
                UIButton *checkBtn = (UIButton *)[weekView viewWithTag:k];
                [checkBtn setSelected:NO];
            }
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            weekImage.image = [UIImage imageNamed:OK_GREY];
            monthImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"320"];
            [checkHeightCell replaceObjectAtIndex:3 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:4 withObject:@"44"];
            [checkHeightCell replaceObjectAtIndex:5 withObject:@"44"];
            monthViewCell.layer.borderColor = [AISColor lightgreenColor].CGColor;
            onetimeViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            everydayViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            weekViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            [tableView beginUpdates];
            [tableView endUpdates];
            [startDateCell setHidden:NO];
            [endDateCell setHidden:NO];
            [sendTimeCell setHidden:NO];
            break;
        default:
            if (checkType == 2) {
                
                [self tableView:myTableView didSelectRowAtIndexPath:checkPath];
                [myTableView selectRowAtIndexPath:checkPath animated:YES scrollPosition:UITableViewScrollPositionNone];
            }
            break;
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 6:
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            onetimeViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            break;
        case 7:
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            everydayViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            break;
        case 8:
            weekImage.image = [UIImage imageNamed:OK_GREY];
            [weekyArray removeAllObjects];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
            weekViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            [tableView beginUpdates];
            [tableView endUpdates];
            break;
        case 9:
            monthImage.image = [UIImage imageNamed:OK_GREY];
            [monthArray removeAllObjects];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
            monthViewCell.layer.borderColor = [AISColor lightgrayColor].CGColor;
            [tableView beginUpdates];
            [tableView endUpdates];
            break;
        default:
            break;
    }
}


#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"messageToAddTemplate"]) {
        AddTemplateViewController *add =[segue destinationViewController];
        add.descritionItem = messageTextField.text;
    }
    else if ([[segue identifier] isEqualToString:@"messageSelectTemplate"]) {
        TemplateViewController *select =[segue destinationViewController];
        select.templeSelected = @"YES";
        select.delegate = self;
    }
    else if ([[segue identifier] isEqualToString:@"MessageAddContact"]) {
        ContactViewController *selectContact =[segue destinationViewController];
        selectContact.contactSelect = @"YES";
        selectContact.delegate = self;
        selectContact.messagegroupsArray = groupArray;
        selectContact.messagecontactsArray = contactArray;
    }
}
- (IBAction)variableSMSBtn:(id)sender {
    
    [self alert:@"@name"];
}

- (IBAction)popupDetailMessage:(id)sender {
    [self alert:[NSString stringWithFormat:@"%@",messageTextField.text] ];
}

- (void)didFinishSelectedTemplate:(NSString *)templatesMessage{
    [messageTextField setText:templatesMessage];
    messageTextField.textColor = [UIColor blackColor];
    [bytesLabel setText:[AISSMSCharacter bytesString:messageTextField.text]];
    [messageNoLabel setText:[AISSMSCharacter messageNumber]];
        CGRect r = [[messageTextField text] boundingRectWithSize:CGSizeMake(messageTextField.frame.size.width, 0)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                         context:nil];
        NSUInteger numLines = r.size.height/20;
    if (numLines > 4) {
        numLines = 5;
        int old = [[checkHeightCell objectAtIndex:1] intValue];
        [checkHeightCell replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%u",old+(20*numLines)]];
    }
    else{
        int old = [[checkHeightCell objectAtIndex:1] intValue];
        [checkHeightCell replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%u",old+(20*numLines)]];
    }
    [myTableView beginUpdates];
    [myTableView endUpdates];
}

-(void)callSendMessage{
    MessageForm *messages = [MessageForm new];
    [messages setMessage:messageTextField.text];
    [messages setTimeExpire:expTimeLabel.text];
    [messages setSendMessageType:SEND_TYPE_IMMEDIATELY];
    NSMutableArray *contactListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactArray count]; k++) {
        [contactListID addObject:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]];
    }
    NSMutableArray *groupListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [groupArray count]; k++) {
        [groupListID addObject:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]];
    }
    NSMutableArray *mobileListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactView.tokenTitles count]; k++) {
        NSScanner *scanner = [NSScanner scannerWithString:[contactView.tokenTitles objectAtIndex:k]];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if ([[contactView.tokenTitles objectAtIndex:k] length] >= 10 && isNumeric == YES) {
            [mobileListID addObject:[contactView.tokenTitles  objectAtIndex:k]];
        }
    }
    [messages setContactIDList:contactListID];
    [messages setGroupIDList:groupListID];
    [messages setMobileNOList:mobileListID];
    ServiceMS01_SendMessage *call = [[ServiceMS01_SendMessage alloc] init];
    [call setParameterWithMessageForm:messages];
    [call setDelegate:self];
    [call requestService];
}
- (void)sendMessageSuccess{
    
    [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGESUCCESS"]];
    [self setDataDefault];
}
- (void)sendMessageError:(ResultStatus *)resultStatus{
    
}
-(void)callSaveMessage{
    MessageForm *messages = [MessageForm new];
    [messages setMessage:messageTextField.text];
    [messages setTimeExpire:expTimeLabel.text];
    if (selectIndex == 6) {
        [messages setSendMessageType:SEND_TYPE_SCHEDULE];
        [messages setRecurringType:RecurringType_NONE];
    }
    else if (selectIndex == 7) {
        [messages setSendMessageType:SEND_TYPE_RECURRING];
        [messages setRecurringType:RecurringType_DAILY];
    }
    else if (selectIndex == 8) {
        [messages setSendMessageType:SEND_TYPE_RECURRING];
        [messages setRecurringType:RecurringType_WEEKLY];
    }
    else if (selectIndex == 9) {
        [messages setSendMessageType:SEND_TYPE_RECURRING];
        [messages setRecurringType:RecurringType_MONTHLY];
    }
    NSMutableArray *contactListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactArray count]; k++) {
        [contactListID addObject:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]];
    }
    NSMutableArray *groupListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [groupArray count]; k++) {
        [groupListID addObject:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]];
    }
    NSMutableArray *mobileListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactView.tokenTitles count]; k++) {
        NSScanner *scanner = [NSScanner scannerWithString:[contactView.tokenTitles objectAtIndex:k]];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if ([[contactView.tokenTitles objectAtIndex:k] length] >= 10 && isNumeric == YES) {
            [mobileListID addObject:[contactView.tokenTitles  objectAtIndex:k]];
        }
    }
    [messages setContactIDList:contactListID];
    [messages setGroupIDList:groupListID];
    [messages setMobileNOList:mobileListID];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"dd / MM / yyyy"];
    //StartDate To Long
    alldateFormString  = [objDateformat dateFromString:startDateLabel.text];
    long long longStartDate = (long long)([alldateFormString timeIntervalSince1970] * 1000.0);
    [messages setStartDate:[NSString stringWithFormat:@"%lld",longStartDate]];
    //EndDate To Long
    if ([endDateLabel.text isEqualToString:@""]) {
        [messages setEndDate:@"0"];
    }
    else{
        alldateFormString  = [objDateformat dateFromString:endDateLabel.text];
        long long longEndDate = (long long)([alldateFormString timeIntervalSince1970] * 1000.0);
        [messages setEndDate:[NSString stringWithFormat:@"%lld",longEndDate]];
    }
    [messages setSendTime:sendTimeLabel.text];
    [messages setWeeklyList:[NSArray arrayWithArray:weekyArray]];
    [messages setMonthlyList:[NSArray arrayWithArray:monthArray]];
    ServiceMS02_SaveSchedule *call = [[ServiceMS02_SaveSchedule alloc] init];
    [call setParameterWithMessageForm:messages];
    [call setDelegate:self];
    [call requestService];
}
- (void)saveScheduleSuccess{
    [self alert:[AISString commonString:typePopup KeyOfValue:@"MESSAGESUCCESS"]];
    [self setDataDefault];
}
- (void)saveScheduleError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}
- (void)didFinishSelectedContact:(NSMutableArray *)contactsArray Group:(NSMutableArray *)groupsArray{

    contactArray = contactsArray;
    groupArray = groupsArray;
    for (int l = 0; l < contactArray.count; l ++) {
        TIToken * token = [contactView.tokenField addTokenWithTitle:[[contactArray objectAtIndex:l] objectForKey:RES_KEY_CONTACT_FIRSTNAME]];
        [token setTintColor:[AISColor lightgreenColor]];
        [contactView.tokenField layoutTokensAnimated:YES];
       
    }
    for (int l = 0; l < groupArray.count; l ++) {
        TIToken * token = [contactView.tokenField addTokenWithTitle:[[groupArray objectAtIndex:l] objectForKey:RES_KEY_GROUP_NAME]];
        [token setTintColor:[AISColor lightgreenColor]];
        [contactView.tokenField layoutTokensAnimated:YES];
    }
}

- (BOOL)tokenField:(TITokenField *)tokenField willAddToken:(TIToken *)token{
    if (contactArray.count > 0) {
        for (int k = 0; k < [contactView.tokenTitles count]; k++) {
            if ([[contactView.tokenTitles objectAtIndex:k] isEqualToString:token.title]) {
                return NO;
            }
        }
    }
    if (groupArray.count > 0) {
        for (int k = 0; k < [contactView.tokenTitles count]; k++) {
            if ([[contactView.tokenTitles objectAtIndex:k] isEqualToString:token.title]) {
                return NO;
            }
        }
    }
    return YES;
}
-(void)tokenField:(TITokenField *)tokenField didAddToken:(TIToken *)token{
    [token setTintColor:[AISColor lightgreenColor]];
}
- (void)tokenFieldFrameDidChange:(TITokenField *)field {
    [checkHeightCell replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%f",field.frame.size.height+25.0f]];
    [myTableView beginUpdates];
    [myTableView endUpdates];
}
- (void)showContactsPicker:(id)sender {
    [self performSegueWithIdentifier:@"MessageAddContact" sender:self];
}
- (void)tokenFieldChangedEditing:(TITokenField *)tokenField {
    [tokenField setRightViewMode:(tokenField.editing ? UITextFieldViewModeAlways : UITextFieldViewModeNever)];
}

-(void)callUpdateSchedule{
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:self.arraySchedule forKey:@"dict"];
    RecurringForm *messages = [RecurringForm new];
    [messages setScheduleID:[[dict objectForKey:@"dict"] objectForKey:RES_KEY_SCHEDULE_ID]];
    [messages setScheduleInstanceID:[[dict objectForKey:@"dict"] objectForKey:RES_KEY_SCHEDULE_INSTANCE_ID]];
    [messages setMessage:messageTextField.text];
    [messages setTimeExpire:expTimeLabel.text];
    if (selectIndex == 6) {
        [messages setSendType:@"1"];
        [messages setRecurringType:@"0"];
    }
    else if (selectIndex == 7) {
        [messages setSendType:@"2"];
        [messages setRecurringType:@"1"];
    }
    else if (selectIndex == 8) {
        [messages setSendType:@"2"];
        [messages setRecurringType:@"2"];
    }
    else if (selectIndex == 9) {
        [messages setSendType:@"2"];
        [messages setRecurringType:@"3"];
    }
    else {
        [messages setSendType:@"0"];
    }
    NSMutableArray *contactListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactArray count]; k++) {
        [contactListID addObject:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]];
    }
    NSMutableArray *groupListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [groupArray count]; k++) {
        [groupListID addObject:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]];
    }
    NSMutableArray *mobileListID = [[NSMutableArray alloc] init];
    for (int k = 0 ; k < [contactView.tokenTitles count]; k++) {
        NSScanner *scanner = [NSScanner scannerWithString:[contactView.tokenTitles objectAtIndex:k]];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if ([[contactView.tokenTitles objectAtIndex:k] length] >= 10 && isNumeric == YES) {
            [mobileListID addObject:[contactView.tokenTitles  objectAtIndex:k]];
        }
    }
    
    [messages setContactIDList:contactListID];
    [messages setGroupIDList:groupListID];
    [messages setMobileNOList:mobileListID];
    
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"dd / MM / yyyy"];
    //StartDate To Long
    alldateFormString  = [objDateformat dateFromString:startDateLabel.text];
    long long longStartDate = (long long)([alldateFormString timeIntervalSince1970] * 1000.0);
    [messages setStartDate:[NSString stringWithFormat:@"%lld",longStartDate]];
    //EndDate To Long
    if ([endDateLabel.text isEqualToString:@"0"] || [endDateLabel.text isEqualToString:@""]) {
        [messages setEndDate:@"0"];
    }
    else{
        alldateFormString  = [objDateformat dateFromString:endDateLabel.text];
        long long longEndDate = (long long)([alldateFormString timeIntervalSince1970] * 1000.0);
        [messages setEndDate:[NSString stringWithFormat:@"%lld",longEndDate]];
    }
    [messages setSendTime:sendTimeLabel.text];
    
    [messages setWeeklyList:[NSArray arrayWithArray:weekyArray]];
    [messages setMonthlyList:[NSArray arrayWithArray:monthArray]];
    
    ServiceRC03_UpdateSchedule *call = [[ServiceRC03_UpdateSchedule alloc] init];
    [call setParameter:messages];
    [call setDelegate:self];
    [call requestService];
}
- (void)updateScheduleSuccess{
    [self alertBack:[AISString commonString:typePopup KeyOfValue:@"MESSAGESUCCESS"]];
}
- (void)updateScheduleError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}
-(void)callGetTemplateList{
    ServiceTP02_GetTemplateList *call = [[ServiceTP02_GetTemplateList alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)getTemplateListSuccess:(ResponseGetTemplateList *)responseGetTemplateList{
    for (TemplateDetail *templatesList in [responseGetTemplateList templateList]) {
        templateDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                     [templatesList ID],RES_KEY_TEMPLATE_ID,
                     [templatesList name],RES_KEY_TEMPLATE_NAME,
                     [templatesList message],RES_KEY_TEMPLATE_MESSAGE, nil];
        [templateArray addObject:templateDict];
    }
    [AISpList setTemplateListArray:templateArray];
    [selectTemplate setTitle:[NSString stringWithFormat:@"%@ (%d)",[AISString commonString:typeButton KeyOfValue :@"SELECT_TEMPLATE"],[templateArray count]] forState:UIControlStateNormal];
    [myTableView reloadData];
}
- (void)getTemplateListError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}
-(void) callSetting{
    ServiceST01_SettingProfile *call = [[ServiceST01_SettingProfile alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)settingProfileSuccess:(ProfileDetail *)profileDetail{
    
    balanceSMS.text = [profileDetail balanceSMS];
    [myTableView reloadData];
}
- (void)settingProfileError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"OK"] RightString:nil];
    [alertView showAlertView];
}
-(void)doneActionBack:(id)sender{
    [alertView dismissAlertView];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)alertBack:(NSString *)message{
    [alertView withActionLeft:@selector(doneActionBack:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"OK"] RightString:nil];
    [alertView showAlertView];
}
@end
