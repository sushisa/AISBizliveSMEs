//
//  ServiceBizLive.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 6/24/57 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestService.h"


@protocol ServiceBizLiveDelegate <NSObject>
- (void)serviceBizLiveSuccess:(NSDictionary *)responseDict;
- (void)serviceBizLiveError:(ResponseStatus *)status;
@end

@interface ServiceBizLive : RequestService

@property (nonatomic, strong) id<ServiceBizLiveDelegate> serviceBizLiveDelegate;
@property (nonatomic, strong) NSString *BizLiveURL;
@property (nonatomic, strong) NSDictionary *requestDict;

- (void)fungusRequest;

@end
