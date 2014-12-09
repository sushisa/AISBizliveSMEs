//
//  SettingViewController.m
//  AISbizlive
//
//  Created by Wachirawit on 5/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "Setting2ViewController.h"
#import "AISGlobal.h"
#import "SettingPackageCell.h"
#define NUMBER_OF_STATIC_CELLS  4
@interface Setting2ViewController ()
{
    NSMutableArray *profiles;
    NSDictionary *listProfile;
}
@end

@implementation Setting2ViewController

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
//    NSLog(@"%@",list.testString);
    profiles = [[NSMutableArray alloc] init];
    [self setTextLangague];
}
-(void)backAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setTextLangague{
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
//    NSLog(@"%@",tableView);
    if (tableView == packageTable) {
        NSLog(@"%d",indexPath.row);
//        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];

    static NSString *CellIdentifier = @"settingPackageList";
    SettingPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[SettingPackageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.packageName.text = [NSString stringWithFormat:@"%d", indexPath.row];
//    NSDictionary *dict = [profiles objectAtIndex:indexPath.row];
//    cell.packageName.text = [dict objectForKey:RES_KEY_SETTING_PACKAGENAME];
//    
//        cell.expireDate.text = [dict objectForKey:RES_KEY_SETTING_EXPIREDATE];
        return cell;
    }
    else{
        UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == packageTable)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%@",tableView);
    if (tableView == packageTable) {
        if (section == 1)
        {
            if (profiles.count != 0) {
                return profiles.count;
            }
            return 0;
        }
    }
    else{
        if (section == 0)
        {
            return [super tableView:tableView numberOfRowsInSection:section];
        }
    }
    return 0;
}
-(void)callSetting{
    ServiceST01_SettingProfile *call = [[ServiceST01_SettingProfile alloc] init];
    [call setDelegate:self];
    [call requestService];
}

- (void)settingProfileSuccess:(ProfileDetail *)profileDetail{
    //    *firstname,*lastname,*mobileno,*topupbalance,*totalSMS,*usedSMS,*balanceSMS;
    nameLabel.text= [NSString stringWithFormat:@"%@ %@",[profileDetail firstname],[profileDetail lastname]];
    
    mobileLabel.text = [NSString stringWithFormat:@"%@-%@-%@",[[profileDetail mobileno] substringToIndex:2] ,[[[profileDetail mobileno] substringFromIndex:2] substringToIndex:4],[[profileDetail mobileno] substringFromIndex:6] ];
    balanceLabel.text  = [profileDetail topupbalance];
    totalSMSLabel.text = [profileDetail totalSMS];
    usedLabel.text = [profileDetail usedSMS];
   smsbalanceLabel.text = [profileDetail balanceSMS];
    
    for (ListPackageDetail *packageList in [profileDetail listPackage]) {
        listProfile = [NSDictionary dictionaryWithObjectsAndKeys:
                       [packageList name],RES_KEY_SETTING_PACKAGENAME,
                       [packageList expiredate],RES_KEY_SETTING_EXPIREDATE,nil] ;
        [profiles addObject:listProfile];
    }
    [myTable reloadData];
    [packageTable reloadData];
}
- (void)settingProfileError:(ResultStatus *)resultStatus{
    
}
@end
