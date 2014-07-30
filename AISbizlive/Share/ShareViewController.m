//
//  ShareViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ShareViewController.h"
#import "AISGlobal.h"
@interface ShareViewController ()

@end

@implementation ShareViewController

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
    [self.tabBarController setSelectedIndex:4];
}
-(void)setTextLangague{
    self.tabBarController.tabBar.hidden = NO;
        self.title = [AISString commonString:typeTitle KeyOfValue :@"SHARE"];
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SHARE"]];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
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
