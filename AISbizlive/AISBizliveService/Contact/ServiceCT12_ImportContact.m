//
//  ServiceCT12_ImportContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT12_ImportContact.h"
#import "ContactDetail.h"
#import "ResponseGetContactList.h"

@implementation ServiceCT12_ImportContact
@synthesize delegate;

- (void)setParameterWithContactList:(NSArray *)contactList
{
    self.contactList = contactList;
}

- (void)requestService
{
    NSMutableArray *contactList = [NSMutableArray new];
    for (ContactDetail *contact in self.contactList) {
        NSDictionary *contactDict = @{REQ_KEY_FIRSTNAME     : [contact name],
                                      REQ_KEY_LASTNAME      : [contact lastname],
                                      REQ_KEY_PHONE_NUMBER  : [contact phoneNumber],
                                      REQ_KEY_PHOTO         : @"Image",
                                      REQ_KEY_CONTACT_SOURCE: @"Import"};
        [contactList addObject:contactDict];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_LIST: contactList};
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    //------------------------------- Test -------------------------------
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_ID           : @"01234",
                                   RES_KEY_NAME         : @"vasin",
                                   RES_KEY_LASTNAME     : @"north",
                                   RES_KEY_PHONE_NUMBER : @"087xxxxxxx",
                                   RES_KEY_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_IMAGE_URL    : @"www.google.co.th"};
        
        NSDictionary *contact2 = @{RES_KEY_ID           : @"01234",
                                   RES_KEY_NAME         : @"Pluem",
                                   RES_KEY_LASTNAME     : @"Limrattanakan",
                                   RES_KEY_PHONE_NUMBER : @"089xxxxxxx",
                                   RES_KEY_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_IMAGE_URL    : @"www.google.co.th"};
        
        NSArray *arrContact = @[contact1,contact2];
        responseData = @{RES_KEY_CONTACT_LIST : arrContact};
    }
    //------------------------------- Test -------------------------------
    
    ResponseGetContactList *serviceData = [[ResponseGetContactList alloc] initWithResponseData:responseData];
    [delegate importContactSuccess:serviceData];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate importContactError:result];
}


@end
