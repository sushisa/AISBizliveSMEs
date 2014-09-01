//
//  TestLogin.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TestLogin.h"
#import "ServiceLG01_ForgotPassword.h"
#import "ServiceLG02_SignUpWithEmail.h"
#import "LoginForm.h"
#import "ServiceLG03_RequestOtpVerification.h"
#import "ServiceLG04_RequestEmailVerification.h"
#import "ServiceLG05_VerifyByOtp.h"
#import "ServiceLG06_VerifyByEmail.h"
#import "ServiceLG07_Login.h"

@interface TestLogin()
<ForgotPasswordDelegate,
SignUpWithEmailDelegate,
RequestOtpVerificationDelegate,
RequestEmailVerificationDelegate,
VerifyByOtpDelegate,
VerifyByEmailDelegate,
LoginDelegate>
@end

@implementation TestLogin

#pragma mark - ServiceLG01_ForgotPassword
- (void)serviceLG01_ForgotPassword
{
    ServiceLG01_ForgotPassword *service = [ServiceLG01_ForgotPassword new];
    [service setDelegate:self];
    [service setParameterWithEmail:@"Username" forgotType:@"Mobile"];
    [service requestService];
}

- (void)forgotPasswordSuccess
{
    NSLog(@"Forgot password success.");
}
- (void)forgotPasswordError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceLG02_SignUpWithEmail
- (void)serviceLG02_SignUpWithEmail
{
    LoginForm *loginForm = [LoginForm new];
    
    ServiceLG02_SignUpWithEmail *service = [ServiceLG02_SignUpWithEmail new];
    [service setDelegate:self];
    [service setParameterWithLoginForm:loginForm];
    [service requestService];
}

- (void)signUpWithEmailSuccess;
{
    
}
- (void)signUpWithEmailError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceLG03_RequestOtpVerification
- (void)serviceLG03_RequestOtpVerification
{
    ServiceLG03_RequestOtpVerification *service = [ServiceLG03_RequestOtpVerification new];
    [service setDelegate:self];
    [service setParameterWithMSISDN:@"087xxxxxxx"];
    [service requestService];
}
- (void)requestOtpVerificationSuccess
{
    NSLog(@"Request OTP verification success.");
}
- (void)requestOtpVerificationError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceLG04_RequestEmailVerification
- (void)serviceLG04_RequestEmailVerification
{
    ServiceLG04_RequestEmailVerification *service = [ServiceLG04_RequestEmailVerification new];
    [service setDelegate:self];
    [service setParameterWithEmail:@"vasin@promptnow.com"];
    [service requestService];
}
- (void)requestEmailVerificationSuccess
{
    NSLog(@"Request email verification success.");
}
- (void)requestEmailVerificationError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceLG05_VerifyByOtp
- (void)serviceLG05_VerifyByOtp
{
    ServiceLG05_VerifyByOtp *service = [ServiceLG05_VerifyByOtp new];
    [service setDelegate:self];
    [service setParameterWithMSISDN:@"087xxxxxxx"
                              email:@"vasin@promptnow.com"
                                otp:@"otp-123456"];
    [service requestService];
}
- (void)verifyByOtpSuccess
{
    NSLog(@"Verify by otp success.");
}
- (void)verifyByOtpError:(ResultStatus *)resultStatus
{
    
}


#pragma mark - ServiceLG06_VerifyByEmail
- (void)serviceLG06_VerifyByEmail
{
    ServiceLG06_VerifyByEmail *service = [ServiceLG06_VerifyByEmail new];
    [service setDelegate:self];
    [service setParameterWithMSISDN:@"087xxxxxxx"
                              email:@"vasin@promptnow.com"
                    emailVerifyCode:@"emailCode-1234"];
    [service requestService];
}

- (void)verifyByEmailSuccess
{
    NSLog(@"Verify by email success");
}
- (void)verifyByEmailError:(ResultStatus *)resultStatus
{
    
}

#pragma mark - ServiceLG07_Login
- (void)serviceLG07_Login
{
    ServiceLG07_Login *service = [ServiceLG07_Login new];
    [service setDelegate:self];
    [service setParameterWithUser:@"vasin@promptnow.com"
                         password:@"passw0rd"
                       isFacebook:NO];
    [service requestService];
}
- (void)loginSuccess
{
    
}
- (void)loginError:(ResultStatus *)resultStatus
{
    
}


@end
