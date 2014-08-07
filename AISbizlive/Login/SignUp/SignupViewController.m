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
#import "WebViewcontroller.h"
@interface SignupViewController ()
{
    UIActionSheet *choosePhoto;
    AISAlertView *alertView ;
    NSDictionary *facebookData;
    NSUserDefaults *defaults;
    NSString *headerToWeb;
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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
    defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"type"] isEqualToString:@"Facebook"]) {
        [AISLoading loadingStart];
        
        [FBSession openActiveSessionWithReadPermissions:@[ @"user_friends"] allowLoginUI:YES completionHandler: ^(FBSession *session, FBSessionState state, NSError *error) {
            if (state == FBSessionStateOpen) {
                [[FBRequest requestForMe] startWithCompletionHandler:
                 ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                     if (!error) {
                         facebookData = user;
                         NSLog(@"%@",facebookData);
                         [self setDataFacebook];
                     }
                 }];
            }
        }];
    }
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setDataFacebook{
//    SIGNUPFACEBOOK
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SIGNUPFACEBOOK"]];
    [fullNameField setText:[facebookData objectForKey:@"name"]];
//    SIGNUP_IDFACEBOOK
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_IDFACEBOOK"]];
    [emailField setText:[facebookData objectForKey:@"id"]];
    [emailField setEnabled:NO];
    //    [photoImage setAlpha:0.0f];
     NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [facebookData objectForKey:@"username"]];
    NSURL *imageURL = [NSURL URLWithString:userImageURL];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    [photoImage setBackgroundImage: [UIImage imageWithData:imageData] forState:UIControlStateNormal];
    
    [AISLoading loadingStop];
//    self.profilePictureView.profileID = [facebookData objectForKey:@"id"];
}
-(void)setTextLangage{
    //Title
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SIGNUP"]];
    //TextField
    [fullNameField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_NAME"]];
    [emailField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_EMAIL"]];
    [phoneField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PHONE"]];
    [passField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PASSWORD"]];
    [confirmPassField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PASSWORD"]];
    //Label
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [phoneLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    [phoneLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [passLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PASS"]];
    [passLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [confirmPassLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_CONFIRM"]];
    [confirmPassLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [termandpolicyLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_TERM"]];
    [termandpolicyLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    //Button
    [termButton setTitle:[AISString commonString:typeTitle KeyOfValue :@"TERM"] forState:UIControlStateNormal];
    [termButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [policyButton setTitle:[AISString commonString:typeTitle KeyOfValue :@"POLICY"] forState:UIControlStateNormal];
    [policyButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
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
//        if (locationAndStringLengthSum == 3 || locationAndStringLengthSum == 8) {
//            phoneField.text = [NSString stringWithFormat:@"%@-",phoneField.text];
//        }
        if (locationAndStringLengthSum > 10) {
            phoneField.text = [NSString stringWithFormat:@"%@-%@-%@",[phoneField.text substringToIndex:2] ,phoneField.text];
            return NO;
        }
    }
    else if ([textField isEqual:passField] || [textField isEqual:confirmPassField]) {
        if (locationAndStringLengthSum > 20) {
            return NO;
        }
    }
    else if ([textField isEqual:fullNameField]) {
        if (locationAndStringLengthSum > 200) {
            return NO;
        }
    }
    else if ([textField isEqual:emailField]) {
        if (locationAndStringLengthSum > 100) {
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
        [passField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:passField]) {
        [confirmPassField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:confirmPassField]) {
        [phoneField becomeFirstResponder];
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
    if ([emailField.text isEqualToString:@""] && [phoneField.text isEqualToString:@""] && [passField.text isEqualToString:@""] && [confirmPassField.text isEqualToString:@""] && [fullNameField.text isEqualToString:@""]) {
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if ([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [AISView changeLayerError:emailView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDEMAIL"]];
    }
    else if([passField.text isEqualToString:@""]){
        [AISView changeLayerError:passwordView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASS"]];
    }
    else if(passField.text.length < 8){
        [AISView changeLayerError:passwordView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else if([confirmPassField.text isEqualToString:@""]){
        [AISView changeLayerError:confirmView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDCONFIRM"]];
    }
    else if(confirmPassField.text.length < 8){
        [AISView changeLayerError:confirmView];
        
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDCONFIRMDIGIT"]];
    }
    else if (![passField.text isEqualToString:confirmPassField.text]){
        [AISView changeLayerError:passwordView];
        [AISView changeLayerError:confirmView];
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSANDCONFIRM"]];
    }
    else if (phoneField.text.length != 10){
        [AISView changeLayerError:phoneView];
        
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPHONE"]];
    }
    else if (![[phoneField.text substringToIndex:2]  isEqual: @"08"] && ![[phoneField.text substringToIndex:2]  isEqual: @"09"] ){
            [AISView changeLayerError:phoneView];
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDISNOPHONE"]];
    }
    
    else {
        
        [self alert:[NSString stringWithFormat:[AISString commonString:typePopup KeyOfValue :@"CONFIRMPHONE"], "%@",phoneField.text ]];
        [self performSegueWithIdentifier:@"signUpToOTP" sender:self];
    }
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"signUpToOTP"]) {
        OTPViewController *otp = segue.destinationViewController;
        otp.phoneNumber = phoneField.text;
        otp.emailAddress = emailField.text;
    }
    else if ([[segue identifier] isEqualToString: @"signupToWeb"]) {
        WebViewController *web = [segue destinationViewController];
        web.Header = headerToWeb;
    }
}
- (IBAction)termClick:(id)sender {
    
    headerToWeb = termButton.titleLabel.text;
    [self performSegueWithIdentifier:@"signupToWeb" sender:self];
}

- (IBAction)policyClick:(id)sender {
    headerToWeb = policyButton.titleLabel.text;
    [self performSegueWithIdentifier:@"signupToWeb" sender:self];
}
@end
