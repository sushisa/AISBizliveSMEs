//
//  ServiceIN01_Help.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceIN01_Help.h"

@implementation ServiceIN01_Help
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_IN_01_GET_HELP_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate helpError:resultStatus];
        return;
    }
    [delegate helpSuccess:responseDict[RES_KEY_INFORMATION]];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate helpError:nil];
}
@end
