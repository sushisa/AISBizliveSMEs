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
    NSDictionary *newList;
    AISAlertView *alertView;
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
    newsimages = [[NSMutableArray alloc]init];
    news = [[NSMutableArray alloc] init];
    [self setTextLangague];
}
-(void)setTextLangague{
    alertView = [[AISAlertView alloc] init];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"NEWS"]];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    [self callGetNews];
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 10.0)];
    
    oneHeaderView.backgroundColor = [UIColor whiteColor];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"NewsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIImageView *ImageCon = (UIImageView *)[cell viewWithTag:0];
    ImageCon.image = [UIImage imageNamed:[[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_PHOTOSMALLPATH]];
    
    //Name
    UILabel *NameLabel = (UILabel *)[cell viewWithTag:1];
    NameLabel.text = [[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_TITLE];
    
    //Tel
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:2];
    detailLabel.textColor = [AISColor lightgrayColor];
    detailLabel.text = [[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_DETAIL];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showNewsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailNewsViewController *detail = segue.destinationViewController;
        
        detail.titleItem = [[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_TITLE];
        detail.imageItem = [[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_PHOTONORMALPATH];
        detail.descritionItem = [[news objectAtIndex:indexPath.row] objectForKey:RES_KEY_NEWS_DETAIL];
    }
}
-(void)callGetNews{
    ServiceNW01_GetNews *call = [[ServiceNW01_GetNews alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)getNewsSuccess:(ResponseGetNews *)responseGetNews{
//    *ID,*title,*detail,*smallPhoto,*nomalPhoto,*date;
    for (NewsDetail *newsList in [responseGetNews newsList]) {
        newList = [NSDictionary dictionaryWithObjectsAndKeys:
                        [newsList title],RES_KEY_NEWS_TITLE,
                   [newsList detail],RES_KEY_NEWS_DETAIL,
                   [newsList nomalPhoto], RES_KEY_NEWS_PHOTONORMALPATH,
                        [newsList smallPhoto], RES_KEY_NEWS_PHOTOSMALLPATH,
                        [newsList date],RES_KEY_NEWS_DATE,nil] ;
        [news addObject:newList];
    }
    
    [myTable reloadData];
}
- (void)getNewsError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}



-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
@end
