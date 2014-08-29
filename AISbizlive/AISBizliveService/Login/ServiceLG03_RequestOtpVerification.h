//
//  ServiceLG03_RequestOtpVerification.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol RequestOtpVerificationDelegate <NSObject>

- (void)requestOtpVerificationSuccess;
- (void)requestOtpVerificationError:(ResultStatus *)resultStatus;

@end


@interface ServiceLG03_RequestOtpVerification : BizliveService

- (void)setParameterWithMSISDN:(NSString *)MSISDN;

@property (nonatomic, assign)id<RequestOtpVerificationDelegate> delegate;
@property (nonatomic, strong)NSString *MSISDN;

@end
