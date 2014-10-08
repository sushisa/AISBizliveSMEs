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
{
    AISAlertView *alertView ;
}
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
    alertView = [[AISAlertView alloc] init];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setHidden:NO];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
//    [self.navigationItem.leftBarButtonItem setTintColor:[AISColor grayColor]];
    [self setTextLangage];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangage{
    //Header
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"LOGIN"]];
    //TextField
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    
    [passwordLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PASS"]];
    [passwordField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PASSWORD"]];
    [passwordField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    //Button
    [forgetPassButton setTitle:[AISString commonString:typeButton KeyOfValue :@"FORGET_PASS"] forState:UIControlStateNormal];
    [forgetPassButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    [signinButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
    [signinButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    
    DLog(@"%@",forgetPassButton.titleLabel);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:emailField]) {
        [passwordField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:passwordField]) {
        [self signIn:self];
        return NO;
    }
    return YES;
}
- (IBAction)signIn:(id)sender {
    if ([emailField.text isEqualToString:@""] && [passwordField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDEMAIL"]];
    }
    else if([passwordField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASS"]];
    }
    else if(passwordField.text.length < 8){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else {
        [self performSegueWithIdentifier: @"tabEN" sender: self];
    }
}
// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
    
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
}

@end
