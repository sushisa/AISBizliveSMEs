//
//  TestLogin.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestLogin : NSObject

- (void)serviceLG01_ForgotPassword;
- (void)serviceLG02_SignUpWithEmail;
- (void)serviceLG03_RequestOtpVerification;
- (void)serviceLG04_RequestEmailVerification;
- (void)serviceLG05_VerifyByOtp;
- (void)serviceLG06_VerifyByEmail;
- (void)serviceLG07_Login;

@end
