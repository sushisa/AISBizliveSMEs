//
//  ServiceLG04_RequestEmailVerification.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG04_RequestEmailVerification.h"

@implementation ServiceLG04_RequestEmailVerification
@synthesize delegate;

- (void)setParameterWithEmail:(NSString *)email
{
    self.email = email;
}
- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_04_REQUEST_EMAIL_URL];
    
    if (!self.email) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate requestEmailVerificationError:resultStatus];
        return;
    }
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_EMAIL: self.email};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate requestEmailVerificationError:resultStatus];
        return;
    }
    [delegate requestEmailVerificationSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate requestEmailVerificationError:nil];
}
@end
