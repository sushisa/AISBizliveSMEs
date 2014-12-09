//
//  ServiceRC03_UpdateSchedule.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "RecurringForm.h"

@protocol UpdateScheduleDelegate <NSObject>

- (void)updateScheduleSuccess;
- (void)updateScheduleError:(ResultStatus *)resultStatus;

@end

@interface ServiceRC03_UpdateSchedule : BizliveService

- (void)setParameter:(RecurringForm *)recurringForm;

@property (nonatomic, assign)id<UpdateScheduleDelegate> delegate;

@property (nonatomic, strong)RecurringForm *recurringForm;

@end
