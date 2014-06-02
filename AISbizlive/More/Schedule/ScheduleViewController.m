//
//  ScheduleViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/19/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ScheduleViewController.h"
#import "AISGlobal.h"
@interface ScheduleViewController ()
{
    NSMutableArray *schedule;
}
@end

@implementation ScheduleViewController

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
    schedule = [[NSMutableArray alloc] initWithObjects:@"Message1",@"Message2",@"Message3",@"Message4", nil];
    NSLog(@"Schedule Load");
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Message Schedule";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Message Schedule";
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return schedule.count;
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
//                                 CGRectMake(0, 0, tableView.frame.size.width, 40.0)];
////    sectionHeaderView.backgroundColor = [UIColor clearColor];
//    
//    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
//                            CGRectMake(10, 10, sectionHeaderView.frame.size.width, 20.0)];
//    
////    sectionHeaderView.layer.cornerRadius = 9.0f;
//    sectionHeaderView.layer.masksToBounds = YES;
//    sectionHeaderView.backgroundColor = [AISColor lightgreenColor];
//    headerLabel.text = @"Message List";
//    headerLabel.tintColor = [UIColor whiteColor];
//    [sectionHeaderView addSubview:headerLabel];
//    return sectionHeaderView;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40.0f;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ScheduleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
//    
//    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *TextLabel = (UILabel *)[cell viewWithTag:1];
    TextLabel.textColor = [AISColor lightgrayColor];
    TextLabel.text = [schedule objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [schedule removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
