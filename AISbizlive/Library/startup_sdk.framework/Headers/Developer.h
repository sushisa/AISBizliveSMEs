//
//  Developer.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/9/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Developer : NSObject

+(void) setFungusParameterWithServiceNumber:(NSString *)serviceNumber iCpId:(NSString *)iCpId andCertificate:(NSString *)certificate;

+(NSString *)getVmURL;
+(NSString *)getVmIP;


@end
