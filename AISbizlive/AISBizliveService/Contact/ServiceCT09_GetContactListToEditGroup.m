//
//  ServiceCT09_GetContactListToEditGroup.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT09_GetContactListToEditGroup.h"

@implementation ServiceCT09_GetContactListToEditGroup
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID
{
    self.ID = ID;
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_CONTACT_ID          : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME        : @"Woravit",
                                   RES_KEY_CONTACT_LASTNAME     : @"Poang",
                                   RES_KEY_CONTACT_MOBILE_NO : @"089xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_CONTACT_PHOTO_PATH    : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_CONTACT_ID            : @"01235",
                                  RES_KEY_CONTACT_FIRSTNAME         : @"Pluem",
                                  RES_KEY_CONTACT_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_CONTACT_MOBILE_NO  : @"089xxxxxxx",
                                  RES_KEY_CONTACT_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_CONTACT_PHOTO_PATH     : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_GROUP_ID              : @"123",
                                 RES_KEY_GROUP_NAME           :@"PromptNow",
                                 RES_KEY_GROUP_PHOTO_PATH       :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};
        
        responseData = @{RES_KEY_GROUP_LIST    : @[group1]};
        responseData = group1;
    }
    
    GroupContactDetail *groupContactDetail = [[GroupContactDetail alloc] initWithResponseData:responseData];
    
    
    [delegate getContactListToEditGroupSuccess:groupContactDetail];
    
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate getContactListToEditGroupError:result];
}


@end
