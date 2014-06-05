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
    currentSelect = -1;
    currentHeight = 65;
    headTemplate = @"headTemplate";
    sampleTemplate = @"sampleTemplate";
    fullTemplate = @"fullTemplate";
    heightTemplateCell = @"heightTemplateCell";
    myObject = [[NSMutableArray alloc] init];
    
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart1", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa093892374893265479823748972394u23874923", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart2", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart3", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart4", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart5", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart6", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"lkjgfkdlgjkldfjgkldfjglkdfjgkldfjgkldfjkgljdflkgjkldfjglfdlkgj", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart7", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart8", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffffffff", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart9", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"Cash Cart10", headTemplate,
            @"Casdasdasdasddasdassh Cart", sampleTemplate,
            @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", fullTemplate,
            @"65", heightTemplateCell,
            nil];
    [myObject addObject:dict];
    
    NSLog(@"Template Load");
    [self setTextLangague];
    self.tabBarController.tabBar.hidden = YES;
    if ([self.templeSelected isEqualToString:@"YES"]) {
        NSLog(@"isMessage");
    }
    else{
        self.navigationItem.rightBarButtonItem = [self templateRightButton];
    }
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(void)setTextLangague{
    [self.navigationItem setTitle:[AISString commonString:TITLE :@"TEMPLATE"]];
    
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationItem.rightBarButtonItem = [self templateRightButton];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarLeftItem alloc] withAction:@selector(backAction) withTarget:self];
}
-(UIBarButtonItem *)templateRightButton{
    UIImageView *customTemplateAdd = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BUTTON_ADD_DEFAULT]];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.bounds = CGRectMake( 10, 0, customTemplateAdd.frame.size.width, customTemplateAdd.frame.size.height );
    [rightButton setImage:[UIImage imageNamed:BUTTON_ADD_HIGHLIGHT] forState:UIControlStateHighlighted];
    [rightButton setImage:[UIImage imageNamed:BUTTON_ADD_DEFAULT]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(templateAdd) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *templateRightButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    return templateRightButton;
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
    
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *subtitle = (UILabel *)[cell viewWithTag:2];
    UILabel *fulltitle = (UILabel *)[cell viewWithTag:42];
    
    CGFloat width = 100;
    CGFloat height = 0;
    CGRect r = [[[myObject objectAtIndex:indexPath.row] objectForKey:fullTemplate] boundingRectWithSize:CGSizeMake(width, height)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                                        context:nil];

    [[myObject objectAtIndex:indexPath.row] setValue:[NSString stringWithFormat:@"%f",currentHeight+r.size.height] forKey:heightTemplateCell];
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
        
        cell.userInteractionEnabled = NO;
    }
    head = (UILabel *)[cell viewWithTag:1];
    head.text = [[myObject objectAtIndex:indexPath.row] objectForKey:headTemplate];
    sample = (UILabel *)[cell viewWithTag:2];
    sample.text =  [[myObject objectAtIndex:indexPath.row] objectForKey:sampleTemplate];
    full = (UILabel *)[cell viewWithTag:3];
    
    [full setNumberOfLines:0];
    [full setLineBreakMode:NSLineBreakByWordWrapping];
    full.text =[[myObject objectAtIndex:indexPath.row] objectForKey:fullTemplate];
    return cell;

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [schedule removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
