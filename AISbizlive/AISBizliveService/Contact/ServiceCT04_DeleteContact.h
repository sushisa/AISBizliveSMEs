//
//  ServiceCT04_DeleteContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol DeleteContactDelegate <NSObject>

- (void)deleteContactSuccess;
- (void)deleteContactError:(ResultStatus *)status;

@end

@interface ServiceCT04_DeleteContact : BizliveService

- (void)setParameterWithContactIDList:(NSArray *)contactIDList;

@property (nonatomic, assign)id<DeleteContactDelegate> delegate;
@property (nonatomic, strong)NSArray *contactIDList;

@end
