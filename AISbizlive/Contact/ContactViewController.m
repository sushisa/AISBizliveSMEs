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
#import "SWTableViewCell.h"
#import "AppDelegate.h"
@interface ContactViewController ()
{
    NSMutableArray *Checkcontact;
    
    NSMutableArray *Namecontact;
    NSMutableArray *Telcontact;
    NSMutableArray *Imagecontact;
    NSMutableData *jsonData;
    UIAlertView *loading;
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
    [self loadPeopleView];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLRequest *theRequest =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dldtestbed.com/php/appAdmin.php"]
                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                 timeoutInterval:10.0];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//    [testTable setMultipleTouchEnabled:YES];
    // Loading...
    loading = [[UIAlertView alloc] initWithTitle:@"" message:@"Please Wait..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
//    [loading show];
    [testTable setContentOffset:CGPointMake(0.0, 44.0)];
    
    if (theConnection) {
		
        jsonData = [[NSMutableData alloc] init];
    }
    else {
        UIAlertView *connectFailMessage = [[UIAlertView alloc] initWithTitle:@"NSURLConnection " message:@"Failed in viewDidLoad"  delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[connectFailMessage show];
    }
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
//    [passwordField resignFirstResponder];
}
-(void)setTextLangague{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [defaults stringForKey:@"lang"];
    if([language isEqualToString:@"EN"])
    {
        self.title = @"Contact";
        [self.navigationItem setTitle:@"Contact"];
    }
    else{
        self.title = @"รายชื่อ";
        [self.navigationItem setTitle:@"รายชื่อ"];
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *didFailWithErrorMessage = [[UIAlertView alloc] initWithTitle: @"NSURLConnection " message: @"didFailWithError"  delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [didFailWithErrorMessage show];
    //inform the user
    NSLog(@"Connection failed! Error - %@", [error localizedDescription]);
    [loading dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [jsonData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    if (jsonData) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [loading dismissWithClickedButtonIndex:0 animated:YES];
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        //    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        Checkcontact = [[NSMutableArray alloc] init];
        Namecontact = [[NSMutableArray alloc] init];
        Telcontact = [[NSMutableArray alloc] init];
        Imagecontact = [[NSMutableArray alloc] init];
        // value in key name
        for (NSDictionary *dataDict in jsonObjects) {
            [Checkcontact addObject:@"Ok_Grey.png"];
            
            [Namecontact addObject:[dataDict objectForKey:@"Name_app"]];
            [Telcontact addObject:[dataDict objectForKey:@"Version_app"]];
            [Imagecontact addObject:[dataDict objectForKey:@"Logo_app"]];
           
            //            NSLog(@"%@",Imagecontact);
        }
        [testTable reloadData];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
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
-(void)loadPeopleView{
    
    self.navigationItem.rightBarButtonItem = [self ContactRightButton];
    self.navigationItem.leftBarButtonItem = [self ContactLeftButton];
}
-(void)loadGroupView{
    self.navigationItem.rightBarButtonItem = [self GroupRightButton];
    self.navigationItem.leftBarButtonItem =[self GroupLeftButton];
}
-(void)peopleAdd{
    [self performSegueWithIdentifier: @"AddPeople" sender: self];
}
-(void)groupAdd{
    
    [self performSegueWithIdentifier: @"AddGroup" sender: self];
}
-(void)peopleDelete{
    if(!testTable.editing){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelDelete)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete(0)" style:UIBarButtonItemStyleDone target:self action:@selector(peopleDeleteBtn)];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
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
    self.navigationItem.leftBarButtonItem = [self ContactLeftButton];
    self.navigationItem.rightBarButtonItem = [self ContactRightButton];

     [testTable setEditing:NO animated:YES];
}

-(void)groupDelete{
    NSLog(@"groupDelete");
}
-(UIBarButtonItem *)ContactRightButton{
    UIImageView *customAddPeople = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BUTTON_PEOPLE_ADD]];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.bounds = CGRectMake( 0, 0, customAddPeople.frame.size.width, customAddPeople.frame.size.height );
    [rightButton setImage:[UIImage imageNamed:BUTTON_PEOPLE_ADD] forState:UIControlStateHighlighted];
    [rightButton setImage:[UIImage imageNamed:BUTTON_PEOPLE_ADD]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(peopleAdd) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *contactAddBtn = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    return contactAddBtn;
}
-(UIBarButtonItem *)ContactLeftButton{
//    UIImageView *customDeletePeople = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BUTTON_PEOPLE_DELETE]];
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftButton.bounds = CGRectMake( 0, 0, customDeletePeople.frame.size.width, customDeletePeople.frame.size.height );
//    [leftButton setImage:[UIImage imageNamed:BUTTON_PEOPLE_DELETE] forState:UIControlStateHighlighted];
//    [leftButton setImage:[UIImage imageNamed:BUTTON_PEOPLE_DELETE]forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(peopleDelete) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *contactDeleteBtn =  [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    
    
    UIBarButtonItem *contactEditBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(peopleDelete)];
    contactEditBtn.tintColor = [AISColor grayColor];
    return contactEditBtn;
}
-(UIBarButtonItem *)GroupRightButton{
    UIImageView *customAddGroup = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BUTTON_GROUP_ADD]];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.bounds = CGRectMake( 0, 0, customAddGroup.frame.size.width, customAddGroup.frame.size.height );
    [rightButton setImage:[UIImage imageNamed:BUTTON_GROUP_ADD] forState:UIControlStateHighlighted];
    [rightButton setImage:[UIImage imageNamed:BUTTON_GROUP_ADD]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(groupAdd) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *groudAddBtn =  [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    return groudAddBtn;
}
-(UIBarButtonItem *)GroupLeftButton{
//    UIImageView *customDeleteGroup = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BUTTON_GROUP_DELETE]];
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftButton.bounds = CGRectMake( 10, 0, customDeleteGroup.frame.size.width, customDeleteGroup.frame.size.height );
//    [leftButton setImage:[UIImage imageNamed:BUTTON_GROUP_DELETE] forState:UIControlStateHighlighted];
//    [leftButton setImage:[UIImage imageNamed:BUTTON_GROUP_DELETE]forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(groupDelete) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *groupDeleteBtn = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//
    UIBarButtonItem *groupEditBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(peopleDelete)];
    groupEditBtn.tintColor = [AISColor grayColor];
    return groupEditBtn;
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
    static NSString *CellIdentifier = @"ContactCell";

    ContactCell *cell = [testTable dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        ContactCell __weak *weakCell = cell;

        [cell setAppearanceWithBlock:^{
            weakCell.leftUtilityButtons =  nil;
            weakCell.rightUtilityButtons = [self rightButtons];
            weakCell.delegate = self;
            weakCell.containingTableView = tableView;
        } force:YES];

        [cell setCellHeight:cell.frame.size.height];
        //    //Image
        NSString *tst = [NSString stringWithFormat:@"http://dldtestbed.com/image/app/%@",[Imagecontact objectAtIndex:indexPath.row]];
        NSURL *url = [NSURL URLWithString:tst];
        NSData *data = [NSData dataWithContentsOfURL:url];
        cell.checkContact.image = [UIImage imageNamed:[Checkcontact objectAtIndex:indexPath.row]];
        cell.imageContact.image = [UIImage imageWithData:data];
        cell.nameContact.text = [Namecontact objectAtIndex:indexPath.row];
        cell.telContact.text = [Telcontact objectAtIndex:indexPath.row];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"cell selected at index path %ld:%ld", (long)indexPath.section, (long)indexPath.row);
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
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Segue");
    if ([[segue identifier] isEqualToString:@"cellToPeople"]) {
        NSLog(@"YESSSSS");
    }
}
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
- (void)swipeableTableViewCell:(ContactCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            NSLog(@"More button was pressed");
            break;
        }
        case 1:
        {
            NSLog(@"DELETE");
            break;
        }
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    return YES;
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor grayColor]
                                                title:@"Edit"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor redColor]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}
@end
