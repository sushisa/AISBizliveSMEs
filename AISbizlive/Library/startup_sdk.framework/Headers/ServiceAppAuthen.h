//
//  ServiceAppAuthen.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 3/17/57 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"

@protocol ServiceAppAuthenDelegate <NSObject>
- (void)serviceAppAuthenSuccess;
- (void)serviceAppAuthenError:(ResponseStatus *)responseStatus;
@end

@interface ServiceAppAuthen : Service
@property (nonatomic, assign)id<ServiceAppAuthenDelegate> delegate;
- (void)fungusRequest;
@end
