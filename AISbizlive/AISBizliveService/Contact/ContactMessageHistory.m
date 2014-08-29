//
//  ContactMessageHistory.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ContactMessageHistory.h"
#import "BizliveServiceParameter.h"

@implementation ContactMessageHistory
@synthesize sendDate, message;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.sendDate = responseData[RES_KEY_SEND_TIME];
        self.message  = responseData[RES_KEY_MESSAGE];
    }
    return self;
}

@end
