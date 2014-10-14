//
//  Signup2ViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 9/3/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "Signup2ViewController.h"
#import "WebViewController.h"
#import "OTPViewController.h"
#import "AISGlobal.h"
@interface Signup2ViewController ()
{
    
    NSString *headerToWeb;
    NSString *indexToWeb;
    NSMutableArray *checkHeightCell;
    AISAlertView *alertView;
    UIActionSheet *choosePhoto;
    bool checkPeople;
    int checkPassword;
}
@end

@implementation Signup2ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    checkPeople = true;
    [self setTextLangage];
    [self setViewGesture];

}
-(void)setViewGesture{
    //Immediately
    UITapGestureRecognizer *PersonTap = [[UITapGestureRecognizer alloc]
                                              initWithTarget: self
                                              action: @selector(personSelected:)];
    [PersonTap setNumberOfTouchesRequired:1];
    [personView addGestureRecognizer:PersonTap];
    imagePerson.image = [UIImage imageNamed:OK_GREEN];
    personView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    
    //Schedule
    UITapGestureRecognizer *JuristicTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(juristicSelected:)];
    [JuristicTap setNumberOfTouchesRequired:1];
    [juristicView addGestureRecognizer:JuristicTap];
    imageJuristic.image = [UIImage imageNamed:OK_GREY];
}
- (void)personSelected:(UITapGestureRecognizer *)sender {
    imageJuristic.image = [UIImage imageNamed:OK_GREY];
    imagePerson.image = [UIImage imageNamed:OK_GREEN];
    checkPeople = true;
    personView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    juristicView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [checkHeightCell replaceObjectAtIndex:2 withObject:@"0"];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"0"];
    [myTableView reloadData];
}
- (void)juristicSelected:(UITapGestureRecognizer *)sender {
    imagePerson.image = [UIImage imageNamed:OK_GREY];
    imageJuristic.image = [UIImage imageNamed:OK_GREEN];
    checkPeople = false;
    juristicView.layer.borderColor = [AISColor lightgreenColor].CGColor;
    personView.layer.borderColor = [AISColor lightgrayColor].CGColor;
    [checkHeightCell replaceObjectAtIndex:2 withObject:@"57"];
    [checkHeightCell replaceObjectAtIndex:3 withObject:@"57"];
    [myTableView reloadData];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangage{
     checkHeightCell = [[NSMutableArray alloc] initWithObjects:@"120",@"54",@"0",@"0",@"57",@"57",@"57",@"57",@"57",@"70",@"60", nil];
    alertView = [[AISAlertView alloc] init];
    //Title
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SIGNUP"]];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    //TextField
    [nameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_NAME"]];
    [nameTextField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [lastNameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_LASTNAME"]];
    [lastNameTextField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    
    [taxIdField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_IDCARD"]];
    [taxIdField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [idCardField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_IDCARD"]];
    [idCardField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [emailField setPlaceholder:[AISString commonString :typePlacehoder KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [phoneField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PHONE"]];
    [phoneField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [passField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PASSWORD"]];
    [passField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [confirmPassField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PASSWORD"]];
    [confirmPassField setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    //Label
    
    [companyLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_COMPANY"]];
    [companyLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [taxIdLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_TAXID"]];
    [taxIdLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [idCardLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_IDCARD"]];
    [idCardLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [emailLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_EMAIL"]];
    [emailLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [phoneLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    [phoneLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [passLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PASS"]];
    [passLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [confirmPassLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_CONFIRM"]];
    [confirmPassLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [termandpolicyLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_TERM"]];
    [termandpolicyLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    //Button
    [personLabel setText:[AISString commonString:typeButton KeyOfValue :@"PERSON"]];
    [personLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [juristicLabel setText:[AISString commonString:typeButton KeyOfValue :@"JURISTIC_PERSON"]];
    [juristicLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [termButton setTitle:[AISString commonString:typeTitle KeyOfValue :@"TERM"] forState:UIControlStateNormal];
    [termButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [policyButton setTitle:[AISString commonString:typeTitle KeyOfValue :@"POLICY"] forState:UIControlStateNormal];
    [policyButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeSmall]];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DONE"] forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [emailField resignFirstResponder];
    [phoneField resignFirstResponder];
    [passField resignFirstResponder];
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [confirmPassField resignFirstResponder];
    [taxIdField resignFirstResponder];
    [idCardField resignFirstResponder];
    [companyField resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:phoneField]) {
            if (phoneField.text.length == 12) {
                phoneField.text = [NSString stringWithFormat:@"%@%@%@",[phoneField.text substringToIndex:2] ,[[phoneField.text substringFromIndex:3] substringToIndex:4],[phoneField.text substringFromIndex:8] ];
            }
    }
    else if ([textField isEqual:idCardField]){
        if (idCardField.text.length == 17) {
            idCardField.text = [NSString stringWithFormat:@"%@%@%@%@%@",[idCardField.text substringToIndex:1] ,[[idCardField.text substringFromIndex:2] substringToIndex:4],[[idCardField.text substringFromIndex:7] substringToIndex:5],[[idCardField.text substringFromIndex:13] substringToIndex:2],[[idCardField.text substringFromIndex:16]substringToIndex:1] ];
        }
    }
    else if ([textField isEqual:taxIdField]){
        if (taxIdField.text.length == 17) {
            taxIdField.text = [NSString stringWithFormat:@"%@%@%@%@%@",[taxIdField.text substringToIndex:1] ,[[taxIdField.text substringFromIndex:2] substringToIndex:4],[[taxIdField.text substringFromIndex:7] substringToIndex:5],[[taxIdField.text substringFromIndex:13] substringToIndex:2],[[taxIdField.text substringFromIndex:16]substringToIndex:1] ];
        }
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:phoneField]) {
        if (phoneField.text.length == 10 && [phoneField.text rangeOfString:@"-"].location == NSNotFound) {
            phoneField.text = [NSString stringWithFormat:@"%@-%@-%@",[phoneField.text substringToIndex:2] ,[[phoneField.text substringFromIndex:2] substringToIndex:4],[phoneField.text substringFromIndex:6] ];
        }
    }
    else if ([textField isEqual:idCardField]) {
        if (idCardField.text.length == 13 && [idCardField.text rangeOfString:@"-"].location == NSNotFound) {
            idCardField.text = [NSString stringWithFormat:@"%@-%@-%@-%@-%@",[idCardField.text substringToIndex:1] ,[[idCardField.text substringFromIndex:1] substringToIndex:4],[[idCardField.text substringFromIndex:5] substringToIndex:5],[[idCardField.text substringFromIndex:10] substringToIndex:2],[[idCardField.text substringFromIndex:12]substringToIndex:1] ];
        }
    }
    else if ([textField isEqual:taxIdField]) {
        if (taxIdField.text.length == 13 && [taxIdField.text rangeOfString:@"-"].location == NSNotFound) {
            taxIdField.text = [NSString stringWithFormat:@"%@-%@-%@-%@-%@",[taxIdField.text substringToIndex:1] ,[[taxIdField.text substringFromIndex:1] substringToIndex:4],[[taxIdField.text substringFromIndex:5] substringToIndex:5],[[taxIdField.text substringFromIndex:10] substringToIndex:2],[[taxIdField.text substringFromIndex:12]substringToIndex:1] ];
        }
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSInteger locationAndStringLengthSum = range.location + [string length];
    if ([textField isEqual:phoneField]) {
        if (locationAndStringLengthSum > 10) {
            
            return NO;
        }
        
    }
    else if ([textField isEqual:passField] || [textField isEqual:confirmPassField]) {
        if (locationAndStringLengthSum > 20) {
            return NO;
        }
    }
    else if ([textField isEqual:nameTextField]) {
        if (locationAndStringLengthSum > 200) {
            return NO;
        }
    }
    else if ([textField isEqual:emailField]) {
        if (locationAndStringLengthSum > 100) {
            return NO;
        }
    }
    else if ([textField isEqual:taxIdField]) {
        if (locationAndStringLengthSum > 13) {
            return NO;
        }
    }
    else if ([textField isEqual:idCardField]) {
        if (locationAndStringLengthSum > 13) {
            return NO;
        }
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:nameTextField]) {
        [lastNameTextField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:lastNameTextField]) {
        if (!checkPeople){
            [taxIdField becomeFirstResponder];
        }
        else {
            [idCardField becomeFirstResponder];
        }
        return NO;
    }
    else if ([textField isEqual:taxIdField]) {
        [companyField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:companyField]) {
        [idCardField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:idCardField]) {
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
#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"%@",[checkHeightCell objectAtIndex:indexPath.row]);
    return [[checkHeightCell objectAtIndex:indexPath.row] floatValue];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"signUpToOTP"]) {
        OTPViewController *otp = segue.destinationViewController;
        otp.phoneNumber = phoneField.text;
//        otp.emailAddress = emailField.text;
    }
    else if ([[segue identifier] isEqualToString: @"signupToWeb"]) {
        WebViewController *web = [segue destinationViewController];
        web.Header = headerToWeb;
        web.indexRow = indexToWeb;
    }
}
- (IBAction)confirmSignUp:(id)sender{
    //  signUpToOTP
    
    if ([emailField.text isEqualToString:@""] && [phoneField.text isEqualToString:@""] && [passField.text isEqualToString:@""] && [confirmPassField.text isEqualToString:@""] && [nameTextField.text isEqualToString:@""]) {
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    
    else if (!checkPeople){
        if (taxIdField.text.length != 17){
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDTAXID"]];
        }
        else if ([companyField.text isEqualToString:@""]){
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDCOMPANY"]];
        }else {
            
            [self alert:[NSString stringWithFormat:[AISString commonString:typePopup KeyOfValue :@"CONFIRMPHONE"], "%@",phoneField.text ]];
            [self performSegueWithIdentifier:@"signUpToOTP" sender:self];
        }
    }
    else if (idCardField.text.length != 17){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDIDCARD"]];
    }
    else if ([emailField.text rangeOfString:@"@"].location == NSNotFound || [emailField.text rangeOfString:@"."].location == NSNotFound){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDEMAIL"]];
    }
    else if([passField.text isEqualToString:@""]){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASS"]];
    }
    else if(passField.text.length < 8){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else if([confirmPassField.text isEqualToString:@""]){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDCONFIRM"]];
    }
    else if(confirmPassField.text.length < 8){
        
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDCONFIRMDIGIT"]];
    }
    else if (![passField.text isEqualToString:confirmPassField.text]){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSANDCONFIRM"]];
    }
    
    else if (phoneField.text.length != 12){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPHONE"]];
    }
    else if (![[phoneField.text substringToIndex:2]  isEqual: @"08"] && ![[phoneField.text substringToIndex:2]  isEqual: @"09"] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDISNOPHONE"]];
    }
    else {
        [self passwordValidate];
        if (checkPassword >= 3) {
            NSLog(@"CheckPass : %d",checkPassword);
            [self alert:[NSString stringWithFormat:@"%@ %@",[AISString commonString:typePopup KeyOfValue :@"SUCCESSSIGNUP"],phoneField.text ]];
            [self performSegueWithIdentifier:@"signUpToOTP" sender:self];
        }
        else{
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSVALIDATE"]];
        }
    }
}
-(void)passwordValidate{
    checkPassword = 0;
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    NSRange number = [passField.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    NSRange upper =  [passField.text rangeOfCharacterFromSet:upperCaseChars];
    NSRange lower = [passField.text rangeOfCharacterFromSet:lowerCaseChars];
    if ( number.length ){
        checkPassword += 1;
    }
    if ( upper.length ){
        checkPassword += 1;
    }
    if ( lower.length ){
        checkPassword += 1;
    }
    for(int i = 0; i < [passField.text length]; i++){
        NSLog(@"%d",[passField.text characterAtIndex:i]);
        if([passField.text characterAtIndex:i] > 3584 && [passField.text characterAtIndex:i] < 3677){
            checkPassword += 1;
            break;
        }
    }
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
    [emailField resignFirstResponder];
    [phoneField resignFirstResponder];
    [passField resignFirstResponder];
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [confirmPassField resignFirstResponder];
    [taxIdField resignFirstResponder];
    [idCardField resignFirstResponder];
    [companyField resignFirstResponder];

}
- (IBAction)termClick:(id)sender {
    
    headerToWeb = termButton.titleLabel.text;
    indexToWeb = @"2";
    [self performSegueWithIdentifier:@"signupToWeb" sender:self];
}

- (IBAction)policyClick:(id)sender {
    headerToWeb = policyButton.titleLabel.text;
    indexToWeb = @"1";
    [self performSegueWithIdentifier:@"signupToWeb" sender:self];
}

@end
