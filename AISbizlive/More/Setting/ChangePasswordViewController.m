//
//  ChangePasswordViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "AISGlobal.h"
@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeButton KeyOfValue :@"CHANGE_PASS"]];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue:@"DONE"] forState:UIControlStateNormal];
    [oldPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"OLD_PASS"]];
    
    [newPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"NEW_PASS"]];
    [reNewPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"CONFIRM_PASS"]];
    [oldPasswordLabel setText:[AISString commonString:typeLabel KeyOfValue :@"OLD_PASS"]];
    [newPasswordLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NEW_PASS"]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
//[AISString commonString:BUTTON :@"DONE"]
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

- (IBAction)doneAction:(id)sender {
    [self backAction];
}
@end
