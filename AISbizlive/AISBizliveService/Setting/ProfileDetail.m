//
//  ProfileDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ProfileDetail.h"
#import "BizliveServiceParameter.h"
@implementation ProfileDetail

@synthesize firstname,lastname,mobileno,topupbalance,totalSMS,usedSMS,balanceSMS,listPackage;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.firstname = responseData[RES_KEY_SETTING_FIRSTNAME];
        self.lastname = responseData[RES_KEY_SETTING_LASTNAME];
        self.mobileno = responseData[RES_KEY_SETTING_MOBILENO];
        self.topupbalance = responseData[RES_KEY_SETTING_TOPUPBALANCE];
        self.totalSMS = responseData[RES_KEY_SETTING_TOTALSMS];
        self.usedSMS = responseData[RES_KEY_SETTING_USEDSMS];
        self.balanceSMS = responseData[RES_KEY_SETTING_BALANCESMS];
        
        NSArray * listsPackage = responseData[RES_KEY_SETTING_LISTPACKAGE];
        for (NSInteger i = 0; i < [listsPackage count]; i++) {
            NSDictionary *package = listsPackage[i];
            
            //            group = group[res_key_contact_]
            ResponseListPackage *packageList = [[ResponseListPackage alloc] initWithResponseData:package];
            self.listPackage = [packageList listPackage];
        }
        
    }
    return self;
}

@end
