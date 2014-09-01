//
//  TestMessage.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TestMessage.h"

#import "ServiceMS01_SendMessage.h"
#import "MessageForm.h"

@interface TestMessage() <SendMessageDelegate>
@end

@implementation TestMessage

- (void)serviceMS01_SendMessage
{
    MessageForm *messageForm = [MessageForm new];
    [messageForm setMessage:@"Hello World"];
    [messageForm setTimeExpire:@"1"];
    [messageForm setSendType:@"1"];
    [messageForm setGroupIDList:@[@"111",@"222",@"333"]];
    //[messageForm setContactIDList:@[@"111",@"222",@"333"]];
    [messageForm setMobileNOList:@[@"089XXXXXXX",@"089XXXXXXX"]];
    [messageForm setSendMessageType:SEND_TYPE_IMMEDIATELY];
    
    
    ServiceMS01_SendMessage *service = [ServiceMS01_SendMessage new];
    [service setDelegate:self];
    [service setMessageForm:messageForm];
    [service requestService];
}

- (void)sendMessageSuccess
{
    
}
- (void)sendMessageError:(ResultStatus *)resultStatus
{
    
}

@end
