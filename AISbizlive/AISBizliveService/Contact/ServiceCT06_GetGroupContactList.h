//
//  ServiceCT06_GetGroupContactList.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseGetGroupContactList.h"

@protocol GetGroupContactListDelegate <NSObject>

- (void)getGroupContactListSuccess:(ResponseGetGroupContactList *)responseData;
- (void)getGroupContactListError:(ResultStatus *)status;

@end

@interface ServiceCT06_GetGroupContactList : BizliveService

@property (nonatomic, assign)id<GetGroupContactListDelegate> delegate;

@end
