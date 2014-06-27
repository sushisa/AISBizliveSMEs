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
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"HISTORY"]];
    [sendHistory setText:[AISString commonString:LABEL :@"HISTORY_SEND"]];
    [balanceHistory setText:[AISString commonString:LABEL :@"HISTORY_QUOTA"]];
    [topupHistory setText:[AISString commonString:LABEL :@"HISTORY_TOPUP"]];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
