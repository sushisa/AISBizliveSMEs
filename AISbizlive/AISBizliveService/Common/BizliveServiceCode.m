//
//  BizliveServiceCode.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "BizliveServiceCode.h"



@implementation BizliveServiceCode

+ (NSString *)getCode:(errorCode)errorCode
{
    switch (errorCode) {
        case SUCCESS:
            return @"0";
        case ERROR_101:
            return @"101";
        case ERROR_102:
            return @"102";
        case ERROR_103:
            return @"103";
            break;
        default:
            break;
    }
}

+ (NSString *)getMessage:(errorCode)errorCode
{
    switch (errorCode) {
        case SUCCESS:
            return @"0";
        case ERROR_101:
            return @"Invalid response format.";
        case ERROR_102:
            return @"Invalid response parameter.";
        case ERROR_103:
            return @"Implement service error.";
            break;
        default:
            break;
    }

}

@end
