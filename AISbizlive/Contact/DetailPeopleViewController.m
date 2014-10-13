//
//  DetailPeopleViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 6/6/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailPeopleViewController.h"
#import "AISGlobal.h"
@interface DetailPeopleViewController ()
{
    NSMutableArray *messageObject;
    NSMutableArray *timeObject;
}
@end

@implementation DetailPeopleViewController

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
    
    timeObject = [[NSMutableArray alloc] init];
    messageObject = [[NSMutableArray alloc] init];
    ServiceCT05_ContactMessageHistory *call = [[ServiceCT05_ContactMessageHistory alloc] init];
    [call setDelegate:self];
    [call setParameterWithID:self.ID];
    [call requestService];
    
    [self setTextLangague];
}
-(void)setTextLangague{
    
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(doneAction) withTarget:self];
    self.navigationItem.title = self.firstName;
    [nameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NAME"]];
    [firstNameField setText:self.firstName];
    
    [lastNameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"LAST_NAME"]];
    [lastNameField setText:self.lastName];
    
    [mobileLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    [phoneNumberField setText:self.phoneNumber];
    [profileImage setImage:[UIImage imageNamed:self.profile]];
    [deleteButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DELETE_CONTACT"] forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneAction{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:@"Delete Contact" LeftString:@"Cancel" RightString:@"OK"];
    [ss showAlertView];
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [timeObject count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier ;
        CellIdentifier = @"toMessage";
    UITableViewCell *cell = [messageTable dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    UILabel  *head = (UILabel *)[cell viewWithTag:201];
    head.text = [AISString timeFormat:[timeObject objectAtIndex:indexPath.row]];
    UILabel *sample = (UILabel *)[cell viewWithTag:202];
    sample.text =   [messageObject objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory{
    for (ContactMessageHistory *history in [responseContactMessageHistory historyList]) {
        [timeObject addObject:[history sendDate]];
        [messageObject addObject:[history message]];
//        NSLog(@"%@\n",[history sendDate]);
//        NSLog(@"%@\n",[history message]);
    }
//    NSLog(@"%@",responseContactMessageHistory);
}
- (void)contactMessageHistoryError:(ResultStatus *)status{
//    NSLog(@"%@",status);
}
//- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory;
//- (void)contactMessageHistoryError:(ResultStatus *)status;
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
