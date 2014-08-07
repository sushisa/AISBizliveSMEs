//
//  FogetPasswordViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "FogetPasswordViewController.h"
#import "AISGlobal.h"
@interface FogetPasswordViewController ()
{
    AISAlertView *alertView;
}
@end

@implementation FogetPasswordViewController

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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];

    [self setTextLangage];
}
-(void)setTextLangage{
    //Header
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"FORGETPASSWORD"]];
    //TextField
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    
    [emailField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    
    //Label
    [forgetPassLabel setText:[AISString commonString:typeLabel KeyOfValue :@"FORGETPASS"]];
    //Button
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneAction:(id)sender {
//  forgetToEmail
    if ([emailField.text isEqualToString:@""]) {
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if ([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound)
    {
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDEMAIL"]];
    }
    else{
        [self alert:[AISString commonString:typePopup KeyOfValue :@"SUCCESSSIGNUP"]];
        [self performSegueWithIdentifier:@"forgetToEmail" sender:self];
    }

}

-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneBTN:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
-(void)doneBTN:(id)sender{
    [alertView dismissAlertView];
}
@end
