//
//  ServiceCT06_GetGroupContactList.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT06_GetGroupContactList.h"


@implementation ServiceCT06_GetGroupContactList
@synthesize delegate;
- (void)requestService
{
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_ID           : @"01234",
                                   RES_KEY_NAME         : @"Woravit",
                                   RES_KEY_LASTNAME     : @"Poang",
                                   RES_KEY_MOBILE_NO    : @"089xxxxxxx",
                                   RES_KEY_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_IMAGE_URL    : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_ID            : @"01235",
                                  RES_KEY_NAME          : @"Pluem",
                                  RES_KEY_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_MOBILE_NO     : @"089xxxxxxx",
                                  RES_KEY_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_IMAGE_URL     : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_ID             : @"123",
                                 RES_KEY_NAME           :@"PromptNow",
                                 RES_KEY_IMAGE_URL      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};
        NSDictionary *group2 = @{RES_KEY_ID             : @"555",
                                 RES_KEY_NAME           :@"AIS",
                                 RES_KEY_IMAGE_URL      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};

        responseData = @{RES_KEY_GROUP_LIST    : @[group1,
                                                   group2]};
    }
    
    ResponseGetGroupContactList *serviceData = [[ResponseGetGroupContactList alloc] initWithResponseData:responseData];
    [delegate getGroupContactListSuccess:serviceData];
    
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate getGroupContactListError:result];
}


@end
