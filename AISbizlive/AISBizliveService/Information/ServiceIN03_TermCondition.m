//
//  ServiceIN03_TermCondition.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceIN03_TermCondition.h"
#import "AISActivity.h"

@implementation ServiceIN03_TermCondition{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_IN_03_GET_TERM_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate termConditionError:resultStatus];
        return;
    }
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    [delegate termConditionSuccess:responseData[RES_KEY_INFORMATION]];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate termConditionError:resultStatus];
    [activity dismissActivity];
}
@end
