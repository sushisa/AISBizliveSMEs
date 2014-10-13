//
//  CashcardDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "CashcardDetail.h"
#import "BizliveServiceParameter.h"
@implementation CashcardDetail

@synthesize topupBalance;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.topupBalance = responseData[RES_KEY_CASHCARD_TOPUPBALANCE];
    }
    return self;
}

- (id)initWithCashcardDetail:(NSArray*)CashcardDetail
{
    self = [super init];
    if (self) {
        self.topupBalance = CashcardDetail[0];
    }
    return self;
}

@end
