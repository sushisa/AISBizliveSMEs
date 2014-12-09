//
//  ServiceLG05_VerifyByOtp.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG05_VerifyByOtp.h"
#import "AISActivity.h"

@implementation ServiceLG05_VerifyByOtp{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithMSISDN:(NSString *)MSISDN
                         email:(NSString *)email
                           otp:(NSString *)otp
{
    self.MSISDN = MSISDN;
    self.email = email;
    self.otp = otp;
}
- (void)requestService
{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_05_VERIFY_OTP_URL];
    
    if (!self.email) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate verifyByOtpError:resultStatus];
        return;
    }
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_MSISDN         : self.MSISDN,
                                  REQ_KEY_LOGIN_EMAIL          : self.email,
                                  REQ_KEY_LOGIN_OTP_VERIFY_CODE: self.otp};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate verifyByOtpError:resultStatus];
        return;
    }
    [delegate verifyByOtpSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate verifyByOtpError:resultStatus];
    [activity dismissActivity];
}
@end
