//
//  ServiceLG05_VerifyByOtp.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol VerifyByOtpDelegate <NSObject>

- (void)verifyByOtpSuccess;
- (void)verifyByOtpError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG05_VerifyByOtp : BizliveService

- (void)setParameterWithMSISDN:(NSString *)MSISDN
                         email:(NSString *)email
                           otp:(NSString *)otp;

@property (nonatomic, assign)id<VerifyByOtpDelegate> delegate;
@property (nonatomic, strong)NSString *MSISDN, *email, *otp;
@end
