//
//  ServiceCT09_GetContactListToEditGroup.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "GroupContactDetail.h"

@protocol GetContactListToEditGroupDelegate <NSObject>

- (void)getContactListToEditGroupSuccess:(GroupContactDetail *)groupContactDetail;
- (void)getContactListToEditGroupError:(ResultStatus *)status;

@end

@interface ServiceCT09_GetContactListToEditGroup : BizliveService

- (void)setParameterWithID:(NSString *)ID;
@property (nonatomic, assign)id<GetContactListToEditGroupDelegate> delegate;
@property (nonatomic, strong)NSString *ID;
@end
