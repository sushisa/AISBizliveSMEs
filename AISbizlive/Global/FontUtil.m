//
//  FontUtil.m
//  AISbizlive
//
//  Created by Wachirawit on 6/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "FontUtil.h"

@implementation FontUtil
+(float) getPointFontSize:(eFontSize)fontSize
{
    switch (fontSize)
    {
        case eFontSizeSmall:
            return AISFontSizeSmall;
            
        case eFontSizeNormal:
            return AISFontSizeNormal;
            
        case eFontSizeBig:
            return AISFontSizeBig;
            
        default:
            return AISFontSizeNormal;
    }
    return AISFontSizeNormal;
}

+(UIFont *)fontWithFontSize:(eFontSize)fontSize
{
    float fSize = [FontUtil getPointFontSize:fontSize];
    return [UIFont fontWithName:AISFontName size:fSize];
}
@end
