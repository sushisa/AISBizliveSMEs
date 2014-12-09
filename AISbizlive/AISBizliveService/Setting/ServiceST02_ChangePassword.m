//
//  ServiceST02_ChangePassword.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceST02_ChangePassword.h"
#import "AISActivity.h"

@implementation ServiceST02_ChangePassword{
    AISActivity *activity;
}
@synthesize delegate;


- (void)setParameterWithOldPassword:(NSString *)OldPassword
                        NewPassword:(NSString *)NewPassword{
    self.old = OldPassword;
    self.news = NewPassword;
}

-(void)requestService{
    activity = [[AISActivity alloc]init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_ST_02_CHANGE_PASSWORD_URL];
    NSDictionary *requestDict = @{REQ_KEY_SETTING_OLDPASSWORD : self.old,
                                  REQ_KEY_SETTING_NEWPASSWORD : self.news};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate changePasswordError:resultStatus];
        return;
    }
    [delegate changePasswordSuccess];
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    ResultStatus *resultStatus = [[ResultStatus alloc] init];
    [resultStatus setResponseCode:[NSString stringWithFormat:@"%d",[status resultCode]]];
    [resultStatus setResponseMessage:[status developerMessage]];
    [delegate changePasswordError:resultStatus];
    [activity dismissActivity];
}
@end
