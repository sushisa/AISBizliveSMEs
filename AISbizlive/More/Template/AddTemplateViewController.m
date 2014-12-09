//
//  AddTemplateViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/9/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AddTemplateViewController.h"
#import "AISGlobal.h"
@interface AddTemplateViewController ()
{
    int checkFontThai;
    bool checkFomatThai;
    NSString *format;
    int checkShots;
    AISAlertView *alertView;
}
@end

@implementation AddTemplateViewController
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
    // Do any additional setup after loading the view.
    alertView = [[AISAlertView alloc] init];
   
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    
    [self setTextLangague];
   
    
}
-(void)setTextLangague{
    if (self.ID == nil || [self.ID isEqualToString:@""]) {
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"ADDTEMPLATE"]];
    }
    else{
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"EDITTEMPLATE"]];
    }
    if(self.descritionItem != nil){
        descritionTemplate.text = self.descritionItem;
        [textLength setText:[AISSMSCharacter bytesString:descritionTemplate.text]];
        self.tabBarController.tabBar.hidden = YES;
    }
    else{
            [nameTemplate setText:self.TemplateName];
            [descritionTemplate setText:self.TemplateMessage];
    }
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] AddButtonWithAction:@selector(templateAdd) withTarget:self];
    
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [nameTemplateLabel setText:[AISString commonString:typeLabel KeyOfValue:@"ADDTEMPLATE_NAME"]];
    [nameTemplate setPlaceholder:[AISString commonString:typeLabel KeyOfValue:@"ADDTEMPLATE_NAME"]];
    [descriptionTemplateLabel setText:[AISString commonString:typeLabel KeyOfValue:@"ADDTEMPLATE_DESCRIPTION"]];
    if (self.TemplateMessage != nil) {
        [textLength setText:[AISSMSCharacter bytesString:descritionTemplate.text]];
    }
    
}
-(void)templateAdd{

    if (![nameTemplate.text isEqualToString:@""] && ![descritionTemplate.text isEqualToString:@""]) {
        if (self.ID == nil || [self.ID isEqualToString:@""]) {
            [self callAddTemplate];
        }
        else{
            [self callEditTemplate];
        }
    }else{
        if([nameTemplate.text isEqualToString:@""] && [descritionTemplate.text isEqualToString:@""]){
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEMPLATENO"]];
        }
        else if ([nameTemplate.text isEqualToString:@""]) {
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEMPLATENAME"]];
        }
        else if ([descritionTemplate.text isEqualToString:@""]){
            [self alert:[AISString commonString:typePopup KeyOfValue :@"TEMPLATEDESCRIPTION"]];
            
        }
    }
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
// Event Gesture for Hide Keyboard
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [nameTemplate resignFirstResponder];
    [descritionTemplate resignFirstResponder];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textViewDidChange:(UITextView *)textView{
    [textLength setText:[AISSMSCharacter bytesString:descritionTemplate.text]];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:nameTemplate]) {
        [descritionTemplate becomeFirstResponder];
        return NO;
    }
    return YES;
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
-(void)callAddTemplate{
    ServiceTP01_AddTemplate *call = [[ServiceTP01_AddTemplate alloc] init];
    [call setParameterWithName:nameTemplate.text Message:descritionTemplate.text];
    [call setDelegate:self];
    [call requestService];
}

- (void)addTemplateSuccess:(TemplateDetail *)templateDetail{
    [delegate didFinishAddTemplate:templateDetail];
    [self alert:[AISString commonString:typePopup KeyOfValue:@"ADDTEMPLATE_SUCCESS"]];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addTemplateError:(ResultStatus *)resultStatus{
    
    [self alert:[resultStatus responseMessage]];
    
}

-(void)callEditTemplate{
    ServiceTP03_EditTemplate *call = [[ServiceTP03_EditTemplate alloc] init];
    [call setParameterWithID:self.ID Name:nameTemplate.text Message:descritionTemplate.text];
    [call setDelegate:self];
    [call requestService];
}
- (void)editTemplateSuccess:(TemplateDetail *)templateDetail{
    [delegate didFinishUpdateTemplate:templateDetail];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editTemplateError:(ResultStatus *)resultStatus{
    
    [self alert:[resultStatus responseMessage]];
    
}
@end
