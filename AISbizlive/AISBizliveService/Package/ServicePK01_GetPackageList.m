//
//  ServicePK01_GetPackageList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServicePK01_GetPackageList.h"
#import "AISActivity.h"

@implementation ServicePK01_GetPackageList{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_PK_01_GET_PACKAGELIST_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getPackageError:resultStatus];
        return;
    }
    
//    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseGetPackageList *serviceData = [[ResponseGetPackageList alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
    [delegate getPackageSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate getPackageError:resultStatus];
    [activity dismissActivity];
}
@end
