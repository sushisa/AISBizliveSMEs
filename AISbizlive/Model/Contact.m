//
//  Contact.m
//  AISbizlive
//
//  Created by Wachirawit on 2/18/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "Contact.h"

@implementation Contact
-(NSDictionary *) ContactDict{
    NSString *stringData = @"{ \"MemberID\":\"1\", \"Name\":\"Weerachai\", \"Tel\":\"0819876107\" }";
    NSData *jsonData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSArray *keys = [jsonObjects allKeys];
    
    // value in key name
    NSString *strMemberID = [jsonObjects objectForKey:@"MemberID"];
    NSString *strName = [jsonObjects objectForKey:@"Name"];
    NSString *strTel = [jsonObjects objectForKey:@"Tel"];
    NSLog(@"MemberID = %@",strMemberID);
    NSLog(@"Name = %@",strName);
    NSLog(@"Tel = %@",strTel);
    
    NSLog(@"====================");
    
    // values in foreach loop
    for (NSString *key in keys) {
        NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
    }

    return ContactDict;
}
@end
