//
//  ServiceCT02_AddContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/18/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT02_AddContact.h"

@implementation ServiceCT02_AddContact
@synthesize delegate;

- (void)setParameterWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                         mobileNO:(NSString *)mobileNO
                          image64:(NSString *)image64
                    contactSource:(NSString *)contactSource;
{
    self.firstname = firstname;
    self.lastname = lastname;
    self.mobileNO = mobileNO;
    self.image64 = image64;
    self.contactSource = contactSource;
}

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL,SERVICE_CT_02_ADDCONTACT_URL];
    NSDictionary *requestData = @{REQ_KEY_CONTACT_FIRSTNAME    : self.firstname,
                                  REQ_KEY_CONTACT_LASTNAME     : self.lastname,
                                  REQ_KEY_CONTACT_MOBILE_NO    : self.mobileNO,
                                  REQ_KEY_CONTACT_PHOTO        : self.image64,
                                  REQ_KEY_CONTACT_SOURCE       : self.contactSource};
    
    [super setRequestURL:requestURL];
    [super setRequestData:requestData];
    [super requestService];
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    //------------------------ Test ------------------------
    
    if (![Admin isOnline]) {
        NSDictionary *contact = @{RES_KEY_CONTACT_ID          : @"01234",
                                  RES_KEY_CONTACT_FIRSTNAME   : @"Woravit",
                                  RES_KEY_CONTACT_LASTNAME    : @"Poang",
                                  RES_KEY_CONTACT_MOBILE_NO   : @"089xxxxxxx",
                                  RES_KEY_CONTACT_LAST_UPDATE : @"1403777666666",
                                  RES_KEY_CONTACT_PHOTO_PATH  : @"www.hotmail.co.th"};
        
        responseDict = @{RES_KEY_RESPONSE_DATA: contact};
    }
    //------------------------ Test ------------------------
    /*
    responseData =     {
        contactId = 1509;
        firstName = aPluem;
        lastName = aLimrattanakan;
        lastUpdatedDate = 1412761505000;
        mobileNo = 0915678910;
        photoPath = "";
    };
    responseStatus =     {
        responseCode = 0000;
        responseMessage = "\U0e40\U0e1e\U0e34\U0e48\U0e21\U0e02\U0e49\U0e2d\U0e21\U0e39\U0e25\U0e1c\U0e39\U0e49\U0e15\U0e34\U0e14\U0e15\U0e48\U0e2d\U0e2a\U0e33\U0e40\U0e23\U0e47\U0e08";
    };
     */

    
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate addContactError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ContactDetail *contactDetail = [[ContactDetail alloc] initWithResponseData:responseData];
    [delegate addContactSuccess:contactDetail];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate addContactError:nil];
}




@end
