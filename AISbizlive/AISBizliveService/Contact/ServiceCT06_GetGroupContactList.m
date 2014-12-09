//
//  ServiceCT06_GetGroupContactList.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT06_GetGroupContactList.h"
#import "AISActivity.h"


@implementation ServiceCT06_GetGroupContactList{
    AISActivity *activity;
}
@synthesize delegate;
- (void)requestService
{
    activity = [[AISActivity alloc] init];
//    [activity showActivity];
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL,SERVICE_CT_06_GETGROUPCONTACT_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
     [activity dismissActivity];
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_CONTACT_ID           : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME         : @"Woravit",
                                   RES_KEY_CONTACT_LASTNAME     : @"Poang",
                                   RES_KEY_CONTACT_MOBILE_NO : @"089xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_CONTACT_ID            : @"01235",
                                  RES_KEY_CONTACT_FIRSTNAME         : @"Pluem",
                                  RES_KEY_CONTACT_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_CONTACT_MOBILE_NO  : @"089xxxxxxx",
                                  RES_KEY_CONTACT_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_CONTACT_PHOTO_PATH     : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_GROUP_ID           : @"123",
                                 RES_KEY_GROUP_NAME           :@"PromptNow",
                                 RES_KEY_GROUP_PHOTO_PATH      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};
        NSDictionary *group2 = @{RES_KEY_CONTACT_ID            : @"555",
                                 RES_KEY_GROUP_NAME         :@"AIS",
                                 RES_KEY_GROUP_PHOTO_PATH      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};

        responseDict = @{RES_KEY_GROUP_LIST    : @[group1,
                                                   group2]};
    }
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate getGroupContactListError:resultStatus];
        return;
    }
    ResponseGetGroupContactList *serviceData = [[ResponseGetGroupContactList alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
    [delegate getGroupContactListSuccess:serviceData];
//    
//    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
//    if (![resultStatus isResponseSuccess]) {
//        [delegate getGroupContactListError:resultStatus];
//        return;
//    }
//    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
//    ResponseGetGroupContactList *serviceData = [[ResponseGetGroupContactList alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
//    [delegate getGroupContactListSuccess:serviceData];
//
    
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate getGroupContactListError:nil];
    [activity dismissActivity];
}


@end
