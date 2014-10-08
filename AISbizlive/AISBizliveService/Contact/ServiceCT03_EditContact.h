//
//  ServiceCT03_EditContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ContactDetail.h"

@protocol EditContactDelegate <NSObject>

- (void)editContactSuccess:(ContactDetail *)contactDetail;
- (void)editContactError:(ResultStatus *)status;

@end

@interface ServiceCT03_EditContact : BizliveService

- (void)setParameterWithID:(NSString *)ID
                 firstname:(NSString *)firstname
                  lastname:(NSString *)lastname
                  mobileNO:(NSString *)mobileNO
                   image64:(NSString *)image64;

@property (nonatomic, strong) NSString *ID, *firstname, *lastname, *mobileNO, *image64;
@property (nonatomic, assign)id<EditContactDelegate> delegate;

@end
