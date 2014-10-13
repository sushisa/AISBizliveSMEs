//
//  ServiceHT01_SendMessage.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
#import "ResponseSendMessage.h"
@protocol SendMessageDelegate <NSObject>

- (void)sendMessageSuccess:(ResponseSendMessage *)responseSendMessage;
- (void)sendMessageError:(ResultStatus *)resultStatus;

@end

@interface ServiceHT01_SendMessage : BizliveService
@property (nonatomic, assign)id<SendMessageDelegate> delegate;

@end
