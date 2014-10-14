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
//    Help Private Policy Terms of Service About
    if ([self.indexRow isEqualToString:@"0"]) {
        [self helpLoad];
    }
    else if ([self.indexRow isEqualToString:@"1"]) {
        [self privacyLoad];
    }
    else if ([self.indexRow isEqualToString:@"2"]) {
        [self termConditionLoad];
    }
    else if ([self.indexRow isEqualToString:@"3"]) {
        [self aboutLoad];
    }
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
-(void)helpLoad{
    ServiceIN01_Help *call = [[ServiceIN01_Help alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)helpSuccess:(NSString *)reponseData{
    [self LoadWebView:reponseData];
}
- (void)helpError:(ResultStatus *)resultStatus{
    
}
-(void)aboutLoad{
    ServiceIN04_About *call = [[ServiceIN04_About alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)aboutSuccess:(NSString *)reponseData{
    [self LoadWebView:reponseData];
    
}
- (void)aboutError:(ResultStatus *)resultStatus{
    
}
-(void)privacyLoad{
    ServiceIN02_Privacy *call = [[ServiceIN02_Privacy alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)privacySuccess:(NSString *)reponseData{
    [self LoadWebView:reponseData];
    
}
- (void)privacyError:(ResultStatus *)resultStatus{
    
}
-(void)termConditionLoad{
    ServiceIN03_TermCondition *call = [[ServiceIN03_TermCondition alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)termConditionSuccess:(NSString *)reponseData{
    [self LoadWebView:reponseData];
    
}
- (void)termConditionError:(ResultStatus *)resultStatus{
    
}
-(void)LoadWebView :(NSString *)urlRequest{
    NSURL *url = [NSURL URLWithString:urlRequest];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
}
@end
