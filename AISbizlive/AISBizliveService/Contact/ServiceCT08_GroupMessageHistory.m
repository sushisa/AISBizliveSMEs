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
    NSDictionary *requestDict  = @{REQ_KEY_CONTACT_ID: self.ID};
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *history = @{RES_KEY_SEND_TIME : @"14032014102051",
                                   RES_KEY_MESSAGE   : @"Hello World!"};
        
        NSArray *arrHistory = @[history];
        
        responseData = @{RES_KEY_CONTACT_HISTORY_LIST: arrHistory};
    }
    
    ResponseContactMessageHistory *historyList = [[ResponseContactMessageHistory alloc] initWithResponseData:responseData];
    [delegate groupMessageHistorySuccess:historyList];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate groupMessageHistoryError:result];
}


@end
