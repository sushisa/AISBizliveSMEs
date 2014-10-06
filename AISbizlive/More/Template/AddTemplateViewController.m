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
    NSLog(@"Add Template Load");
    alertView = [[AISAlertView alloc] init];
   
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    if(self.descritionItem != nil){
        descritionTemplate.text = self.descritionItem;
        [textLength setText:[AISSMSCharacter bytesString:descritionTemplate.text]];
        self.tabBarController.tabBar.hidden = YES;
    }
    
    [self setTextLangague];
    
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"ADDTEMPLATE"]];
    
    
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] AddButtonWithAction:@selector(templateAdd) withTarget:self];
    
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [nameTemplateLabel setText:[AISString commonString:typeLabel KeyOfValue:@"ADDTEMPLATE_NAME"]];
    
    [descriptionTemplateLabel setText:[AISString commonString:typeLabel KeyOfValue:@"ADDTEMPLATE_DESCRIPTION"]];
    
}
-(void)templateAdd{

    if (![nameTemplate.text isEqualToString:@""] && ![descritionTemplate.text isEqualToString:@""]) {
       
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"TemplateList.plist"]; //3
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath: path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"TemplateList" ofType:@"plist"]; //5
            
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        }
        NSMutableArray *favs = [[NSMutableArray alloc] initWithContentsOfFile: path];
        NSDictionary *test = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              nameTemplate.text, @"TITLE",
                              descritionTemplate.text,@"DESCRIPTION",
                              nil];
        [favs addObject:test];
        [favs writeToFile:path atomically:YES];
        [self.navigationController popViewControllerAnimated:YES];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
