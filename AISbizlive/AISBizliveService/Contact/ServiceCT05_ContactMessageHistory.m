//
//  ServiceCT05_ContactMessageHistory.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT05_ContactMessageHistory.h"

@implementation ServiceCT05_ContactMessageHistory
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID
{
    self.ID = ID;
}

- (void)requestService
{
    if (!self.ID) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate contactMessageHistoryError:resultStatus];
        return;
    }
    [super setRequestDict:@{REQ_KEY_CONTACT_ID : self.ID}];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *history1 = @{RES_KEY_SEND_TIME : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello World!"};
        NSDictionary *history2 = @{RES_KEY_SEND_TIME : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello Promptnow!"};
        NSDictionary *history3 = @{RES_KEY_SEND_TIME : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello AIS!"};
        
        NSArray *arrHistory = @[history1, history2, history3];
        
        responseData = @{RES_KEY_CONTACT_HISTORY_LIST: arrHistory};
    }
    
    ResponseContactMessageHistory *historyList = [[ResponseContactMessageHistory alloc] initWithResponseData:responseData];
    [delegate contactMessageHistorySuccess:historyList];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate contactMessageHistoryError:result];
}



@end
