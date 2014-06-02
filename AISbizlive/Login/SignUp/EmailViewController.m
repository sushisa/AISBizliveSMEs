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
    [self.navigationController.navigationBar setHidden:NO];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationItem.leftBarButtonItem =[[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)setTextLangage{
    //Header
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_EMAIL]];
    //Textfield
    [emailTextField setPlaceholder:[AISBLString defaultString:PLACEHODER_EMAIL]];
    //Label
    [emailLabel setText:[AISBLString defaultString:LABEL_EMAIL]];
    //Button
    [resendEmailButton setTitle:[AISBLString defaultString:BUTTON_RESEND_EMAIL] forState:UIControlStateNormal];
    [Donebtn setTitle:[AISBLString defaultString:BUTTON_DONE] forState:UIControlStateNormal];
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
    NSLog(@"resend Email Click !!");
}
- (IBAction)Donebtn:(id)sender {
//    emailToSignIn
      [self performSegueWithIdentifier:@"emailToSignIn" sender:self];
//    [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
}
@end
