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
    NSDictionary *requestDict = @{REQ_KEY_EMAIL      : self.email,
                                  REQ_KEY_FORGOT_TYPE: self.forgotType};
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate forgotPasswordSuccess];
}

- (void)bizliveServiceError:(ResultStatus *)result;
{
    [delegate forgotPasswordError:result];
}

@end
