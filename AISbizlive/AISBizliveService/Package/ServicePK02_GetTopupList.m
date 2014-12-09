//
//  ServicePK02_GetTopupList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServicePK02_GetTopupList.h"
#import "AISActivity.h"

@implementation ServicePK02_GetTopupList{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity =[[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_PK_02_GET_TOPUPLIST_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getTopupError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    TopupDetail *serviceData = [[TopupDetail alloc] initWithResponseData:responseData[RES_KEY_TOPUP_LIST]];
    [delegate getTopupSuccess:serviceData];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate getTopupError:resultStatus];
    [activity dismissActivity];
}
@end
