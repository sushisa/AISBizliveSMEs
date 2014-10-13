//
//  ResponseSendMessage.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseSendMessage.h"
#import "BizliveServiceParameter.h"

@implementation ResponseSendMessage
- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.sendMessage = [[NSMutableArray alloc] init];
        NSArray *arrSendMessageList = responseData[RES_KEY_SEND_MESSAGE_LIST];
        
        for (NSInteger i = 0; i < [arrSendMessageList count]; i++) {
            SendMessageDetail *list = [[SendMessageDetail alloc]initWithResponseData:arrSendMessageList[i]];
            [self.sendMessage addObject:list];
        }
    }
    return self;
}

@end
