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
//TestService
    [emailField setText:@""];
    [passwordField setText:@""];
}

-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangage];
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
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textField textInputMode] primaryLanguage]) { // In fact, in iOS7, '[[textField textInputMode] primaryLanguage]' is nil
        return NO;
    }
    return YES;
}
- (IBAction)signIn:(id)sender {
    
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    if ([emailField.text isEqualToString:@""] ){
        
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNOEMAIL"]];
    }
    else if ([passwordField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASS"]];
    }
    else if([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDEMAIL"]];
    }
    else if(passwordField.text.length < 8){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else {
        ServiceLG07_Login *login = [[ServiceLG07_Login alloc] init];
        [login setUser:[emailField text]];
        [login setPassword:[passwordField text]];
        [login setDelegate:self];
        [login requestService];
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
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"OK"] RightString:nil];
    [alertView showAlertView];
    
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (void)loginSuccess:(NSDictionary *)resultLogin{
//    NSLog(@"%@",resultLogin);
        NSUserDefaults *defaults;
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%@ %@",[resultLogin objectForKey:RES_KEY_CONTACT_FIRSTNAME],[resultLogin objectForKey:RES_KEY_CONTACT_LASTNAME]] forKey:@"userLogin"];
    [defaults synchronize];
    [self performSegueWithIdentifier: @"tabEN" sender: self];
    
}
- (void)loginError:(ResultStatus *)resultStatus{
    
    [self alert:[resultStatus responseMessage]];
}

@end
