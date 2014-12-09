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
        self.photo = responseData[RES_KEY_SETTING_PHOTOPATH];
        self.mobileno = responseData[RES_KEY_SETTING_MOBILENO];
        self.topupbalance = responseData[RES_KEY_SETTING_TOPUPBALANCE];
        self.totalSMS = responseData[RES_KEY_SETTING_TOTALSMS];
        self.usedSMS = responseData[RES_KEY_SETTING_USEDSMS];
        self.balanceSMS = responseData[RES_KEY_SETTING_BALANCESMS];
            ResponseListPackage *packageList = [[ResponseListPackage alloc] initWithResponseData:responseData];
            self.listPackage = [packageList listPackage];
        
    }
    return self;
}

@end
