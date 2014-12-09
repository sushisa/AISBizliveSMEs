//
//  ServiceLG06_VerifyByEmail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG06_VerifyByEmail.h"
#import "AISActivity.h"

@implementation ServiceLG06_VerifyByEmail{
    AISActivity *activity;
}
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
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_06_VERIFY_EMAIL_URL];
    
    if (!self.email) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate verifyByEmailError:resultStatus];
        return;
    }
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_MSISDN            : self.MSISDN,
                                  REQ_KEY_LOGIN_EMAIL             : self.email,
                                  REQ_KEY_LOGIN_EMAIL_VERIFY_CODE : self.emailVerifyCode};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate verifyByEmailError:resultStatus];
        return;
    }
    [delegate verifyByEmailSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate verifyByEmailError:resultStatus];
    [activity dismissActivity];
}
@end
