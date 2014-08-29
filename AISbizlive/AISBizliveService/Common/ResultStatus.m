//
//  ResultStatus.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResultStatus.h"
#import "BizliveServiceParameter.h"
#import "BizliveServiceCode.h"


@implementation ResultStatus


- (id)initWithResponse:(NSDictionary *)response
{
    self = [super init];
    if (self) {
        NSDictionary *responseStatus = [response objectForKey:RES_KEY_RESPONSE_STATUS];
        self.responseCode = [responseStatus objectForKey:RES_KEY_RESPONSE_CODE];
        self.responseMessage = [responseStatus objectForKey:RES_KEY_RESPONSE_MESSAGE];
        
        if ([self isResponseSuccess]) {
            @try {
                self.responseData = [response objectForKey:RES_KEY_RESPONSE_DATA];
            }
            @catch (NSException *exception) {
                self.responseData = nil;
                NSLog(@"%@",exception);
            }
        }
        
        
    }
    return self;
}

- (id)initWithResponseStatus:(ResponseStatus *)responseStatus
{
    self = [super init];
    if (self) {
        self.responseCode = [NSString stringWithFormat:@"%d",[responseStatus getStatusCode]];
        self.responseMessage = [responseStatus getDescription];
    }
    return self;
}


- (BOOL)isResponseSuccess
{
    return YES;
    //return [self.responseCode isEqualToString:[BizliveServiceCode getCode:SUCCESS]] ;
}
@end
