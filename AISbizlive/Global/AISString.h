//
//  AISString.h
//  AISbizlive
//
//  Created by Wachirawit on 6/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#define BUTTON @"BUTTON"
#define TITLE @"TITLE"
#define PLACEHODER @"PLACEHODER"
#define LABEL @"LABEL"
#define POPUP @"POPUP"
typedef enum
{
    typeButton = 1,
    typeTitle,
    typePlacehoder,
    typeLabel,
    typePopup,
}typeText;
@interface AISString : NSObject
+(NSString*)commonString:(typeText) commonType KeyOfValue:(NSString *)key;
+(NSMutableArray*)commonArray :(NSString *)key;
+(NSMutableArray*)TemplateArray;
@end
