//
//  ServiceHT01_SendMessage.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceHT01_SendMessage.h"
#import "AISActivity.h"

@implementation ServiceHT01_SendMessage{
    AISActivity *activity;
}
@synthesize delegate;

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_HT_01_GET_SENDMESSAGE_HISTORY_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate sendMessageHistoryError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseSendMessage *serviceData = [[ResponseSendMessage alloc] initWithResponseData:responseData];
    [delegate sendMessageHistorySuccess:serviceData];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate sendMessageHistoryError:resultStatus];
    [activity dismissActivity];
}
@end
