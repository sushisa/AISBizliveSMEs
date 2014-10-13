//
//  SendMessageDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "SendMessageDetail.h"
#import "BizliveServiceParameter.h"

@implementation SendMessageDetail
@synthesize message,senddate,successed,failed;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        
        self.message = responseData[RES_KEY_SEND_MESSAGE_MESSAGE];
        self.senddate = responseData[RES_KEY_SEND_MESSAGE_DATE];
        self.successed = responseData[RES_KEY_SEND_MESSAGE_SUCCESSED];
        self.failed = responseData[RES_KEY_SEND_MESSAGE_FAILED];
        
    }
    return self;
}

@end
