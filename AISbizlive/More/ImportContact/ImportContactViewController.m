//
//  ImportContactViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 4/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ImportContactViewController.h"
#import "AISGlobal.h"
#import "ContactCell.h"
@interface ImportContactViewController ()
{
    NSDictionary *dict;
    NSMutableArray *myObject,*check;
    CFIndex number;
    NSString *Firstname ,*Lastname ;
    ABMultiValueRef Phone ;
    NSString *lastname,*firstname,*phone1,*profileImage;
    NSMutableArray *selectedMarks;
    NSData *contactImageData ;
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
    firstname = @"firstname";
    lastname = @"lastname";
    phone1 = @"phone";
    profileImage = @"profileImage";
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
     self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(backAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"IMPORTCONTACT"]];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self setTextLangague];
    [self phonebook];
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
        
       contactImageData  = (__bridge NSData *)ABPersonCopyImageDataWithFormat(ref, kABPersonImageFormatThumbnail);
        Phone = ABRecordCopyValue(ref, kABPersonPhoneProperty);
        if (ABMultiValueGetCount(Phone)>0){
            phones = [[NSString alloc] initWithFormat:@"%@",ABMultiValueCopyValueAtIndex(Phone, 0) ];
            dict = [NSDictionary dictionaryWithObjectsAndKeys:
                    Firstname, firstname,
                    Lastname, lastname,
                    phones, phone1,
                    contactImageData,profileImage,
                    nil];
            [myObject addObject:dict];
        }
        
    }
    check =[[NSMutableArray alloc] initWithArray:myObject];
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
    return [check count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
     NSDictionary *cellValue = [check objectAtIndex:indexPath.row];
    if([cellValue objectForKey:profileImage] != nil){
        cell.imageContact.image = [UIImage imageWithData:[cellValue objectForKey:profileImage]];
    }
    else {
        cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
    }
//    cell.imageContact
    cell.nameContact.text =  [[NSString alloc]initWithFormat:@"%@ %@",[cellValue objectForKey:firstname],[cellValue objectForKey:lastname]];
    cell.telContact.text =  [[NSString alloc]initWithFormat:@"%@",[cellValue objectForKey:phone1]];
    return cell;
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

@end
