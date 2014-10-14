//
//  ServiceIN02_Privacy.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceIN02_Privacy.h"

@implementation ServiceIN02_Privacy
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_IN_02_GET_PRIVACY_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate privacyError:resultStatus];
        return;
    }
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    [delegate privacySuccess:responseData[RES_KEY_INFORMATION]];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate privacyError:nil];
}
@end
