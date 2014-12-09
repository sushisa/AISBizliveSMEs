//
//  ServiceMS01_SendMessage.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceMS01_SendMessage.h"
#import "AISActivity.h"

@implementation ServiceMS01_SendMessage{
    AISActivity *activity;
}

@synthesize delegate;

- (void)setParameterWithMessageForm:(MessageForm *)messageForm
{
    self.messageForm = messageForm;
}

- (void)requestService
{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
      NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_MS_01_SEND_MESSAGE_URL];
    @try {
        [super setRequestData:[self.messageForm getForm]];
        [super setRequestURL:requestURL];
        [super requestService];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate sendMessageError:resultStatus];
        return;
    }
    
    [delegate sendMessageSuccess];
    
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [activity dismissActivity];
    [delegate sendMessageError:resultStatus];
}

@end
