//
//  DetailGroupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 7/1/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailGroupViewController.h"
#import "AISGlobal.h"
#import "DetailPeopleGroupViewController.h"
@interface DetailGroupViewController ()
{
    NSMutableArray *timeObject;
    NSMutableArray *messageObject;
}
@end

@implementation DetailGroupViewController

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
    [self callService];
    [self setTextLangague];
}
-(void)callService{
    ServiceCT08_GroupMessageHistory *service = [[ServiceCT08_GroupMessageHistory alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:@"111"];
    [service requestService];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:self.nameGroup];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(doneAction) withTarget:self];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    fullNameTextField.text = self.nameGroup;
    [ProfilePicture setImage:[UIImage imageNamed:self.profileGroup]];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneAction{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(doneAction:) withActionRight:@selector(deleteAction:) withTarget:self message:[NSString stringWithFormat:@"%@ %@ %@",[AISString commonString:typePopup KeyOfValue :@"DELETEGROUP"],self.nameGroup,[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]] LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"DELETE"]];
    [ss showAlertView];
}
-(void)doneAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)deleteAction:(id)sender{
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
- (void)groupMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory{
    for (ContactMessageHistory *history in [responseContactMessageHistory historyList]) {
        [messageObject addObject:[history message]];
        [timeObject addObject:[history sendDate]];
//        NSLog(@"%@\n",[history sendDate]);
//        NSLog(@"%@\n",[history message]);
    }
}
- (void)groupMessageHistoryError:(ResultStatus *)status{
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailPeopleGroup"]) {
        DetailPeopleGroupViewController *detailPeople = [segue destinationViewController];
        detailPeople.GroupContact = self.GroupContact;
        detailPeople.GroupName = self.nameGroup;
//        detailPeople.IdGroup = [Namecontact objectAtIndex:selectIndex];
    }
}

- (IBAction)deleteGroupButton:(id)sender {
}
@end
