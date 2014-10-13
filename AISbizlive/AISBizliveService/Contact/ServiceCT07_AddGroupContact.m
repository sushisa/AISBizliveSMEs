//
//  ServiceCT07_AddGroupContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT07_AddGroupContact.h"

@implementation ServiceCT07_AddGroupContact
@synthesize delegate;

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL,SERVICE_CT_07_ADDGROUP_URL];
    
    NSMutableArray *contactList = [NSMutableArray new];
    for (NSString *contactID in self.contactID) {
        
        NSDictionary *contact = @{REQ_KEY_CONTACT_ID: contactID};
        [contactList addObject:contact];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_GROUP_NAME  : self.groupName,
                                  REQ_KEY_GROUP_PHOTO : self.image,
                                  RES_KEY_CONTACT_ID_LIST: contactList};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)setParameterWithGroupName:(NSString *)groupName
                            image:(NSString *)image
                        contactID:(NSArray *)contactID
{
    self.groupName = groupName;
    self.image = image;
    self.contactID = contactID;
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_CONTACT_ID           : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME    : @"Woravit",
                                   RES_KEY_CONTACT_LASTNAME     : @"Poang",
                                   RES_KEY_CONTACT_MOBILE_NO    : @"089xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_CONTACT_ID            : @"01235",
                                  RES_KEY_CONTACT_FIRSTNAME     : @"Pluem",
                                  RES_KEY_CONTACT_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_CONTACT_MOBILE_NO     : @"089xxxxxxx",
                                  RES_KEY_CONTACT_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_CONTACT_PHOTO_PATH    : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_GROUP_ID               : @"123",
                                 RES_KEY_GROUP_NAME            :@"PromptNow",
                                 RES_KEY_GROUP_PHOTO_PATH      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST          : @[contact1,
                                                                   contact2]};
        
        responseDict = @{RES_KEY_GROUP_LIST    : @[group1]};
        responseDict = group1;
    }
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate addGroupContactError:resultStatus];
        return;
    }
    GroupContactDetail *groupContactDetail = [[GroupContactDetail alloc] initWithResponseData:responseDict];
    
    
    [delegate addGroupContactSuccess:groupContactDetail];
    
}
- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate addGroupContactError:nil];
}


@end
