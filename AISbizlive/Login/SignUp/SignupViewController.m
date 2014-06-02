//
//  SignupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "SignupViewController.h"
#import "AISGlobal.h"
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
    [self.navigationController setTitle:[AISBLString defaultString:HEADER_SIGNIN]];
    //TextField
    [fullNameField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNUP_FULLNAME]];
    [emailField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNUP_EMAIL]];
    [phoneField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNUP_PHONE]];
    [passField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNUP_PASSWORD]];
    [confirmPassField setPlaceholder:[AISBLString defaultString:PLACEHODER_SIGNUP_CONFIRMPASSWORD]];
    //Label
    [emailLabel setText:[AISBLString defaultString:LABEL_SIGNUP_EMAIL]];
    [phoneLabel setText:[AISBLString defaultString:LABEL_SIGNUP_PHONE]];
    [passLabel setText:[AISBLString defaultString:LABEL_SIGNUP_PASSWORD]];
    [confirmPassLabel setText:[AISBLString defaultString:LABEL_SIGNUP_CONFIRMPASSWORD]];
    [termandpolicyLabel setText:[AISBLString defaultString:LABEL_SIGNUP_TERM_POLICY]];
    //Button
    [termButton setTitle:[AISBLString defaultString:BUTTON_TERM] forState:UIControlStateNormal];
    [policyButton setTitle:[AISBLString defaultString:BUTTON_POLICY] forState:UIControlStateNormal];
    [doneButton setTitle:[AISBLString defaultString:BUTTON_DONE] forState:UIControlStateNormal];
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
       [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"กรุณาระบุข้อมูลที่จำเป็นให้ครบถ้วน" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else if ([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [AISView changeLayerError:emailView];
        [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"กรุณาระบุ E-mail ให้ถูกต้อง" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else if (phoneField.text.length != 10){
        [AISView changeLayerError:phoneView];
        [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"กรุณาระบุเบอร์โทรศัพท์ ให้ครบ 10 ตำแหน่ง" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else if(passField.text.length < 8){
        [AISView changeLayerError:passwordView];
        [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"กรุณาระบุรหัสผ่านให้ครบถ้วน" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else if(confirmPassField.text.length < 8){
        NSLog(@"Confirm");
        [AISView changeLayerError:confirmView];
        [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"กรุณาระบุยืนยันรหัสผ่านให้ครบถ้วน" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else if (![passField.text isEqualToString:confirmPassField.text]){
        [AISView changeLayerError:passwordView];
        [AISView changeLayerError:confirmView];
        [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:@"Password / Confirm Password is not match, plase try again" LeftString:@"Done" RightString:nil];
        [alertView showAlertView];
    }
    else {
        [self performSegueWithIdentifier:@"signUpToOTP" sender:self];
        NSLog(@"111");
        NSLog(@"aaa");
    }
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
@end
