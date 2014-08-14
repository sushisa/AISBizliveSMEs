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
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    if (self.profile == nil) {
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
    [lastNameTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"LAST_NAME"]];
    
    [mobileLabel setText:[AISString commonString:typeLabel KeyOfValue :@"MOBILE"]];
    [mobileNoTextField setText:self.phoneNumber];
    [mobileNoTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"SIGNUP_PHONE"]];

}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [mobileNoTextField resignFirstResponder];
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
    NSLog(@"Done");
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
    [imagePeople setBackgroundImage:chosenImage forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
