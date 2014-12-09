//
//  ScheduleViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/19/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ScheduleViewController.h"
#import "AISGlobal.h"
#import "ScheduleCell.h"
#import "MessageTableViewController.h"
#import "AISActivity.h"
@interface ScheduleViewController ()
{
    NSMutableArray *schedule;
    NSArray * sendToMessageArray;
    AISAlertView *alertView ;
    NSDictionary *dict;
    int selectIndex;
    AISActivity *activity;
    NSSortDescriptor *descriptor;
}
@end

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    schedule = [[NSMutableArray alloc] init];
//    NSLog(@"Schedule Load");
//
    activity = [[AISActivity alloc] init];
    [self callGetScheduleList];

    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangague{
    selectIndex = 0;
    alertView = [[AISAlertView alloc] init];
    descriptor = [NSSortDescriptor sortDescriptorWithKey:RES_KEY_SCHEDULE_ID  ascending:NO];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SCHEDULE"]];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
    if ([schedule count] == 0) {
        [activity showActivity];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 10.0)];
    
    oneHeaderView.backgroundColor = [UIColor whiteColor];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return schedule.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ScheduleCell";
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ScheduleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ScheduleCell __weak * weakCell = cell;
    
    
    [cell setAppearanceWithBlock:^{
        weakCell.containingTableView = tableView;
        
//        if ([[[schedule objectAtIndex:indexPath.row] objectForKey:RES_KEY_SCHEDULE_EDIT_EXPIRE] isEqualToString:@"Y"]) {
            weakCell.rightUtilityButtons = [self rightButtons];
//        }
        weakCell.delegate = self;
    } force:NO];
    cell.message.textColor = [AISColor lightgrayColor];
    cell.message.text = [[schedule objectAtIndex:indexPath.row] objectForKey:RES_KEY_MESSAGE];
    
    [cell setCellHeight:cell.frame.size.height];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  65.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectIndex = (int) indexPath.row;
    [self performSegueWithIdentifier:@"scToMessage" sender:self];
}
-(BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell{
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    selectIndex = (int) [mytable indexPathForCell:cell].row;
    [self alert:[NSString stringWithFormat:@"Delete %@ ?",[[schedule objectAtIndex:selectIndex] objectForKey:RES_KEY_MESSAGE] ]];
//    switch (index) {
//    }
}
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}
-(void)callGetScheduleList{
    
    ServiceRC01_GetScheduleList *call = [[ServiceRC01_GetScheduleList alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)getScheduleListSuccess:(NSArray *)scheduleList{
    [activity dismissActivity];
    [schedule removeAllObjects];
    for (RecurringForm *sec in scheduleList) {
        
        dict = [[NSMutableDictionary alloc] init];
        if ([[sec contactIDList] count] > 0 ) {
            [dict setValue:[sec contactIDList] forKey:RES_KEY_CONTACT_LIST];
        }
        if ([[sec groupIDList] count] > 0) {
            [dict setValue:[sec groupIDList] forKey:RES_KEY_CONTACT_GROUP_LIST];
        }
        if ([[sec mobileNOList] count] > 0) {
            [dict setValue:[sec mobileNOList] forKey:RES_KEY_MOBILE_LIST];
        }
        if ([[sec weeklyList] count]  > 0) {
            [dict setValue:[sec weeklyList] forKey:RES_KEY_WEEKLY];
        }
        if( [[sec monthlyList] count]  > 0){
            [dict setValue:[sec monthlyList] forKey:RES_KEY_MONTHLY];
        }
//        [dayDict setObject:self.recurringType forKey:RES_KEY_RECURRING_TYPE];
//        
//        [requestData setObject:dayDict forKey:RES_KEY_RECURRING_LIST];
        
        
        
        [dict setValue:[sec message] forKey:RES_KEY_MESSAGE];
        [dict setValue:[sec scheduleID] forKey:RES_KEY_SCHEDULE_ID];
        [dict setValue:[sec scheduleInstanceID] forKey:RES_KEY_SCHEDULE_INSTANCE_ID];
        [dict setValue:[sec startDate] forKey:RES_KEY_START_DATE];
        [dict setValue:[sec endDate] forKey:RES_KEY_END_DATE];
        [dict setValue:[sec sendTime] forKey:RES_KEY_SEND_TIME];
        [dict setValue:[sec timeExpire] forKey:RES_KEY_TIME_EXPIRE];
//        
        [dict setValue:[sec isEditExpire] forKey:RES_KEY_SCHEDULE_EDIT_EXPIRE];
        [dict setValue:[sec sendType] forKey:RES_KEY_SEND_TYPE];
        if ([[sec sendType] isEqualToString:@"2"]) {
            [dict setValue:[sec recurringType] forKey:RES_KEY_RECURRING_TYPE];
        }

//        if ([[sec isEditExpire] isEqualToString:@"Y"]) {
//            if ([[sec weeklyList] count] > 0) {
//                dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                        [sec message],RES_KEY_MESSAGE,
//                        [sec scheduleID],RES_KEY_SCHEDULE_ID,
//                        [sec scheduleInstanceID],RES_KEY_SCHEDULE_INSTANCE_ID,
//                        [sec startDate],RES_KEY_START_DATE,
//                        [sec endDate],RES_KEY_END_DATE,
//                        [sec sendTime],RES_KEY_SEND_TIME,
//                        [sec timeExpire],RES_KEY_TIME_EXPIRE,
//                        [sec recurringType],RES_KEY_RECURRING_TYPE,
//                        [sec isEditExpire],RES_KEY_SCHEDULE_EDIT_EXPIRE,
//                        [sec groupIDList],RES_KEY_GROUP_LIST,
//                        [sec contactIDList],RES_KEY_CONTACT_LIST,
//                         [sec mobileNOList],RES_KEY_MOBILE_LIST,
//                        [sec weeklyList],RES_KEY_WEEKLY,
//                        nil] ;
//            }
//            else{
////                if ([[sec monthlyList] count] > 0) {
//                dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                        [sec message],RES_KEY_MESSAGE,
//                        [sec scheduleID],RES_KEY_SCHEDULE_ID,
//                        [sec scheduleInstanceID],RES_KEY_SCHEDULE_INSTANCE_ID,
//                        [sec startDate],RES_KEY_START_DATE,
//                        [sec endDate],RES_KEY_END_DATE,
//                        [sec sendTime],RES_KEY_SEND_TIME,
//                        [sec timeExpire],RES_KEY_TIME_EXPIRE,
//                        [sec recurringType],RES_KEY_RECURRING_TYPE,
//                        [sec isEditExpire],RES_KEY_SCHEDULE_EDIT_EXPIRE,
//                        [sec groupIDList],RES_KEY_GROUP_LIST,
//                        [sec contactIDList],RES_KEY_CONTACT_LIST,
//                         [sec mobileNOList],RES_KEY_MOBILE_LIST,
//                        [sec monthlyList],RES_KEY_MONTHLY,
//                        nil] ;
//            }
        
        [schedule addObject:dict];
        
//        [AISpList setSheduleListArray:schedule];
        [schedule sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];

//        }
    }
    sendToMessageArray = [NSArray arrayWithArray:scheduleList];
    [mytable reloadData];
}
- (void)getScheduleListError:(ResultStatus *)resultStatus{
    [activity dismissActivity];
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:[resultStatus responseMessage] LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
    
}
-(void)callDeleteSchedule{
    ServiceRC02_DeleteSchedule *call = [[ServiceRC02_DeleteSchedule alloc] init];
    [call setParameterWithIDList:[[schedule objectAtIndex:selectIndex] objectForKey:RES_KEY_SCHEDULE_ID] InstanceID:[[schedule objectAtIndex:selectIndex] objectForKey:RES_KEY_SCHEDULE_INSTANCE_ID]];
    [call setDelegate:self];
    [call requestService];
}
- (void)deleteScheduleSuccess{
    [alertView dismissAlertView];
    [self callGetScheduleList];
}
- (void)deleteScheduleError:(ResultStatus *)resultStatus{
    [alertView dismissAlertView];
//    [self alert:[resultStatus responseMessage]];
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:[resultStatus responseMessage] LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}

-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)deleteAction:(id)sender{
        [self callDeleteSchedule];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:@selector(deleteAction:) withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"DELETE"]];
    [alertView showAlertView];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"scToMessage"]) {
        MessageTableViewController *editSchedule =[segue destinationViewController];
        editSchedule.arraySchedule = [schedule objectAtIndex:selectIndex];
    }
}
@end
