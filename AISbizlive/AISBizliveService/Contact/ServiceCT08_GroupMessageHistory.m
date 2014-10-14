//
//  ServiceCT08_GroupMessageHistory.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT08_GroupMessageHistory.h"


@implementation ServiceCT08_GroupMessageHistory
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID
{
    self.ID = ID;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_08_GROUP_MESSAGE_HISTORY_URL];
    
    if (!self.ID) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate groupMessageHistoryError:resultStatus];
        return;
    }
    
    NSDictionary *requestDict  = @{REQ_KEY_CONTACT_ID: self.ID};
    
    [super setRequestData:requestDict];
    [super setRequestURL:requestURL];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        NSDictionary *history = @{RES_KEY_SEND_TIME : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello World!"};
        
        NSArray *arrHistory = @[history];
        
        responseDict = @{RES_KEY_CONTACT_HISTORY_LIST: arrHistory};
    }
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate groupMessageHistoryError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseContactMessageHistory *historyList = [[ResponseContactMessageHistory alloc] initWithResponseData:responseData];
    [delegate groupMessageHistorySuccess:historyList];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate groupMessageHistoryError:nil];
}


@end
