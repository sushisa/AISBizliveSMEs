//
//  ServiceIN04_About.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceIN04_About.h"

@implementation ServiceIN04_About
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_IN_04_GET_ABOUT_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate aboutError:resultStatus];
        return;
    }
    [delegate aboutSuccess:responseDict[RES_KEY_INFORMATION]];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate aboutError:nil];
}
@end
