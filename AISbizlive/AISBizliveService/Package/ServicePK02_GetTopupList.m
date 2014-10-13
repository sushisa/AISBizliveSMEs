//
//  ServicePK02_GetTopupList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServicePK02_GetTopupList.h"

@implementation ServicePK02_GetTopupList
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_PK_02_GET_TOPUPLIST_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getTopupError:resultStatus];
        return;
    }
    
    TopupDetail *serviceData = [[TopupDetail alloc] initWithResponseData:responseDict[RES_KEY_TOPUP_LIST]];
    [delegate getTopupSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate getTopupError:nil];
}
@end
