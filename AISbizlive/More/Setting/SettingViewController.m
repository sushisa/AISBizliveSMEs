//
//  SettingViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 10/22/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "SettingViewController.h"
#import "AISGlobal.h"
#import "SettingPackageCell.h"

@interface SettingViewController ()
{
    NSMutableArray *profiles;
    NSDictionary *listProfile;
    AISAlertView *alertView;
}
@end

@implementation SettingViewController

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
    profiles = [[NSMutableArray alloc] init];
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangague{
    alertView = [[AISAlertView alloc] init];
    self.navigationItem.leftBarButtonItem = [[AISNavigationBarItem alloc] BackButtonWithAction:@selector(backAction) withTarget:self];
    [self.navigationItem setTitle:[AISString commonString:typeTitle KeyOfValue :@"SETTING"]];
    [bathLabel setText:[AISString commonString:typeLabel KeyOfValue :@"BAHT"]];
    [message1Label setText:[AISString commonString:typeLabel KeyOfValue :@"MESSAGE"]];
    [message2Label setText:[AISString commonString:typeLabel KeyOfValue :@"MESSAGE"]];
    [message3Label setText:[AISString commonString:typeLabel KeyOfValue :@"MESSAGE"]];
    [yourBalanceLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SETTING_BALANCE"]];
    [numberSMSLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SETTING_NUMBER"]];
    [usedSMSLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SETTING_USED"]];
    [smsBalanceLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SETTING_SMS"]];
    [yourPackageLabel setText:[AISString commonString:typeLabel KeyOfValue :@"SETTING_PACKAGE"]];
    [changPasswordButton setTitle:[AISString commonString:typeButton KeyOfValue :@"CHANGE_PASS"] forState:UIControlStateNormal];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTextLangague];
    [self callSetting];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        static NSString *CellIdentifier = @"settingPackageList";
        SettingPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        NSDictionary *dict = [profiles objectAtIndex:indexPath.row];
        cell.packageName.text = [dict objectForKey:RES_KEY_SETTING_PACKAGENAME];
    
    cell.expireDate.text = [AISString timeFormat:[dict objectForKey:RES_KEY_SETTING_EXPIREDATE]];
        return cell;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return profiles.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}
-(void)callSetting{
    ServiceST01_SettingProfile *call = [[ServiceST01_SettingProfile alloc] init];
    [call setDelegate:self];
    [call requestService];
}

- (void)settingProfileSuccess:(ProfileDetail *)profileDetail{
    //    *firstname,*lastname,*mobileno,*topupbalance,*totalSMS,*usedSMS,*balanceSMS;
    nameLabel.text= [NSString stringWithFormat:@"%@ %@",[profileDetail firstname],[profileDetail lastname]];
    mobileLabel.text =  [NSString stringWithFormat:@"%@-%@-%@",[[profileDetail mobileno] substringToIndex:2] ,[[[profileDetail mobileno] substringFromIndex:2] substringToIndex:4],[[profileDetail mobileno] substringFromIndex:6] ];
    balanceLabel.text  = [AISString numberFormat:[profileDetail topupbalance]];
    totalSMSLabel.text = [AISString numberFormat:[profileDetail totalSMS]];
    usedLabel.text = [AISString numberFormat:[profileDetail usedSMS]];
    smsbalanceLabel.text = [AISString numberFormat:[profileDetail balanceSMS]];
    
    for (ListPackageDetail *packageList in [profileDetail listPackage]) {
        listProfile = [NSDictionary dictionaryWithObjectsAndKeys:
                       [packageList name],RES_KEY_SETTING_PACKAGENAME,
                       [packageList expiredate],RES_KEY_SETTING_EXPIREDATE,nil] ;
        [profiles addObject:listProfile];
    }
    [packageTable reloadData];
}
- (void)settingProfileError:(ResultStatus *)resultStatus{
    [self alert:[resultStatus responseMessage]];
}



-(void)doneAction:(id)sender{
    [alertView dismissAlertView];
}
-(void)alert:(NSString *)message{
    [alertView withActionLeft:@selector(doneAction:) withActionRight:nil withTarget:self message:message LeftString:[AISString commonString:typeButton KeyOfValue :@"DONE"] RightString:nil];
    [alertView showAlertView];
}
@end
