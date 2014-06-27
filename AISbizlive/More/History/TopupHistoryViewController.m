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
    topupHistory = [[NSMutableArray alloc] initWithObjects:@"100 SMS/Package",@"200 SMS/Package",@"300 SMS/Package",@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" , nil];
    
    self.navigationItem.title = @"Topup History";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Topup History";
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
    channelLabel.text = [AISString commonString:LABEL :@"HISTORY_TOPUP_CHANNEL"];
    [channelLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth, 0, labelWidth, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    dateLabel.text = [AISString commonString:LABEL :@"HISTORY_SEND_DATE"];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(labelWidth*2, 0, labelWidth, 40.0)];
    amountLabel.textColor =  [AISColor  grayColor];
    amountLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    amountLabel.text = [AISString commonString:LABEL :@"HISTORY_TOPUP_AMOUNT"];
    [amountLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *mobileLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(labelWidth*3, 0, labelWidth, 40.0)];
    mobileLabel.textColor =  [AISColor  grayColor];
    mobileLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    mobileLabel.text = [AISString commonString:LABEL :@"MOBILE"];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    //
    //    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:10001];
    [TextLabel setTextColor:[AISColor lightgrayColor]];
    
    TextLabel.text = [topupHistory objectAtIndex:indexPath.row];
    return cell;
}

@end
