//
//  ServiceCT12_ImportContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseGetContactList.h"

@protocol ImportContactDelegate <NSObject>

- (void)importContactSuccess:(ResponseGetContactList *)responseGetContactList;
- (void)importContactError:(ResultStatus *)status;

@end
@interface ServiceCT12_ImportContact : BizliveService

- (void)setParameterWithContactList:(NSArray *)contactList;

@property (nonatomic, assign)id<ImportContactDelegate> delegate;
@property (nonatomic, strong)NSArray *contactList;

@end
