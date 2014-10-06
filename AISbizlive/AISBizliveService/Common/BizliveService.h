//
//  BizliveService.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveServiceParameter.h"
#import "ResultStatus.h"
#import "Admin.h"


@interface BizliveService : NSObject

- (void)requestService;
- (NSDictionary *)getRequestData;

@property (nonatomic, strong)NSDictionary *requestDict;
@property (nonatomic, strong)NSString *requestUrl;


@end
