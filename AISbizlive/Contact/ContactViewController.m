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
    NSMutableArray *Checkcontact;
    
    NSMutableArray *Namecontact;
    NSMutableArray *Telcontact;
    NSMutableArray *Imagecontact;
    NSMutableData *jsonData;
    UIAlertView *loading;
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
    ServiceBizLive *service = [[ServiceBizLive alloc] init];
    [service setBizLiveURL:@"https://www.google.com"];
    NSDictionary *newdict = [[NSDictionary alloc] init];
    [service setRequestDict:newdict];
    service.delegate = self;
    [service fungusRequest];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    [self setTextLangague];
    [self.tabBarController setSelectedIndex:1];
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
    for (int i = 0; i < Checkcontact.count; i++) {
        if ([[Checkcontact objectAtIndex:i] isEqualToString:@"Ok_Green.png"]) {
            [returnContact addObject:[Namecontact objectAtIndex:i]];
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
    Checkcontact = [[NSMutableArray alloc] initWithObjects:@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png", nil];
    Namecontact = [[NSMutableArray alloc] initWithObjects:@"Testcdsfdsfdsfdsfdsfdsfdsfdsf1",@"Test2",@"Test3",@"Test4",@"Test5",@"Test1",@"Test2",@"Test3",@"Test4",@"Test5",@"Test1",@"Test2",@"Test3",@"Test4",@"Test5",@"Test1",@"Test2",@"Test3",@"Test4",@"Test5",nil];
    Telcontact = [[NSMutableArray alloc] initWithObjects:@"tdsfeffffffdsvvdfgfsfewfdsvdsvsdvdsfsdfsdfdsfdsfl1",@"tel2",@"tel3",@"tel4",@"tel5",@"tel1",@"tel2",@"tel3",@"tel4",@"tel5",@"tel1",@"tel2",@"tel3",@"tel4",@"tel5",@"tel1",@"tel2",@"tel3",@"tel4",@"tel5",nil];
    Imagecontact = [[NSMutableArray alloc] initWithObjects:@"Logo.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",nil];
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
    Checkcontact = [[NSMutableArray alloc] initWithObjects:@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png",@"Ok_Grey.png", nil];
    Namecontact = [[NSMutableArray alloc] initWithObjects:@"Group1",@"Group2",@"Group3",@"Group4",@"Group5",nil];
    Telcontact = [[NSMutableArray alloc] initWithObjects:@"tel1",@"tel2",@"tel3",@"tel4",@"tel5",nil];
    Imagecontact = [[NSMutableArray alloc] initWithObjects:@"icon.png",@"icon.png",@"icon.png",@"icon.png",@"icon.png",nil];
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
    return Namecontact.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"PeopleCell";
    ContactCell *cell = (ContactCell *)[testTable dequeueReusableCellWithIdentifier:CellIdentifier];
    ContactCell __weak * weakCell = cell;
    
    
    [cell setAppearanceWithBlock:^{
        weakCell.containingTableView = testTable;
        
        
        weakCell.rightUtilityButtons = [self rightButtons];
        
        
        weakCell.delegate = self;
    } force:NO];
    
    
        cell.checkContact.image = [UIImage imageNamed:[Checkcontact objectAtIndex:indexPath.row]];
        cell.imageContact.image = [UIImage imageNamed:[Imagecontact objectAtIndex:indexPath.row]];
        cell.nameContact.text = [Namecontact objectAtIndex:indexPath.row];
    cell.telContact.text = [Telcontact objectAtIndex:indexPath.row];
    [cell setCellHeight:cell.frame.size.height];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    if(tableView.isEditing){
        ContactCell *checkCell = (ContactCell *)[testTable cellForRowAtIndexPath:indexPath];
        UIImage *check = [UIImage imageNamed:@"Ok_Grey.png"];
        if(checkCell.checkContact.image == check){
            [Checkcontact replaceObjectAtIndex:indexPath.row withObject:@"Ok_Green.png"];
            checkCell.checkContact.image = [UIImage imageNamed:@"Ok_Green.png"];
        }
        else{
            
            [Checkcontact replaceObjectAtIndex:indexPath.row withObject:@"Ok_Grey.png"];
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
        detailPeople.firstName = [Namecontact objectAtIndex:selectIndex];
        detailPeople.phoneNumber = [Telcontact objectAtIndex:selectIndex];
        detailPeople.profile = [Imagecontact objectAtIndex:selectIndex];
    }
    else if([[segue identifier] isEqualToString:@"EditPeople"]) {
        AddPeopleViewController *editPeople = [segue destinationViewController];
        editPeople.checkPush = @"YES";
        editPeople.firstName = [Namecontact objectAtIndex:selectIndex];
        editPeople.phoneNumber = [Telcontact objectAtIndex:selectIndex];
        editPeople.profile = [Imagecontact objectAtIndex:selectIndex];
    } else if([[segue identifier] isEqualToString:@"AddPeople"]) {
        AddPeopleViewController *editPeople = [segue destinationViewController];
        editPeople.checkPush = @"YES";
    }else if ([[segue identifier] isEqualToString:@"AddGroup"]) {
        
    }else if ([[segue identifier] isEqualToString:@"EditGroup"]) {
        AddGroupViewController *addGroup = [segue destinationViewController];
        addGroup.nameGroup = [Namecontact objectAtIndex:selectIndex];
        addGroup.profileGroup = [Imagecontact objectAtIndex:selectIndex];
//        NSLog(@"EditGroup");
    }else if ([[segue identifier] isEqualToString:@"cellToGroup"]) {
        DetailGroupViewController *addGroup = [segue destinationViewController];
        addGroup.nameGroup = [Namecontact objectAtIndex:selectIndex];
        addGroup.profileGroup = [Imagecontact objectAtIndex:selectIndex];
        NSLog(@"cellToGroup");
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

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
-(BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell{
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            selectIndex = (int) [testTable indexPathForCell:cell].row;
            if ([selectPeopleAndGroup selectedSegmentIndex] == 0) {
                [self performSegueWithIdentifier:@"EditPeople" sender:self];
            }
            else{
                
                [self performSegueWithIdentifier:@"EditGroup" sender:self];
            }
            break;
        case 1:
        {
            // Delete button was pressed
            NSLog(@"Delete");
            break;
        }
        default:
            break;
    }
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict{
    
}
- (void)serviceBizLiveError:(ResponseStatus *)status{
    
}
@end
