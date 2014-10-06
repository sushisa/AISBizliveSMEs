//
//  FungusParameter.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/8/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FungusParameter : NSObject

+(void)setBaseNumber:(NSString *)base;
+(NSString *)getBaseNumber;

+(void)setPrimeNumber:(NSString *)prime;
+(NSString *)getPrimeNumber;

+(void)setBearerID:(NSString *)bID;
+(NSString *)getBearerID;

+(void)setAuthCode:(NSString *)authCode;
+(NSString *)getAuthCode;

+(void) setApplicationID:(NSString *) appID;
+(NSString *) getApplicationID;

+(void) setApplicationName:(NSString *) appName;
+(NSString *) getApplicationName;

+(void) setApplicationVersion:(NSString *) appVersion;
+(NSString *) getApplicationVersion;

+(void) setClientID:(NSString *)clientID;
+(NSString *) getClientID;

+(void) setFungusCerticicateFileName:(NSString *) certificate;
+(NSString *) getFungusCerticicateFileName;

+(void) clearSessionID;

+ (void)setSessionID:(NSString *)sessionID;
+ (NSString *)getSessionID;

+ (void)setCookie:(NSString *)cookie;
+ (NSString *)getCookie;

+ (void)setUserID:(NSString *)userID;
+ (NSString *)getUserID;

+ (void)setApp:(NSString *)app;
+ (NSString *)getApp;

+(void) setTokenID:(NSString *)token;
+(NSString *) getTokenID;

+ (void)clearTokenKey;
+ (void)setTokenKey:(NSString *)token;
+ (NSString *) getTokenKey;

+(void) setOrderRef;
+(NSString *) getOrderRef;

+(void) clearMSISDN;
+(void) setMSISDN:(NSString *) number;
+(NSString *) getMSISDN;

+(void) clearUserToken;
+(void) setUserToken:(NSString *) token;
+(NSString *) getUserToken;

+(BOOL) isRequestLogin;

+(void) setOrderID:(NSString *) transID;
+(NSString *) getOrderID;

+(void) setVmIP:(NSString *) ip;
+(NSString *) getVmIP;

+(void) setVmUrl:(NSString *) url;
+(NSString *) getVmUrl;

+(void) setUserStatus:(NSString *) status;
+(NSString *) getUserStatus;

+(void) setPermissionList:(NSArray *) permissions;
//+(NSArray *) getPermissionList;
+(NSArray *) getPermissionList;

+(void) setAppStatus:(NSString *)status;
+(NSString *)getAppStatus;

+(void) setGssoTransactionId:(NSString *)GssoTransactionId;
+(NSString *)getGssoTransactionId;

+(void)setRedirectURL:(NSString *)url;
+(NSString *)getRedirectURL;

+(void)setAccessToken:(NSString *)accessToken;
+(NSString *)getAccessToken;

+ (void)setAuthenLevel:(NSString *)authenLevel;
+ (NSString *)getAuthenLevel;

+ (void)setExpireIn:(NSString *)time;
+ (NSString *)getExpireIn;

+ (void)setIDType:(NSString *)idType;
+ (NSString *)getIDType;

+ (void)setIDValue:(NSString *)idValue;
+ (NSString *)getIDValue;

+ (void)setOpenIDFlag:(NSString *)openIDFlag;
+ (NSString *)getOpenIDFlag;

+ (void)setRegistrationLevel:(NSString *)registrationLevel;
+ (NSString *)getRegistrationLevel;


+(BOOL)isAuthenticated;





@end
