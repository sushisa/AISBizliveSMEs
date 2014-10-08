//
//  TestRecurring.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/28/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "TestRecurring.h"

#import "ServiceRC01_GetScheduleList.h"
#import "ServiceRC02_DeleteSchedule.h"
#import "ServiceRC03_UpdateSchedule.h"

@interface TestRecurring() <GetScheduleListDelegate, DeleteScheduleDelegate, UpdateScheduleDelegate>
@end

@implementation TestRecurring

#pragma mark - ServiceRC01_GetScheduleList
- (void)serviceRC01_GetScheduleList
{
    ServiceRC01_GetScheduleList *service = [ServiceRC01_GetScheduleList new];
    [service setDelegate:self];
    [service requestService];
}

- (void)getScheduleListSuccess:(MessageForm *)messageForm
{
    NSLog(@"messageId = %@\n", [messageForm messageID]);
    NSLog(@"message = %@\n", [messageForm message]);
    NSLog(@"timeExpire = %@\n", [messageForm timeExpire]);
    NSLog(@"sendType = %@\n", [messageForm sendType]);
    
    for (NSString *groupID in [messageForm groupIDList]) {
        NSLog(@"  groupIDList = %@\n", groupID);
    }
    
    for (NSString *contactID in [messageForm contactIDList]) {
        NSLog(@"  contactID = %@\n", contactID);
    }
    
    for (NSString *mobileNO in [messageForm mobileNOList]) {
        NSLog(@"  MobileNO = %@\n", mobileNO);
    }
    
    NSLog(@"startDate = %@\n", [messageForm startDate]);
    NSLog(@"endDate = %@\n", [messageForm endDate]);
    NSLog(@"sendTime = %@\n", [messageForm sendTime]);
    
    NSLog(@"recurringType = %@\n", [messageForm recurringType]);
    
    for (NSString *dayOfMonth in [messageForm weeklyList]) {
        NSLog(@"   dayOfMonth = %@\n", dayOfMonth);
    }
    
    for (NSString *day in [messageForm monthlyList]) {
        NSLog(@"   day = %@\n", day);
    }
    
    
    
}
- (void)getScheduleListError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceRC02_DeleteSchedule

- (void)serviceRC02_DeleteSchedule
{
    ServiceRC02_DeleteSchedule *service = [ServiceRC02_DeleteSchedule new];
    [service setDelegate:self];
    [service setParameterWithIDList:@[@"111",@"222"]];
    [service requestService];
}

- (void)deleteScheduleSuccess
{
    
}
- (void)deleteScheduleError:(ResultStatus *)resultStatus
{
    
}
#pragma mark - ServiceRC03_UpdateSchedule

- (void)serviceRC03_UpdateSchedule
{
    ServiceRC03_UpdateSchedule *service = [ServiceRC03_UpdateSchedule new];
    [service setDelegate:self];
    MessageForm *messageForm = [MessageForm new];
    [service setMessageForm:messageForm];
    [service requestService];
}

- (void)updateScheduleSuccess
{
    
}
- (void)updateScheduleError:(ResultStatus *)resultStatus
{
    
}

@end
