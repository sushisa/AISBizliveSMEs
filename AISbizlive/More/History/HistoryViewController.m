//
//  HistoryViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "HistoryViewController.h"
#import "AISGlobal.h"
@interface HistoryViewController ()
{
    NSMutableArray *history;
}
@end

@implementation HistoryViewController

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
    
    history = [[NSMutableArray alloc] initWithObjects:@"Send Message History",@"TopUp History",@"Quota Balance History", nil];
    NSLog(@"History Load");
    [self setTextLangague];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"HISTORY"]];
    
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return history.count;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *CellIdentifier = @"HistoryCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
////    
////    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
//    // Configure the cell...
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    UILabel *TextLabel = (UILabel *)[cell viewWithTag:1];
//    TextLabel.textColor = [AISColor lightgrayColor];
//    TextLabel.text = [history objectAtIndex:indexPath.row];
//    return cell;
//}

@end
