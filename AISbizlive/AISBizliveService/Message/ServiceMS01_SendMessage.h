//
//  ServiceMS01_SendMessage.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "MessageForm.h"

@protocol SendMessageDelegate <NSObject>

- (void)sendMessageSuccess;
- (void)sendMessageError:(ResultStatus *)resultStatus;

@end

@interface ServiceMS01_SendMessage : BizliveService

- (void)setParameterWithMessageForm:(MessageForm *)messageForm;

@property (nonatomic, assign)id<SendMessageDelegate> delegate;
@property (nonatomic, strong)MessageForm *messageForm;

@end
