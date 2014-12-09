//
//  ServiceCT08_GroupMessageHistory.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/21/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseGroupMessageHistory.h"

@protocol GroupMessageHistoryDelegate <NSObject>

- (void)groupMessageHistorySuccess:(ResponseGroupMessageHistory *)responseGroupMessageHistory;
- (void)groupMessageHistoryError:(ResultStatus *)status;

@end

@interface ServiceCT08_GroupMessageHistory : BizliveService

- (void)setParameterWithID:(NSString *)ID;
@property (nonatomic, assign)id<GroupMessageHistoryDelegate> delegate;
@property (nonatomic, strong)NSString *ID;

@end
