//
//  ServiceCT01_GetContactList.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ServiceCT01_GetContactList.h"


@implementation ServiceCT01_GetContactList
@synthesize getContactListDelegate, requestData;

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL,SERVICE_CT_01_GETCONTACTLIST_URL];
    [super setRequestURL:requestURL];
    [super requestService];
}
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    if (![Admin isOnline]) {
        //------------------------------- Test -------------------------------
        NSDictionary *contact1 = @{RES_KEY_CONTACT_ID           : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME    : @"vasin",
                                   RES_KEY_CONTACT_LASTNAME     : @"north",
                                   RES_KEY_CONTACT_MOBILE_NO    : @"087xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.google.co.th"};
        
        NSDictionary *contact2 = @{RES_KEY_CONTACT_ID           : @"01234",
                                   RES_KEY_CONTACT_FIRSTNAME    : @"Pluem",
                                   RES_KEY_CONTACT_LASTNAME     : @"Limrattanakan",
                                   RES_KEY_CONTACT_MOBILE_NO    : @"089xxxxxxx",
                                   RES_KEY_CONTACT_LAST_UPDATE  : @"1403773133605",
                                   RES_KEY_CONTACT_PHOTO_PATH   : @"www.google.co.th"};
        
        NSArray *arrContact = @[contact1,contact2];
        NSDictionary *contactList = @{RES_KEY_CONTACT_LIST : arrContact};
        responseDict = @{RES_KEY_RESPONSE_DATA: contactList};
        //------------------------------- Test -------------------------------
    }
    
    /*Example json
    {
        responseData =     {
            contactList =         (
                                   {
                                       contactId = 1489;
                                       firstName = Art;
                                       lastName = hotline;
                                       lastUpdatedDate = 1412332968000;
                                       mobileNo = 0812345690;
                                       photoPath = "";
                                   },
                                   {
                                       contactId = 1487;
                                       firstName = Art;
                                       lastName = isnt;
                                       lastUpdatedDate = 1407222144000;
                                       mobileNo = 0981234567;
                                       photoPath = "";
                                   },
                                   {
                                       contactId = 1488;
                                       firstName = Art;
                                       lastName = isss;
                                       lastUpdatedDate = 1407222236000;
                                       mobileNo = 0812345689;
                                       photoPath = "";
                                   },
                                   {
                                       contactId = 1472;
                                       firstName = Art;
                                       lastName = "";
                                       lastUpdatedDate = 1408017767000;
                                       mobileNo = 0800000001;
                                       photoPath = "";
                                   },
                                   {
                                       contactId = 1473;
                                       firstName = soomboon1;
                                       lastName = sirirattanachat;
                                       lastUpdatedDate = 1408017767000;
                                       mobileNo = 0880000001;
                                       photoPath = "/opt/equinox/picture/contact/contact_1473.jpg";
                                   },
                                   {
                                       contactId = 1499;
                                       firstName = TestFirstName;
                                       lastName = TestLastName;
                                       lastUpdatedDate = 1411379490000;
                                       mobileNo = 0811111111;
                                       photoPath = "";
                                   },
                                   {
                                       contactId = 1505;
                                       firstName = ytrew;
                                       lastName = tretwe;
                                       lastUpdatedDate = 1412329550000;
                                       mobileNo = 0987654321;
                                       photoPath = "";
                                   }
                                   );
        };
    */
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [getContactListDelegate getcontactListError:resultStatus];
        return;
    }
    ResponseGetContactList *serviceData = [[ResponseGetContactList alloc] initWithResponseData:responseDict[RES_KEY_RESPONSE_DATA]];
    [getContactListDelegate getContactListSuccess:serviceData];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [getContactListDelegate getcontactListError:nil];
}
@end
