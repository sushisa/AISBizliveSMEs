//
//  TopupDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "HistoryTopupDetail.h"
#import "BizliveServiceParameter.h"

@implementation HistoryTopupDetail
@synthesize channel,date,amount,mobileno;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        
        self.channel = responseData[RES_KEY_HISTORY_TOPUP_CHANNEL];
        self.date = responseData[RES_KEY_HISTORY_TOPUP_DATE];
        self.amount = responseData[RES_KEY_HISTORY_TOPUP_AMOUNT];
        self.mobileno = responseData[RES_KEY_HISTORY_TOPUP_MOBILENO];
        
    }
    return self;
}
@end
