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
{
    self.user = user;
    self.password = password;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_LG_07_LOGIN_URL];

    NSDictionary *requestDict = @{REQ_KEY_LOGIN_EMAIL     : self.user,
                        REQ_KEY_LOGIN_PASSWORD : self.password};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        responseDict = @{RES_KEY_LOGIN_USER_ID_TOKEN  : @"xxxx1234",
                         RES_KEY_LOGIN_USERNAME       : @"vasin1234",
                         RES_KEY_LOGIN_USER_MOBILE_NO : @"087xxxxxxx",
                         RES_KEY_LOGIN_CONTACT_QUOTA  : @"50",
                         RES_KEY_LOGIN_OPERATOR_TYPE  : @"AIS",
                         RES_KEY_LOGIN_FLAG     : @"N",};
    }
    
    NSDictionary* responseData = responseDict[RES_KEY_RESPONSE_DATA] ;
//    NSLog(@"%@",responseDict);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_USER_ID_TOKEN]);
//    NSLog(@"%@",responseDict[RES_KEY_LOGIN_USERNAME]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_USER_MOBILE_NO]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_CONTACT_QUOTA]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_OPERATOR_TYPE]);
    NSLog(@"%@",responseData[RES_KEY_LOGIN_FLAG]);
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate loginError:resultStatus];
        return;
    }
    //SetDefault
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:responseData[RES_KEY_LOGIN_USER_ID_TOKEN] forKey:REQ_KEY_USER_TOKEN_ID];
    [defaults setValue:responseData[RES_KEY_LOGIN_USER_MOBILE_NO] forKey:REQ_KEY_USER_MOBILE_NO];
    [defaults setValue:@"TH" forKey:REQ_KEY_LANGUAGE];
    [defaults setValue:responseData[RES_KEY_LOGIN_OPERATOR_TYPE] forKey:REQ_KEY_OPERATOR_TYPE];
    [defaults setObject:@"YES" forKey:@"login"];
    [defaults synchronize];
    [delegate loginSuccess];
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate loginError:nil];
}

@end
