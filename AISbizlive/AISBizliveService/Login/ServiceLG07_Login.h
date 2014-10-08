//
//  ServiceLG07_Login.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol LoginDelegate <NSObject>

- (void)loginSuccess;
- (void)loginError:(ResultStatus *)resultStatus;

@end

@interface ServiceLG07_Login : BizliveService

- (void)setParameterWithUser:(NSString *)user
                    password:(NSString *)password
                  isFacebook:(BOOL)isFacebook;

@property (nonatomic, assign)id<LoginDelegate> delegate;

@property (nonatomic, strong)NSString *user, *password;
@property (nonatomic)BOOL isFacebook;

@end
