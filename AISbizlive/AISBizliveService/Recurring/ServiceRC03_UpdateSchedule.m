//
//  ServiceRC03_UpdateSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC03_UpdateSchedule.h"

@implementation ServiceRC03_UpdateSchedule
@synthesize delegate;

- (void)setParameter:(MessageForm *)messageForm
{
    self.messageForm = messageForm;
}

- (void)requestService
{
    [super setRequestDict:[self.messageForm getForm]];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate updateScheduleSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate updateScheduleError:result];
}

@end
