//
//  ServiceLG04_RequestEmailVerification.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG04_RequestEmailVerification.h"

@implementation ServiceLG04_RequestEmailVerification
@synthesize delegate;

- (void)setParameterWithEmail:(NSString *)email
{
    self.email = email;
}

- (void)requestService
{
    NSDictionary *requestDict = @{REQ_KEY_LOGIN_EMAIL: self.email};
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate requestEmailVerificationSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate requestEmailVerificationError:result];
}

@end
