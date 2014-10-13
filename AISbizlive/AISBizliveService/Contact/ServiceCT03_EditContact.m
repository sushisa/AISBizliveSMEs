//
//  ServiceCT03_EditContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT03_EditContact.h"

@implementation ServiceCT03_EditContact

@synthesize delegate;

- (void)requestService
{
    NSString *requestURL = [NSString stringWithFormat:@"%@%@", SERVER_PREFIX_URL, SERVICE_CT_03_EDIT_CONTACT_URL];
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_ID        : self.ID,
                                  REQ_KEY_CONTACT_FIRSTNAME : self.firstname,
                                  REQ_KEY_CONTACT_LASTNAME  : self.lastname,
                                  REQ_KEY_CONTACT_MOBILE_NO : self.mobileNO,
                                  REQ_KEY_CONTACT_PHOTO     : self.image64};
    [super setRequestURL:requestURL];
    [super setRequestData:requestDict];
    [super requestService];
}

- (void)setParameterWithID:(NSString *)ID
                 firstname:(NSString *)firstname
                  lastname:(NSString *)lastname
                  mobileNO:(NSString *)mobileNO
                   image64:(NSString *)image64
{
    self.ID = ID;
    self.firstname = firstname;
    self.lastname = lastname;
    self.mobileNO = mobileNO;
    self.image64 = image64;
}

- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict
{
    //------------------------ Test ------------------------
    if (![Admin isOnline]) {
        NSDictionary *contact = @{RES_KEY_CONTACT_ID             : @"01234",
                                  RES_KEY_CONTACT_FIRSTNAME      : @"Woravit",
                                  RES_KEY_CONTACT_LASTNAME       : @"Poang",
                                  RES_KEY_CONTACT_MOBILE_NO      : @"089xxxxxxx",
                                  RES_KEY_CONTACT_LAST_UPDATE    : @"1403777666666",
                                  RES_KEY_CONTACT_PHOTO_PATH     : @"www.hotmail.co.th"};
        responseDict = @{RES_KEY_RESPONSE_DATA: contact};
    }
    //------------------------ Test ------------------------
    
    ResultStatus *resultStatus = [[ResultStatus alloc] initWithResponse:responseDict];
    if (![resultStatus isResponseSuccess]) {
        [delegate editContactError:resultStatus];
        return;
    }
    
    NSDictionary *responseData = responseDict[RES_KEY_RESPONSE_DATA];
    ContactDetail *contactDetail = [[ContactDetail alloc] initWithResponseData:responseData];
    [delegate editContactSuccess:contactDetail];
}

- (void)serviceBizLiveError:(ResponseStatus *)status
{
    [delegate editContactError:nil];
}


@end
