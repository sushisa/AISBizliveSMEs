//
//  ServiceLG01_ForgotPassword.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG01_ForgotPassword.h"

@implementation ServiceLG01_ForgotPassword
@synthesize delegate;

- (void)setParameterWithEmail:(NSString *)email
                   forgotType:(NSString *)forgotType
{
    self.email = email;
    self.forgotType = forgotType;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_01_FORGET_PASSWORD_URL];
    
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_EMAIL      : self.email,
                                  REQ_KEY_LOGIN_FORGOT_TYPE: self.forgotType};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate forgotPasswordError:resultStatus];
        return;
    }
    [delegate forgotPasswordSuccess];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate forgotPasswordError:nil];
}

@end
