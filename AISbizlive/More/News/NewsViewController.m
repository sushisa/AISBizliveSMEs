//
//  NewsViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/17/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "NewsViewController.h"
#import "DetailNewsViewController.h"
#import "AISGlobal.h"
@interface NewsViewController ()
{
    NSMutableArray *news;
    NSMutableArray *newsimages;
}
@end

@implementation NewsViewController

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
    newsimages = [[NSMutableArray alloc] initWithObjects:@"icon.png",@"icon.png",@"icon.png",@"icon.png", nil];
    news = [[NSMutableArray alloc] initWithObjects:@"Message1",@"Message2",@"Message3",@"Message4", nil];
    NSLog(@"News Load");
    self.tabBarController.tabBar.hidden = YES;
    [self setTextLangague];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"NEWS"]];
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return news.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"NewsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_DEFAULT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
//    
//    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:CELL_BACKGROUND_HIGHLIGHT] stretchableImageWithLeftCapWidth:0.0 topCapHeight:15.0] ];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIImageView *ImageCon = (UIImageView *)[cell viewWithTag:0];
    ImageCon.image = [UIImage imageNamed:[newsimages objectAtIndex:indexPath.row]];
    
    //Name
    UILabel *NameLabel = (UILabel *)[cell viewWithTag:1];
    NameLabel.text = [news objectAtIndex:indexPath.row];
    
    //Tel
    UILabel *TelLabel = (UILabel *)[cell viewWithTag:2];
    TelLabel.textColor = [AISColor lightgrayColor];
    TelLabel.text = [news objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showNewsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailNewsViewController *detail = segue.destinationViewController;
        
        detail.titleItem = [news objectAtIndex:indexPath.row];
        detail.imageItem = [newsimages objectAtIndex:indexPath.row];
        //        [[segue destinationViewController] setDescritionItem:[newsimages objectAtIndex:indexPath.row]];
    }
}

@end
