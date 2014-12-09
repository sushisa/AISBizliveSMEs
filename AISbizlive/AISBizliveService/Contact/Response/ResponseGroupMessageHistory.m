//
//  ResponseGroupMessageHistory.m
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseGroupMessageHistory.h"
#import "BizliveServiceParameter.h"

@implementation ResponseGroupMessageHistory

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.historyList = [[NSMutableArray alloc] init];
        NSArray *arrHistory = responseData[RES_KEY_GROUP_HISTORY_LIST];
        
        for (NSInteger i = 0; i < [arrHistory count]; i++) {
            ContactMessageHistory *history = [[ContactMessageHistory alloc] initWithResponseData:arrHistory[i]];
            [self.historyList addObject:history];
        }
        
    }
    return self;
}
@end
