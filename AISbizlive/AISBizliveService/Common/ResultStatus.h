//
//  ResultStatus.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <startup_sdk/ResponseStatus.h>

@interface ResultStatus : NSObject

- (id)initWithResponse:(NSDictionary *)response;
- (id)initWithResponseStatus:(ResponseStatus *)responseStatus;
- (BOOL)isResponseSuccess;

@property (nonatomic, strong)NSString *responseCode;
@property (nonatomic, strong)NSString *responseMessage;
@property (nonatomic, strong)NSDictionary *responseData;
@end
