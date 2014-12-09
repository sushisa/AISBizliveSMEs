//
//  ContactViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 2/7/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ContactViewController.h"
#import "AISGlobal.h"
#import "ContactCell.h"
#import "AppDelegate.h"
#import "MessageTableViewController.h"

@interface ContactViewController ()
{
    NSDictionary *contactDict;
    
    //Contact People
    NSMutableArray *contactArray;
//    NSMutableArray *contactArrayList;
    //Contact Group
    NSMutableArray *groupArray;
    NSMutableArray *groupArrayContact;
    AISAlertView *alertView;
    
    NSMutableArray *deleteArray;
    NSMutableArray *searchArray;
    NSSortDescriptor *descriptor;
    NSSortDescriptor *descriptorGroup;
    int selectIndex;
    UIView *dimView;
    NSUserDefaults *defaults;
}

@end

@implementation ContactViewController
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
    
    contactArray = [[NSMutableArray alloc] init];
    groupArray = [[NSMutableArray alloc] init];
    deleteArray = [[NSMutableArray alloc] init];
    searchArray = [[NSMutableArray alloc] init];
    groupArrayContact = [[NSMutableArray alloc] init];
    dimView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+10, testTable.frame.size.width, 0)];
    dimView.backgroundColor = [UIColor whiteColor];
    UILabel *noRe = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, testTable.frame.size.width, 20)];
    noRe.text = [AISString commonString:typeLabel KeyOfValue:@"NO_RESULT"];
    noRe.textColor = [AISColor lightgreenColor];
    [noRe setTextAlignment:NSTextAlignmentCenter];
    [dimView addSubview:noRe];
    [self.view addSubview:dimView];
    [seachTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    if ([[AISpList getContactListArray] count] == 0) {
        [self callContactList];
    }
    else{
        [contactArray addObjectsFromArray: [AISpList getContactListArray]];
        [groupArray addObjectsFromArray:[AISpList getGroupListArray]];
    }
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    [self setTextLangague];
    [self.tabBarController setSelectedIndex:1];
   
}
-(void)textFieldDidChange:(UITextField *)txtFld {
        [searchArray removeAllObjects];
        
        NSString * tem = [NSString stringWithFormat:@"%@",txtFld.text];
        NSPredicate *predicate;
        NSArray *result;
        if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
            predicate = [NSPredicate predicateWithFormat:
                         @"(firstName contains[c] %@) OR (lastName contains[c] %@) OR (mobileNo contains[c] %@)" ,tem,tem,tem];
            result = [contactArray filteredArrayUsingPredicate:predicate];
        }
        else{
            predicate = [NSPredicate predicateWithFormat:
                         @"groupName contains[c] %@",tem];
            result = [groupArray filteredArrayUsingPredicate:predicate];
        }
        [searchArray addObjectsFromArray:result];
    if (![txtFld.text isEqualToString:@""]) {
        if ([searchArray count] == 0) {
            [self addDimView];
        }else{
            [self removeDimView];
        }
    }
        [testTable reloadData];
}
-(void)addDimView{
    [dimView setFrame:CGRectMake(0, testTable.frame.origin.y, testTable.frame.size.width, testTable.frame.size.height)];
}
-(void)removeDimView{
    [dimView setFrame:CGRectMake(0, self.view.frame.size.height+10, testTable.frame.size.width, testTable.frame.size.height)];
}
-(void)callContactList{
    ServiceCT01_GetContactList *callPeople = [[ServiceCT01_GetContactList alloc] init];
    [callPeople setGetContactListDelegate:self];
    [callPeople requestService];
}
-(void)callGroupList{
    ServiceCT06_GetGroupContactList *callGroup = [[ServiceCT06_GetGroupContactList alloc] init];
    [callGroup setDelegate:self];
    [callGroup requestService];
}

- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [seachTextField resignFirstResponder];
}
-(void)setTextLangague{
    descriptorGroup =[NSSortDescriptor sortDescriptorWithKey:RES_KEY_GROUP_NAME  ascending:YES];
    descriptor = [NSSortDescriptor sortDescriptorWithKey:RES_KEY_CONTACT_FIRSTNAME  ascending:YES];
    
    defaults = [NSUserDefaults standardUserDefaults];
    nameLogin.text = [defaults objectForKey:@"userLogin"];
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
    NSMutableArray *returnContact = [[NSMutableArray alloc] init];
    NSMutableArray *returnGroup = [[NSMutableArray alloc] init];
    for (int i = 0; i < contactArray.count; i++) {
        if ([[[contactArray objectAtIndex:i] objectForKey:@"check"] isEqualToString:@"Ok_Green.png"]) {
            [returnContact addObject:[contactArray objectAtIndex:i]];
        }
    }
    for (int i = 0; i < groupArray.count; i++) {
        if ([[[groupArray objectAtIndex:i] objectForKey:@"check"] isEqualToString:@"Ok_Green.png"]) {
            [returnGroup addObject:[groupArray objectAtIndex:i]];
        }
    }
    [delegate didFinishSelectedContact:returnContact Group:returnGroup];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadPeopleView{
    [seachTextField resignFirstResponder];
    [searchArray removeAllObjects];
    [self removeDimView];
    [seachTextField setText:@""];
    if ([self.contactSelect isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectContact) withTarget:self];
        self.tabBarController.tabBar.hidden = YES;
        NSLog(@"%@",self.messagecontactsArray);
        for (int k = 0 ; k < [contactArray count]; k++) {
            for (int j = 0; j < [self.messagecontactsArray count]; j ++) {
               
                if ([[[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_ID] isEqualToString:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]]) {
                    contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_LAST_UPDATE],RES_KEY_CONTACT_LAST_UPDATE,
                                   [[self.messagecontactsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                                   @"Ok_Green.png",@"check",nil] ;
                    [contactArray replaceObjectAtIndex:k withObject:contactDict];
                }
                
            }
        }
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [seachTextField resignFirstResponder];
    return YES;
}
-(void)loadGroupView{
    [seachTextField resignFirstResponder];
    [searchArray removeAllObjects];
    [self removeDimView];
    [seachTextField setText:@""];
    if ([self.contactSelect isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
        
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectContact) withTarget:self];
        self.tabBarController.tabBar.hidden = YES;
        NSLog(@"%@",self.messagegroupsArray);
        for (int k = 0 ; k < [groupArray count]; k++) {
            for (int j = 0; j < [self.messagegroupsArray count]; j ++) {
                
                if ([[[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_ID] isEqualToString:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]]) {
                    contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_ID],RES_KEY_GROUP_ID,
                                   [[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_NAME],RES_KEY_GROUP_NAME,
                                   [[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_LAST_UPDATE],RES_KEY_GROUP_LAST_UPDATE,
                                   [[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_PHOTO_PATH],RES_KEY_GROUP_PHOTO_PATH,
                                   @"Ok_Green.png",@"check",
                                   [[self.messagegroupsArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_LIST],RES_KEY_CONTACT_LIST,nil] ;
                    [groupArray replaceObjectAtIndex:k withObject:contactDict];
                }
                
            }
        }
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
    [deleteArray removeAllObjects];
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:@"Delete Contact" LeftString:[AISString commonString:typeButton KeyOfValue:@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue:@"OK"]];
    [ss showAlertView];
    for (int k = 0 ; k < [contactArray count]; k++) {
        if ([[[contactArray objectAtIndex:k] objectForKey:@"check"] isEqualToString:@"Ok_Green.png"]) {
            [deleteArray addObject:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]];
        }
    }
}
-(void)leftAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
}
-(void)rightAction:(id)sender{
    [[AISAlertView alloc] dismissAlertView];
    [self callDeleteContact];
}
-(void)cancelDelete{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] PeopleDeleteButtonWithAction:@selector(peopleDelete) withTarget:self];
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] PeopleAddButtonWithAction:@selector(peopleAdd) withTarget:self];
    for (int k = 0 ; k < [contactArray count]; k++) {
        contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_LAST_UPDATE],RES_KEY_CONTACT_LAST_UPDATE,
                       [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                       @"Ok_Grey.png",@"check",nil] ;
        [contactArray replaceObjectAtIndex:k withObject:contactDict];
    }
     [testTable setEditing:NO animated:YES];
    [testTable reloadData];
}
-(void)groupCancelDelete{
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] PeopleDeleteButtonWithAction:@selector(groupDelete) withTarget:self];
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] PeopleAddButtonWithAction:@selector(groupAdd) withTarget:self];
    for (int j = 0; j < [groupArray count]; j++) {
        contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                       [[groupArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_ID],RES_KEY_GROUP_ID,
                       [[groupArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_NAME],RES_KEY_GROUP_NAME,
                       [[groupArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_LAST_UPDATE],RES_KEY_GROUP_LAST_UPDATE,
                       [[groupArray objectAtIndex:j] objectForKey:RES_KEY_GROUP_PHOTO_PATH],RES_KEY_GROUP_PHOTO_PATH,
                       @"Ok_Grey.png",@"check",
                       [[groupArray objectAtIndex:j] objectForKey:RES_KEY_CONTACT_LIST],RES_KEY_CONTACT_LIST,nil] ;
        [groupArray replaceObjectAtIndex:j withObject:contactDict];
    }

    [testTable setEditing:NO animated:YES];
    [testTable reloadData];
}
-(void)groupDelete{
    if(!testTable.editing){
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] CancelButtonWithAction:@selector(groupCancelDelete) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DeleteButtonWithAction:@selector(groupDeleteBtn) withTarget:self];
    }
    [testTable setEditing:!testTable.editing animated:YES];
}
-(void)groupDeleteBtn{
    AISAlertView *ss = [[AISAlertView alloc]  withActionLeft:@selector(leftAction:) withActionRight:@selector(rightAction:) withTarget:self message:@"Delete Group" LeftString:[AISString commonString:typeButton KeyOfValue:@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue:@"OK"]];
    [ss showAlertView];
    for (int k = 0 ; k < [groupArray count]; k++) {
        if ([[[groupArray objectAtIndex:k] objectForKey:@"check"] isEqualToString:@"Ok_Green.png"]) {
            [deleteArray addObject:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]];
        }
    }
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
        if ([searchArray count] == 0) {
            return contactArray.count;
        }
        else{
            return searchArray.count;
        }
    }
    else{
        if ([searchArray count] == 0) {
            return groupArray.count;
        }
        else{
            return searchArray.count;
        }
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
    if (cell == nil) {
        cell = (ContactCell *)[testTable dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    ContactCell __weak * weakCell = cell;
    
    [cell setAppearanceWithBlock:^{
        weakCell.containingTableView = testTable;
        
        
        if (![self.contactSelect isEqualToString:@"YES"]) {
            weakCell.rightUtilityButtons = [self rightButtons];
        }
        
        weakCell.delegate = self;
    } force:NO];
    NSDictionary *dictContact;
    if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
        if ([searchArray count] == 0) {
            dictContact = [contactArray objectAtIndex:indexPath.row];
        }
        else{
            dictContact = [searchArray objectAtIndex:indexPath.row];
        }
        cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[dictContact objectForKey:RES_KEY_CONTACT_FIRSTNAME],[dictContact objectForKey:RES_KEY_CONTACT_LASTNAME]];
        cell.telContact.text = [AISString phoneFormat:[dictContact objectForKey:RES_KEY_CONTACT_MOBILE_NO]];
        cell.lastUpdate.text = [AISString timeFormat:[dictContact objectForKey:RES_KEY_CONTACT_LAST_UPDATE]];
        cell.checkContact.image = [UIImage imageNamed:[dictContact objectForKey:@"check"]];
//        if ([[[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_PHOTO_PATH]isEqualToString:@""]) {
            cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
//        }
//        else{
//        cell.imageContact.image = [UIImage imageNamed:[[contactArray objectAtIndex:indexPath.row] objectForKey:Photocontact]];
//            NSData * img1 = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVER_PREFIX_URL,[[contactArray objectAtIndex:indexPath.row] objectForKey:Photocontact]]]];
//            cell.imageContact.image = [UIImage imageWithData:img1];
//        }
    }
    else{
        if ([searchArray count] == 0) {
            dictContact = [groupArray objectAtIndex:indexPath.row];
        }
        else{
            dictContact = [searchArray objectAtIndex:indexPath.row];
        }
        cell.nameContact.text = [dictContact objectForKey:RES_KEY_GROUP_NAME];
        cell.checkContact.image = [UIImage imageNamed:[dictContact objectForKey:@"check"]];
        cell.lastUpdate.text = [AISString timeFormat:[dictContact objectForKey:RES_KEY_GROUP_LAST_UPDATE]];
//        if ([[[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_PHOTO_PATH]isEqualToString:@""]) {
            cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
//        }else{
//        cell.imageContact.image = [UIImage imageNamed:[[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_PHOTO_PATH]];
//        }
        
    }
    [cell setCellHeight:cell.frame.size.height];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    if(tableView.isEditing){
        ContactCell *checkCell = (ContactCell *)[testTable cellForRowAtIndexPath:indexPath];
//        UIImage *check = [UIImage imageNamed:@"Ok_Grey.png"];
        
        if (selectPeopleAndGroup.selectedSegmentIndex == 0) {
            if([[[contactArray objectAtIndex:indexPath.row] objectForKey:@"check"] isEqualToString: @"Ok_Grey.png"]){
                contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                                [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                                [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                                [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                                [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LAST_UPDATE],RES_KEY_CONTACT_LAST_UPDATE,
                                [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                               @"Ok_Green.png",@"check",nil] ;
                [contactArray replaceObjectAtIndex:indexPath.row withObject:contactDict];
                
                checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Green.png"];
            }
            else{
                contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LAST_UPDATE],RES_KEY_CONTACT_LAST_UPDATE,
                               [[contactArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                               @"Ok_Grey.png",@"check",nil] ;
                [contactArray replaceObjectAtIndex:indexPath.row withObject:contactDict];
                
                checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Grey.png"];
            }
        }
        else{
            if([[[groupArray objectAtIndex:indexPath.row] objectForKey:@"check"] isEqualToString: @"Ok_Grey.png"]){
                contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_ID],RES_KEY_GROUP_ID,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_NAME],RES_KEY_GROUP_NAME,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_LAST_UPDATE],RES_KEY_GROUP_LAST_UPDATE,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_PHOTO_PATH],RES_KEY_GROUP_PHOTO_PATH,
                               @"Ok_Green.png",@"check",
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LIST],RES_KEY_CONTACT_LIST,nil] ;
                [groupArray replaceObjectAtIndex:indexPath.row withObject:contactDict];
                checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Green.png"];
                
            }
            else{
                contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_ID],RES_KEY_GROUP_ID,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_NAME],RES_KEY_GROUP_NAME,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_LAST_UPDATE],RES_KEY_GROUP_LAST_UPDATE,
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_GROUP_PHOTO_PATH],RES_KEY_GROUP_PHOTO_PATH,
                               @"Ok_Grey.png",@"check",
                               [[groupArray objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LIST],RES_KEY_CONTACT_LIST,nil] ;
                [groupArray replaceObjectAtIndex:indexPath.row withObject:contactDict];
                checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Grey.png"];
            }
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
        detailPeople.firstName = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_FIRSTNAME];
        detailPeople.lastName = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_LASTNAME];
        detailPeople.phoneNumber = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_MOBILE_NO];
        detailPeople.profile = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_PHOTO_PATH];
        detailPeople.ID = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_ID];
        detailPeople.delegate = self;
    }
    else if([[segue identifier] isEqualToString:@"EditPeople"]) {
        AddPeopleViewController *editPeople = [segue destinationViewController];
        editPeople.checkPush = @"YES";
        editPeople.delegate = self;
        editPeople.ID = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_ID];
        editPeople.firstName = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_FIRSTNAME];
        editPeople.lastName = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_LASTNAME];
        editPeople.phoneNumber = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_MOBILE_NO];
        editPeople.profile = [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_PHOTO_PATH];
    } else if([[segue identifier] isEqualToString:@"AddPeople"]) {
        AddPeopleViewController *addPeople = [segue destinationViewController];
        addPeople.checkPush = @"YES";
        addPeople.delegate = self;
    }else if ([[segue identifier] isEqualToString:@"AddGroup"]) {
        AddGroupViewController *addGroup = [segue destinationViewController];
        addGroup.delegate = self;
    }else if ([[segue identifier] isEqualToString:@"EditGroup"]) {
        AddGroupViewController *addGroup = [segue destinationViewController];
        addGroup.idGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_ID];
        addGroup.nameGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_NAME];
        addGroup.profileGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_PHOTO_PATH];
        addGroup.contactList = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_LIST];
        addGroup.delegate = self;
    }else if ([[segue identifier] isEqualToString:@"cellToGroup"]) {
        DetailGroupViewController *detailGroup = [segue destinationViewController];
        detailGroup.idGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_ID];
        detailGroup.nameGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_NAME];
        detailGroup.profileGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_PHOTO_PATH];
        detailGroup.arrayContactGroup = [[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_LIST];
        detailGroup.delegate = self;
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
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 50.0)];
    
    oneHeaderView.backgroundColor = [UIColor whiteColor];
    return oneHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.0f;
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
                [self alert:[NSString stringWithFormat:@"%@ %@ %@",[AISString commonString:typePopup KeyOfValue :@"DELETEPEOPLE"],[[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_FIRSTNAME],[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]]];
            }
            else{
                [self alert:[NSString stringWithFormat:@"%@ '%@' %@",[AISString commonString:typePopup KeyOfValue :@"DELETEGROUP"],[[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_NAME],[AISString commonString:typePopup KeyOfValue :@"DELETEDESCIPTION"]]];
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
                       [contact ID],RES_KEY_CONTACT_ID,
                       [contact name],RES_KEY_CONTACT_FIRSTNAME,
                       [contact lastname], RES_KEY_CONTACT_LASTNAME,
                       [contact phoneNumber],RES_KEY_CONTACT_MOBILE_NO,
                       [contact lastUpdate],RES_KEY_CONTACT_LAST_UPDATE,
                       [contact imageURL],RES_KEY_CONTACT_PHOTO_PATH,
                       @"Ok_Grey.png",@"check",nil] ;
        [contactArray addObject:contactDict];
    }
    [AISpList setContactListArray:contactArray];
    [contactArray sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    [testTable reloadData];
    [self callGroupList];
}


- (void)getcontactListError:(ResultStatus *)status
{
    
}
- (void)getGroupContactListSuccess:(ResponseGetGroupContactList *)responseData{
   
    for (GroupContactDetail *groupContact in [responseData groupContactList]) {
        contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                       [groupContact ID],RES_KEY_GROUP_ID,
                       [groupContact name],RES_KEY_GROUP_NAME,
                       [groupContact lastUpdate],RES_KEY_GROUP_LAST_UPDATE,
                       [groupContact imageURL],RES_KEY_GROUP_PHOTO_PATH,
                        @"Ok_Grey.png",@"check",
                       [groupContact contactList],RES_KEY_CONTACT_LIST,nil] ;
        [groupArray addObject:contactDict];
    }
    [AISpList setGroupListArray:groupArray];
    [groupArray sortUsingDescriptors:[NSArray arrayWithObject:descriptorGroup]];
        [self alertOneButton:[NSString stringWithFormat:@"%@ %@",[AISString commonString:typeLabel KeyOfValue:@"WELCOME"],[defaults objectForKey:@"userLogin"]]];
    [testTable reloadData];
}
- (void)getGroupContactListError:(ResultStatus *)status{
    
}

-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)deleteAction:(id)sender{
    [deleteArray removeAllObjects];
    if ([selectPeopleAndGroup selectedSegmentIndex] == 0) {
        [deleteArray addObject: [[contactArray objectAtIndex:selectIndex] objectForKey:RES_KEY_CONTACT_ID]];
        [self callDeleteContact];
    }
    else{
        [deleteArray addObject:[[groupArray objectAtIndex:selectIndex] objectForKey:RES_KEY_GROUP_ID]];
        [self callDeleteGroupContact];
    }
    
}
-(void)callDeleteContact{
    
    [alertView dismissAlertView];
    ServiceCT04_DeleteContact *deletePeople = [[ServiceCT04_DeleteContact alloc] init];
    [deletePeople setDelegate:self];
    [deletePeople setParameterWithContactIDList:deleteArray];
    [deletePeople requestService];
}
- (void)deleteContactSuccess{
    for (int j = 0; j < [deleteArray count]; j++) {
        for (int k = 0; k < [contactArray count]; k++) {
            if ([[deleteArray objectAtIndex:j] isEqualToString:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]]) {
                [contactArray removeObjectAtIndex:k];
            }
        }
    }
    [AISpList setContactListArray:contactArray];
//    [contactArray removeObjectAtIndex:selectIndex];
    [testTable reloadData];
//    [self callContactList];
}
- (void)deleteContactError:(ResultStatus *)status{
    
}
-(void)callDeleteGroupContact{
    [alertView dismissAlertView];
    ServiceCT11_DeleteGroupContact *deletaGroup = [[ServiceCT11_DeleteGroupContact alloc] init];
    [deletaGroup setDelegate:self];
    [deletaGroup setParameterWithGroupIDList:deleteArray];
    [deletaGroup requestService];
}
- (void)deleteGroupContactSuccess{
    for (int j = 0; j < [deleteArray count]; j++) {
        for (int k = 0; k < [groupArray count]; k++) {
            if ([[deleteArray objectAtIndex:j] isEqualToString:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]]) {
                [groupArray removeObjectAtIndex:k];
            }
        }
    }
    [AISpList setGroupListArray:groupArray];
    [testTable reloadData];
//    [self callGroupList];
}
- (void)deleteGroupContactError:(ResultStatus *)status{
    
}
-(void)alertOneButton:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"OK"] RightString:nil];
    [alertView showAlertView];
    
    [seachTextField resignFirstResponder];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:@selector(deleteAction:) withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"OK"]];
    [alertView showAlertView];
    
    [seachTextField resignFirstResponder];
}

- (void)didFinishUpdateContact:(NSDictionary *)contactsDict{
    for (int k = 0; k < [contactArray count]; k ++) {
        if ([[contactsDict objectForKey:RES_KEY_CONTACT_ID] isEqualToString:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]]) {
            contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                           [[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                           [contactsDict objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                           [contactsDict objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                           [contactsDict objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                           [contactsDict objectForKey:RES_KEY_CONTACT_LAST_UPDATE],RES_KEY_CONTACT_LAST_UPDATE,
                           [contactsDict objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                           @"Ok_Grey.png",@"check",nil] ;
            [contactArray replaceObjectAtIndex:k withObject:contactDict];
        }
    }
    [AISpList setContactListArray:contactArray];
}

- (void)didFinishAddContact:(NSDictionary *)contactsDict{
    [contactArray addObject:contactsDict];
    [contactArray sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    [AISpList setContactListArray:contactArray];
    [testTable reloadData];
}

- (void)didFinishDeleteContact:(NSString *)contactsID{
    for (int k = 0; k < [contactArray count]; k ++) {
        if ([contactsID isEqualToString:[[contactArray objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]]) {
            [contactArray removeObjectAtIndex:k];
        }
    }
    [AISpList setContactListArray:contactArray];
    [testTable reloadData];
}

- (void)didFinishAddGroup:(NSDictionary *)groupsDict{
    [groupArray addObject:groupsDict];
    [groupArray sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    [AISpList setGroupListArray:groupArray];
    [testTable reloadData];
}
- (void)didFinishUpdateGroup:(NSDictionary *)groupsDict{
    for (int k = 0; k < [groupArray count]; k ++) {
        if ([[groupsDict objectForKey:RES_KEY_GROUP_ID] isEqualToString:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]]) {
            contactDict = [NSDictionary dictionaryWithObjectsAndKeys:
                           [groupsDict objectForKey:RES_KEY_GROUP_ID],RES_KEY_GROUP_ID,
                           [groupsDict objectForKey:RES_KEY_GROUP_NAME],RES_KEY_GROUP_NAME,
                           [groupsDict objectForKey:RES_KEY_GROUP_LAST_UPDATE],RES_KEY_GROUP_LAST_UPDATE,
                           [groupsDict objectForKey:RES_KEY_GROUP_PHOTO_PATH],RES_KEY_GROUP_PHOTO_PATH,
                           @"Ok_Grey.png",@"check",
                          [groupsDict objectForKey:RES_KEY_CONTACT_LIST],RES_KEY_CONTACT_LIST,nil] ;
            [groupArray replaceObjectAtIndex:k withObject:contactDict];
        }
    }
    [AISpList setGroupListArray:groupArray];
    [testTable reloadData];
}

- (void)didFinishDeleteGroup:(NSString *)groupsID{
    for (int k = 0; k < [groupArray count]; k ++) {
        if ([groupsID isEqualToString:[[groupArray objectAtIndex:k] objectForKey:RES_KEY_GROUP_ID]]) {
            [groupArray removeObjectAtIndex:k];
        }
    }
    [AISpList setGroupListArray:groupArray];
    [testTable reloadData];
}
@end
