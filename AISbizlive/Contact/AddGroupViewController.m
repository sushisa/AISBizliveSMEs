//
//  AddGroupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AddGroupViewController.h"
#import "AISGlobal.h"
#import "ContactCell.h"
#import "DetailPeopleGroupViewController.h"
@interface AddGroupViewController ()
{
    NSDictionary *dict;
    NSMutableArray *contactGroup;
    NSMutableArray* contactID;
    NSMutableArray* returnContact;
    NSMutableArray* searchArray;
    int selectIndex;
    AISAlertView *alertView;
    UIView *dimView;
}
@end

@implementation AddGroupViewController
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
    dimView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+10, myTable.frame.size.width, myTable.frame.size.height)];
    dimView.backgroundColor = [UIColor whiteColor];
    UILabel *noRe = [[UILabel alloc] initWithFrame:CGRectMake(0, 20,myTable.frame.size.width, 20)];
    noRe.text = [AISString commonString:typeLabel KeyOfValue:@"NO_RESULT"];
    noRe.textColor = [AISColor lightgreenColor];
    [noRe setTextAlignment:NSTextAlignmentCenter];
    [dimView addSubview:noRe];
    [self.view addSubview:dimView];
    [searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    [self setTextLangague];
    contactID = [[NSMutableArray alloc] init];
    contactGroup = [[NSMutableArray alloc] init];
    returnContact = [[NSMutableArray alloc] init];
    alertView = [[AISAlertView alloc] init];
    searchArray = [[NSMutableArray alloc]init];
    [contactGroup removeAllObjects];
    [contactID removeAllObjects];
    if (self.idGroup == nil || [self.idGroup isEqualToString:@""]) {
        NSLog(@"ADD");
    }
    else{
        for (ContactDetail *contact in self.contactList) {
            dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           [contact ID],RES_KEY_CONTACT_ID,
                           [contact name],RES_KEY_CONTACT_FIRSTNAME,
                           [contact lastname], RES_KEY_CONTACT_LASTNAME,
                           [contact phoneNumber],RES_KEY_CONTACT_MOBILE_NO,
                           [contact lastUpdate],RES_KEY_CONTACT_LAST_UPDATE,
                           [contact imageURL],RES_KEY_CONTACT_PHOTO_PATH,
                           @"Ok_Grey.png",@"check",nil] ;
            [contactGroup addObject:dict];
            [contactID addObject:[contact ID]];
        }
    }
}
-(void)textFieldDidChange:(UITextField *)txtFld {
    [searchArray removeAllObjects];
    
    NSString * tem = [NSString stringWithFormat:@"%@",txtFld.text];
    NSPredicate *predicate;
    NSArray *result;
    predicate = [NSPredicate predicateWithFormat:
                 @"(firstName contains[c] %@) OR (lastName contains[c] %@) OR (mobileNo contains[c] %@)" ,tem,tem,tem];
    result = [contactGroup filteredArrayUsingPredicate:predicate];
    [searchArray addObjectsFromArray:result];
    if (![txtFld.text isEqualToString:@""]) {
        if ([searchArray count] == 0) {
            [dimView setFrame:CGRectMake(0, myTable.frame.origin.y, myTable.frame.size.width, myTable.frame.size.height)];
        }else{
            [dimView setFrame:CGRectMake(0, self.view.frame.size.height+10, myTable.frame.size.width, myTable.frame.size.height)];
        }
    }
    [myTable reloadData];
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [nameGroupTextField resignFirstResponder];
    [searchTextField resignFirstResponder];
}
-(void)setTextLangague{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    if (self.idGroup == nil || [self.idGroup isEqualToString: @""]) {
        [profileImage setBackgroundImage:[UIImage imageNamed:PROFILE_DEFALUT] forState:UIControlStateNormal];
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"ADDGROUP"]];
        [nameGroupTextField setPlaceholder:[AISString commonString:typePlacehoder KeyOfValue:@"NAME_GROUP"]];
    }
    else {
        if (self.profileGroup == nil || [self.profileGroup isEqualToString: @""]) {
            [profileImage setBackgroundImage:[UIImage imageNamed:PROFILE_DEFALUT] forState:UIControlStateNormal];
        }
        else{
            [profileImage setBackgroundImage:[UIImage imageNamed:self.profileGroup] forState:UIControlStateNormal];
        }
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"EDITGROUP"]];
        [nameGroupTextField setText:self.nameGroup];
    }
    self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(doneAction) withTarget:self];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [contactLabel setText:[AISString commonString:typeLabel KeyOfValue:@"ADD_CONTACT"]];
    [nameGroupLabel setText:[AISString commonString:typeLabel KeyOfValue:@"GROUPNAME"]];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [self setTextLangague];
}
-(void)backAction{
    [nameGroupTextField resignFirstResponder];
    [searchTextField resignFirstResponder];
    
    if (self.idGroup == nil || [self.idGroup isEqualToString: @""]) {
        if (![nameGroupTextField.text isEqualToString:@""]) {
            [self alertTwo:[AISString commonString:typePopup KeyOfValue:@"BACK_CONTACT"]];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        if (![nameGroupTextField.text isEqualToString:self.nameGroup]) {
            [self alertTwo:[AISString commonString:typePopup KeyOfValue:@"BACK_CONTACT"]];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
-(void)doneAction{
    [alertView dismissAlertView];
    [nameGroupTextField resignFirstResponder];
    [searchTextField resignFirstResponder];
    if ([nameGroupTextField.text isEqualToString:@""]) {
        [self alert:[AISString commonString:typePopup KeyOfValue:@"GROUPNAMENO"]];
    }
    else {
        if(self.idGroup == nil || [self.idGroup isEqualToString:@""]){
            [self callAddGroupContact];
        }
        else{
            [self callEditGroupContact];
        }
    }
}

-(void)alertTwo:(NSString *)message{
    [alertView withActionLeft:@selector(cancelAction:) withActionRight:@selector(doneAction) withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"CANCEL"] RightString:[AISString commonString:typeButton KeyOfValue :@"OK"]];
    [alertView showAlertView];
}
-(void)cancelAction:(id)sender{
    [alertView dismissAlertView];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([searchArray count] == 0) {
        return [contactGroup count];
    }else{
        return searchArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"contactGroup";
    
    ContactCell  *cell = (ContactCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *dictContact;
    if ([searchArray count] == 0) {
        dictContact = [contactGroup objectAtIndex:indexPath.row];
    }else{
        dictContact = [searchArray objectAtIndex:indexPath.row];
    }
    cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
    cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[dictContact objectForKey:RES_KEY_CONTACT_FIRSTNAME] , [dictContact objectForKey:RES_KEY_CONTACT_LASTNAME]];
    cell.telContact.text = [AISString phoneFormat:[dictContact objectForKey:RES_KEY_CONTACT_MOBILE_NO]];
    cell.lastUpdate.text = [AISString timeFormat:[dictContact objectForKey:RES_KEY_CONTACT_LAST_UPDATE]];
    [cell setCellHeight:85.0f];
    return cell;
}

- (void)callAddGroupContact{
    ServiceCT07_AddGroupContact *call = [[ServiceCT07_AddGroupContact alloc] init];
    [call setParameterWithGroupName:nameGroupTextField.text image:@"" contactID:contactID];
    [call setDelegate:self];
    [call requestService];
}
- (void)addGroupContactSuccess:(GroupContactDetail *)groupContactDetail{

    dict = [NSDictionary dictionaryWithObjectsAndKeys:
                   [groupContactDetail ID],RES_KEY_GROUP_ID,
                   [groupContactDetail name],RES_KEY_GROUP_NAME,
                   [groupContactDetail lastUpdate],RES_KEY_GROUP_LAST_UPDATE,
                   [groupContactDetail imageURL],RES_KEY_GROUP_PHOTO_PATH,
                   @"Ok_Grey.png",@"check",
                   [groupContactDetail contactList],RES_KEY_CONTACT_LIST,nil] ;
    [delegate didFinishAddGroup:dict];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addGroupContactError:(ResultStatus *)status{
    [self alert:[status responseMessage]];
}

- (void)callEditGroupContact{
    ServiceCT10_EditGroupContact *call =[[ServiceCT10_EditGroupContact alloc] init];
    [call setParameterWithGroupID:self.idGroup name:nameGroupTextField.text image64:@"" contactID:contactID];
    [call setDelegate:self];
    [call requestService];
}

- (void)editGroupContactSuccess:(GroupContactDetail *)groupContactDetail{
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [groupContactDetail ID],RES_KEY_GROUP_ID,
            [groupContactDetail name],RES_KEY_GROUP_NAME,
            [groupContactDetail lastUpdate],RES_KEY_GROUP_LAST_UPDATE,
            [groupContactDetail imageURL],RES_KEY_GROUP_PHOTO_PATH,
            @"Ok_Grey.png",@"check",
            [groupContactDetail contactList],RES_KEY_CONTACT_LIST,nil] ;
    [delegate didFinishUpdateGroup:dict];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editGroupContactError:(ResultStatus *)status{
    [self alert:[status responseMessage]];
    
}
-(void)didFinishSelectedContact:(NSMutableArray *)contactList{
    [contactGroup removeAllObjects];
    [contactID removeAllObjects];
    contactGroup = contactList;
    for (int k = 0; k < [contactGroup count]; k++) {
        [contactID addObject:[[contactGroup objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID]];
    }
    [myTable reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"selectedContact"]) {
        DetailPeopleGroupViewController *selected = [segue destinationViewController];
        selected.delegate = self;
        selected.IDContactGroup = contactGroup;
    }
}
- (IBAction)addPeopleToGroup:(id)sender {
    [self performSegueWithIdentifier:@"selectedContact" sender:self];
}
@end
