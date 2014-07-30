//
//  ForgetEmailViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ForgetEmailViewController.h"
#import "AISGlobal.h"
@interface ForgetEmailViewController ()

@end

@implementation ForgetEmailViewController

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
    [self setTextLangage];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setTextLangage{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    //Header
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"EMAIL"]];
    //Textfield
    [emailPlaceholder setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue:@"ACTIVATION_EMAIL"]];
    //Label
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"EMAIL"]];
    //Button
    [resendEmail setTitle:[AISString commonString:typeButton KeyOfValue :@"RESEND_EMAIL"] forState:UIControlStateNormal];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
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

- (IBAction)doneAction:(id)sender{
//  emailToReset
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
