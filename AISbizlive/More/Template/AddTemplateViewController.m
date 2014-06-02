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
    
    self.navigationItem.title = @"Add Template";
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    self.navigationItem.rightBarButtonItem = [self templateRightButton];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(UIBarButtonItem *)templateRightButton{
    UIBarButtonItem *templateRightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(templateAdd)];
    return templateRightButton;
}
-(void)templateAdd{
    NSLog(@"Template ADD");
    [self.navigationController popViewControllerAnimated:YES];
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
    self.navigationItem.title = @"Add Template";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
