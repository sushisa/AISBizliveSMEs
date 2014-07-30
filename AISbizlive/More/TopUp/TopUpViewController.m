//
//  TopUpViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TopUpViewController.h"
#import "AISGlobal.h"
@interface TopUpViewController ()

@end

@implementation TopUpViewController

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
    NSLog(@"Top Up Load");
    [self setTextLangague];
    currentLabel.text = @"1,000.00";
    mobileLabel.text = @"0953285722";
}
-(void)backAction{
    if ([self.checkPackage isEqualToString:@"YES"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"TOPUP"]];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(DoneButton) withTarget:self];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
}
-(void)DoneButton{
    NSLog(@"Done");
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
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

@end
