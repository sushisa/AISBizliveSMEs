//
//  PackageViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "PackageViewController.h"
#import "AISGlobal.h"
#import "PaymentViewController.h"
#import "PackageCell.h"
@interface PackageViewController ()
{
    NSDictionary *packagesList;
    NSMutableArray *package;
    AISAlertView *alertView;
}
@end

@implementation PackageViewController

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
    package = [[NSMutableArray alloc] init];
    
    [self setTextLangague];
    [self.tabBarController setSelectedIndex:3];
    
}
-(void)setTextLangague{
    alertView = [[AISAlertView alloc] init];
        self.tabBarController.tabBar.hidden = NO;
        self.title = [AISString commonString:typeTitle KeyOfValue :@"PACKAGE"];
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"PACKAGE"]];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    if ([package count] == 0) {
        ServicePK01_GetPackageList *callPackage = [[ServicePK01_GetPackageList alloc] init];
        [callPackage setDelegate:self];
        [callPackage requestService];
    }
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
    return package.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 60.0)];

    oneHeaderView.backgroundColor = [UIColor whiteColor];
    UIView *twoHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(10, 10, tableView.frame.size.width-20, 40.0)];
    
//    twoHeaderView.backgroundColor = [AISColor lightgreenColor];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(10, 5, tableView.frame.size.width-40, 30.0)];
    
    headerLabel.textColor = [AISColor lightgreenColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    headerLabel.text = [AISString commonString:typeLabel KeyOfValue :@"SELECT_PACKAGE"];
    [twoHeaderView addSubview:headerLabel];
    [oneHeaderView addSubview:twoHeaderView];
    NSLog(@"%f",headerLabel.frame.origin.x);
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"PackageCell";
    PackageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *dict = [package objectAtIndex:indexPath.row];
    cell.packageName.text = [dict objectForKey:RES_KEY_PACKAGE_NAME];
    cell.sumSMS.text = [dict objectForKey:RES_KEY_PACKAGE_VALUE];
    cell.amountPackage.text = [NSString stringWithFormat:@"%@ %@",[dict objectForKey:RES_KEY_PACKAGE_PRICE],[AISString commonString:typeLabel KeyOfValue:@"BAHT"]];
    cell.descriptionAmount.text = [AISString commonString:typeLabel KeyOfValue:@"SERVICE_CHARGE"];
    
    cell.descriptionSMS.text = [AISString commonString:typeLabel KeyOfValue:@"MESSAGE"];
    [cell.packagebtn setTitle:[AISString commonString:typeButton KeyOfValue:@"PACKAGE"] forState:UIControlStateNormal];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0f;
}
- (void)getPackageSuccess:(ResponseGetPackageList *)responsePackage{
//    code, *name, *price,*value;
    for (PackageDetail *packages in [responsePackage packageList]) {
        packagesList = [NSDictionary dictionaryWithObjectsAndKeys:
                       [packages code],RES_KEY_PACKAGE_CODE,
                       [packages name],RES_KEY_PACKAGE_NAME,
                       [packages price], RES_KEY_PACKAGE_PRICE,
                       [packages value],RES_KEY_PACKAGE_VALUE,nil] ;
        [package addObject:packagesList];
    }
    
    [mytable reloadData];
}
- (void)getPackageError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Payment"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        PaymentViewController *payment = segue.destinationViewController;
        
//        detail.titleItem = [news objectAtIndex:indexPath.row];
//        detail.imageItem = [newsimages objectAtIndex:indexPath.row];
        //        [[segue destinationViewController] setDescritionItem:[newsimages objectAtIndex:indexPath.row]];
    }
}
- (IBAction)goToDetailPackage:(id)sender {
    [self performSegueWithIdentifier: @"Payment" sender: self];
}
@end
