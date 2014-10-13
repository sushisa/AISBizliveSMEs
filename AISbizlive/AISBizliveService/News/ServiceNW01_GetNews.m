//
//  ServiceNW01_GetNews.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceNW01_GetNews.h"

@implementation ServiceNW01_GetNews
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_NW_01_GET_NEWS_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getNewsError:resultStatus];
        return;
    }
    [delegate getNewsSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate getNewsError:nil];
}
@end
