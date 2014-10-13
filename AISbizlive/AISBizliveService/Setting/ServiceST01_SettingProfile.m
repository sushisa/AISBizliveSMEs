//
//  ServiceST01_SettingProfile.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceST01_SettingProfile.h"

@implementation ServiceST01_SettingProfile
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_ST_01_SETTING_PROFILE_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate settingProfileError:resultStatus];
        return;
    }
    
    ResponseSettingProfile *serviceData = [[ResponseSettingProfile alloc] initWithResponseData:responseDict];
    [delegate settingProfileSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate settingProfileError:nil];
}
@end
