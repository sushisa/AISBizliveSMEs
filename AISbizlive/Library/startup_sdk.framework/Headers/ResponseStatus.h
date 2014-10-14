//
//  ResponseStatus.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/18/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectResponse.h"

@interface ResponseStatus : NSObject
{
    NSString *_orderRef;
    BOOL responseSuccess;
}

-(void)initialWithResponse:(NSDictionary *)response orderRef:(NSString *)orderRef;
//-(void)initWithResponse:(NSDictionary *)response;
//-(void)setStatusCode:(int)code;
//-(void)setDescription:(NSString *)description;

-(BOOL)isResponseSuccess;

-(id)initWithConnectResponse:(ConnectResponse *)connectResponse;


@property(nonatomic, strong)NSString *developerMessage, *userMessage, *moreInfo, *errorCode;
@property(nonatomic)NSInteger resultCode;

@property (nonatomic, strong)NSString *responseStatus;
@end
