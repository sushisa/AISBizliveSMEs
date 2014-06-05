//
//  TermViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/30/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TermViewController.h"
#import "AISGlobal.h"
@interface TermViewController ()

@end

@implementation TermViewController

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
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    [self setTextLangage];
}
-(void)setTextLangage{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"TERM"]];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
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
