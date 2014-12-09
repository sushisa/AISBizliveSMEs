//
//  OTPViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "OTPViewController.h"
#import "AISGlobal.h"
#import "EmailViewController.h"
@interface OTPViewController ()
{
    AISAlertView *alertView;
}
@end

@implementation OTPViewController

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
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)setTextLangage{
    //Header
//    [self.navigationController.navigationBar.topItem setTitle:[AISString commonString:TITLE :@"OTP"]];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"OTP"]];
    //TextField
    [otpTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"ACTIVATION_OTP"]];
    [otpTextField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    //Label
    [OTPLabel setText:[AISString commonString:typeLabel KeyOfValue :@"OTP"]];
    [OTPLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    //Button
    [resendOTPButton setTitle:[AISString commonString:typeButton KeyOfValue :@"RESEND_OTP"] forState:UIControlStateNormal];
    [resendOTPButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [otpTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmOTP:(id)sender{
    //    otpToEmail
    [AISView changeLayerNomal:otpView];
    if ([otpTextField.text isEqualToString:@""]) {
        [AISView changeLayerError:otpView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if(otpTextField.text.length < 4){
        [AISView changeLayerError:otpView];
        [self alert:[AISString commonString:typePopup KeyOfValue  :@"ACTIVATECODE"]];
    }
    else {
        [self callVarifyByOtp];
    }
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue  :@"DONE"] RightString:nil];
    [alertView showAlertView];
    [otpTextField resignFirstResponder];
}
-(IBAction)resendOTP:(id)sender{
    [otpTextField setText:@""];
    [otpTextField resignFirstResponder];
    [AISView changeLayerNomal:otpView];
    [self callRequestNewOtp];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}

-(void)callVarifyByOtp{
    ServiceLG05_VerifyByOtp *call = [[ServiceLG05_VerifyByOtp alloc] init];
    [call setParameterWithMSISDN:self.phoneNumber email:self.emailAddress otp:otpTextField.text];
    [call setDelegate:self];
    [call requestService];
}
- (void)verifyByOtpSuccess{
    [self alert:[AISString commonString:typePopup KeyOfValue  :@"CONFIRMACTIVATE"]];
    [self performSegueWithIdentifier:@"otpToEmail" sender:self];
}
- (void)verifyByOtpError:(ResultStatus *)resultStatus{
    
    [self alert:[resultStatus responseMessage]];
    
}
-(void)callRequestNewOtp{
    ServiceLG03_RequestOtpVerification *call = [[ServiceLG03_RequestOtpVerification alloc] init];
    [call setParameterWithMSISDN:self.phoneNumber];
    [call setDelegate:self];
    [call requestService];
}
- (void)requestOtpVerificationSuccess{
    [self alert:[NSString stringWithFormat:@"%@ %@",[AISString commonString:typePopup KeyOfValue  :@"SUCCESSSIGNUP"] ,self.phoneNumber]];
}
- (void)requestOtpVerificationError:(ResultStatus *)resultStatus{
    
    [self alert:[resultStatus responseMessage]];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"otpToEmail"]) {
        EmailViewController *emailView = [segue destinationViewController];
        emailView.emailAddress = self.emailAddress;
        emailView.phoneNumber = self.phoneNumber;
    }
}
@end
