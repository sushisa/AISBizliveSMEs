//
//  AISString.m
//  AISbizlive
//
//  Created by Wachirawit on 6/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISString.h"

@implementation AISString

    NSString *lang;
    NSString *path;
    NSDictionary *root;
    NSDictionary *type;
    NSDictionary *returnText;
+(NSString *) getTypeText:(typeText)type
{
    switch (type)
    {
        case typeButton:
            return BUTTON;
            
        case typeTitle:
            return TITLE;
            
        case typeLabel:
            return LABEL;
            
        case typePlacehoder:
            return PLACEHODER;
        case typePopup:
            return POPUP;
        default:
            return nil;
    }
    return nil;
}

+(NSString*)commonString:(typeText) commonType KeyOfValue:(NSString *)key
{
    lang = [[NSUserDefaults standardUserDefaults] stringForKey:@"lang"];
    path = [[NSBundle mainBundle] pathForResource:@"Common" ofType:@"plist"];
    root = [[NSDictionary alloc]initWithContentsOfFile:path];
    type = [[NSDictionary alloc]initWithDictionary:[root objectForKey:[AISString getTypeText:commonType]]];
    returnText = [[NSDictionary alloc] initWithDictionary:[type objectForKey:key]];
    return [returnText objectForKey:lang];
}
+(NSMutableArray*)commonArray :(NSString *)key
{
    lang = [[NSUserDefaults standardUserDefaults] stringForKey:@"lang"];
    path = [[NSBundle mainBundle] pathForResource:@"Common" ofType:@"plist"];
    root = [[NSDictionary alloc]initWithContentsOfFile:path];
    type = [[NSDictionary alloc]initWithDictionary:[root objectForKey:key]];
   NSMutableArray *returnCommonText = [[NSMutableArray alloc] initWithArray:[type objectForKey:lang]];
    return returnCommonText;
}
+(NSMutableArray*)TemplateArray
{
    path = [[NSBundle mainBundle] pathForResource:@"TemplateList" ofType:@"plist"];
    NSMutableArray *templateRoot = [[NSMutableArray alloc]initWithContentsOfFile:path];
    return templateRoot;
}
@end
