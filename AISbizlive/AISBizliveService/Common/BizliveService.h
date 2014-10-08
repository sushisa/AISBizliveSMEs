//
//  BizliveService.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <startup_sdk/ServiceBizLive.h>
#import "BizliveServiceParameter.h"
#import "ResultStatus.h"
#import "Admin.h"
#import "BizliveServiceConfig.h"

@interface BizliveService : NSObject <ServiceBizLiveDelegate>
{
    ServiceBizLive *serviceBizLive;
}

- (void)requestService;
- (NSDictionary *)getRequestData:(NSDictionary *)requestData;

@property (nonatomic, strong)NSDictionary *requestData;
@property (nonatomic, strong)NSString *requestURL;


@end
