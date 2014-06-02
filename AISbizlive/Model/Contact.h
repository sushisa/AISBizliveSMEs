//
//  Contact.h
//  AISbizlive
//
//  Created by Wachirawit on 2/18/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
{
    NSArray *NameContact;
    NSArray *TelContact;
    NSArray *DateContact;
    NSArray *TimeContact;
    NSDictionary *ContactDict;
}
-(NSDictionary *) ContactDict;

@end
