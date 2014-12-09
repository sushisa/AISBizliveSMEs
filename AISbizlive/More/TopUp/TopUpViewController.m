//
//  TopUpViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TopUpViewController.h"
#import "AISGlobal.h"
#import "BizliveServiceParameter.h"
@interface TopUpViewController ()
{
    AISAlertView *alertView;
}
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
    alertView = [[AISAlertView alloc] init];
    [self setTextLangague];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    mobileLabel.text = [AISString phoneFormat:[defaults objectForKey:REQ_KEY_USER_MOBILE_NO]];
    currentBahtLabel.text = [defaults objectForKey:RES_KEY_SETTING_TOPUPBALANCE];
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
    topupLabel.text = [AISString commonString:typeLabel KeyOfValue :@"TOPUP_CASH"];
    descriptionCurrent.text = [AISString commonString:typeLabel KeyOfValue :@"TOPUP_CURRENT"];
    currentBahtLabel.text = [AISString commonString:typeLabel KeyOfValue :@"BAHT"];
    serialLabel.text = [AISString commonString:typeLabel KeyOfValue :@"TOPUP_SERIAL"];
    serialTextfield.placeholder = [AISString commonString:typePlacehoder KeyOfValue :@"TOPUP_SERIAL"];
    
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
-(void)DoneButton{
    [self alert:[AISString commonString:typePopup KeyOfValue :@"TOPUPNO"]];
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
