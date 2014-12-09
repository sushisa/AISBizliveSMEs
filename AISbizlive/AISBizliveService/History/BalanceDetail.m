//
//  BalanceDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "BalanceDetail.h"
#import "BizliveServiceParameter.h"

@implementation BalanceDetail
@synthesize name,date,amount,status;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        
        self.name = responseData[RES_KEY_HISTORY_BALANCE_NAME];
        self.date = responseData[RES_KEY_HISTORY_BALANCE_DATE];
        self.amount = responseData[RES_KEY_HISTORY_BALANCE_AMOUNT];
        self.status = responseData[RES_KEY_HISTORY_BALANCE_STATUS];
        
    }
    return self;
}

@end
