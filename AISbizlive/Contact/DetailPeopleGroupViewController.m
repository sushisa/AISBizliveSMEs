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
//    [myTable setDelegate:self];
//    [myTable setDataSource:self];
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
        [call setDelegate:self];
        [call requestService];
//        [myTable reloadData];
    }
    else{
        [self.navigationItem setTitle:[self GroupName]];
        detailContact = self.GroupContact;
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
    NSDictionary *tmpDict = [detailContact objectAtIndex:indexPath.row];
    cell.imageContact.image = [UIImage imageNamed:[tmpDict objectForKey:@"Image"]];
    cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[tmpDict objectForKey:@"Name"],[tmpDict objectForKey:@"LastName"]];
    cell.telContact.text = [tmpDict objectForKey:@"Tel"];
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
                [contact name],@"Name",
                [contact lastname], @"LastName",
                [contact phoneNumber],@"Tel",
                [contact imageURL],@"Image", nil] ;
        NSLog(@"  Contact ID          : %@\n", [contact ID]);
        NSLog(@"  Contact name        : %@\n", [contact name]);
        NSLog(@"  Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"  Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"  Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"  Contact imageURL    : %@\n", [contact imageURL]);

        [detailContact addObject:dict];
    }
    
}
- (void)getcontactListError:(ResultStatus *)status
{
    
}
@end
