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
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_12_IMPORT_CONTACT_URL];

    NSMutableArray *contactList = [NSMutableArray new];
    for (ContactDetail *contact in self.contactList) {
        NSDictionary *contactDict = @{REQ_KEY_CONTACT_FIRSTNAME     : [contact name],
                                      REQ_KEY_CONTACT_LASTNAME      : [contact lastname],
                                      REQ_KEY_CONTACT_MOBILE_NO     : [contact phoneNumber],
                                      REQ_KEY_CONTACT_PHOTO         : @"Image",
                                      REQ_KEY_CONTACT_SOURCE        : @"Import"};
        [contactList addObject:contactDict];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_LIST: contactList};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    //------------------------------- Test -------------------------------
    if (![Admin isOnline]) {
        NSDictionary *contact1 = @{RES_KEY_CONTACT_ID           : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME         : @"vasin",
                                   RES_KEY_CONTACT_LASTNAME     : @"north",
                                   RES_KEY_CONTACT_MOBILE_NO : @"087xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.google.co.th"};
        
        NSDictionary *contact2 = @{RES_KEY_CONTACT_ID          : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME          : @"Pluem",
                                   RES_KEY_CONTACT_LASTNAME     : @"Limrattanakan",
                                   RES_KEY_CONTACT_MOBILE_NO : @"089xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.google.co.th"};
        
        NSArray *arrContact = @[contact1,contact2];
        responseDict = @{RES_KEY_CONTACT_LIST : arrContact};
    }
    //------------------------------- Test -------------------------------
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate importContactError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ResponseGetContactList *serviceData = [[ResponseGetContactList alloc] initWithResponseData:responseData];
    [delegate importContactSuccess:serviceData];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate importContactError:nil];
}


@end
