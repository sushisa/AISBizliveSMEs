//
//  MoresViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/28/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "MoresViewController.h"
#import "AISGlobal.h"
@interface MoresViewController ()

@end

@implementation MoresViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    [self selectMoreCell];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTextLangague];
    [self selectMoreCell];
    [self.tabBarController setSelectedIndex:0];
}
-(void)setTextLangague{
    
    self.tabBarController.tabBar.hidden = NO;
    self.title = [AISString commonString:typeTitle KeyOfValue :@"MORE"];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"MORE"]];
    settingLabel.text =[AISString commonString:typeTitle KeyOfValue :@"SETTING"];
    [settingLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    addContactLabel.text =[AISString commonString:typeTitle KeyOfValue :@"ADDCONTACT"];
    [addContactLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    newsLabel.text =[AISString commonString:typeTitle KeyOfValue :@"NEWS"];
    [newsLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    scheduleLabel.text =[AISString commonString:typeTitle KeyOfValue :@"SCHEDULE"];
    [scheduleLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    historyLabel.text =[AISString commonString:typeTitle KeyOfValue :@"HISTORY"];
    [historyLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    topupLabel.text =[AISString commonString:typeTitle KeyOfValue :@"TOPUP"];
    [topupLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    importLabel.text =[AISString commonString:typeTitle KeyOfValue :@"IMPORTCONTACT"];
    [importLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    informationLabel.text =[AISString commonString:typeTitle KeyOfValue :@"INFORMATION"];
    [informationLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    templateLabel.text =[AISString commonString:typeTitle KeyOfValue :@"TEMPLATE"];
    [templateLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
    logoutLabel.text =[AISString commonString:typeTitle KeyOfValue :@"LOGOUT"];
    [logoutLabel setFont:[FontUtil fontWithFontSize:eFontSizeNormal]];
}
-(void)selectMoreCell{
    //Setting
    UITapGestureRecognizer *settingTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(settingSelect:)];
    [settingTap setNumberOfTouchesRequired:1];
    [settingView addGestureRecognizer:settingTap];
    //Add Contact
    UITapGestureRecognizer *addContactTap = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self
                                          action: @selector(addContactSelect:)];
    [addContactTap setNumberOfTouchesRequired:1];
    [addContactView addGestureRecognizer:addContactTap];
    //News
    UITapGestureRecognizer *newsTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self
                                             action: @selector(newsSelect:)];
    [newsTap setNumberOfTouchesRequired:1];
    [newsView addGestureRecognizer:newsTap];
    //Schedule
    UITapGestureRecognizer *scheduleTap = [[UITapGestureRecognizer alloc]
                                       initWithTarget: self
                                       action: @selector(scheduleSelect:)];
    [scheduleTap setNumberOfTouchesRequired:1];
    [scheduleView addGestureRecognizer:scheduleTap];
    
    //History
    UITapGestureRecognizer *historyTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(historySelect:)];
    [historyTap setNumberOfTouchesRequired:1];
    [historyView addGestureRecognizer:historyTap];
    
    //Topup
    UITapGestureRecognizer *topupTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(topupSelect:)];
    [topupTap setNumberOfTouchesRequired:1];
    [topupView addGestureRecognizer:topupTap];
    
    //Import
    UITapGestureRecognizer *importTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(importSelect:)];
    [importTap setNumberOfTouchesRequired:1];
    [importView addGestureRecognizer:importTap];
    
    //Information
    UITapGestureRecognizer *informationTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(informationSelect:)];
    [informationTap setNumberOfTouchesRequired:1];
    [informationView addGestureRecognizer:informationTap];
    
    //Template
    UITapGestureRecognizer *templateTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(templateSelect:)];
    [templateTap setNumberOfTouchesRequired:1];
    [templateView addGestureRecognizer:templateTap];
    
    //Logout
    UITapGestureRecognizer *logoutTap = [[UITapGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(logoutSelect:)];
    [logoutTap setNumberOfTouchesRequired:1];
    [logoutView addGestureRecognizer:logoutTap];
}
-(void)settingSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"setting" sender:self];
}
-(void)addContactSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"addcontact" sender:self];
}
-(void)newsSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"news" sender:self];
}
-(void)scheduleSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"schedule" sender:self];
}
-(void)historySelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"history" sender:self];
}
-(void)topupSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"topup" sender:self];
}
-(void)importSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"import" sender:self];
}
-(void)informationSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"information" sender:self];
}
-(void)templateSelect :(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"template" sender:self];
}
-(void)logoutSelect :(UITapGestureRecognizer *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
