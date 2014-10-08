//
//  ServiceCT11_DeleteGroupContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"

@protocol DeleteGroupContactDelegate <NSObject>

- (void)deleteGroupContactSuccess;
- (void)deleteGroupContactError:(ResultStatus *)status;

@end

@interface ServiceCT11_DeleteGroupContact : BizliveService


- (void)setParameterWithGroupIDList:(NSArray *)groupIDList;

@property (nonatomic, assign)id<DeleteGroupContactDelegate> delegate;
@property (nonatomic, strong)NSArray *groupIDList;

@end
