//
//  ContactDetail.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ContactDetail.h"
#import "BizliveServiceParameter.h"

@implementation ContactDetail

@synthesize ID, name, lastname, phoneNumber, lastUpdate, imageURL;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.ID = responseData[RES_KEY_CONTACT_ID];
        self.name = responseData[RES_KEY_NAME];
        self.lastname = responseData[RES_KEY_LASTNAME];
        self.phoneNumber = responseData[RES_KEY_MOBILE_NO];
        self.imageURL = responseData[RES_KEY_IMAGE_URL];
    }
    return self;
}

- (id)initWithContactDetail:(NSArray*)contactDetail
{
    self = [super init];
    if (self) {
        self.ID = contactDetail[0];
        self.name = contactDetail[1];
        self.lastname = contactDetail[2];
        self.phoneNumber = contactDetail[3];
        self.lastUpdate = contactDetail[4];
        self.imageURL = contactDetail[5];
    }
    return self;
}


@end
