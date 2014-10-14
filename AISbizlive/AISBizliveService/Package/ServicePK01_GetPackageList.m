//
//  ServicePK01_GetPackageList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServicePK01_GetPackageList.h"

@implementation ServicePK01_GetPackageList
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_PK_01_GET_PACKAGELIST_URL];
    
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getPackageError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    PackageDetail *serviceData = [[PackageDetail alloc] initWithResponseData:responseData[RES_KEY_PACKAGE_LIST]];
    [delegate getPackageSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate getPackageError:nil];
}
@end
