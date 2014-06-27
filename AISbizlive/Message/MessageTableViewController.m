
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
    UITextField *toText;
    float checkLineTo;
    float fixHeight;
    int tagTag;
    bool textFieldEmpty;
    UIView *addTagView;
    UITapGestureRecognizer *tagTap;
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
    checkLineTo = 0.0f;
    fixHeight = 0.0f;
    tagTag = 1000;
    addTagView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 263, 40)];
    hour = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
    checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"60",@"80",@"237",@"40",@"120",@"56",@"56",@"56",@"56",@"50", nil];
    weekDetail = [[NSMutableArray alloc] initWithArray:[AISString commonArray:@"WEEK_DETAIL"]];
    self.navigationItem.rightBarButtonItem = [self MessageRightButton];
    self.navigationItem.leftBarButtonItem = [self MessageLeftButton];
    //    [toText setFrame:CGRectMake(10, 5, 30, 50)];
    toText = [[UITextField alloc] initWithFrame:CGRectMake(10, 7, addTagView.frame.size.width, 30)];
    toText.delegate = self;
    
//    [toText setPlaceholder:@"To :fd;lgkf;ldgk;ldfkg;ldfk"];
//    //    toText.text = @"\u200B";
    [addTagView addSubview:toText];
    [bytesLabel setText:@"0/160"];
    [messageNoLabel setText:@"0"];
    [characterLabel setText:@"0"];
    [sendTimeLabel setText:@""];
    [startDateLabel setText:@""];
    [endDateLabel setText:@""];
    [oneTimeImage setImage:[UIImage imageNamed:OK_GREY]];
    [everydayImage setImage:[UIImage imageNamed:OK_GREY]];
    [weekImage setImage:[UIImage imageNamed:OK_GREY]];
    [monthImage setImage:[UIImage imageNamed:OK_GREY]];
    
    [self showImmediately];
    [self setViewGesture];
    [self setTextLangague];
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    [self setTextLangague];
    [self showImmediately];
    [self setViewGesture];
    [self returnFormSelectTemplate];
//    [toTextField setFrame:CGRectMake(30, toTextField.frame.origin.y, toTextField.frame.size.width, toTextField.frame.size.height)];
    
    for (int l = 0; l < self.arrayContact.count; l ++) {
        CGRect r = [[self.arrayContact objectAtIndex:l] boundingRectWithSize:CGSizeMake(contactView.frame.size.width, 0)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                         context:nil];
//        NSLog(@"%f",r.size.width);
        UIView *tagView = [[UIView alloc] initWithFrame:CGRectMake(toText.frame.origin.x, toText.frame.origin.y,r.size.width , 30)];
        UILabel *tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,r.size.width , 30)];
        tagLabel.text = [self.arrayContact objectAtIndex:l];
        tagView.backgroundColor = [UIColor whiteColor];
        tagLabel.textColor = [AISColor lightgreenColor];
        [tagView addSubview:tagLabel];
        UILabel *colon = [[UILabel alloc] initWithFrame:CGRectMake(tagLabel.frame.size.width, 0, 5, 30)];
        colon.text = @",";
        [tagView addSubview:colon];
        checkLineTo += tagView.frame.size.width;
        if (checkLineTo >= 200) {
            [toText setFrame:CGRectMake(10, toText.frame.origin.y + 35,contactView.frame.size.width , 30)];
            checkLineTo = 0;
            [addTagView setFrame:CGRectMake(addTagView.frame.origin.x, addTagView.frame.origin.y, addTagView.frame.size.width, toText.frame.origin.y +105)];
        }
        else{
            [toText setFrame:CGRectMake(toText.frame.origin.x + r.size.width + 10, toText.frame.origin.y, toText.frame.size.width-r.size.width, toText.frame.size.height)];
        }
        float old = toText.frame.origin.y;
        [checkHeightCell replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%f",old+55]];
        [myTableView beginUpdates];
        [myTableView endUpdates];
        [addTagView addSubview:tagView];
        [tagView setTag:tagTag];
        tagTap = [[UITapGestureRecognizer alloc]
                                               initWithTarget: self
                  action: @selector(tagSelect:)];
        [tagTap setNumberOfTouchesRequired:1];
        [tagView addGestureRecognizer:tagTap];
        tagTag += 1;
    }
    [scrollContactView addSubview:addTagView];
    
    toText.text = @"\u200B";
    
}
- (void)tagSelect:(UITapGestureRecognizer *)sender{
    NSLog(@"%@",[[sender.view viewWithTag:sender.view.tag ] backgroundColor] );
    if ([[sender.view viewWithTag:sender.view.tag ] backgroundColor] == [UIColor redColor]) {
        
        [sender.view setBackgroundColor:[UIColor whiteColor]];
    }
    else{
    
      [[sender.view viewWithTag:sender.view.tag ] setBackgroundColor:[UIColor redColor]];
    }
//    [tagTap setState:UIGestureRecognizerStateChanged];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length == 0  && textFieldEmpty) {
        //
        [tagTap setState:UIGestureRecognizerStateRecognized];
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%@",textField);
    textFieldEmpty = YES;
    [tagTap setState:UIGestureRecognizerStateBegan];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [tagTap setState:UIGestureRecognizerStateEnded];
}
-(void)returnFormSelectTemplate{
    if (self.msgText != nil) {
        CGRect r = [[messageTextField text] boundingRectWithSize:CGSizeMake(messageTextField.frame.size.width, 0)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                         context:nil];
        NSUInteger numLines = r.size.height/20;
        [messageView setFrame:CGRectMake(messageView.frame.origin.x, messageView.frame.origin.y, messageView.frame.size.width, messageView.frame.size.height+(20*numLines))];
        int old = [[checkHeightCell objectAtIndex:1] intValue];
        [checkHeightCell replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%lu",old+(20*numLines)]];
        [myTableView beginUpdates];
        [myTableView endUpdates];
        [bytesLabel setText:[AISSMSCharacter bytesString:messageTextField.text]];
        [messageNoLabel setText:[AISSMSCharacter messageNumber]];
        [characterLabel setText:[NSString stringWithFormat:@"%ld",(unsigned long)[messageTextField.text length]]];
        
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"60",@"80",@"237",@"40",@"120",@"56",@"56",@"56",@"56",@"50", nil];
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
}

#pragma mark - Langague In View
-(void)setTextLangague{
     [messageTextField setText:self.msgText];

        self.title = [AISString commonString:TITLE :@"MESSAGE"];
        [self.navigationItem setTitle:[AISString commonString:TITLE :@"MESSAGE"]];
    [selectTemplate setTitle:[AISString commonString:BUTTON :@"SELECT_TEMPLATE"] forState:UIControlStateNormal];
    [saveTemplate setTitle:[AISString commonString:BUTTON :@"SAVE_TEMPLATE"] forState:UIControlStateNormal];
    [variableSMS setTitle:[AISString commonString:BUTTON :@"VARIABLE_SMS"] forState:UIControlStateNormal];
    [messageNoTitle setText:[AISString commonString:LABEL :@"MESSAGE_NO"]];
    [expTimeTitle setText:[AISString commonString:LABEL :@"EXP_TIME"]];
    [characterTitle setText:[AISString commonString:LABEL :@"CHARACTER"]];
    [realCharacterTitle setText:[AISString commonString:LABEL :@"REAL_CHARACTER"]];
    [scheduleLabel setText:[AISString commonString:BUTTON :@"SCHEDULE"]];
    [immediatelyLabel setText:[AISString commonString:BUTTON :@"IMMEDIATELY"]];
    [startDateTitle setText:[AISString commonString:LABEL :@"START_DATE"]];
    [endDateTitle setText:[AISString commonString:LABEL :@"END_DATE"]];
    [sendTimeTitle setText:[AISString commonString:LABEL :@"SEND_TIME"]];
    
    [onetimeLabel setText:[AISString commonString:LABEL :@"ONE_TIME"]];
    
    [everydayLabel setText:[AISString commonString:LABEL :@"EVERY_DAY"]];
    
    [weekLabel setText:[AISString commonString:LABEL :@"WEEK"]];
    
    [monthLabel setText:[AISString commonString:LABEL :@"MONTH"]];
    [totalSMS setText:[AISString commonString:LABEL :@"TOTALSMS"]];
    [totalSMSSchedule setText:[AISString commonString:LABEL :@"TOTALSMS"]];
}

#pragma mark - Immediately

- (void)immediatelySelected:(UITapGestureRecognizer *)sender {
    [self showImmediately];
//    [myTableView setContentSize:CGSizeMake(myTableView.frame.size.width, 387)];
}
-(void)showImmediately{
    scheduleImage.image = [UIImage imageNamed:OK_GREY];
    immediatelyImage.image = [UIImage imageNamed:OK_GREEN];
    immediatelyView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    scheduleView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [detailImmediatelyCell setHidden:NO];
    [myTableView setContentOffset:CGPointMake(myTableView.contentOffset.x, 0) animated:NO];
    [dateCell setHidden:YES];
    [onetimeCell setHidden:YES];
    [everydayCell setHidden:YES];
    [weekCell setHidden:YES];
    [monthCell setHidden:YES];
    [totalCell setHidden:YES];
    
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"50"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:8 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:9 withObject:@"0"];
    [myTableView reloadData];
}
#pragma mark - Schedule

- (void)ScheduleSelected:(UITapGestureRecognizer *)sender{
    [self showScheduleCell];
//    [myTableView setContentSize:CGSizeMake(myTableView.frame.size.width, 771)];
    [self loadMonthView];
    [self loadWeekView];
}
-(void)showScheduleCell{
    immediatelyImage.image = [UIImage imageNamed:OK_GREY];
    scheduleImage.image = [UIImage imageNamed:OK_GREEN];
    scheduleView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    immediatelyView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [detailImmediatelyCell setHidden:YES];
    [myTableView setScrollEnabled:YES];
    [dateCell setHidden:NO];
    [onetimeCell setHidden:NO];
    [everydayCell setHidden:NO];
    [weekCell setHidden:NO];
    [monthCell setHidden:NO];
    [totalCell setHidden:NO];
    
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:4 withObject:@"120"];
    [checkHeightCell replaceObjectAtIndex:5 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:6 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:7 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:8 withObject:@"56"];
    [checkHeightCell replaceObjectAtIndex:9 withObject:@"50"];
    [myTableView reloadData];
}
-(void)loadWeekView{
    int row = 3;
    int column = 3;
    float originWidth = 90.0f;
    float originHeight = 25.0f;
    int valueOfWeek = 0;
    int weekTag = 10001;
    for (int l = 1; l <= row; l ++) {
        for (int j = 1; j <= column; j ++) {
            if (valueOfWeek == 7) {
                break;
            }
            UIButton *weekButton = [UIButton buttonWithType:UIButtonTypeCustom];
            //    [dateMonth setTitle:@" TEST" forState:UIControlStateNormal];
            UIImageView *checkBox = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1.png"]];
            [checkBox setFrame:CGRectMake(0, 0, 20, 20)];
            [checkBox setTag:0];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, 70, 20)];
            [label setTextAlignment:NSTextAlignmentLeft];
            [label setTextColor:[AISColor lightgrayColor]];
            [label setFont:[UIFont systemFontOfSize:13.0f]];
            [label setTag:1];
            [label setText:[NSString stringWithFormat:@"%@",[weekDetail objectAtIndex:valueOfWeek]]];
            [weekButton addSubview:checkBox];
            [weekButton addSubview:label];
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
-(void) weekDetailClick:(UIButton*)sender
{
    UIImageView *im;
    UILabel *l ;
        if ([[[sender subviews] objectAtIndex:1] isKindOfClass:[UILabel class]]) {
           im = (UIImageView *)[[sender subviews] objectAtIndex:0];
           l = (UILabel *) [[sender subviews] objectAtIndex:1];
        }
        else{
            im = (UIImageView *)[[sender subviews] objectAtIndex:1];
            l = (UILabel *) [[sender subviews] objectAtIndex:0];
        }
        if (im.image == [UIImage imageNamed:@"Box1.png"]) {
            [im setImage:[UIImage imageNamed:@"Info_Icon.png"]];
            [l setTextColor:[AISColor lightgreenColor]];
        }
        else {
            [im setImage:[UIImage imageNamed:@"Box1.png"]];
            [l setTextColor:[AISColor lightgrayColor]];
        }
}
-(void)loadMonthView{
    int row = 7 ;
    int column = 5;
    int day = 1;
    float originWidth = 50.0f;
    float originHeight = 20.0f;
    for (int l = 1; l <= row; l ++) {
        for (int j = 1; j <= column; j ++) {
            UIButton *dateMonth = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImageView *checkBox = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1.png"]];
            [checkBox setFrame:CGRectMake(0, 0, 20, 20)];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, 30, 20)];
            [label setTextAlignment:NSTextAlignmentLeft];
            [label setTextColor:[AISColor lightgrayColor]];
            [label setFont:[UIFont systemFontOfSize:13.0f]];
            if (day <= 31) {
                [label setText:[NSString stringWithFormat:@"%d",day]];
                [dateMonth setFrame:CGRectMake((originWidth * (j - 1))+(5 * j), (originHeight * (l - 1))+(8 * (l - 1)), originWidth, originHeight)];
            }
            else if (day == 32) {
                //END
                [label setFrame:CGRectMake(22, 0, 120, 20)];
                [label setText:[AISString commonString:LABEL :@"MONTH_END_MONTH"]];
                [dateMonth setFrame:CGRectMake(60, 168, 140, originHeight)];
            }
            else if (day == 33){
                //ALL
                [label setFrame:CGRectMake(22, 0, 50, 20)];
                [label setText:[AISString commonString:LABEL :@"MONTH_ALL"]];
                [dateMonth setFrame:CGRectMake(225, 168, originWidth, originHeight)];
                [dateMonth addSubview:checkBox];
                [dateMonth addSubview:label];
                [dateMonth setTag:day];
                
                [dateMonth addTarget:self
                              action:@selector(weekDetailClick:)
                    forControlEvents:UIControlEventTouchUpInside];
                [monthView addSubview:dateMonth];
                break;
            }
            [dateMonth addSubview:checkBox];
            [dateMonth addSubview:label];
            
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
    NSLog(@"NumLine : %lu",(unsigned long)numLines);
    if([text isEqualToString:@"\n"] || (numLines > checkLine)){
        
        if (i < 3) {
            i += 1;
        }
        
        if ([oldHeight intValue] < 200) {
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
    [characterLabel setText:[NSString stringWithFormat:@"%ld",(unsigned long)[messageTextField.text length]]];
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
    [timeFormat setDateFormat:@"HH:mm"];
    
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
    expTimeLabel.text = [NSString stringWithFormat:@"%@ HR",[hour objectAtIndex:row]];
}

#pragma mark - Navigation Bar Item
-(UIBarButtonItem *)MessageRightButton{
    UIBarButtonItem *contactAddBtn = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:BUTTON :@"DONE"]  style:UIBarButtonItemStyleBordered target:self action:nil];
    [contactAddBtn setTintColor:[AISColor lightgreenColor]];
    return contactAddBtn;
}
-(UIBarButtonItem *)MessageLeftButton{
    UIBarButtonItem *contactDeleteBtn = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:BUTTON :@"CLEAR"]  style:UIBarButtonItemStyleBordered target:self action:@selector(clearAction)];
    [contactDeleteBtn setTintColor:[AISColor lightgrayColor]];
    
    return contactDeleteBtn;
}
-(void)clearAction{
    [self setDataDefault];
}
#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%@",[checkHeightCell objectAtIndex:indexPath.row]);
   return [[checkHeightCell objectAtIndex:indexPath.row] floatValue];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    tstCell = [myTableView cellForRowAtIndexPath:indexPath];
    
    [toText resignFirstResponder];
    [messageTextField resignFirstResponder];
    switch (indexPath.row) {
        case 5:
            oneTimeImage.image = [UIImage imageNamed:OK_GREEN];
            break;
        case 6:
            everydayImage.image = [UIImage imageNamed:OK_GREEN];
            break;
        case 7:
            weekImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"152"];
            [tableView beginUpdates];
            [tableView endUpdates];
            break;
        case 8:
            monthImage.image = [UIImage imageNamed:OK_GREEN];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"260"];
            [tableView beginUpdates];
            [tableView endUpdates];
            break;
        default:
            break;
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 5:
            oneTimeImage.image = [UIImage imageNamed:OK_GREY];
            break;
        case 6:
            everydayImage.image = [UIImage imageNamed:OK_GREY];
            break;
        case 7:
            weekImage.image = [UIImage imageNamed:OK_GREY];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
            [tableView beginUpdates];
            [tableView endUpdates];
            break;
        case 8:
            monthImage.image = [UIImage imageNamed:OK_GREY];
            [checkHeightCell replaceObjectAtIndex:indexPath.row withObject:@"56"];
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
    }
    else if ([[segue identifier] isEqualToString:@"MessageAddContact"]) {
        ContactViewController *selectContact =[segue destinationViewController];
        selectContact.contactSelect = @"YES";
        self.arrayContact = nil;
    }
}
- (IBAction)variableSMSBtn:(id)sender {
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:nil withTarget:self message:@"@name" LeftString:@"Done" RightString:nil];
    [ss showAlertView];
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
//-(void)rightAction:(id)sender{
//    [[AISAlertView alloc] dismissAlertView];
//}

@end
