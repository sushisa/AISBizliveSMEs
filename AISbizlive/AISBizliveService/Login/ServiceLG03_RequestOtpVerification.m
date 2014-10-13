//
//  ServiceLG03_RequestOtpVerification.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG03_RequestOtpVerification.h"


@implementation ServiceLG03_RequestOtpVerification
@synthesize delegate;

- (void)setParameterWithMSISDN:(NSString *)MSISDN
{
    self.MSISDN = MSISDN;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_03_REQUEST_OTP_URL];
    
    if (!self.MSISDN) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate requestOtpVerificationError:resultStatus];
        return;
    }
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_MSISDN: self.MSISDN};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate requestOtpVerificationError:resultStatus];
        return;
    }
    [delegate requestOtpVerificationSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate requestOtpVerificationError:nil];
}


@end
