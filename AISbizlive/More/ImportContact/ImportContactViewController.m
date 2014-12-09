//
//  ImportContactViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ImportContactViewController.h"
#import "AISGlobal.h"
#import "ImportCell.h"
@interface ImportContactViewController ()
{
    NSDictionary *dict;
    NSMutableArray *myObject;
    NSMutableArray *returnArray;
    CFIndex number;
    NSString *Firstname ,*Lastname ;
    ABMultiValueRef Phone ;
    NSMutableArray *selectedMarks;
    NSData *contactImageData ;
    NSMutableArray *reqData;
    AISAlertView *alertView;
}
@end

@implementation ImportContactViewController

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
    alertView = [[AISAlertView alloc] init];
    reqData = [[NSMutableArray alloc] init];
    returnArray = [[NSMutableArray alloc] init];
    [self authorizationAddressBook];
    [self setTextLangague];
}
-(void)authorizationAddressBook{
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(nil, nil);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {
                // If the app is authorized to access the first time then add the contact
                [self phonebook];
            } else {
                NSLog(@"Not Allow");
            }
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        
        [self phonebook];
    }
    else {
        NSLog(@"Not Allow 2");
    }
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangague{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
     self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(doneAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"IMPORTCONTACT"]];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
    [self phonebook];
}
-(void)doneAction{
    if ([reqData count] == 0) {
        [self alert:[AISString commonString:typePopup KeyOfValue:@"IMPORT_NO_SELECT"]];
    }else{
        [self callImaportContact];
    }
}

-(void)phonebook{
    myObject = [[NSMutableArray alloc] init];
    dict = [[NSDictionary alloc] init];
    CFErrorRef error = NULL;
    
    ABAddressBookRef UserAddressBook = ABAddressBookCreateWithOptions(NULL, &error);
    CFArrayRef Contant = ABAddressBookCopyArrayOfAllPeople(UserAddressBook);
    number = CFArrayGetCount(Contant);
    NSString *phones = nil;
    for (int i = 0;i<number; i++) {
        ABRecordRef ref = CFArrayGetValueAtIndex(Contant, i);
        Firstname = [[NSString alloc] initWithFormat:@"%@",ABRecordCopyValue(ref, kABPersonFirstNameProperty) ];
       
        Lastname = [[NSString alloc] initWithFormat:@"%@",ABRecordCopyValue(ref, kABPersonLastNameProperty) ];
        if ([Lastname isEqualToString:@"(null)"]) {
            Lastname = @"";
        }
       contactImageData  = (__bridge NSData *)ABPersonCopyImageDataWithFormat(ref, kABPersonImageFormatThumbnail);
        Phone = ABRecordCopyValue(ref, kABPersonPhoneProperty);
        if (ABMultiValueGetCount(Phone)>0){
            phones = [[NSString alloc] initWithFormat:@"%@",ABMultiValueCopyValueAtIndex(Phone, 0) ];
            
            NSString *mobileText = [NSString stringWithFormat:@"%@%@%@",[phones substringToIndex:3] ,[[phones substringFromIndex:4] substringToIndex:3],[phones substringFromIndex:8] ];
            
            ContactDetail *contact = [ContactDetail new];
            contact.name = Firstname;
            contact.lastname = Lastname;
            contact.phoneNumber = mobileText;
            [myObject addObject:contact];
        }
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [myObject count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    ImportCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
     ContactDetail *cellValue = [myObject objectAtIndex:indexPath.row];
//    if([cellValue imageURL] != nil){
//        cell.imageContact.image = [UIImage imageWithData:[cellValue objectForKey:profileImage]];
//    }
//    else {
        cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
//    }
    cell.nameContact.text =  [[NSString alloc]initWithFormat:@"%@ %@",[cellValue name],[cellValue lastname]];
    cell.telContact.text =  [[NSString alloc]initWithFormat:@"%@",[cellValue phoneNumber]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [reqData addObject:[myObject objectAtIndex:indexPath.row]];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [reqData removeObject:[myObject objectAtIndex:indexPath.row]];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 60.0)];
    
    oneHeaderView.backgroundColor = [UIColor whiteColor];
    UIView *twoHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(10, 10, tableView.frame.size.width-20, 40.0)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:[AISString commonString:typeButton KeyOfValue:@"SELECT_ALL"] forState:UIControlStateNormal];
    [btn setTitleColor:[AISColor lightgrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[AISColor lightgreenColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [btn setImage:[UIImage imageNamed:OK_GREY] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:OK_GREEN] forState:UIControlStateSelected];
    [btn  setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0)];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 0.0f);
    [btn setFrame:CGRectMake(tableView.frame.size.width-130, 5, 120.0, 30.0)];
    [btn addTarget:self
            action:@selector(selectAll:)
         forControlEvents:UIControlEventTouchUpInside];
    [twoHeaderView addSubview:btn];
    [oneHeaderView addSubview:twoHeaderView];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}

-(void) selectAll:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [button setSelected:!button.selected];
    if (button.selected) {
        for (int i = 0; i < [myObject count]; i++) {
                NSIndexPath *checkPath=[NSIndexPath indexPathForRow:i inSection:0];
                [self tableView:mytable didSelectRowAtIndexPath:checkPath];
                [mytable selectRowAtIndexPath:checkPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
    }
    else{
        for (int i = 0; i < [myObject count]; i++) {
            NSIndexPath *checkPath=[NSIndexPath indexPathForRow:i inSection:0];
            [self tableView:mytable didDeselectRowAtIndexPath:checkPath];
            [mytable deselectRowAtIndexPath:checkPath animated:YES];
        }
    }
}
-(void)callImaportContact{
    ServiceCT12_ImportContact *call = [[ServiceCT12_ImportContact alloc] init];
//    array[first , last , mobile]
    [call setParameterWithContactList:reqData];
    [call setDelegate:self];
    [call requestService];
}

- (void)importContactSuccess:(ResponseGetContactList *)responseGetContactList{
    
    [self alertBack:[AISString commonString:typePopup KeyOfValue:@"IMPORT_SUCCESS"]];
}
- (void)importContactError:(ResultStatus *)status{
    [self alert:[status responseMessage]];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
 
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
-(void)doneActionBack:(id)sender{
    [alertView dismissAlertView];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)alertBack:(NSString *)message{
    [alertView withActionLeft:@selector(doneActionBack:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"OK"] RightString:nil];
    [alertView showAlertView];
}
@end
