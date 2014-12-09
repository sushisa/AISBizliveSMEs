//
//  MessageHistoryViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "MessageHistoryViewController.h"
#import "AISGlobal.h"
@interface MessageHistoryViewController ()
{
    NSMutableArray *messageHistory;
    NSDictionary *messageHistoryList;
    NSSortDescriptor *descriptor;
    NSMutableArray *filletArray;
    UIPickerView *fillterPicker;
    UIView *fillterDimView;
    NSSortDescriptor *fillterDescriptor;
    UIView *dimView;
    NSMutableArray *searchArray;
    NSString *fillterString;
    AISAlertView *alertView;
}
@end

@implementation MessageHistoryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    messageHistory = [[NSMutableArray alloc] init];
    searchArray = [[NSMutableArray alloc] init];
    alertView = [[AISAlertView alloc] init];
    descriptor = [NSSortDescriptor sortDescriptorWithKey:RES_KEY_SEND_MESSAGE_DATE  ascending:NO];
    filletArray = [[NSMutableArray alloc] initWithObjects:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DETAIL"],[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DATE"], nil];
    dimView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+10, myTable.frame.size.width, myTable.frame.size.height)];
    dimView.backgroundColor = [UIColor whiteColor];
    UILabel *noRe = [[UILabel alloc] initWithFrame:CGRectMake(0, 20,myTable.frame.size.width, 20)];
    noRe.text = [AISString commonString:typeLabel KeyOfValue:@"NO_RESULT"];
    noRe.textColor = [AISColor lightgreenColor];
    [noRe setTextAlignment:NSTextAlignmentCenter];
    [dimView addSubview:noRe];
    [self.view addSubview:dimView];
    [searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self callSendMessageHistory];
    self.navigationItem.title = @"Message History";
    self.navigationItem.leftBarButtonItem =[[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    UITapGestureRecognizer *viewTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(hideKeyboard:)];
    [viewTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:viewTap];
    
    UITapGestureRecognizer *fillterTap = [[UITapGestureRecognizer alloc]
                                       initWithTarget: self
                                          action: @selector(fillter:)];
    [fillterTap setNumberOfTouchesRequired:1];
    [fillterView addGestureRecognizer:fillterTap];
    fillterDescriptor = [NSSortDescriptor sortDescriptorWithKey:RES_KEY_MESSAGE  ascending:NO];
    [fillterLabel setText:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DETAIL"]];
    fillterString = RES_KEY_SEND_MESSAGE_MESSAGE;
    
   
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [searchTextField resignFirstResponder];
    [fillterDimView removeFromSuperview];
}
-(void)fillter:(UITapGestureRecognizer *)sender {
    fillterPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, myTable.frame.origin.y+myTable.frame.size.height - 120, self.view.frame.size.width, 50.0f)];
    fillterPicker.dataSource = self;
    fillterPicker.delegate = self;
    fillterPicker.backgroundColor = [UIColor whiteColor];
    fillterDimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    fillterDimView.backgroundColor =  [[UIColor alloc] initWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.3f];
    [fillterDimView addSubview:fillterPicker];
    [self.view addSubview:fillterDimView];
}
-(void)textFieldDidChange:(UITextField *)txtFld {
    [searchArray removeAllObjects];
    
    NSString * tem = [NSString stringWithFormat:@"%@",txtFld.text];
    NSPredicate *predicate;
    NSArray *result;
    predicate = [NSPredicate predicateWithFormat:
                 @"(%K contains[c] %@)" ,fillterString,tem];
    result = [messageHistory filteredArrayUsingPredicate:predicate];
    [searchArray addObjectsFromArray:result];
    if (![txtFld.text isEqualToString:@""]) {
        if ([searchArray count] == 0) {
            [dimView setFrame:CGRectMake(0, myTable.frame.origin.y, myTable.frame.size.width, myTable.frame.size.height)];
        }else{
            [dimView setFrame:CGRectMake(0, self.view.frame.size.height+10, myTable.frame.size.width, myTable.frame.size.height)];
        }
    }
    [myTable reloadData];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [filletArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [filletArray objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    fillterLabel.text = [NSString stringWithFormat:@"%@",[filletArray objectAtIndex:row]];
    if ([[filletArray objectAtIndex:row] isEqualToString:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DETAIL"]]) {
        fillterString = RES_KEY_SEND_MESSAGE_MESSAGE;
    }
    else{
        fillterString = RES_KEY_SEND_MESSAGE_DATE;
    }
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Message History";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if ([searchArray count] == 0) {
        return [messageHistory count];
    }else{
        return searchArray.count;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 44.0)];
    
    oneHeaderView.backgroundColor = [AISColor lightgreenColor];
    UIView *twoHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 2, tableView.frame.size.width, 40.0)];
    
    twoHeaderView.backgroundColor = [UIColor whiteColor];
    
    float labelWidth = twoHeaderView.frame.size.width/6;
    
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(0, 0, labelWidth*2, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    dateLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DATE"];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(labelWidth*2, 0, labelWidth*2, 40.0)];
    
    detailLabel.textColor = [AISColor  grayColor];
    detailLabel.font = [UIFont boldSystemFontOfSize:11.0f];
    detailLabel.text =[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DETAIL"];
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *successLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake((labelWidth)*4, 0, labelWidth, 40.0)];
    successLabel.textColor =  [AISColor  grayColor];
    successLabel.font = [UIFont boldSystemFontOfSize:10.0f];
    successLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_SUCCESS"];
    [successLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake((labelWidth)*5, 0, labelWidth, 40.0)];
    failLabel.textColor =  [AISColor  grayColor];
    failLabel.font = [UIFont boldSystemFontOfSize:10.0f];
    failLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_FAILED"];
    [failLabel setTextAlignment:NSTextAlignmentCenter];
    
    [twoHeaderView addSubview:detailLabel];
    [twoHeaderView addSubview:dateLabel];
    [twoHeaderView addSubview:successLabel];
    [twoHeaderView addSubview:failLabel];
    [oneHeaderView addSubview:twoHeaderView];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"messagehistory";
    messageHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[messageHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dictHistory;
    if ([searchArray count] == 0) {
        dictHistory = [messageHistory objectAtIndex:indexPath.row];
    }else{
        dictHistory = [searchArray objectAtIndex:indexPath.row];
    }
    //swipe
    cell.detail.text = [dictHistory objectForKey:RES_KEY_SEND_MESSAGE_DATE];
    // ->
    cell.date.text = [dictHistory objectForKey:RES_KEY_SEND_MESSAGE_MESSAGE];
    
    cell.success.text = [dictHistory objectForKey:RES_KEY_SEND_MESSAGE_SUCCESSED];
    cell.failed.text = [dictHistory objectForKey:RES_KEY_SEND_MESSAGE_FAILED];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}
-(void)callSendMessageHistory{
    ServiceHT01_SendMessage *call = [[ServiceHT01_SendMessage alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)sendMessageHistorySuccess:(ResponseSendMessage *)responseSendMessage{
//    *message,*senddate,*successed,*failed;
    for (SendMessageDetail *sendMessage in [responseSendMessage sendMessage]) {
        messageHistoryList = [NSDictionary dictionaryWithObjectsAndKeys:
                   [sendMessage message],RES_KEY_SEND_MESSAGE_MESSAGE,
                    [AISString dateFormat:[sendMessage senddate]],RES_KEY_SEND_MESSAGE_DATE,
                   [sendMessage successed], RES_KEY_SEND_MESSAGE_SUCCESSED,
                   [sendMessage failed], RES_KEY_SEND_MESSAGE_FAILED,nil] ;
        [messageHistory addObject:messageHistoryList];
    }
    
    [messageHistory sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    [myTable reloadData];
    
}
- (void)sendMessageHistoryError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}



-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
@end
