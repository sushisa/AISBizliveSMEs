//
//  ServiceLG07_Login.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/25/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceLG07_Login.h"

@implementation ServiceLG07_Login
@synthesize delegate;

- (void)setParameterWithUser:(NSString *)user
                    password:(NSString *)password
                  isFacebook:(BOOL)isFacebook
{
    self.user = user;
    self.password = password;
    self.isFacebook = isFacebook;
}

- (void)requestService
{
    NSDictionary *requestDict;
    if (self.isFacebook) {
        requestDict = @{REQ_KEY_LOGIN_EMAIL          : self.user,
                        REQ_KEY_LOGIN_FACEBOOK_TOKEN : self.password};
    }
    else {
        requestDict = @{REQ_KEY_LOGIN_USER     : self.user,
                        REQ_KEY_LOGIN_PASSWORD : self.password};
    }
    
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        responseData = @{RES_KEY_LOGIN_USER_ID_TOKEN  : @"xxxx1234",
                         RES_KEY_LOGIN_USERNAME       : @"vasin1234",
                         RES_KEY_LOGIN_USER_MOBILE_NO : @"087xxxxxxx",
                         RES_KEY_LOGIN_CONTACT_QUOTA  : @"50",
                         RES_KEY_LOGIN_OPERATOR_TYPE  : @"AIS",
                         RES_KEY_LOGIN_FLAG     : @"N",};
    }
    
    
    NSLog(@"%@",responseData[RES_KEY_LOGIN_USER_ID_TOKEN]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_USERNAME]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_USER_MOBILE_NO]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_CONTACT_QUOTA]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_OPERATOR_TYPE]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_FLAG]);
    
    [delegate loginSuccess];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate loginError:result];
}

@end
