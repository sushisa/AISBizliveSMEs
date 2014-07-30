//
//  QuotaBalanceViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "QuotaBalanceViewController.h"
#import "AISGlobal.h"
@interface QuotaBalanceViewController ()
{
    NSMutableArray *quotaBalance;
}
@end

@implementation QuotaBalanceViewController

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
    quotaBalance = [[NSMutableArray alloc] initWithObjects:@"100 SMS/Package",@"200 SMS/Package",@"300 SMS/Package",@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" , nil];
    
    self.navigationItem.title = @"Quota Balance History";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Quota Balance History";
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
    return quotaBalance.count;
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
    UILabel *packageLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, 0, labelWidth, 40.0)];
    
    packageLabel.textColor = [AISColor  grayColor];
    packageLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    packageLabel.text = [AISString commonString:typeTitle KeyOfValue :@"PACKAGE"];
    [packageLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth, 0, labelWidth, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    dateLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_QUOTA_DATE"];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(labelWidth*2, 0, labelWidth, 40.0)];
    statusLabel.textColor =  [AISColor  grayColor];
    statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    statusLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_QUOTA_STATUS"];
    [statusLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *smsLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth*3, 0, labelWidth, 40.0)];
    smsLabel.textColor =  [AISColor  grayColor];
    smsLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    smsLabel.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_QUOTA_BALANCE"];
    [smsLabel setTextAlignment:NSTextAlignmentCenter];
    
    [twoHeaderView addSubview:packageLabel];
    [twoHeaderView addSubview:dateLabel];
    [twoHeaderView addSubview:statusLabel];
    [twoHeaderView addSubview:smsLabel];
    [oneHeaderView addSubview:twoHeaderView];
    return oneHeaderView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *oneFooterView = [[UIView alloc] initWithFrame:
                              CGRectMake(0, 0, tableView.frame.size.width, 42.0)];
    oneFooterView.backgroundColor = [AISColor lightgreenColor];
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 2, self.tableView.frame.size.width, 40)];
    whiteView.backgroundColor = [UIColor whiteColor];
    float labelWidth = oneFooterView.frame.size.width/4;
    UIView *twoFooterView = [[UIView alloc] initWithFrame:
                             CGRectMake(labelWidth*2, 0, tableView.frame.size.width, 40.0)];
    UILabel *totalLable = [[UILabel alloc] initWithFrame:
                             CGRectMake(0, 0, labelWidth, 40.0)];
    totalLable.backgroundColor = [AISColor lightgreenColor];
    totalLable.textColor = [UIColor whiteColor];
    totalLable.font = [UIFont boldSystemFontOfSize:15.0f];
    totalLable.text = [AISString commonString:typeLabel KeyOfValue :@"HISTORY_QUOTA_TOTAL"];
    [totalLable setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *totalBalanceLable = [[UILabel alloc] initWithFrame:
                         CGRectMake(labelWidth, 0, labelWidth, 40.0)];
    totalBalanceLable.textColor =  [AISColor  grayColor];
    totalBalanceLable.font = [UIFont boldSystemFontOfSize:14.0f];
    totalBalanceLable.text = @"400";
    [totalBalanceLable setTextAlignment:NSTextAlignmentCenter];
    
    [twoFooterView addSubview:totalLable];
    [twoFooterView addSubview:totalBalanceLable];
    [whiteView addSubview:twoFooterView];
    [oneFooterView addSubview:whiteView];
    return oneFooterView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 42.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 42.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"quotabalance";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    //
    //    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:10004];
    [TextLabel setTextColor:[AISColor lightgrayColor]];
    TextLabel.text = [quotaBalance objectAtIndex:indexPath.row];
    return cell;
}
@end
