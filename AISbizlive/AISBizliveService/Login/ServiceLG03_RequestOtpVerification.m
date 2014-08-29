//
//  ServiceLG03_RequestOtpVerification.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG03_RequestOtpVerification.h"


@implementation ServiceLG03_RequestOtpVerification
@synthesize delegate;

- (void)setParameterWithMSISDN:(NSString *)MSISDN
{
    self.MSISDN = MSISDN;
}

- (void)requestService
{
    NSDictionary *requestDict = @{REQ_KEY_MSISDN: self.MSISDN};
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate requestOtpVerificationSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate requestOtpVerificationError:result];
}

@end
