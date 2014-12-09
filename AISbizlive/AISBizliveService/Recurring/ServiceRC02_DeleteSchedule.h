//
//  ServiceRC02_DeleteSchedule.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol DeleteScheduleDelegate <NSObject>

- (void)deleteScheduleSuccess;
- (void)deleteScheduleError:(ResultStatus *)resultStatus;

@end

@interface ServiceRC02_DeleteSchedule : BizliveService

- (void)setParameterWithIDList:(NSString *)IDschedule InstanceID:(NSString *)IDInstance;

@property (nonatomic, assign) id<DeleteScheduleDelegate> delegate;
@property (nonatomic, strong) NSString *IDschedule;
@property (nonatomic, strong) NSString *IDInstance;

@end
