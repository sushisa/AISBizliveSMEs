//
//  ServiceCT10_EditGroupContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT10_EditGroupContact.h"

@implementation ServiceCT10_EditGroupContact
@synthesize delegate;

- (void)setParameterWithGroupID:(NSString *)groupID
                           name:(NSString *)name
                        image64:(NSString *)image64
                      contactID:(NSArray *)contactID
{
    self.groupID = groupID;
    self.name = name;
    self.image64 = image64;
    self.contactID = contactID;
}


- (void)requestService
{
   NSMutableArray *contactList = [NSMutableArray new];
    for (NSString *contactID in self.contactID) {
        NSDictionary *contact = @{REQ_KEY_CONTACT_ID: contactID};
        [contactList addObject:contact];
    }
    NSDictionary *requestDict  = @{REQ_KEY_GROUP_ID  : self.groupID,
                                   REQ_KEY_GROUP_NAME: self.name,
                                   REQ_KEY_PHOTO     : self.image64,
                                   REQ_KEY_CONTACT_ID: contactList};
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_ID           : @"01234",
                                   RES_KEY_NAME         : @"Woravit",
                                   RES_KEY_LASTNAME     : @"Poang",
                                   RES_KEY_PHONE_NUMBER : @"089xxxxxxx",
                                   RES_KEY_LAST_UPDATE  : @"1403777666666",
                                   RES_KEY_IMAGE_URL    : @"www.hotmail.co.th"};
        NSDictionary *contact2 =@{RES_KEY_ID            : @"01235",
                                  RES_KEY_NAME          : @"Pluem",
                                  RES_KEY_LASTNAME      : @"Limrattanakan",
                                  RES_KEY_PHONE_NUMBER  : @"089xxxxxxx",
                                  RES_KEY_LAST_UPDATE   : @"1403777666666",
                                  RES_KEY_IMAGE_URL     : @"www.google.co.th"};
        
        NSDictionary *group1 = @{RES_KEY_ID             : @"123",
                                 RES_KEY_NAME           :@"PromptNow",
                                 RES_KEY_IMAGE_URL      :@"www.promptnow.com",
                                 RES_KEY_CONTACT_LIST   : @[contact1,
                                                            contact2]};
        
        responseData = @{RES_KEY_GROUP_LIST    : @[group1]};
        responseData = group1;
    }
    
    GroupContactDetail *groupContactDetail = [[GroupContactDetail alloc] initWithResponseData:responseData];
    
    
    [delegate editGroupContactSuccess:groupContactDetail];
    
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate editGroupContactError:result];
}

@end
