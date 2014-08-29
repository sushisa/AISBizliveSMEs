//
//  ServiceLG06_VerifyByEmail.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol VerifyByEmailDelegate <NSObject>

- (void)verifyByEmailSuccess;
- (void)verifyByEmailError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG06_VerifyByEmail : BizliveService

- (void)setParameterWithMSISDN:(NSString *)MSISDN
                         email:(NSString *)email
               emailVerifyCode:(NSString *)emailVerifyCode;


@property(nonatomic, assign)id<VerifyByEmailDelegate> delegate;
@property(nonatomic, strong)NSString *MSISDN, *email, *emailVerifyCode;

@end
