//
//  BizliveService.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "BizliveService.h"

#import <startup_sdk/ResponseStatus.h>

@interface BizliveService()

@end

@implementation BizliveService
@synthesize requestData;


- (void)requestService
{
    serviceBizLive = [[ServiceBizLive alloc] init];
    [serviceBizLive setServiceBizLiveDelegate:self];
    [serviceBizLive setBizLiveURL:self.requestURL];
    [serviceBizLive setRequestDict:[self getRequestData:self.requestData]];
    [serviceBizLive fungusRequest];
    
}



- (NSDictionary *)getRequestData:(NSDictionary *)request
{
    NSMutableDictionary *requestParam = [[NSMutableDictionary alloc] init];
    [requestParam setValue:@"1" forKey:REQ_KEY_USER_TOKEN_ID];
    [requestParam setValue:@"0815678910" forKey:REQ_KEY_USER_MOBILE_NO];
    [requestParam setValue:@"TH" forKey:REQ_KEY_LANGUAGE];
    [requestParam setValue:@"AIS" forKey:REQ_KEY_OPERATOR_TYPE];
    
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
    [requestDict setObject:requestParam forKey:REQ_KEY_REQUEST_PARAM];
    
    if (request) {
        [requestDict setValue:request forKey:REQ_KEY_REQUEST_DATA];
    }
    
    return requestDict;
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict{};
- (void)serviceBizLiveError:(ResponseStatus *)status{};

@end
