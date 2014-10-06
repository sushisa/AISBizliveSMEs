//
//  HistoryViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "HistoryViewController.h"
#import "AISGlobal.h"
@interface HistoryViewController ()

@end

@implementation HistoryViewController

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
    
    [self setTextLangague];
}
-(void)setTextLangague{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"HISTORY"]];
    [sendHistory setText:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_SEND"]];
    [balanceHistory setText:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_QUOTA"]];
    [topupHistory setText:[AISString commonString:typeLabel KeyOfValue :@"HISTORY_TOPUP"]];
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
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
