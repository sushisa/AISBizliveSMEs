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

@interface TemplateViewController ()
{
//    NSMutableArray *headTemplate;
//    NSMutableArray *sampleTemplate;
//    NSMutableArray *fullTemplate;
    BOOL *selected;
    UILabel *head;
    UILabel *sample;
    UILabel *full;
    UITableViewCell *cell ;
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
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"TEMPLATE"]];
    if ([self.templeSelected isEqualToString:@"YES"]) {
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(popBackAction) withTarget:self];
    }
    else{
        self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
        self.navigationItem.rightBarButtonItem = [self templateRightButton];
       
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
-(UIBarButtonItem *)templateRightButton{
    UIBarButtonItem *templateRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_ADD_DEFAULT] style:UIBarButtonItemStyleBordered target:self action:@selector(templateAdd)];
    return templateRightButton;
}
-(UIBarButtonItem *)selectTemplateRightButton{
    UIBarButtonItem *templateRightButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:BUTTON :@"DONE"] style:UIBarButtonItemStyleBordered target:self action:@selector(selectTemplate)];
    return templateRightButton;
}
-(void)selectTemplate{
    NSArray *arr = [self.navigationController viewControllers];
    MessageTableViewController *rvc = (MessageTableViewController *)[arr objectAtIndex:[arr count]-2];
    rvc.msgText = fullReturn;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)templateAdd{
    NSLog(@"Template ADD");
    
    AddTemplateViewController *addTemplate = [self.storyboard instantiateViewControllerWithIdentifier:@"AddTemplateViewController"];
    
    [self.navigationController pushViewController:addTemplate animated:YES];
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
         self.navigationItem.rightBarButtonItem = [self selectTemplateRightButton];
     }
    cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *subtitle = (UILabel *)[cell viewWithTag:2];
    UILabel *fulltitle = (UILabel *)[cell viewWithTag:42];
    
    CGFloat width = 280;
    CGFloat height = 0;
    CGRect r = [[[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"]boundingRectWithSize:CGSizeMake(width, height)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                                        context:nil];

    [[myObject objectAtIndex:indexPath.row] setValue:[NSString stringWithFormat:@"%f",currentHeight+r.size.height+30] forKey:heightTemplateCell];
    fullReturn = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    [UIView animateWithDuration:.3f animations:^{
        subtitle.alpha = 0.0f;
        fulltitle.alpha = 1.0f;
    }];
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView beginUpdates];
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    UILabel *subtitle = (UILabel *)[cell viewWithTag:2];
    UILabel *fulltitle = (UILabel *)[cell viewWithTag:42];
      [[myObject objectAtIndex:indexPath.row] setValue:@"65" forKey:heightTemplateCell];
    [UIView animateWithDuration:.3f animations:^{
        subtitle.alpha = 1.0f;
        fulltitle.alpha = 0.0f;
    }];
   
    [tableView endUpdates];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TemplateCell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
//        cell.userInteractionEnabled = NO;
    }
    head = (UILabel *)[cell viewWithTag:1];
    head.text = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"TITLE"];
    sample = (UILabel *)[cell viewWithTag:2];
    sample.text =  [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    full = (UILabel *)[cell viewWithTag:3];
    
    [full setNumberOfLines:0];
    [full setLineBreakMode:NSLineBreakByWordWrapping];
    full.text = [[[AISString TemplateArray] objectAtIndex:indexPath.row] objectForKey:@"DESCRIPTION"];
    return cell;

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [myObject removeObjectAtIndex:indexPath.row];
        NSString *path = [[NSBundle mainBundle] pathForResource: @"TemplateList" ofType:@"plist"];
         NSMutableArray *delete = [[NSMutableArray alloc] initWithContentsOfFile: path];
        [delete removeObjectAtIndex:indexPath.row];
        NSLog(@"%@",myObject);
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        [fileManager removeItemAtPath:path error:NULL];
//        [[NSFileManager defaultManager] removeFileAtPath:path error:NULL];

        [delete writeToFile:path atomically:YES];
//        [delete re:path atomically:YES];
        [messageTable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//        [messageTable reloadData];
    }
}
@end
