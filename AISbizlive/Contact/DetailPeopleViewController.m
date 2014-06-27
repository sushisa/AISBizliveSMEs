//
//  DetailPeopleViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 6/6/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailPeopleViewController.h"
#import "AISGlobal.h"
@interface DetailPeopleViewController ()
{
    NSMutableArray *myobject;
}
@end

@implementation DetailPeopleViewController

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
    myobject = [[NSMutableArray alloc] initWithObjects:@"100 SMS/Package",@"200 SMS/Package",@"300 SMS/Package",@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" ,@"400 SMS/Package" , nil];
    [self setTextLangague];
}
-(void)setTextLangague{
    
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
    self.navigationItem.title = [AISString commonString:TITLE :@"DETAILCONTACT"];
    [nameLabel setText:[AISString commonString:LABEL :@"FIRST_NAME"]];
    [firstNameField setText:self.firstName];
    
    [lastNameLabel setText:[AISString commonString:LABEL :@"LAST_NAME"]];
    [lastNameField setText:self.lastName];
    
    [mobileLabel setText:[AISString commonString:LABEL :@"MOBILE"]];
    [phoneNumberField setText:self.phoneNumber];
    [profileImage setImage:[UIImage imageNamed:self.profile]];
    [deleteButton setTitle:[AISString commonString:BUTTON :@"DELETE_CONTACT"] forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [myobject count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier ;
    if (indexPath.row % 2 == 0) {
        CellIdentifier = @"toMessage";
    }
    else{
        CellIdentifier = @"sendMessage";
    }
    UITableViewCell *cell = [messageTable dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    UILabel  *head = (UILabel *)[cell viewWithTag:201];
    head.text = [myobject objectAtIndex:indexPath.row];
    UILabel *sample = (UILabel *)[cell viewWithTag:202];
    sample.text =   [myobject objectAtIndex:indexPath.row];
    return cell;
    
}

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
