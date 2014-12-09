//
//  ServiceCT11_DeleteGroupContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT11_DeleteGroupContact.h"
#import "AISActivity.h"



@implementation ServiceCT11_DeleteGroupContact{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithGroupIDList:(NSArray *)groupIDList
{
    self.groupIDList = groupIDList;
}

- (void)requestService
{
    activity =[[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_11_DELETE_GROUP_URL];
    
    if (!self.groupIDList) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate deleteGroupContactError:resultStatus];
        return;
    }
    
    
    NSDictionary *requestDict = @{REQ_KEY_GROUP_LIST: self.groupIDList};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate deleteGroupContactError:resultStatus];
        return;
    }
    [delegate deleteGroupContactSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate deleteGroupContactError:nil];
    [activity dismissActivity];
}


@end
