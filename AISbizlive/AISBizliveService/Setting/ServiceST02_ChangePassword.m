//
//  ServiceST02_ChangePassword.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceST02_ChangePassword.h"

@implementation ServiceST02_ChangePassword
@synthesize delegate;


- (void)setParameterWithOldPassword:(NSString *)OldPassword
                        NewPassword:(NSString *)NewPassword{
//    self.oldPassword = OldPassword;
//    self.newPassword = NewPassword;
}

-(void)requestService{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_ST_02_CHANGE_PASSWORD_URL];
//    NSDictionary *requestDict = @{REQ_KEY_SETTING_OLDPASSWORD : self.oldPassword,
//                                  REQ_KEY_SETTING_NEWPASSWORD : self.newPassword};
    [super setRequestURL:requestURL];
//    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate changePasswordError:resultStatus];
        return;
    }
    [delegate changePasswordSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate changePasswordError:nil];
}
@end
