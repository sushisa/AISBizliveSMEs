//
//  ServiceLG06_VerifyByEmail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG06_VerifyByEmail.h"

@implementation ServiceLG06_VerifyByEmail
@synthesize delegate;

- (void)setParameterWithMSISDN:(NSString *)MSISDN
                         email:(NSString *)email
               emailVerifyCode:(NSString *)emailVerifyCode
{
    self.MSISDN = MSISDN;
    self.email = email;
    self.emailVerifyCode = emailVerifyCode;
}

- (void)requestService
{
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_MSISDN            : self.MSISDN,
                                  REQ_KEY_LOGIN_EMAIL             : self.email,
                                  REQ_KEY_LOGIN_EMAIL_VERIFY_CODE : self.emailVerifyCode};
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate verifyByEmailSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate verifyByEmailError:result];
}

@end
