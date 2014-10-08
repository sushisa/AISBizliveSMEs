//
//  ServiceRC02_DeleteSchedule.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceRC02_DeleteSchedule.h"

@implementation ServiceRC02_DeleteSchedule

@synthesize delegate;

- (void)setParameterWithIDList:(NSArray *)IDList
{
    self.IDList = IDList;
}

- (void)requestService
{
    NSMutableArray *messageIDArray = [NSMutableArray array];
    
    for (NSString *messageID in self.IDList)
    {
        NSDictionary *messageIDDict = @{REQ_KEY_MESSAGE_ID: messageID};
        [messageIDArray addObject:messageIDDict];
    }
    
    NSDictionary *requestData = @{REQ_KEY_RECURRING_LIST: messageIDArray};
    
    [super setRequestData:requestData];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate deleteScheduleSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate deleteScheduleError:result];
}



@end
