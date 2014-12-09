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
    NSDictionary *dict;
    NSMutableArray *messageHistory;
    NSSortDescriptor *descriptor;
}
@end

@implementation DetailGroupViewController
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
    [self callService];
    [self setTextLangague];
}
-(void)callService{
    ServiceCT08_GroupMessageHistory *service = [[ServiceCT08_GroupMessageHistory alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:self.idGroup];
    [service requestService];
}
-(void)setTextLangague{
    
    descriptor =[NSSortDescriptor sortDescriptorWithKey:RES_KEY_CONTACT_SEND_DATE  ascending:NO];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Group %@",self.nameGroup]];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(doneAction) withTarget:self];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    fullNameTextField.text = self.nameGroup;
//    if (self.profileGroup == nil || [self.profileGroup isEqualToString: @""]) {
        [ProfilePicture setImage:[UIImage imageNamed:PROFILE_DEFALUT]];
//    }
//    else{
//        [ProfilePicture setImage:[UIImage imageNamed:self.profileGroup]];
//    }
}
-(void)viewWillAppear:(BOOL)animated {
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneAction{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(doneAction:) withActionRight:@selector(deleteAction:) withTarget:self message:[NSString stringWithFormat:@"%@ '%@' %@",[AISString commonString:typePopup KeyOfValue :@"DELETEGROUP"],self.nameGroup,[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]] LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"OK"]];
    [ss showAlertView];
}
-(void)doneAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)deleteAction:(id)sender{
    [self callDeleteGroupContact];
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
    sample.text =  [cellDict objectForKey:RES_KEY_MESSAGE];
    return cell;
    
}
- (void)groupMessageHistorySuccess:(ResponseGroupMessageHistory *)responseGroupMessageHistory{
    for (ContactMessageHistory *history in [responseGroupMessageHistory historyList]) {
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
}
- (void)groupMessageHistoryError:(ResultStatus *)status{
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailPeopleGroup"]) {
        DetailPeopleGroupViewController *detailPeople = [segue destinationViewController];
        detailPeople.idGroup = self.idGroup;
        detailPeople.GroupName = self.nameGroup;
        detailPeople.ArrayContactGroup = self.arrayContactGroup;
    }
}
-(void)callDeleteGroupContact{
    [[AISAlertView alloc] dismissAlertView];
    ServiceCT11_DeleteGroupContact *deletaGroup = [[ServiceCT11_DeleteGroupContact alloc] init];
    [deletaGroup setDelegate:self];
    [deletaGroup setParameterWithGroupIDList:[NSArray arrayWithObjects:self.idGroup, nil]];
    [deletaGroup requestService];
}
- (void)deleteGroupContactSuccess{
    [delegate didFinishDeleteGroup:self.idGroup];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)deleteGroupContactError:(ResultStatus *)status{
    
}

@end
