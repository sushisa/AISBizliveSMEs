//
//  ServiceCT04_DeleteContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT04_DeleteContact.h"

@implementation ServiceCT04_DeleteContact
@synthesize delegate;
- (void)setParameterWithContactIDList:(NSArray *)contactIDList;
{
    self.contactIDList = contactIDList;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_04_DELETE_CONTACT];
    
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_LIST  : self.contactIDList};

    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate deleteContactError:resultStatus];
        return;
    }
    [delegate deleteContactSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate deleteContactError:nil];
}


@end
