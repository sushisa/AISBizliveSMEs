//
//  AISBLString.m
//  AISbizlive
//
//  Created by Wachirawit on 2/21/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISBLString.h"

@implementation AISBLString
+(NSString*)defaultString:(NSString *)key
{
    NSString *lang = [[NSUserDefaults standardUserDefaults] stringForKey:@"lang"];
    NSString *path;
    if([lang isEqualToString:@"EN"])
    {
        path = [[NSBundle mainBundle] pathForResource:@"ENGlobalString" ofType:@"plist"];
    }
    else
    {
        path = [[NSBundle mainBundle] pathForResource:@"THGlobalString" ofType:@"plist"];
    }
    NSDictionary *dictionary = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    return [dictionary objectForKey:key];
}
@end
