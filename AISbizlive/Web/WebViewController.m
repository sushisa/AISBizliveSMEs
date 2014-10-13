//
//  WebViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 6/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "WebViewController.h"
#import "AISGlobal.h"
@interface WebViewController ()

@end

@implementation WebViewController

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
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:self.Header];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)helpSuccess:(NSString *)reponseData{
    
}
- (void)helpError:(ResultStatus *)resultStatus{
    
}

- (void)aboutSuccess:(NSString *)reponseData{
    
}
- (void)aboutError:(ResultStatus *)resultStatus{
    
}

- (void)privacySuccess:(NSString *)reponseData{
    
}
- (void)privacyError:(ResultStatus *)resultStatus{
    
}

- (void)termConditionSuccess:(NSString *)reponseData{
    
}
- (void)termConditionError:(ResultStatus *)resultStatus{
    
}

@end
