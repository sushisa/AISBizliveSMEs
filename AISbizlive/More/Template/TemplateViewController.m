//
//  TemplateViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 3/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TemplateViewController.h"
#import "AddTemplateViewController.h"
#import "AISGlobal.h"
#import "MessageTableViewController.h"
#import "TemplateCell.h"
@interface TemplateViewController ()
{
//    NSMutableArray *headTemplate;
//    NSMutableArray *sampleTemplate;
//    NSMutableArray *fullTemplate;
    BOOL *selected;
    UILabel *head;
    UILabel *sample;
    UILabel *full;
//    UITableViewCell *cell ;
    TemplateCell  *cell;
    int currentSelect;
    float currentHeight;
    float newHeight;

    // A array Object
    NSMutableArray *myObject;
    
    // A dictionary object
    NSMutableDictionary *dict;
    
    // Define keys
    NSString *headTemplate;
    NSString *sampleTemplate;
    NSString *fullTemplate;
    NSString *heightTemplateCell;
    int *cellHeight;
    NSString *fullReturn;
}
@end

@implementation TemplateViewController

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
    NSLog(@"%@",[AISString TemplateArray]);
    currentSelect = -1;
    currentHeight = 65;
    heightTemplateCell = @"heightTemplateCell";
    
    [self setTextLangague];
    
}
-(void)setTextLangague{
    
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue:@"TEMPLATE"]];
    if ([self.templeSelected isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(popBackAction) withTarget:self];
    }
    else{
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] TemplateAddButtonWithAction:@selector(templateAdd) withTarget:self];
       
    }
    myObject = [[NSMutableArray alloc] init];
    for (int k = 0; k<[AISString TemplateArray].count; k++) {
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"65", heightTemplateCell,
                nil];
        [myObject addObject:dict];
    }
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
}
-(void)selectTemplate{
    NSArray *arr = [self.navigationController viewControllers];
    MessageTableViewController *rvc = (MessageTableViewController *)[arr objectAtIndex:[arr count]-2];
    rvc.msgText = fullReturn;
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [[[myObject objectAtIndex:indexPath.row] objectForKey:heightTemplateCell] floatValue];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [myObject count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if ([self.templeSelected isEqualToString:@"YES"]) {
        self.navigationItem.rightBarButtonItem = [[AISNavigationBarItem alloc] DoneButtonWithAction:@selector(selectTemplate) withTarget:self];
     }
//    cell = [tableView cellForRowAtIndexPath:indexPath];
    
//    UILabel *subtitle = (UILabel *)[[tableView cellForRowAtIndexPath:indexPath] viewWithTag:2];
//    UILabel *fulltitle = (UILabel *)[[tableView cellForRowAtIndexPath:indexPath] viewWithTag:42];
    CGFloat width = 280;
    CGFloat height = 0;
    CGRect r = [[[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"]boundingRectWithSize:CGSizeMake(width, height)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                                        context:nil];

    [[myObject objectAtIndex:indexPath.row] setValue:[NSString stringWithFormat:@"%f",currentHeight+r.size.height+30] forKey:heightTemplateCell];
    fullReturn = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    [UIView animateWithDuration:.3f animations:^{
        cell.descriptionTemplate.alpha = 1.0f;
        cell.sampleDescriptionTemplate.alpha = 0.0f;
    }];
    NSLog(@"%@",cell.descriptionTemplate.text);
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    cell = ;
//    UILabel *subtitle = (UILabel *)[[tableView cellForRowAtIndexPath:indexPath] viewWithTag:2];
//    UILabel *fulltitle = (UILabel *)[[tableView cellForRowAtIndexPath:indexPath] viewWithTag:42];
      [[myObject objectAtIndex:indexPath.row] setValue:@"65" forKey:heightTemplateCell];
    [UIView animateWithDuration:.3f animations:^{
        cell.descriptionTemplate.alpha = 0.0f;
        cell.sampleDescriptionTemplate.alpha = 1.0f;
    }];
    
    [tableView beginUpdates];
    [tableView endUpdates];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TemplateCell";
    cell = [messageTable dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    if (cell == nil) {
        cell = [[TemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
//        cell.userInteractionEnabled = NO;
    }
    
    
    TemplateCell  __weak *weakCell = cell;
    [cell setAppearanceWithBlock:^{
        weakCell.leftUtilityButtons =  nil;
        weakCell.rightUtilityButtons = nil;
        weakCell.delegate = self;
        weakCell.containingTableView = messageTable;
    } force:YES];
    
//    [cell setCellHeight:cell.frame.size.height];
    cell.nameTemplate.text = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"TITLE"];
    cell.sampleDescriptionTemplate.text =  [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    cell.descriptionTemplate.alpha = 0.0f;
    cell.descriptionTemplate.text = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    return cell;

}
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleNone;
}
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
//    [cell setAccessoryType:UITableViewCellAccessoryNone];
//    selectIndex = (int) [testTable indexPathForCell:cell].row;
    switch (index) {
        case 0:
        {
            NSLog(@"Edit");
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
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [myObject removeObjectAtIndex:indexPath.row];
//        NSString *path = [[NSBundle mainBundle] pathForResource: @"TemplateList" ofType:@"plist"];
//         NSMutableArray *delete = [[NSMutableArray alloc] initWithContentsOfFile: path];
//        [delete removeObjectAtIndex:indexPath.row];
//        NSLog(@"%@",myObject);
//        [delete writeToFile:path atomically:YES];
//        [messageTable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//    }
//}
@end
