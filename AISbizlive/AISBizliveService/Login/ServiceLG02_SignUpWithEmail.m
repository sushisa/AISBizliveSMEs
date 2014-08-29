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
    NSDictionary *requestDict = @{REQ_KEY_FIRSTNAME : [self.loginForm firstname],
                                  REQ_KEY_LASTNAME  : [self.loginForm lastname],
                                  REQ_KEY_MSISDN    : [self.loginForm phoneNumber],
                                  REQ_KEY_EMAIL     : [self.loginForm email],
                                  REQ_KEY_PASSWORD  : [self.loginForm password],
                                  REQ_KEY_PHOTO     : [self.loginForm photoBase64]};
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        responseData = @{RES_KEY_USER_ID: @"1xx3234"};
    }
    
    [delegate signUpWithEmailSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate signUpWithEmailError:result];
}


@end
