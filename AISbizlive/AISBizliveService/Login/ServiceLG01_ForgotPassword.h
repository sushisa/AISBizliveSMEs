//
//  ServiceLG01_ForgotPassword.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol ForgotPasswordDelegate <NSObject>

- (void)forgotPasswordSuccess;
- (void)forgotPasswordError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG01_ForgotPassword : BizliveService

- (void)setParameterWithEmail:(NSString *)email
                   forgotType:(NSString *)forgotType;

@property (nonatomic, assign)id<ForgotPasswordDelegate> delegate;
@property (nonatomic, strong)NSString *email, *forgotType;

@end
