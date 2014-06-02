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
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_FORGET]];
    //TextField
    [emailField setPlaceholder:[AISBLString defaultString:PLACEHODER_FORGET]];
    //Label
    [forgetPassLabel setText:[AISBLString defaultString:LABEL_FORGET]];
    //Button
    [doneButton setTitle:[AISBLString defaultString:BUTTON_DONE] forState:UIControlStateNormal];
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
    [self performSegueWithIdentifier:@"forgetToEmail" sender:self];

}

@end
