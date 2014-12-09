//
//  ServiceTP02_GetTemplateList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceTP02_GetTemplateList.h"
//#import "AISActivity.h"


@implementation ServiceTP02_GetTemplateList{
//    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    
//    activity = [[AISActivity alloc] init];
//    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_TP_02_GET_TEMPLATELIST_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
//    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getTemplateListError:resultStatus];
        return;
    }
    
    ResponseGetTemplateList *serviceData = [[ResponseGetTemplateList alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
    [delegate getTemplateListSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
//    [activity dismissActivity];
    [delegate getTemplateListError:resultStatus];
}

@end
