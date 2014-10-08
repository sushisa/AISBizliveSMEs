//
//  BizliveServiceCode.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SUCCESS,
    ERROR_101,
    ERROR_102,
    ERROR_103
} errorCode;

@interface BizliveServiceCode : NSObject

+ (NSString *)getCode:(errorCode)errorCode;
+ (NSString *)getMessage:(errorCode)errorCode;

@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *message;

@end
