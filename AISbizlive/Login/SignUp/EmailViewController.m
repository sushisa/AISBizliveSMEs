//
//  EmailViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "EmailViewController.h"
#import "AISGlobal.h"
@interface EmailViewController ()
{
    AISAlertView *alertView;
}
@end

@implementation EmailViewController

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
    alertView = [[AISAlertView alloc] init];
    [self.navigationController.navigationBar setHidden:NO];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationItem.leftBarButtonItem =[[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)setTextLangage{
    //Header
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"EMAIL"]];
    //Textfield
    [emailTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"ACTIVATION_EMAIL"]];
    [emailTextField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    //Label
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"EMAIL"]];
    [emailLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    //Button
    [resendEmailButton setTitle:[AISString commonString:typeButton KeyOfValue :@"RESEND_EMAIL"] forState:UIControlStateNormal];
    [resendEmailButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    [Donebtn setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
    [Donebtn.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resendEmail:(id)sender{
    [emailTextField setText:@""];
    [emailTextField resignFirstResponder];
    [AISView changeLayerNomal:emailView];
    [self alert:[AISString commonString:typePopup KeyOfValue :@"CONFIRMACTIVATE"]];
    
}
- (IBAction)Donebtn:(id)sender {
//    emailToSignIn
    
    [AISView changeLayerNomal:emailView];
    if ([emailTextField.text isEqualToString:@""]) {
        [AISView changeLayerError:emailView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if (emailTextField.text.length < 4)
    {
        [AISView changeLayerError:emailView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"EMAILACTIVATECODE"]];
    }
    else{
        [self alert:[AISString commonString:typePopup KeyOfValue :@"CONFIRMTOSIGNIN"]];
        [self performSegueWithIdentifier:@"emailToSignIn" sender:self];
    }
//    [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
    [emailTextField resignFirstResponder];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
@end
