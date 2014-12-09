//
//  AddPeopleViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AddPeopleViewController.h"
#import "AISGlobal.h"
@interface AddPeopleViewController ()
{
    UIActionSheet *choosePhoto;
    NSString *imageName;
    AISAlertView *alertView;

    NSDictionary *dict;
}
@end

@implementation AddPeopleViewController
@synthesize delegate;
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
    [self setTextLangague];
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
}
-(void)setTextLangague{
    
    alertView = [[AISAlertView alloc] init];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(doneAction) withTarget:self];
    if (self.firstName == nil || [self.firstName isEqualToString: @""]) {
        
        [imagePeople setBackgroundImage:[UIImage imageNamed:PROFILE_DEFALUT] forState:UIControlStateNormal];
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"ADDCONTACT"]];
    }
    else {
        
//        if (self.profile == nil || [self.profile isEqualToString: @""]) {
            [imagePeople setBackgroundImage:[UIImage imageNamed:PROFILE_DEFALUT] forState:UIControlStateNormal];
//        }
//        else{
//            [imagePeople setBackgroundImage:[UIImage imageNamed:self.profile] forState:UIControlStateNormal];
//        }
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"EDITCONTACT"]];
    }
    [nameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NAME"]];
    [nameTextField setText:self.firstName];
    [nameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"NAME"]];
    
    [lastNameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"LAST_NAME"]];
     [lastNameTextField setText:self.lastName];
    [lastNameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"LAST_NAME"]];
    
    [mobileLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    if (self.phoneNumber != nil) {
        [mobileNoTextField setText:[AISString phoneFormat:self.phoneNumber]];
    }
    [mobileNoTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PHONE"]];

}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [mobileNoTextField resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField isEqual:mobileNoTextField]) {
        if (mobileNoTextField.text.length == 12) {
            mobileNoTextField.text = [NSString stringWithFormat:@"%@%@%@",[mobileNoTextField.text substringToIndex:2] ,[[mobileNoTextField.text substringFromIndex:3] substringToIndex:4],[mobileNoTextField.text substringFromIndex:8] ];
        }
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:mobileNoTextField]) {
        if (mobileNoTextField.text.length == 10 && [mobileNoTextField.text rangeOfString:@"-"].location == NSNotFound) {
            mobileNoTextField.text = [AISString phoneFormat:mobileNoTextField.text];
        }
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSInteger locationAndStringLengthSum = range.location + [string length];
    if ([textField isEqual:mobileNoTextField]) {
        if (locationAndStringLengthSum > 10) {
            
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
        [mobileNoTextField becomeFirstResponder];
        return NO;
    }
    else if ([textField isEqual:mobileNoTextField]) {
        [self doneAction];
        return NO;
    }
    return YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    [self clearAllData];
}
-(void)clearAllData{
    [nameTextField setText:@""];
    [lastNameTextField setText:@""];
    [mobileNoTextField setText:@""];
    [imagePeople setBackgroundColor:[UIColor whiteColor]];
    self.firstName = @"";
    self.lastName = @"";
    self.phoneNumber = @"";
    self.profile = @"";
}
-(void)viewWillAppear:(BOOL)animated {
    [self setTextLangague];
}
-(void)backAction{
    
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [mobileNoTextField resignFirstResponder];
    if (self.firstName == nil || [self.firstName isEqualToString: @""]) {
        if (![nameTextField.text isEqualToString:@""] || ![mobileNoTextField.text isEqualToString:@""] || ![lastNameTextField.text isEqualToString:@""]) {
            [self alertTwo:[AISString commonString:typePopup KeyOfValue:@"BACK_CONTACT"]];
        }
        else{
            if ([self.checkPush isEqualToString: @"YES"]) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            else {
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
    else{
        if (![nameTextField.text isEqualToString:self.firstName] || ![lastNameTextField.text isEqualToString:self.lastName]) {
            [self alertTwo:[AISString commonString:typePopup KeyOfValue:@"BACK_CONTACT"]];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
   
}
-(void)doneAction{
    [alertView dismissAlertView];
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [mobileNoTextField resignFirstResponder];
    if ([nameTextField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if ([lastNameTextField.text isEqualToString:@""]){
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if ([mobileNoTextField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if (mobileNoTextField.text.length < 10){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDISNOPHONE"]];
    }
    else if (![[mobileNoTextField.text substringToIndex:2]  isEqual: @"08"] && ![[mobileNoTextField.text substringToIndex:2]  isEqual: @"09"] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDISNOPHONE"]];
    }
    else {
        if ([self.ID isEqualToString:@""] || self.ID == nil) {
            [self callAddContact];
        }
        else{
            [self callEditContact];
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectPicture:(id)sender {
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
    switch (buttonIndex) {
        case 0:
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                      message:@"Device has no camera"
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles: nil];
                
                [myAlertView show];
                
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
    NSLog(@"%@",chosenImage);
    NSURL *imagePath = info[UIImagePickerControllerReferenceURL];
    
    imageName = [imagePath lastPathComponent];
    [imagePeople setBackgroundImage:chosenImage forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)alertTwo:(NSString *)message{
    [alertView withActionLeft:@selector(cancelAction:) withActionRight:@selector(doneAction) withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"OK"]];
    [alertView showAlertView];
}
-(void)cancelAction:(id)sender{
    [alertView dismissAlertView];
    if ([self.checkPush isEqualToString: @"YES"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
-(void)callAddContact{
    ServiceCT02_AddContact *callAddPeople = [[ServiceCT02_AddContact alloc] init];
    [callAddPeople setFirstname:nameTextField.text];
    [callAddPeople setLastname:lastNameTextField.text];
    if (mobileNoTextField.text.length == 12) {
        NSString *mobileText = [NSString stringWithFormat:@"%@%@%@",[mobileNoTextField.text substringToIndex:2] ,[[mobileNoTextField.text substringFromIndex:3] substringToIndex:4],[mobileNoTextField.text substringFromIndex:8] ];
        [callAddPeople setMobileNO:mobileText];
    }
    else{
        [callAddPeople setMobileNO:mobileNoTextField.text];
    }
    [callAddPeople setImage64:@""];
    [callAddPeople setContactSource:@"IOS"];
    [callAddPeople setDelegate:self];
    [callAddPeople requestService];
}

- (void)addContactSuccess:(ContactDetail *)contactDetail{
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
                   [contactDetail ID],RES_KEY_CONTACT_ID,
                   [contactDetail name],RES_KEY_CONTACT_FIRSTNAME,
                   [contactDetail lastname], RES_KEY_CONTACT_LASTNAME,
                   [contactDetail phoneNumber],RES_KEY_CONTACT_MOBILE_NO,
                   [contactDetail lastUpdate],RES_KEY_CONTACT_LAST_UPDATE,
                   [contactDetail imageURL],RES_KEY_CONTACT_PHOTO_PATH,
                   @"Ok_Grey.png",@"check",nil] ;
    [delegate didFinishAddContact: dict];
    if ([self.checkPush isEqualToString: @"YES"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)addContactError:(ResultStatus *)status{
    [self alert:[status responseMessage]];
    
}

- (void)didFinishUpdateContact:(NSMutableArray *)contactsArray{
    
}
-(void)callEditContact{
   
    ServiceCT03_EditContact *call = [[ServiceCT03_EditContact alloc] init];
    
    [call setID:self.ID];
    [call setFirstname:nameTextField.text];
    [call setLastname:lastNameTextField.text];
    [call setImage64:@""];
    if (mobileNoTextField.text.length == 12) {
        NSString *mobileText = [NSString stringWithFormat:@"%@%@%@",[mobileNoTextField.text substringToIndex:2] ,[[mobileNoTextField.text substringFromIndex:3] substringToIndex:4],[mobileNoTextField.text substringFromIndex:8] ];
        [call setMobileNO:mobileText];
    }
    else{
        [call setMobileNO:mobileNoTextField.text];
    }
    [call setDelegate:self];
    [call requestService];
}
- (void)editContactSuccess:(ContactDetail *)contactDetail{
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [contactDetail ID],RES_KEY_CONTACT_ID,
            [contactDetail name],RES_KEY_CONTACT_FIRSTNAME,
            [contactDetail lastname], RES_KEY_CONTACT_LASTNAME,
            [contactDetail phoneNumber],RES_KEY_CONTACT_MOBILE_NO,
            [contactDetail lastUpdate],RES_KEY_CONTACT_LAST_UPDATE,
            [contactDetail imageURL],RES_KEY_CONTACT_PHOTO_PATH,
            @"Ok_Grey.png",@"check",nil] ;
    [delegate didFinishUpdateContact: dict];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editContactError:(ResultStatus *)status{
    [self alert:[status responseMessage]];
}
@end
