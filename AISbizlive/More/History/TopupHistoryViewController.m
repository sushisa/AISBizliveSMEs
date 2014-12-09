//
//  TopupHistoryViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TopupHistoryViewController.h"
#import "AISGlobal.h"
@interface TopupHistoryViewController ()
{
    NSMutableArray *topupHistory;
    NSDictionary *topupHistoryList;
    AISAlertView *alertView;
}
@end

@implementation TopupHistoryViewController

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
	// Do any additional setup after loading the view.
    topupHistory = [[NSMutableArray alloc] init];
    alertView = [[AISAlertView alloc] init];
    [self callTopupHistory];
    self.navigationItem.title = @"Topup History";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Topup History";
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
    return topupHistory.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 42.0)];
    
    oneHeaderView.backgroundColor = [AISColor lightgreenColor];
    UIView *twoHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 40.0)];
    
    twoHeaderView.backgroundColor = [UIColor whiteColor];
     float labelWidth = twoHeaderView.frame.size.width/4;
    UILabel *channelLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(0, 0, labelWidth, 40.0)];
    
    channelLabel.textColor = [AISColor  grayColor];
    channelLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    channelLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_TOPUP_CHANNEL"];
    [channelLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth, 0, labelWidth, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    dateLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND_DATE"];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(labelWidth*2, 0, labelWidth, 40.0)];
    amountLabel.textColor =  [AISColor  grayColor];
    amountLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    amountLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_TOPUP_AMOUNT"];
    [amountLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *mobileLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth*3, 0, labelWidth, 40.0)];
    mobileLabel.textColor =  [AISColor  grayColor];
    mobileLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    mobileLabel.text = [AISString commonString:typeLabel KeyOfValue :@"MOBILE"];
    [mobileLabel setTextAlignment:NSTextAlignmentCenter];
    
    [twoHeaderView addSubview:channelLabel];
    [twoHeaderView addSubview:dateLabel];
    [twoHeaderView addSubview:amountLabel];
    [twoHeaderView addSubview:mobileLabel];
    [oneHeaderView addSubview:twoHeaderView];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 42.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"topuphistory";
    topupHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[topupHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.date.text = [AISString timeFormat:[[topupHistory objectAtIndex:indexPath.row] objectForKey:RES_KEY_HISTORY_TOPUP_DATE]];
    cell.channel.text = [[topupHistory objectAtIndex:indexPath.row] objectForKey:RES_KEY_HISTORY_TOPUP_CHANNEL];
     cell.mobileNo.text = [[topupHistory objectAtIndex:indexPath.row] objectForKey:RES_KEY_HISTORY_TOPUP_MOBILENO];
     cell.amount.text = [[topupHistory objectAtIndex:indexPath.row] objectForKey:RES_KEY_HISTORY_TOPUP_AMOUNT];
    return cell;
}
-(void)callTopupHistory{
    ServiceHT02_Topup *call =[[ServiceHT02_Topup alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)topupSuccess:(ResponseTopup *)responseTopup{
//    *channel, *date, *amount, *mobileno;
    for (HistoryTopupDetail *history in [responseTopup topup]) {
        topupHistoryList = [NSDictionary dictionaryWithObjectsAndKeys:
                              [history channel],RES_KEY_HISTORY_TOPUP_CHANNEL,
                              [history date],RES_KEY_HISTORY_TOPUP_DATE,
                              [history amount], RES_KEY_HISTORY_TOPUP_AMOUNT,
                              [history mobileno], RES_KEY_HISTORY_TOPUP_MOBILENO,nil] ;
        [topupHistory addObject:topupHistoryList];
    }
    [myTable reloadData];
}
- (void)topupError:(ResultStatus *)resultStatus{
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
