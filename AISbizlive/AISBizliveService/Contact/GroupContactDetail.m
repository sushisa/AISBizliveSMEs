//
//  GroupContactDetail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "GroupContactDetail.h"



@implementation GroupContactDetail

@synthesize ID, name, imageURL, lastUpdate;
@synthesize contactList;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        NSDictionary * contactGroup = responseData[RES_KEY_CONTACT_GROUP];
        self.ID = contactGroup[RES_KEY_GROUP_ID];
        self.name = contactGroup[RES_KEY_GROUP_NAME];
        self.imageURL = contactGroup[RES_KEY_GROUP_PHOTO_PATH];
        self.lastUpdate = contactGroup[RES_KEY_GROUP_LAST_UPDATE];
        
        ResponseGetContactList *responseGetContactList = [[ResponseGetContactList alloc] initWithResponseData:responseData];
        self.contactList = [responseGetContactList contactList];
    }
    return self;
}

@end
