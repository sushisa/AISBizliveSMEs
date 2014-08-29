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
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_ID   : self.ID,
                                  REQ_KEY_NAME         : self.name,
                                  REQ_KEY_LASTNAME     : self.lastname,
                                  REQ_KEY_PHONE_NUMBER : self.phoneNumber,
                                  REQ_KEY_PHOTO        : self.image64};
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)setParameterWithID:(NSString *)ID
                      name:(NSString *)name
                  lastname:(NSString *)lastname
               phoneNumber:(NSString *)phoneNumber
                   image64:(NSString *)image64
{
    self.ID = ID;
    self.name = name;
    self.lastname = lastname;
    self.phoneNumber = phoneNumber;
    self.image64 = image64;
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    //------------------------ Test ------------------------
    if (![Admin isOnline]) {
        responseData = @{RES_KEY_CONTACT_ID  : @"01234",
                         RES_KEY_NAME        : @"Woravit",
                         RES_KEY_LASTNAME    : @"Poang",
                         RES_KEY_MOBILE_NO   : @"089xxxxxxx",
                         RES_KEY_LAST_UPDATE : @"1403777666666",
                         RES_KEY_IMAGE_URL   : @"www.hotmail.co.th"};
    }
    //------------------------ Test ------------------------
    
    ContactDetail *contactDetail = [[ContactDetail alloc] initWithResponseData:responseData];
    [delegate editContactSuccess:contactDetail];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate editContactError:result];
}


@end
