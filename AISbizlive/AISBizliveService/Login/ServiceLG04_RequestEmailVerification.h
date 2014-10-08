//
//  ServiceLG04_RequestEmailVerification.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol RequestEmailVerificationDelegate <NSObject>

- (void)requestEmailVerificationSuccess;
- (void)requestEmailVerificationError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG04_RequestEmailVerification : BizliveService

- (void)setParameterWithEmail:(NSString *)email;

@property (nonatomic, assign)id<RequestEmailVerificationDelegate> delegate;
@property (nonatomic, strong)NSString *email;

@end
