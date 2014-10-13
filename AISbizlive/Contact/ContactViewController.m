//
//  ContactViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ContactViewController.h"
#import "AISGlobal.h"
#import "AddPeopleViewController.h"
#import "AddGroupViewController.h"
#import "ContactCell.h"
#import "AppDelegate.h"
#import "DetailPeopleViewController.h"
#import "DetailGroupViewController.h"
#import "MessageTableViewController.h"

@interface ContactViewController ()
{
    NSDictionary *contactDict;
    
    //Contact People
    NSMutableArray *contactArray;
    
    NSString *IDcontact;
    NSString *FirstNamecontact;
    NSString *LastNamecontact;
    NSString *Mobilecontact;
    NSString *Photocontact;
    NSString *Checkcontact;
    
    //Contact Group
    NSMutableArray *groupArray;
    NSMutableArray *contactGroup;
    NSString *IDgroup;
    NSString *Namegroup;
    NSString *Photogroup;
    
    
    AISAlertView *alertView;
    int selectIndex;
}

@end

@implementation ContactViewController

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
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    [self setTextLangague];
    [self.tabBarController setSelectedIndex:1];
    FirstNamecontact = @"firstName";
    LastNamecontact = @"lastName";
    Mobilecontact = @"mobileNo";
    Photocontact = @"photoPath";
    IDcontact = @"contactId";
    
    Checkcontact = @"check";
    contactArray = [[NSMutableArray alloc] init];
    ServiceCT01_GetContactList *callPeople = [[ServiceCT01_GetContactList alloc] init];
    [callPeople setGetContactListDelegate:self];
    [callPeople requestService];
    
    Namegroup = @"name";
    IDgroup = @"groupId";
    Photogroup = @"photoGroup";
    groupArray = [[NSMutableArray alloc] init];
    contactGroup = [[NSMutableArray alloc] init];
    ServiceCT06_GetGroupContactList *callGroup = [[ServiceCT06_GetGroupContactList alloc] init];
    [callGroup setDelegate:self];
    [callGroup requestService];
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [seachTextField resignFirstResponder];
}
-(void)setTextLangague{
    
    self.title = [AISString commonString:typeTitle KeyOfValue:@"CONTACT"];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"CONTACT"]];
    
    [selectPeopleAndGroup setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[AISColor lightgreenColor],NSForegroundColorAttributeName ,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil] forState:UIControlStateNormal];
    [selectPeopleAndGroup setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName ,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil] forState:UIControlStateHighlighted];
    [selectPeopleAndGroup setTitle:[AISString commonString:typeLabel KeyOfValue:@"TABPEOPLE"] forSegmentAtIndex:0];
    [selectPeopleAndGroup setTitle:[AISString commonString:typeLabel KeyOfValue:@"TABGROUP"] forSegmentAtIndex:1];
    alertView = [[AISAlertView alloc] init];
    if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
        [self loadPeopleView];
    }else{
        [self loadGroupView];
    }
}
-(void)viewWillAppear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = NO;
    [self setTextLangague];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionSelect:(id)sender {
    
    UISegmentedControl *segmented = (UISegmentedControl *)sender;
    
    switch (segmented.selectedSegmentIndex) {
        case 0:
            [self loadPeopleView];
            break;
        case 1:
            [self loadGroupView];
            break;
        default:
            break;
    }
}
-(void)popBackAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)selectContact{
//    Checkcontact
    NSArray *arr = [self.navigationController viewControllers];
    MessageTableViewController *rvc = (MessageTableViewController *)[arr objectAtIndex:[arr count]-2];
    NSMutableArray *returnContact = [[NSMutableArray alloc] init];
    for (int i = 0; i < contactArray.count; i++) {
        if ([[[contactArray objectAtIndex:i] objectForKey:Checkcontact] isEqualToString:@"Ok_Green.png"]) {
            [returnContact addObject:[[contactArray objectAtIndex:i] objectForKey:FirstNamecontact]];
        }
    }
    rvc.arrayContact = returnContact;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadPeopleView{
    if ([self.contactSelect isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectContact) withTarget:self];
        self.tabBarController.tabBar.hidden = YES;
        [testTable setEditing:YES animated:YES];
    }
    else{
        
        self.tabBarController.tabBar.hidden = NO;
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] PeopleAddButtonWithAction:@selector(peopleAdd) withTarget:self];
        [testTable setEditing:NO animated:NO];
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] PeopleDeleteButtonWithAction:@selector(peopleDelete) withTarget:self];
    }
    [testTable reloadData];
}
-(void)loadGroupView{
    if ([self.contactSelect isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
        
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectContact) withTarget:self];
        self.tabBarController.tabBar.hidden = YES;
        [testTable setEditing:YES animated:YES];
    }
    else{
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] GroupAddButtonWithAction:@selector(groupAdd) withTarget:self];
        self.navigationItem.leftBarButtonItem =[[AISNavigationBarItem alloc] GroupDeleteButtonWithAction:@selector(groupDelete) withTarget:self];
        
        self.tabBarController.tabBar.hidden = NO;

        [testTable setEditing:NO animated:NO];
    }
    
    [testTable reloadData];
}
-(void)peopleAdd{
    [self performSegueWithIdentifier: @"AddPeople" sender: self];
}
-(void)groupAdd{
    [self performSegueWithIdentifier: @"AddGroup" sender: self];
}
-(void)peopleDelete{
    if(!testTable.editing){
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] CancelButtonWithAction:@selector(cancelDelete) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(peopleDeleteBtn) withTarget:self];
    }
    [testTable setEditing:!testTable.editing animated:YES];
}
-(void)peopleDeleteBtn{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:@"Delete Contact" LeftString:@"Cancel" RightString:@"OK"];
    [ss showAlertView];
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)cancelDelete{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] PeopleDeleteButtonWithAction:@selector(peopleDelete) withTarget:self];
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] PeopleAddButtonWithAction:@selector(peopleAdd) withTarget:self];

     [testTable setEditing:NO animated:YES];
}

-(void)groupDelete{
    NSLog(@"groupDelete");
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
        return contactArray.count;
    }
    else{
        return groupArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier;
    if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
        CellIdentifier = @"PeopleCell";
    }else{
        CellIdentifier = @"GroupCell";
    }
    ContactCell *cell = (ContactCell *)[testTable dequeueReusableCellWithIdentifier:CellIdentifier];
    ContactCell __weak * weakCell = cell;
    
    
    [cell setAppearanceWithBlock:^{
        weakCell.containingTableView = testTable;
        
        
        weakCell.rightUtilityButtons = [self rightButtons];
        
        
        weakCell.delegate = self;
    } force:NO];
    
    
    if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
        cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[[contactArray objectAtIndex:indexPath.row] objectForKey:FirstNamecontact],[[contactArray objectAtIndex:indexPath.row] objectForKey:LastNamecontact]];
        cell.telContact.text = [[contactArray objectAtIndex:indexPath.row] objectForKey:Mobilecontact];
        cell.checkContact.image = [UIImage imageNamed:[[contactArray objectAtIndex:indexPath.row] objectForKey:Checkcontact]];
        if ([[[contactArray objectAtIndex:indexPath.row] objectForKey:Photocontact]isEqualToString:@""]) {
            cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
        }else{
//        cell.imageContact.image = [UIImage imageNamed:[[contactArray objectAtIndex:indexPath.row] objectForKey:Photocontact]];
            NSData * img1 = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVER_PREFIX_URL,[[contactArray objectAtIndex:indexPath.row] objectForKey:Photocontact]]]];
            cell.imageContact.image = [UIImage imageWithData:img1];
        }
    }
    else{
        cell.nameContact.text = [[groupArray objectAtIndex:indexPath.row] objectForKey:Namegroup];
        cell.checkContact.image = [UIImage imageNamed:[[groupArray objectAtIndex:indexPath.row] objectForKey:Photogroup]];
        if ([[[groupArray objectAtIndex:indexPath.row] objectForKey:Photogroup]isEqualToString:@""]) {
            cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
        }else{
        cell.imageContact.image = [UIImage imageNamed:[[groupArray objectAtIndex:indexPath.row] objectForKey:Photogroup]];
        }
        
    }
    [cell setCellHeight:cell.frame.size.height];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    if(tableView.isEditing){
        ContactCell *checkCell = (ContactCell *)[testTable cellForRowAtIndexPath:indexPath];
        UIImage *check = [UIImage imageNamed:@"Ok_Grey.png"];
        if(checkCell.checkContact.image == check){
            [contactArray replaceObjectAtIndex:indexPath.row withObject:@"Ok_Green.png"];
            checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Green.png"];
        }
        else{
            
            [contactArray replaceObjectAtIndex:indexPath.row withObject:@"Ok_Grey.png"];
            checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Grey.png"];
        }
        
    }
    else{
        
        selectIndex = (int) indexPath.row;
        if ([selectPeopleAndGroup selectedSegmentIndex] == 0) {
            [self performSegueWithIdentifier:@"cellToPeople" sender:self];
        }
        else{
            
            [self performSegueWithIdentifier:@"cellToGroup" sender:self];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"cellToPeople"]) {
        DetailPeopleViewController *detailPeople = [segue destinationViewController];
        detailPeople.firstName = [[contactArray objectAtIndex:selectIndex] objectForKey:FirstNamecontact];
        detailPeople.lastName = [[contactArray objectAtIndex:selectIndex] objectForKey:LastNamecontact];
        detailPeople.phoneNumber = [[contactArray objectAtIndex:selectIndex] objectForKey:Mobilecontact];
        detailPeople.profile = [[contactArray objectAtIndex:selectIndex] objectForKey:Photocontact];
        detailPeople.ID = [[contactArray objectAtIndex:selectIndex] objectForKey:IDcontact];
    }
    else if([[segue identifier] isEqualToString:@"EditPeople"]) {
        AddPeopleViewController *editPeople = [segue destinationViewController];
        editPeople.checkPush = @"YES";
        editPeople.firstName = [[contactArray objectAtIndex:selectIndex] objectForKey:FirstNamecontact];
        editPeople.lastName = [[contactArray objectAtIndex:selectIndex] objectForKey:LastNamecontact];
        editPeople.phoneNumber = [[contactArray objectAtIndex:selectIndex] objectForKey:Mobilecontact];
        editPeople.profile = [[contactArray objectAtIndex:selectIndex] objectForKey:Photocontact];
    } else if([[segue identifier] isEqualToString:@"AddPeople"]) {
        AddPeopleViewController *editPeople = [segue destinationViewController];
        editPeople.checkPush = @"YES";
    }else if ([[segue identifier] isEqualToString:@"AddGroup"]) {
        
    }else if ([[segue identifier] isEqualToString:@"EditGroup"]) {
        AddGroupViewController *addGroup = [segue destinationViewController];
        addGroup.nameGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:Namegroup];
        addGroup.profileGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:Photogroup];
//        NSLog(@"EditGroup");
    }else if ([[segue identifier] isEqualToString:@"cellToGroup"]) {
        DetailGroupViewController *addGroup = [segue destinationViewController];
        addGroup.nameGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:Namegroup];
        addGroup.profileGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:Photogroup];
        addGroup.GroupContact = [contactGroup objectAtIndex:selectIndex];
    }
}
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"Edit"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.0f;
}
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
-(BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell{
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    selectIndex = (int) [testTable indexPathForCell:cell].row;
    switch (index) {
        case 0:
            //Edit
            if ([selectPeopleAndGroup selectedSegmentIndex] == 0) {
                [self performSegueWithIdentifier:@"EditPeople" sender:self];
            }
            else{
                
                [self performSegueWithIdentifier:@"EditGroup" sender:self];
            }
            break;
        case 1:
        {
            // Delete
            if ([selectPeopleAndGroup selectedSegmentIndex] == 0) {
                [self alert:[NSString stringWithFormat:@"%@ %@ %@",[AISString commonString:typePopup KeyOfValue :@"DELETEPEOPLE"],[[contactArray objectAtIndex:selectIndex] objectForKey:FirstNamecontact],[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]]];
            }
            else{
                [self alert:[NSString stringWithFormat:@"%@ %@ %@",[AISString commonString:typePopup KeyOfValue :@"DELETEGROUP"],[[contactArray objectAtIndex:selectIndex] objectForKey:FirstNamecontact],[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]]];
            }
            break;
        }
        default:
            break;
    }
}
- (void)getContactListSuccess:(ResponseGetContactList *)responseGetContactList{
    
    for (ContactDetail *contact in [responseGetContactList contactList]) {
        contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                       [contact ID],IDcontact,
                       [contact name],FirstNamecontact,
                       [contact lastname], LastNamecontact,
                       [contact phoneNumber],Mobilecontact,
                       [contact imageURL],Photocontact,
                       @"Ok_Grey.png",Checkcontact,nil] ;
        [contactArray addObject:contactDict];
    }
    
    [testTable reloadData];
}
- (void)getcontactListError:(ResultStatus *)status
{
    
}
- (void)getGroupContactListSuccess:(ResponseGetGroupContactList *)responseData{
    for (GroupContactDetail *groupContact in [responseData groupContactList]) {
//        NSLog(@"Group ID         : %@\n", [groupContact ID]);
//        NSLog(@"Group name       : %@\n", [groupContact name]);
//        NSLog(@"Group imageURL   : %@\n", [groupContact imageURL]);
//        NSLog(@"Group lastUpdate : %@\n", [groupContact lastUpdate]);
        contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                       [groupContact ID],IDgroup,
                       [groupContact name],Namegroup,
                       [groupContact imageURL],Photogroup,nil] ;
        [groupArray addObject:contactDict];
        for (ContactDetail *contact in [groupContact contactList]) {
            
            contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                           [contact ID],IDcontact,
                           [contact name],FirstNamecontact,
                           [contact lastname], LastNamecontact,
                           [contact phoneNumber],Mobilecontact,
                           [contact imageURL],Photocontact,nil] ;
            [contactGroup addObject:contactDict];
        }
        
    }
    
    [testTable reloadData];
}
- (void)getGroupContactListError:(ResultStatus *)status{
    
}

-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)deleteAction:(id)sender{
    ServiceCT04_DeleteContact *deletePeople = [[ServiceCT04_DeleteContact alloc] init];
    [deletePeople setDelegate:self];
    [deletePeople setParameterWithContactIDList:[NSArray arrayWithObjects:[[contactArray objectAtIndex:selectIndex] objectForKey:IDcontact], nil]];
    [deletePeople requestService];
    
}
- (void)deleteContactSuccess{
    [alertView dismissAlertView];
}
- (void)deleteContactError:(ResultStatus *)status{
    
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:@selector(deleteAction:) withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"DELETE"]];
    [alertView showAlertView];
    
    [seachTextField resignFirstResponder];
}
@end
