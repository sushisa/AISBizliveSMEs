//
//  TopupDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TopupDetail.h"
#import "BizliveServiceParameter.h"

@implementation TopupDetail
@synthesize channel,date,amount,mobileno;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        
        self.channel = responseData[RES_KEY_SEND_MESSAGE_MESSAGE];
        self.date = responseData[RES_KEY_SEND_MESSAGE_DATE];
        self.amount = responseData[RES_KEY_SEND_MESSAGE_SUCCESSED];
        self.mobileno = responseData[RES_KEY_SEND_MESSAGE_FAILED];
        
    }
    return self;
}
@end
