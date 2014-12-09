//
//  ServiceMS02_SaveSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceMS02_SaveSchedule.h"
#import "AISActivity.h"

@implementation ServiceMS02_SaveSchedule{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithMessageForm:(MessageForm *)messageForm
{
    _messageForm = messageForm;
}

- (void)requestService
{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_MS_02_SAVE_SCHEDULE_URL];
        [super setRequestData:[_messageForm getForm]];
        [super setRequestURL:requestURL];
        [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate saveScheduleError:resultStatus];
        return;
    }
    
    [delegate saveScheduleSuccess];
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [activity dismissActivity];
    [delegate saveScheduleError:resultStatus];
}
@end
