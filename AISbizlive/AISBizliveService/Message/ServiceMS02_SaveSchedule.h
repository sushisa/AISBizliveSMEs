//
//  ServiceMS02_SaveSchedule.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "MessageForm.h"

@protocol SaveScheduleDelegate <NSObject>

- (void)saveScheduleSuccess;
- (void)saveScheduleError:(ResultStatus *)resultStatus;

@end

@interface ServiceMS02_SaveSchedule : BizliveService
{
    @private
    MessageForm *_messageForm;
}

- (void)setParameterWithMessageForm:(MessageForm *)messageForm;

@property (nonatomic, assign)id<SaveScheduleDelegate> delegate;

@end
