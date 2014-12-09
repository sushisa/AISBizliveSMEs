//
//  ResponseBalance.m
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseBalance.h"
#import "BizliveServiceParameter.h"

@implementation ResponseBalance
- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.balance = [[NSMutableArray alloc] init];
        NSArray *arrBalanceList = responseData[RES_KEY_HISTORY_BALANCE_LIST];
        
        for (NSInteger i = 0; i < [arrBalanceList count]; i++) {
            BalanceDetail *list = [[BalanceDetail alloc]initWithResponseData:arrBalanceList[i]];
            [self.balance addObject:list];
        }
    }
    return self;
}

@end
