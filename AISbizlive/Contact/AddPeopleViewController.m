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
}
@end

@implementation AddPeopleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"google");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    alertView = [[AISAlertView alloc] init];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    if (self.profile == nil || [self.profile isEqualToString: @""]) {
        [imagePeople setBackgroundImage:[UIImage imageNamed:PROFILE_DEFALUT] forState:UIControlStateNormal];
    }
    else {
        [imagePeople setBackgroundImage:[UIImage imageNamed:self.profile] forState:UIControlStateNormal];
    }
    [self setTextLangague];
}
-(void)setTextLangague{
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(doneAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"ADDCONTACT"]];
    [nameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NAME"]];
    [nameTextField setText:self.firstName];
    [nameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"NAME"]];
    
    [lastNameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"LAST_NAME"]];
     [lastNameTextField setText:self.lastName];
    [lastNameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"LAST_NAME"]];
    
    [mobileLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    [mobileNoTextField setText:self.phoneNumber];
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
            mobileNoTextField.text = [NSString stringWithFormat:@"%@-%@-%@",[mobileNoTextField.text substringToIndex:2] ,[[mobileNoTextField.text substringFromIndex:2] substringToIndex:4],[mobileNoTextField.text substringFromIndex:6] ];
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

-(void)viewDidDisappear:(BOOL)animated{
    [self clearAllData];
}
-(void)clearAllData{
    [nameTextField setText:@""];
    [lastNameTextField setText:@""];
    [mobileNoTextField setText:@""];
    self.firstName = @"";
    self.phoneNumber = @"";
    self.profile = @"";
}
-(void)viewWillAppear:(BOOL)animated {
    [self setTextLangague];
}
-(void)backAction{
    if ([self.checkPush isEqualToString: @"YES"]) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)doneAction{
    if ([nameTextField.text isEqualToString:@""] && [lastNameTextField.text isEqualToString:@""]&& [mobileNoTextField.text isEqualToString:@""] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if (mobileNoTextField.text.length != 12){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPHONE"]];
    }
    else if (![[mobileNoTextField.text substringToIndex:2]  isEqual: @"08"] && ![[mobileNoTextField.text substringToIndex:2]  isEqual: @"09"] ){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDISNOPHONE"]];
    }
    else {
//        NSData *data = [imageName dataUsingEncoding: NSUnicodeStringEncoding];
//        
//        NSString *ret = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

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
        
//        [self performSegueWithIdentifier: @"tabEN" sender: self];
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

-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
- (void)addContactSuccess:(ContactDetail *)contactDetail{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addContactError:(ResultStatus *)status{
    
}
@end
