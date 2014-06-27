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
@interface AISString : NSObject
+(NSString*)commonString:(NSString *) commonType :(NSString *)key;
+(NSMutableArray*)commonArray :(NSString *)key;
+(NSMutableArray*)TemplateArray;
@end
