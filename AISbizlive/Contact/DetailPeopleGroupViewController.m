//
//  DetailPeopleGroupViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 9/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailPeopleGroupViewController.h"
#import "AISGlobal.h"
#import "SelectCell.h"
#import "AddGroupViewController.h"
#import "DetailCell.h"

@interface DetailPeopleGroupViewController ()
{
    NSDictionary *dict;
    NSMutableArray *detailContact;
    NSMutableArray *returnContact;
    NSMutableArray *searchArray;
    NSSortDescriptor *descriptor;
    UIView *dimView;
}
@end

@implementation DetailPeopleGroupViewController
@synthesize delegate;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTextLangague];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(hideKeyboard:)];
    [oneTapGesture setNumberOfTouchesRequired:1];
    dimView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+10, mytable.frame.size.width, mytable.frame.size.height)];
    dimView.backgroundColor = [UIColor whiteColor];
    UILabel *noRe = [[UILabel alloc] initWithFrame:CGRectMake(0, 20,mytable.frame.size.width, 20)];
    noRe.text = [AISString commonString:typeLabel KeyOfValue:@"NO_RESULT"];
    noRe.textColor = [AISColor lightgreenColor];
    [noRe setTextAlignment:NSTextAlignmentCenter];
    [dimView addSubview:noRe];
    [self.view addSubview:dimView];
    [searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}
-(void)textFieldDidChange:(UITextField *)txtFld {
    [searchArray removeAllObjects];
    
    NSString * tem = [NSString stringWithFormat:@"%@",txtFld.text];
    NSPredicate *predicate;
    NSArray *result;
        predicate = [NSPredicate predicateWithFormat:
                     @"(firstName contains[c] %@) OR (lastName contains[c] %@) OR (mobileNo contains[c] %@)" ,tem,tem,tem];
        result = [detailContact filteredArrayUsingPredicate:predicate];
    [searchArray addObjectsFromArray:result];
    if (![txtFld.text isEqualToString:@""]) {
        if ([searchArray count] == 0) {
            [dimView setFrame:CGRectMake(0, mytable.frame.origin.y, mytable.frame.size.width, mytable.frame.size.height)];
        }else{
            [dimView setFrame:CGRectMake(0, self.view.frame.size.height+10, mytable.frame.size.width, mytable.frame.size.height)];
        }
    }
    [mytable reloadData];
}
-(void)setTextLangague{
    returnContact = [[NSMutableArray alloc] init];
    detailContact = [[NSMutableArray alloc] init];
    searchArray = [[NSMutableArray alloc] init];
    descriptor =[NSSortDescriptor sortDescriptorWithKey:RES_KEY_CONTACT_FIRSTNAME  ascending:YES];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    if ([self GroupName] == nil || [[self GroupName] isEqualToString:@""]) {
        [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"CONTACT"]];
        [detailContact addObjectsFromArray:[AISpList getContactListArray]];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(doneAction) withTarget:self];
        [detailContact sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
        
        for (int k = 0; k < [self.IDContactGroup count]; k++) {
            for (int j = 0 ; j < [detailContact count]; j++) {
                
                if ([[[self.IDContactGroup objectAtIndex:k] objectForKey:RES_KEY_CONTACT_ID] isEqualToString: [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_ID]]) {
                    dict = [NSDictionary dictionaryWithObjectsAndKeys:
                            [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
                            [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
                            [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
                            [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
                            [[detailContact objectAtIndex:j] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
                            OK_GREEN,@"check",nil] ;
                    [detailContact replaceObjectAtIndex:j withObject:dict];
                }
            }
            
        }

    }
    else{
        [self.navigationItem setTitle:[self GroupName]];
        for (ContactDetail *contact in self.ArrayContactGroup) {
            dict = [NSDictionary dictionaryWithObjectsAndKeys:
                    [contact ID],RES_KEY_CONTACT_ID,
                    [contact name],RES_KEY_CONTACT_FIRSTNAME,
                    [contact lastname], RES_KEY_CONTACT_LASTNAME,
                    [contact phoneNumber],RES_KEY_CONTACT_MOBILE_NO,
                    [contact lastUpdate],RES_KEY_CONTACT_LAST_UPDATE,
                    [contact imageURL],RES_KEY_CONTACT_PHOTO_PATH,
                    @"Ok_Grey.png",@"check",nil] ;
            [detailContact addObject:dict];
        }
        
        [detailContact sortUsingDescriptors:[NSArray arrayWithObject:descriptor]];
        //        detailContact =  self.ArrayContactGroup;
    }
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [searchTextField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [searchTextField resignFirstResponder];
    return YES;
}
-(void)doneAction{
    
    for (int i = 0; i < [detailContact count]; i++) {
        if ([[[detailContact objectAtIndex:i] objectForKey:@"check"] isEqualToString:OK_GREEN]) {
            [returnContact addObject:[detailContact objectAtIndex:i]];
        }
    }
    [delegate didFinishSelectedContact:returnContact];
    [self.navigationController popViewControllerAnimated:YES];
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
    if ([searchArray count] == 0) {
        return detailContact.count;
    }else{
        return searchArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier ;
    NSDictionary *dictContact;
    if ([self GroupName] == nil) {
        CellIdentifier = @"PeopleCell";
        SelectCell *cell = (SelectCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
        if ([searchArray count] == 0) {
            dictContact = [detailContact objectAtIndex:indexPath.row];
        }
        else{
            dictContact = [searchArray objectAtIndex:indexPath.row];
        }
        cell.checkContact.image = [UIImage imageNamed:[dictContact objectForKey:@"check"]];
        
        //
        if ([[dictContact objectForKey:@"check"] isEqualToString:OK_GREEN]) {
            [self tableView:mytable didSelectRowAtIndexPath:indexPath];
            [mytable selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
        
        cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[dictContact objectForKey:RES_KEY_CONTACT_FIRSTNAME],[dictContact objectForKey:RES_KEY_CONTACT_LASTNAME]];
        cell.telContact.text = [AISString phoneFormat:[dictContact objectForKey:RES_KEY_CONTACT_MOBILE_NO]];
        cell.lastUpdate.text = [AISString timeFormat:[dictContact objectForKey:RES_KEY_CONTACT_LAST_UPDATE]];
      
        return cell;
    }
    else{
        CellIdentifier = @"DetailPeopleCell";
        DetailCell *cell = (DetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.imageContact.image = [UIImage imageNamed:PROFILE_DEFALUT];
        
        if ([searchArray count] == 0) {
            dictContact = [detailContact objectAtIndex:indexPath.row];
        }
        else{
            dictContact = [searchArray objectAtIndex:indexPath.row];
        }
        cell.nameContact.text = [NSString stringWithFormat:@"%@ %@",[dictContact objectForKey:RES_KEY_CONTACT_FIRSTNAME],[dictContact objectForKey:RES_KEY_CONTACT_LASTNAME]];
        cell.telContact.text = [AISString phoneFormat:[dictContact objectForKey:RES_KEY_CONTACT_MOBILE_NO]];
        cell.lastUpdate.text = [AISString timeFormat:[dictContact objectForKey:RES_KEY_CONTACT_LAST_UPDATE]];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [[[detailContact re:indexPath.row] objectForKey:@"check"] repl]
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
            OK_GREEN,@"check",nil] ;
    [detailContact replaceObjectAtIndex:indexPath.row withObject:dict];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_ID],RES_KEY_CONTACT_ID,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_FIRSTNAME],RES_KEY_CONTACT_FIRSTNAME,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_LASTNAME], RES_KEY_CONTACT_LASTNAME,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_MOBILE_NO],RES_KEY_CONTACT_MOBILE_NO,
            [[detailContact objectAtIndex:indexPath.row] objectForKey:RES_KEY_CONTACT_PHOTO_PATH],RES_KEY_CONTACT_PHOTO_PATH,
            OK_GREY,@"check",nil] ;
    [detailContact replaceObjectAtIndex:indexPath.row withObject:dict];
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

@end
