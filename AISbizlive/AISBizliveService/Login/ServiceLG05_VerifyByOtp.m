//
//  ServiceLG05_VerifyByOtp.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG05_VerifyByOtp.h"

@implementation ServiceLG05_VerifyByOtp
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
    NSDictionary *requestDict = @{REQ_KEY_MSISDN         : self.MSISDN,
                                  REQ_KEY_EMAIL          : self.email,
                                  REQ_KEY_OTP_VERIFY_CODE: self.otp};
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate verifyByOtpSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate verifyByOtpError:result];
}

@end
