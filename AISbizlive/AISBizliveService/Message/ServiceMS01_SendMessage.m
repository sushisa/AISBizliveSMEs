//
//  ServiceMS01_SendMessage.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/26/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceMS01_SendMessage.h"

@implementation ServiceMS01_SendMessage
@synthesize delegate;

- (void)setParameterWithMessageForm:(MessageForm *)messageForm
{
    self.messageForm = messageForm;
}

- (void)requestService
{
    @try {
        [super setRequestData:[self.messageForm getForm]];
        [super requestService];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [delegate sendMessageSuccess];
    
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate sendMessageError:nil];
}

@end
