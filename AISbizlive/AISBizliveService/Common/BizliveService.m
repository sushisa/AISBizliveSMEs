//
//  BizliveService.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "BizliveService.h"

//#import <startup_sdk/ServiceBizLive.h>


#import <startup_sdk/ResponseStatus.h>
#import <startup_sdk/ServiceBizLive.h>
@interface BizliveService()<ServiceBizLiveDelegate>
@end

@implementation BizliveService
@synthesize requestDict;


- (void)requestService
{
    
    ServiceBizLive *service = [[ServiceBizLive alloc] init];
    
    @try {
        [service setDelegate:self];
        [service setBizLiveURL:@""];
        [service setRequestDict:[self getRequestData]];
        [service fungusRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    @try {
        ResultStatus *result = [[ResultStatus alloc] initWithResponse:responseDict];
        
        if ([result isResponseSuccess]) {
            @try {
                [self bizliveServiceSuccess:[result responseData]];
            }
            @catch (NSException *exception) {
                NSLog(@"%@",exception);
            }
        }
        else
            [self bizliveServiceError:result];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *result = [[ResultStatus alloc] initWithResponseStatus:status];
    [self bizliveServiceError:result];
}


- (NSDictionary *)getRequestData
{
    return [self getRequestData:requestDict];
}

- (NSDictionary *)getRequestData:(NSDictionary *)requestData
{
    NSMutableDictionary *requestParam = [[NSMutableDictionary alloc] init];
    [requestParam setValue:nil forKey:REQ_KEY_USER_TOKEN_ID];
    [requestParam setValue:nil forKey:REQ_KEY_USER_MOBILE_NO];
    [requestParam setValue:@"TH" forKey:REQ_KEY_LANGUAGE];
    [requestParam setValue:@"AIS" forKey:REQ_KEY_OPERATOR_TYPE];
    
    NSMutableDictionary *request = [[NSMutableDictionary alloc] init];
    [request setObject:requestParam forKey:REQ_KEY_REQUEST_PARAM];
    
    if (requestData) {
        [request setValue:requestData forKey:REQ_KEY_REQUEST_DATA];
    }
    
    return request;
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData{}
- (void)bizliveServiceError:(ResultStatus *)result;{}
@end
