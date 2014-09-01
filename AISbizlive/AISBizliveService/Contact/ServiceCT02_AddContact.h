//
//  ServiceCT02_AddContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/18/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseGetContactList.h"
#import "ContactDetail.h"

@protocol AddContactListDelegate <NSObject>

- (void)addContactSuccess:(ContactDetail *)contactDetail;
- (void)addContactError:(ResultStatus *)status;

@end

@interface ServiceCT02_AddContact : BizliveService

- (void)setParameterWithName:(NSString *)name
                    lastname:(NSString *)lastname
                 phoneNumber:(NSString *)phoneNumber
                     image64:(NSString *)image64;


@property (nonatomic, strong) NSString *name, *lastname, *phoneNumber, *image64;
@property (nonatomic, assign)id<AddContactListDelegate> delegate;

@end
