//
//  ServiceNW01_GetNews.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceNW01_GetNews.h"
#import "AISActivity.h"

@implementation ServiceNW01_GetNews{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_NW_01_GET_NEWS_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getNewsError:resultStatus];
        return;
    }
    ResponseGetNews *serviceData = [[ResponseGetNews alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
    [delegate getNewsSuccess:serviceData];
//    [delegate getNewsSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate getNewsError:resultStatus];
    [activity dismissActivity];
}
@end
