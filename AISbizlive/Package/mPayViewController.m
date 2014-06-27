//
//  mPayViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 6/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "mPayViewController.h"
#import "AISGlobal.h"
@interface mPayViewController ()

@end

@implementation mPayViewController

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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangague];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"MPAY"]];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goToAppStore:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                @"https://itunes.apple.com/th/app/mpay/id401853685?mt=8&uo=4"]];
}
@end
