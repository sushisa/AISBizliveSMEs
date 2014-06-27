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
}
@end

@implementation MessageHistoryViewController

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
    messageHistory = [[NSMutableArray alloc] initWithObjects:@"100 SMS/Package",@"200 SMS/Package",@"300 SMS/Package",@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" , nil];
    
    self.navigationItem.title = @"Message History";
    self.navigationItem.leftBarButtonItem =[[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Message History";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
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
    return messageHistory.count;
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
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, 0, labelWidth, 40.0)];
    
    detailLabel.textColor = [AISColor  grayColor];
    detailLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    detailLabel.text =[AISString commonString:LABEL :@"HISTORY_SEND_DETAIL"];
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(labelWidth, 0, labelWidth, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    dateLabel.text = [AISString commonString:LABEL :@"HISTORY_SEND_DATE"];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *successLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake((labelWidth)*2, 0, labelWidth, 40.0)];
    successLabel.textColor =  [AISColor  grayColor];
    successLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    successLabel.text = [AISString commonString:LABEL :@"HISTORY_SEND_SUCCESS"];
    [successLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake((labelWidth)*3, 0, labelWidth, 40.0)];
    failLabel.textColor =  [AISColor  grayColor];
    failLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    failLabel.text = [AISString commonString:LABEL :@"HISTORY_SEND_FAILED"];
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
    return 42.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"messagehistory";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:10001];
    [TextLabel setTextColor:[AISColor lightgrayColor]];
    
    TextLabel.text = [messageHistory objectAtIndex:indexPath.row];
    return cell;
//    TextLabel.text = ;
    return cell;
}
@end
