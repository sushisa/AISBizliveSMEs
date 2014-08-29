//
//  ResponseGetGroupContactList.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ResponseGetGroupContactList.h"
#import "BizliveServiceParameter.h"

@implementation ResponseGetGroupContactList

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.groupContactList = [[NSMutableArray alloc] init];
        NSArray *groupContactList = responseData[RES_KEY_GROUP_LIST];
        
        for (NSInteger i = 0; i < [groupContactList count]; i++) {
            NSDictionary *group = groupContactList[i];
            GroupContactDetail *groupContact = [[GroupContactDetail alloc]initWithResponseData:group];
            [self.groupContactList addObject:groupContact];
        }
        
    }
    return self;
}

@end


