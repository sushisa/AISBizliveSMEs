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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setTextLangage{
    //Header
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_EMAIL]];
    //Textfield
    [emailPlaceholder setPlaceholder:[AISBLString defaultString:PLACEHODER_EMAIL]];
    //Label
    [emailLabel setText:[AISBLString defaultString:LABEL_EMAIL]];
    //Button
    [resendEmail setTitle:[AISBLString defaultString:BUTTON_RESEND_EMAIL] forState:UIControlStateNormal];
    [doneButton setTitle:[AISBLString defaultString:BUTTON_DONE] forState:UIControlStateNormal];
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
    [self performSegueWithIdentifier:@"emailToReset" sender:self];
}
@end
