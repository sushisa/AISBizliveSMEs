//
//  FontUtil.h
//  AISbizlive
//
//  Created by Wachirawit on 6/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#define AISFontName @"HelveticaNeue"
#ifdef IS_IOS8
#define AISFontSizeSmall 12.0
#define AISFontSizeNormal 14.0
#else
#define AISFontSizeSmall 14.0
#define AISFontSizeNormal 17.0
#endif
#define AISFontSizeBig 30.0

typedef enum
{
    eFontSizeSmall = 1,
    eFontSizeNormal,
    eFontSizeBig,
}eFontSize;

@interface FontUtil : NSObject

+(float) getPointFontSize:(eFontSize)fontSize;
+(UIFont *)fontWithFontSize:(eFontSize)fontSize;

@end
