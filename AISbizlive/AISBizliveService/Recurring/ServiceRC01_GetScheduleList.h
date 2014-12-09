//
//  ServiceRC01_GetScheduleList.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "RecurringForm.h"

@protocol GetScheduleListDelegate <NSObject>

- (void)getScheduleListSuccess:(NSArray *)scheduleList;
- (void)getScheduleListError:(ResultStatus *)resultStatus;

@end

@interface ServiceRC01_GetScheduleList : BizliveService

@property (nonatomic, assign)id<GetScheduleListDelegate> delegate;

@end
