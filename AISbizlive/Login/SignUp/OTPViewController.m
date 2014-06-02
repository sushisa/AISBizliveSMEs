//
//  OTPViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "OTPViewController.h"
#import "AISGlobal.h"
@interface OTPViewController ()

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
    
    [self.navigationController.navigationBar setHidden:NO];

    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)setTextLangage{
    //Header
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_OTP]];
    //TextField
    [otpTextField setPlaceholder:[AISBLString defaultString:PLACEHODER_OTP]];
    //Label
    [OTPLabel setText:[AISBLString defaultString:LABEL_OTP]];
    //Button
    [resendOTPButton setTitle:[AISBLString defaultString:BUTTON_RESEND_OTP] forState:UIControlStateNormal];
    [doneButton setTitle:[AISBLString defaultString:BUTTON_DONE] forState:UIControlStateNormal];
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
    [self performSegueWithIdentifier:@"otpToEmail" sender:self];
}
-(IBAction)resendOTP:(id)sender{
    NSLog(@"resend OTP Click !!");
}
@end
