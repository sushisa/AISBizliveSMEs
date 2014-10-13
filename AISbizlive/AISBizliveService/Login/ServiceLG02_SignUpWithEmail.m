//
//  ServiceLG02_SignUpWithEmail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG02_SignUpWithEmail.h"

@implementation ServiceLG02_SignUpWithEmail
@synthesize delegate;

- (void)setParameterWithLoginForm:(LoginForm *)loginForm
{
    self.loginForm = loginForm;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_02_SIGNUP_EMAIL_URL];
    
    if (!self.loginForm) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate signUpWithEmailError:resultStatus];
        return;
    }
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_FIRSTNAME : [self.loginForm firstname],
                                  REQ_KEY_LOGIN_LASTNAME  : [self.loginForm lastname],
                                  REQ_KEY_LOGIN_MSISDN    : [self.loginForm phoneNumber],
                                  REQ_KEY_LOGIN_EMAIL     : [self.loginForm email],
                                  REQ_KEY_LOGIN_PASSWORD  : [self.loginForm password],
                                  REQ_KEY_LOGIN_PHOTO: [self.loginForm photoBase64]};
    
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        responseDict = @{RES_KEY_LOGIN_USER_ID: @"1xx3234"};
    }
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate signUpWithEmailError:resultStatus];
        return;
    }
    [delegate signUpWithEmailSuccess];

}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate signUpWithEmailError:nil];
}


@end
