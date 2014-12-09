//
//  ServiceCT09_GetContactListToEditGroup.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT09_GetContactListToEditGroup.h"
#import "AISActivity.h"

@implementation ServiceCT09_GetContactListToEditGroup{
    AISActivity *activity;
}
@synthesize delegate;

- (void)setParameterWithID:(NSString *)ID
{
    self.ID = ID;
}
- (void)requestService
{
    activity = [[AISActivity alloc] init];
    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_09_GETCONTACTLIST_TOEDITGROUP_URL];
    
    if (!self.ID) {
        ResultStatus *resultStatus = [[ResultStatus alloc] init];
        [delegate getContactListToEditGroupError:resultStatus];
        return;
    }
    
    NSDictionary *requestDict  = @{REQ_KEY_GROUP_ID: self.ID};
    
    [super setRequestData:requestDict];
    [super setRequestURL:requestURL];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
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
        
        responseDict = @{RES_KEY_GROUP_LIST    : @[group1]};
        responseDict = group1;
    }
    [activity dismissActivity];
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getContactListToEditGroupError:resultStatus];
        return;
    }
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    GroupContactDetail *groupContactDetail = [[GroupContactDetail alloc] initWithResponseData:responseData];
    
    
    [delegate getContactListToEditGroupSuccess:groupContactDetail];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate getContactListToEditGroupError:nil];
    [activity dismissActivity];
}


@end
