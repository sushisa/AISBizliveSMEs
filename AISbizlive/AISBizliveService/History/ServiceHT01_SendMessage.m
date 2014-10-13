//
//  ServiceHT01_SendMessage.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceHT01_SendMessage.h"

@implementation ServiceHT01_SendMessage
@synthesize delegate;

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_HT_01_GET_SENDMESSAGE_HISTORY_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate sendMessageError:resultStatus];
        return;
    }
    
    ResponseSendMessage *serviceData = [[ResponseSendMessage alloc] initWithResponseData:responseDict];
    [delegate sendMessageSuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate sendMessageError:nil];
}
@end
