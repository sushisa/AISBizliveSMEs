//
//  SignupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "SignupViewController.h"
#import "AISGlobal.h"
#import "OTPViewController.h"
@interface SignupViewController ()
{
    UIActionSheet *choosePhoto;
    AISAlertView *alertView ;
}
@end

@implementation SignupViewController

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
    // Tap Gesture for Hide Keyboard
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    alertView = [AISAlertView alloc];
    [self setTextLangage];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangage{
    //Title
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"SIGNUP"]];
    //TextField
    [fullNameField setPlaceholder:[AISString commonString:PLACEHODER :@"SIGNUP_NAME"]];
    [emailField setPlaceholder:[AISString commonString:PLACEHODER :@"SIGNUP_EMAIL"]];
    [phoneField setPlaceholder:[AISString commonString:PLACEHODER :@"SIGNUP_PHONE"]];
    [passField setPlaceholder:[AISString commonString:PLACEHODER :@"SIGNUP_PASSWORD"]];
    [confirmPassField setPlaceholder:[AISString commonString:PLACEHODER :@"SIGNUP_PASSWORD"]];
    //Label
    [emailLabel setText:[AISString commonString:LABEL :@"SIGNUP_EMAIL"]];
    [phoneLabel setText:[AISString commonString:LABEL :@"SIGNUP_PHONE"]];
    [passLabel setText:[AISString commonString:LABEL :@"SIGNUP_PASS"]];
    [confirmPassLabel setText:[AISString commonString:LABEL :@"SIGNUP_CONFIRM"]];
    [termandpolicyLabel setText:[AISString commonString:LABEL :@"SIGNUP_TERM"]];
    //Button
    [termButton setTitle:[AISString commonString:TITLE :@"TERM"] forState:UIControlStateNormal];
    [policyButton setTitle:[AISString commonString:TITLE :@"POLICY"] forState:UIControlStateNormal];
    [doneButton setTitle:[AISString commonString:BUTTON :@"DONE"] forState:UIControlStateNormal];
}
// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailField resignFirstResponder];
    [phoneField resignFirstResponder];
    [passField resignFirstResponder];
    [fullNameField resignFirstResponder];
    [confirmPassField resignFirstResponder];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSInteger locationAndStringLengthSum = range.location + [string length];
    if ([textField isEqual:phoneField]) {
        if (locationAndStringLengthSum > 10) {
            return NO;
        }
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:fullNameField]) {
       [emailField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:emailField]) {
        [phoneField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:phoneField]) {
        [passField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:passField]) {
        [confirmPassField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:confirmPassField]) {
        [confirmPassField resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)choosePicture:(id)sender {
    choosePhoto = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:nil
                                     otherButtonTitles:@"Take a Photo",@"Library", nil];
    // Show the sheet
    [choosePhoto showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerController *picker= [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    switch (buttonIndex) {
        case 0:
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"Device Has No Camera" LeftString:@"Done" RightString:nil];
                [alertView showAlertView];
                
            }
            else {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:picker animated:YES completion:nil];
            }

            break;
        case 1:
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:picker animated:YES completion:nil];
            break;
        default:
            break;
    
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    //imageVieq.image = chosenImage;
    [photoImage setBackgroundImage:chosenImage forState:UIControlStateNormal];
   [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (IBAction)confirmSignUp:(id)sender{
//  signUpToOTP
    
    [AISView changeLayerNomal:emailView];
    [AISView changeLayerNomal:phoneView];
    [AISView changeLayerNomal:passwordView];
    [AISView changeLayerNomal:confirmView];
    if ([emailField.text isEqualToString:@""] || [phoneField.text isEqualToString:@""] || [passField.text isEqualToString:@""] || [confirmPassField.text isEqualToString:@""] || [fullNameField.text isEqualToString:@""]) {
        [self alert:[AISString commonString:POPUP :@"TEXTFIELDNIL"]];
    }
    else if ([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [AISView changeLayerError:emailView];
        [self alert:[AISString commonString:POPUP :@"TEXTFIELDEMAIL"]];
    }
    else if (phoneField.text.length != 10){
        [AISView changeLayerError:phoneView];
        
        [self alert:[AISString commonString:POPUP :@"TEXTFIELDPHONE"]];
    }
    else if(passField.text.length < 8){
        [AISView changeLayerError:passwordView];
         [self alert:[AISString commonString:POPUP :@"TEXTFIELDPASS"]];
    }
    else if(confirmPassField.text.length < 8){
        [AISView changeLayerError:confirmView];
        
        [self alert:[AISString commonString:POPUP :@"TEXTFIELDCONFIRM"]];
    }
    else if (![passField.text isEqualToString:confirmPassField.text]){
        [AISView changeLayerError:passwordView];
        [AISView changeLayerError:confirmView];
        [self alert:[AISString commonString:POPUP :@"TEXTFIELDPASSANDCONFIRM"]];
    }
    else {
        
        [self alert:[NSString stringWithFormat:[AISString commonString:POPUP :@"CONFIRMPHONE"], "%@",phoneField.text ]];
        [self performSegueWithIdentifier:@"signUpToOTP" sender:self];
    }
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:BUTTON :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"signUpToOTP"]) {
        OTPViewController *otp = segue.destinationViewController;
        otp.phoneNumber = phoneField.text;
        otp.emailAddress = emailField.text;
    }
}
@end
