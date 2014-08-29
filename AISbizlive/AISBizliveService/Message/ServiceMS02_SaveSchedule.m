//
//  ServiceMS02_SaveSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceMS02_SaveSchedule.h"


@implementation ServiceMS02_SaveSchedule
@synthesize delegate;

- (void)setParameterWithMessageForm:(MessageForm *)messageForm
{
    _messageForm = messageForm;
}

- (void)requestService
{
    [super setRequestDict:[_messageForm getForm]];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate saveScheduleSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate saveScheduleError:result];
}
@end
