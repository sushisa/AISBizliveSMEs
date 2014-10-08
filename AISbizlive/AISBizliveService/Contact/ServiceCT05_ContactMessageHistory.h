//
//  ServiceCT05_ContactMessageHistory.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import "BizliveService.h"
#import "ResponseContactMessageHistory.h"
#import "ContactMessageHistory.h"
@protocol ContactMessageHistoryDelegate <NSObject>

- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory;
- (void)contactMessageHistoryError:(ResultStatus *)status;

@end


@interface ServiceCT05_ContactMessageHistory : BizliveService

- (void)setParameterWithID:(NSString *)ID;

@property (nonatomic, assign)id<ContactMessageHistoryDelegate> delegate;
@property (nonatomic, strong)NSString *ID;
@end
