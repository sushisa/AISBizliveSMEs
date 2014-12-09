//
//  ChangePasswordViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "AISGlobal.h"
@interface ChangePasswordViewController ()
{
    AISAlertView *alertView;
}
@end

@implementation ChangePasswordViewController

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
    [self setTextLangague];
    
    alertView = [[AISAlertView alloc] init];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
}
-(void)setTextLangague{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeButton KeyOfValue :@"CHANGE_PASS"]];
    [doneButton setTitle:[AISString commonString:typeButton KeyOfValue:@"DONE"] forState:UIControlStateNormal];
    [oldPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"OLD_PASS"]];
    
    [newPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"NEW_PASS"]];
    [reNewPasswordTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue :@"CONFIRM_PASS"]];
    [oldPasswordLabel setText:[AISString commonString:typeLabel KeyOfValue :@"OLD_PASS"]];
    [newPasswordLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NEW_PASS"]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
//[AISString commonString:BUTTON :@"DONE"]
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [oldPasswordTextField resignFirstResponder];
    [newPasswordTextField resignFirstResponder];
    [reNewPasswordTextField resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneAction:(id)sender {
    if ([oldPasswordTextField.text isEqualToString:@""] || [newPasswordTextField.text isEqualToString:@""] || [reNewPasswordTextField.text isEqualToString:@""]){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDNIL"]];
    }
    else if(oldPasswordTextField.text.length < 8 || newPasswordTextField.text.length < 8 || reNewPasswordTextField.text.length < 8){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else if(![newPasswordTextField.text isEqualToString:reNewPasswordTextField.text]){
        [self alert:[AISString commonString:typePopup KeyOfValue :@"TEXTFIELDPASSDIGIT"]];
    }
    else {
        [self callChangePassword];
    }
}
-(void)dissAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(dissAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
    
    [oldPasswordTextField resignFirstResponder];
    [newPasswordTextField resignFirstResponder];
    [reNewPasswordTextField resignFirstResponder];
}

-(void)callChangePassword{
    ServiceST02_ChangePassword *call = [[ServiceST02_ChangePassword alloc] init];
    [call setDelegate:self];
    [call setParameterWithOldPassword:oldPasswordTextField.text NewPassword:newPasswordTextField.text];
    [call requestService];
}
- (void)changePasswordSuccess{
    [self backAction];
}
- (void)changePasswordError:(ResultStatus *)resultStatus{
    
}
@end
