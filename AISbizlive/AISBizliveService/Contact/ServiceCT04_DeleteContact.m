//
//  ServiceCT04_DeleteContact.m
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "ServiceCT04_DeleteContact.h"

@implementation ServiceCT04_DeleteContact
@synthesize delegate;
- (void)setParameterWithContactIDList:(NSArray *)contactIDList;
{
    self.contactIDList = contactIDList;
}

- (void)requestService
{
    NSMutableArray *contactList = [[NSMutableArray alloc]init];
    for (NSString *contactID in self.contactIDList) {
        NSDictionary *contactDict = @{REQ_KEY_CONTACT_ID: contactID};
        [contactList addObject:contactDict];
    }
    
    NSDictionary *requestDict = @{REQ_KEY_CONTACT_LIST  : contactList};

    NSLog(@"%@",requestDict);
    
    [super setRequestDict:requestDict];
    [super requestService];
}

- (void)bizliveServiceSuccess:(NSDictionary *)responseData
{
    [delegate deleteContactSuccess:responseData];
}

- (void)bizliveServiceError:(ResultStatus *)result
{
    [delegate deleteContactError:result];
}


@end
