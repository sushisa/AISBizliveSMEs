//
//  DetailPeopleGroupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 9/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailPeopleGroupViewController.h"
#import "AISGlobal.h"
#import "ContactCell.h"

@interface DetailPeopleGroupViewController ()
{
    NSDictionary *dict;
    NSMutableArray *detailContact;
    NSString *FirstNamecontact;
    NSString *LastNamecontact;
    NSString *Mobilecontact;
    NSString *Photocontact;
    NSString *IDcontact;
}
@end

@implementation DetailPeopleGroupViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    FirstNamecontact = @"firstName";
    LastNamecontact = @"lastName";
    Mobilecontact = @"mobileNo";
    Photocontact = @"photoPath";
    IDcontact = @"contactId";
    
    [self setTextLangague];
}
-(void)setTextLangague{
    detailContact = [[NSMutableArray alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    if ([self GroupName] == nil) {
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"CONTACT"]];
        ServiceCT01_GetContactList *call = [[ServiceCT01_GetContactList alloc] init];
        [call setGetContactListDelegate:self];
        [call requestService];
//        [myTable reloadData];
    }
    else{
        [self.navigationItem setTitle:[self GroupName]];
        [detailContact addObject: self.GroupContact];
    }
//    [myTable reloadData];
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
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
    return detailContact.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PeopleCell";
    ContactCell *cell = (ContactCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    NSDictionary *tmpDict = ;
//    NSLog(@"%@",[detailContact objectAtIndex:indexPath.row]);
    cell.imageContact.image = [UIImage imageNamed:[[detailContact objectAtIndex:indexPath.row] objectForKey:Photocontact]];
    cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[[detailContact objectAtIndex:indexPath.row] objectForKey:FirstNamecontact],[[detailContact objectAtIndex:indexPath.row] objectForKey:LastNamecontact]];
    cell.telContact.text = [[detailContact objectAtIndex:indexPath.row] objectForKey:Mobilecontact];
    [cell setCellHeight:cell.frame.size.height];
    return cell;
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
- (void)getContactListSuccess:(ResponseGetContactList *)responseGetContactList{
    
    for (ContactDetail *contact in [responseGetContactList contactList]) {
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                [contact ID],IDcontact,
                [contact name],FirstNamecontact,
                [contact lastname], LastNamecontact,
                [contact phoneNumber],Mobilecontact,
                [contact imageURL],Photocontact, nil] ;
        [detailContact addObject:dict];
    }
    [mytable reloadData];
    
}
- (void)getcontactListError:(ResultStatus *)status
{
    
}
@end
