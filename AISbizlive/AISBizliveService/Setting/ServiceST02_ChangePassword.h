//
//  ServiceST02_ChangePassword.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
@protocol ChangePasswordDelegate <NSObject>

- (void)changePasswordSuccess;
- (void)changePasswordError:(ResultStatus *)resultStatus;

@end

@interface ServiceST02_ChangePassword : BizliveService

- (void)setParameterWithOldPassword:(NSString *)OldPassword
                        NewPassword:(NSString *)NewPassword;
@property (nonatomic, assign)id<ChangePasswordDelegate> delegate;

@property (nonatomic,strong)NSString *oldPassword,*newPassword;

@end
