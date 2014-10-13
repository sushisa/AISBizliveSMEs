//
//  ServiceIN03_TermCondition.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceIN03_TermCondition.h"

@implementation ServiceIN03_TermCondition
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_IN_03_GET_TERM_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate termConditionError:resultStatus];
        return;
    }
    [delegate termConditionSuccess:responseDict[RES_KEY_INFORMATION]];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate termConditionError:nil];
}
@end
