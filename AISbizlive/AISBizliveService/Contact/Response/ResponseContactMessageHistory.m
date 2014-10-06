//
//  ResponseContactMessageHistory.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ResponseContactMessageHistory.h"
#import "BizliveServiceParameter.h"

@implementation ResponseContactMessageHistory

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.historyList = [[NSMutableArray alloc] init];
        NSArray *arrHistory = responseData[RES_KEY_CONTACT_HISTORY_LIST];
        
        for (NSInteger i = 0; i < [arrHistory count]; i++) {
            ContactMessageHistory *history = [[ContactMessageHistory alloc] initWithResponseData:arrHistory[i]];
            [self.historyList addObject:history];
        }
        
    }
    return self;
}

@end
