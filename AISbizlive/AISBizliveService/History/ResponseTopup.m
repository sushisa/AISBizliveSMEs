//
//  ResponseTopup.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseTopup.h"

#import "BizliveServiceParameter.h"

@implementation ResponseTopup
- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.topup = [[NSMutableArray alloc] init];
        NSArray *arrSendMessageList = responseData[RES_KEY_HISTORY_TOPUP_LIST];
        
        for (NSInteger i = 0; i < [arrSendMessageList count]; i++) {
            HistoryTopupDetail *list = [[HistoryTopupDetail alloc]initWithResponseData:arrSendMessageList[i]];
            [self.topup addObject:list];
        }
    }
    return self;
}

@end
