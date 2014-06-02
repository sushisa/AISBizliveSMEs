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
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(10, 0, 100.0, 40.0)];
    
    detailLabel.textColor = [AISColor  grayColor];
    detailLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    detailLabel.text = @"Detail";
    [detailLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(110, 0, 90.0, 40.0)];
    dateLabel.textColor = [AISColor  grayColor];
    dateLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    dateLabel.text = @"Date/Time";
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *successLabel = [[UILabel alloc] initWithFrame:
                          CGRectMake(200, 0, 60.0, 40.0)];
    successLabel.textColor =  [AISColor  grayColor];
    successLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    successLabel.text = @"Success";
    [successLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:
                             CGRectMake(260, 0, 50.0, 40.0)];
    failLabel.textColor =  [AISColor  grayColor];
    failLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    failLabel.text = @"Failed";
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
    
    //    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    //
    //    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:10001];
    [TextLabel setTextColor:[AISColor lightgrayColor]];
    TextLabel.text = [messageHistory objectAtIndex:indexPath.row];
    return cell;
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [package removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//   
//}
@end
