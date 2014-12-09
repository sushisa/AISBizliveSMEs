//
//  ServiceRC02_DeleteSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC02_DeleteSchedule.h"
#import "AISActivity.h"

@implementation ServiceRC02_DeleteSchedule{
    AISActivity *activity;
}

@synthesize delegate;

- (void)setParameterWithIDList:(NSString *)IDschedule  InstanceID:(NSString *)IDInstance;
{
    self.IDschedule = IDschedule;
    self.IDInstance = IDInstance;
}

- (void)requestService
{
    activity = [[AISActivity alloc] init];
//    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_RC_02_DELETE_SCHEDULE_URL];
    NSDictionary *newdict = @{REQ_KEY_SCHEDULE_ID : self.IDschedule,
                              REQ_KEY_SCHEDULE_INSTANCE_ID: self.IDInstance};
    NSDictionary *requestData = @{REQ_KEY_DELETE_SCHEDULE_LIST: [NSArray arrayWithObject:newdict]};
    [super setRequestData:requestData];
    [super setRequestURL:requestURL];
    [super requestService];
    
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
//    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate deleteScheduleError:resultStatus];
        return;
    }
    
    [delegate deleteScheduleSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
//    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate deleteScheduleError:resultStatus];
}



@end
