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
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_05_CONTACT_MESSAGE_HISTORY_URL];
    
    if (!self.ID) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate contactMessageHistoryError:resultStatus];
        return;
    }
    NSDictionary *requestData = @{REQ_KEY_CONTACT_ID : self.ID};
    [super setRequestURL:requestURL];
    [super setRequestData:requestData];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        NSDictionary *history1 = @{RES_KEY_MESSAGE_SEND_DATE : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello World!"};
        NSDictionary *history2 = @{RES_KEY_MESSAGE_SEND_DATE : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello Promptnow!"};
        NSDictionary *history3 = @{RES_KEY_MESSAGE_SEND_DATE : @"1403773133605",
                                   RES_KEY_MESSAGE   : @"Hello AIS!"};
        
        NSArray *arrHistory = @[history1, history2, history3];
        
        NSDictionary *contactHistoryList = @{RES_KEY_CONTACT_HISTORY_LIST: arrHistory};
        responseDict = @{RES_KEY_RESPONSE_DATA: contactHistoryList};
        
    }
    
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate contactMessageHistoryError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseContactMessageHistory *historyList = [[ResponseContactMessageHistory alloc] initWithResponseData:responseData];
    [delegate contactMessageHistorySuccess:historyList];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate contactMessageHistoryError:nil];
}



@end
