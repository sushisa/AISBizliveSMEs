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

- (void)setParameterWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                      mobileNO:(NSString *)mobileNO
                          image64:(NSString *)image64
                    contactSource:(NSString *)contactSource;


@property (nonatomic, strong) NSString *firstname, *lastname, *mobileNO, *image64, *contactSource;
@property (nonatomic, assign)id<AddContactListDelegate> delegate;

@end
