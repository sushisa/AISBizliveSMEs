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
    NSDictionary *dict;
    NSMutableArray *messageHistory;
    NSSortDescriptor *descriptor;
}
@end

@implementation DetailPeopleViewController
@synthesize delegate;
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
    
    messageHistory = [[NSMutableArray alloc] init];
    messageTable.estimatedRowHeight = 100.0;
    messageTable.rowHeight = UITableViewAutomaticDimension;
    ServiceCT05_ContactMessageHistory *call = [[ServiceCT05_ContactMessageHistory alloc] init];
    [call setDelegate:self];
    [call setParameterWithID:self.ID];
    [call requestService];
    
    [self setTextLangague];
}
-(void)setTextLangague{
    
    descriptor =[NSSortDescriptor sortDescriptorWithKey:RES_KEY_CONTACT_SEND_DATE  ascending:NO];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(doneAction) withTarget:self];
    self.navigationItem.title = self.firstName;
    [nameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"NAME"]];
    [firstNameField setText:self.firstName];
    
    [lastNameLabel setText:[AISString commonString:typeLabel KeyOfValue :@"LAST_NAME"]];
    [lastNameField setText:self.lastName];
    
    [mobileLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SIGNUP_PHONE"]];
    [phoneNumberField setText:[AISString phoneFormat:self.phoneNumber]];
//    if ([self.profile isEqualToString:@""] || self.profile == nil) {
        [profileImage setImage:[UIImage imageNamed:PROFILE_DEFALUT]];
//    }
//    else{
//        [profileImage setImage:[UIImage imageNamed:self.profile]];
//    }
    [deleteButton setTitle:[AISString commonString:typeButton KeyOfValue :@"DELETE_CONTACT"] forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneAction{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:[NSString stringWithFormat:@"%@ '%@' %@",[AISString commonString:typePopup KeyOfValue:@"DELETEPEOPLE"],self.firstName,[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]] LeftString:@"Cancel" RightString:@"OK"];
    [ss showAlertView];
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    [self callDeleteContact];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [messageHistory count];
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
    NSDictionary *cellDict = [messageHistory objectAtIndex:indexPath.row];
    UILabel  *head = (UILabel *)[cell viewWithTag:201];
    head.text = [AISString timeFormat:[cellDict objectForKey:RES_KEY_CONTACT_SEND_DATE]];
    UILabel *sample = (UILabel *)[cell viewWithTag:202];
    sample.text =   [cellDict objectForKey:RES_KEY_MESSAGE];
    return cell;
    
}
- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory{
    for (ContactMessageHistory *history in [responseContactMessageHistory historyList]) {
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                [history sendDate],RES_KEY_CONTACT_SEND_DATE,
                [history message],RES_KEY_MESSAGE,nil] ;
        [messageHistory addObject:dict];
    }
    
    [messageHistory sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    if ([messageHistory count] == 0) {
       UIView *dimView = [[UIView alloc] initWithFrame:CGRectMake(0, messageTable.frame.origin.y, messageTable.frame.size.width, messageTable.frame.size.height)];
        dimView.backgroundColor = [UIColor whiteColor];
        UILabel *noRe = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, messageTable.frame.size.width, 20)];
        noRe.text = [AISString commonString:typeLabel KeyOfValue:@"NO_RESULT"];
        noRe.textColor = [AISColor lightgreenColor];
        [noRe setTextAlignment:NSTextAlignmentCenter];
        [dimView addSubview:noRe];
        [self.view addSubview:dimView];
    }
    [messageTable reloadData];
//    NSLog(@"%@",responseContactMessageHistory);
}
- (void)contactMessageHistoryError:(ResultStatus *)status{
//    NSLog(@"%@",status);
}

-(void)callDeleteContact{
    [[AISAlertView alloc] dismissAlertView];
    ServiceCT04_DeleteContact *deletePeople = [[ServiceCT04_DeleteContact alloc] init];
    [deletePeople setDelegate:self];
    [deletePeople setParameterWithContactIDList:[NSArray arrayWithObjects:self.ID, nil]];
    [deletePeople requestService];
}
- (void)deleteContactSuccess{
    [delegate didFinishDeleteContact:self.ID];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)deleteContactError:(ResultStatus *)status{
    
}
@end
