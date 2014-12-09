//
//  ServiceST01_SettingProfile.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceST01_SettingProfile.h"
#import "AISActivity.h"

@implementation ServiceST01_SettingProfile{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_ST_01_SETTING_PROFILE_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate settingProfileError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ProfileDetail *serviceData = [[ProfileDetail alloc] initWithResponseData:responseData];
    [delegate settingProfileSuccess:serviceData];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate settingProfileError:resultStatus];
    [activity dismissActivity];
}
@end
