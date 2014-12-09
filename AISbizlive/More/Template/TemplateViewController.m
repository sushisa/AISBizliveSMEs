//
//  TemplateViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TemplateViewController.h"
#import "AISGlobal.h"
#import "MessageTableViewController.h"
#import "TemplateCell.h"
#import "AISActivity.h"
@interface TemplateViewController ()
{
//    NSMutableArray *headTemplate;
//    NSMutableArray *sampleTemplate;
//    NSMutableArray *fullTemplate;
    BOOL *selected;
    IBOutlet UITableView *mytable;
    AISActivity *activity;
    int selectIndex;
//    UITableViewCell *cell ;

    // A array Object
    NSDictionary *listArray;
    NSMutableArray *myObject;
    
    int *cellHeight;
    NSString *fullReturn;
    NSSortDescriptor *descriptor;
    AISAlertView *alertView;
}
@end

@implementation TemplateViewController
@synthesize delegate;
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
    selectIndex = 0;

    myObject = [[NSMutableArray alloc] init];
   
    messageTable.estimatedRowHeight = 100.0;
    messageTable.rowHeight = UITableViewAutomaticDimension;
    activity = [[AISActivity alloc] init];
    [self setTextLangague];
    
}
-(void)setTextLangague{
    descriptor = [NSSortDescriptor sortDescriptorWithKey:RES_KEY_CONTACT_LAST_UPDATE  ascending:NO];
    
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"TEMPLATE"]];
    if ([self.templeSelected isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
    }
    else{
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] TemplateAddButtonWithAction:@selector(templateAdd) withTarget:self];
       
    }
    alertView = [[AISAlertView alloc] init];
    [messageTable reloadData];
    
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)popBackAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    if ([[AISpList getTemplateListArray] count] == 0) {
        [self callGetTemplateList];
    }else{
        [myObject addObjectsFromArray:[AISpList getTemplateListArray]];
    }
}
-(void)selectTemplate{
    [delegate didFinishSelectedTemplate:fullReturn];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)templateAdd{
    [self performSegueWithIdentifier:@"AddTemplate" sender:self];
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
    return [myObject count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TemplateCell";
    TemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    TemplateCell  *cell = (TemplateCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.rightUtilityButtons = [self rightButtons];
    //    cell.delegate = self;
    TemplateCell __weak * weakCell = cell;
    [cell setAppearanceWithBlock:^{
        weakCell.containingTableView = messageTable;
        weakCell.rightUtilityButtons = [self rightButtons];
        weakCell.delegate = self;
    } force:NO];
    cell.nameTemplate.text = [[myObject objectAtIndex:indexPath.row] objectForKey:RES_KEY_TEMPLATE_NAME];
    
    cell.descriptionTemplate.text = [[myObject objectAtIndex:indexPath.row] objectForKey:RES_KEY_TEMPLATE_MESSAGE];
//    NSLog(@"Cell - > %f",cell.frame.size.height);
    CGRect r = [[[myObject objectAtIndex:indexPath.row] objectForKey:RES_KEY_TEMPLATE_MESSAGE] boundingRectWithSize:CGSizeMake(cell.frame.size.width, 0)
                                                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                                                                context:nil];
//    NSUInteger numLines = r.size.height/20;
    [cell setCellHeight:(r.size.height + 80)];
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.templeSelected isEqualToString:@"YES"]) {
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectTemplate) withTarget:self];
        fullReturn = [[myObject objectAtIndex:indexPath.row] objectForKey:RES_KEY_TEMPLATE_MESSAGE];
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell{
    return YES;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    selectIndex = (int) [mytable indexPathForCell:cell].row;
    switch (index) {
        case 0:
        {
            [self performSegueWithIdentifier:@"EditTemplate" sender:self];
            break;
        }
        case 1:
        {
            [self callDeleteTemplate:[[myObject objectAtIndex:selectIndex] objectForKey:RES_KEY_TEMPLATE_ID]];
            break;
        }
        default:
            break;
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *oneHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(0, 0, tableView.frame.size.width, 60.0)];
    
    oneHeaderView.backgroundColor = [UIColor whiteColor];
    UIView *twoHeaderView = [[UIView alloc] initWithFrame:
                             CGRectMake(10, 10, tableView.frame.size.width-20, 40.0)];
    
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(10, 5, tableView.frame.size.width-40, 30.0)];
    
    headerLabel.textColor = [AISColor lightgreenColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    headerLabel.text = [AISString commonString:typeLabel KeyOfValue :@"SELECT_TEMPLATE"];
    [twoHeaderView addSubview:headerLabel];
    [oneHeaderView addSubview:twoHeaderView];
    return oneHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"EditTemplate"]) {
        
        AddTemplateViewController *edit = [segue destinationViewController];
        edit.ID = [[myObject objectAtIndex:selectIndex] objectForKey:RES_KEY_TEMPLATE_ID];
        edit.TemplateName = [[myObject objectAtIndex:selectIndex] objectForKey:RES_KEY_TEMPLATE_NAME];
        edit.TemplateMessage = [[myObject objectAtIndex:selectIndex] objectForKey:RES_KEY_TEMPLATE_MESSAGE];
        edit.delegate = self;
        
    }
    if ([[segue identifier] isEqualToString:@"AddTemplate"]) {
        
        AddTemplateViewController *add = [segue destinationViewController];
        add.delegate = self;
        
    }
}

-(void)callGetTemplateList{
    [activity showActivity];
    ServiceTP02_GetTemplateList *call = [[ServiceTP02_GetTemplateList alloc] init];
    [call setDelegate:self];
    [call requestService];
}
- (void)getTemplateListSuccess:(ResponseGetTemplateList *)responseGetTemplateList{
    [activity dismissActivity];
    for (TemplateDetail *templatesList in [responseGetTemplateList templateList]) {
        listArray = [[NSDictionary alloc] initWithObjectsAndKeys:
                        [templatesList ID],RES_KEY_TEMPLATE_ID,
                        [templatesList name],RES_KEY_TEMPLATE_NAME,
                        [templatesList message],RES_KEY_TEMPLATE_MESSAGE, nil];
        [myObject addObject:listArray];
    }
    [AISpList setTemplateListArray:myObject];
    [mytable reloadData];
}
- (void)getTemplateListError:(ResultStatus *)resultStatus{
    [activity dismissActivity];
    [self alert:[resultStatus responseMessage]];
    
}
-(void)callDeleteTemplate:(NSString *)ID{
    ServiceTP04_DeleteTemplate *delete = [[ServiceTP04_DeleteTemplate alloc] init];
    [delete setParameterWithID:ID];
    [delete setDelegate:self];
    [delete requestService];
}
- (void)deleteTemplateSuccess{
    [myObject removeObjectAtIndex:selectIndex];
    [AISpList setTemplateListArray:myObject];
    [messageTable reloadData];
//    [self callGetTemplateList];
}
- (void)deleteTemplateError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
    
}

- (void)didFinishAddTemplate:(TemplateDetail *)addTemplateArray{
        listArray = [[NSDictionary alloc] initWithObjectsAndKeys:
                     [addTemplateArray ID],RES_KEY_TEMPLATE_ID,
                     [addTemplateArray name],RES_KEY_TEMPLATE_NAME,
                     [addTemplateArray message],RES_KEY_TEMPLATE_MESSAGE, nil];
    [myObject addObject:listArray];
    [AISpList setTemplateListArray:myObject];
    [messageTable reloadData];
}
- (void)didFinishUpdateTemplate:(TemplateDetail *)updateTemplateArray{
    for (int k = 0; k < [myObject count]; k ++) {
        if ([[updateTemplateArray ID] isEqualToString:[[myObject objectAtIndex:k] objectForKey:RES_KEY_TEMPLATE_ID]]) {
            listArray = [[NSDictionary alloc] initWithObjectsAndKeys:
                         [updateTemplateArray ID],RES_KEY_TEMPLATE_ID,
                         [updateTemplateArray name],RES_KEY_TEMPLATE_NAME,
                         [updateTemplateArray message],RES_KEY_TEMPLATE_MESSAGE, nil];
            [myObject replaceObjectAtIndex:k withObject:listArray];
        }
    }
    [AISpList setTemplateListArray:myObject];
    [messageTable reloadData];
}
-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
@end
