//
//  DetailNewsViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailNewsViewController.h"
#import "AISGlobal.h"
@interface DetailNewsViewController ()

@end

@implementation DetailNewsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Detail News Load");
    
    self.navigationItem.title = @"News";
    self.newsLabelTitle.text = self.titleItem;
    self.newsImage.image = [UIImage imageNamed:self.imageItem];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
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
