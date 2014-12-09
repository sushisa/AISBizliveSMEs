//
//  ServiceLG02_SignUpWithEmail.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "LoginForm.h"

@protocol SignUpWithEmailDelegate <NSObject>

- (void)signUpWithEmailSuccess:(NSDictionary *)resultSignUp;
- (void)signUpWithEmailError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG02_SignUpWithEmail : BizliveService

- (void)setParameterWithLoginForm:(LoginForm *)loginForm;

@property (nonatomic, assign)id<SignUpWithEmailDelegate> delegate;
@property (nonatomic, strong)LoginForm *loginForm;



@end
