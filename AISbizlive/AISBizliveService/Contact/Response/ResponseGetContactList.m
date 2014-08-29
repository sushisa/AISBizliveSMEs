//
//  ResponseGetContactList.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseGetContactList.h"
#import "BizliveServiceParameter.h"
#import "ContactDetail.h"

@implementation ResponseGetContactList

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.contactList = [[NSMutableArray alloc] init];
        NSArray *arrContactList = responseData[RES_KEY_CONTACT_LIST];
        
        for (NSInteger i = 0; i < [arrContactList count]; i++) {
            ContactDetail *contact = [[ContactDetail alloc] initWithResponseData:arrContactList[i]];
            [self.contactList addObject:contact];
        }
        
    }
    return self;
}
@end
