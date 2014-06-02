//
//  LoginViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/12/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "LoginViewController.h"
#import "AISGlobal.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [self.navigationController.navigationBar setHidden:NO];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
//    [self.navigationItem.leftBarButtonItem setTintColor:[AISColor grayColor]];
    [self setTextLangage];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangage{
    //Header
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_SIGNIN]];
    //TextField
    [emailField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNIN_EMAIL]];
    [passwordField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNIN_PASSWORD]];
    //Button
    [forgetPassButton setTitle:[AISBLString defaultString:BUTTON_SIGNIN_FORGET] forState:UIControlStateNormal];
    [signinButton setTitle:[AISBLString defaultString:BUTTON_SIGNIN_SIGNIN] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signIn:(id)sender {
 
        [self performSegueWithIdentifier: @"tabEN" sender: self];
}
// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
}

@end
