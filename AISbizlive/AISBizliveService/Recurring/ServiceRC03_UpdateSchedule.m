//
//  ServiceRC03_UpdateSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC03_UpdateSchedule.h"
#import "AISActivity.h"
@implementation ServiceRC03_UpdateSchedule{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameter:(RecurringForm *)recurringForm
{
    self.recurringForm = recurringForm;
}

- (void)requestService
{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_RC_03_EDIT_SCHEDULE_URL];
    [super setRequestData:[self.recurringForm getForm]];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate updateScheduleError:resultStatus];
        return;
    }
    
    [delegate updateScheduleSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate updateScheduleError:resultStatus];
}
@end
