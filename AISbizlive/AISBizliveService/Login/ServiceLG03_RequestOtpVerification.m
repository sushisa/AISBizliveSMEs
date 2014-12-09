//
//  ServiceLG03_RequestOtpVerification.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG03_RequestOtpVerification.h"
#import "AISActivity.h"


@implementation ServiceLG03_RequestOtpVerification{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithMSISDN:(NSString *)MSISDN
{
    self.MSISDN = MSISDN;
}

- (void)requestService
{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
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
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate requestOtpVerificationError:resultStatus];
        return;
    }
    [delegate requestOtpVerificationSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate requestOtpVerificationError:resultStatus];
    [activity dismissActivity];
}


@end
