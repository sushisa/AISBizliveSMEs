//
//  ServiceCT01_GetContactList.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceCT01_GetContactList.h"

@implementation ServiceCT01_GetContactList
@synthesize delegate;

- (void)requestService
{
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseDict
{
    //------------------------------- Test -------------------------------
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
    responseDict = @{RES_KEY_CONTACT_LIST : arrContact};
    //------------------------------- Test -------------------------------

    ResponseGetContactList *serviceData = [[ResponseGetContactList alloc] initWithResponseData:responseDict];
    [delegate getContactListSuccess:serviceData];
}
- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate getcontactListError:result];
}





@end
