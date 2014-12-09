//
//  ServiceHT02_Topup.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceHT02_Topup.h"
#import "AISActivity.h"

@implementation ServiceHT02_Topup{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_HT_02_GET_TOPUP_HISTORY_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate topupError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseTopup *serviceData = [[ResponseTopup alloc] initWithResponseData:responseData];
    [delegate topupSuccess:serviceData];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate topupError:resultStatus];
    [activity dismissActivity];
}
@end
