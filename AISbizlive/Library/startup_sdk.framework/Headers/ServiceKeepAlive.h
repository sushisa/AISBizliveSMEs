//
//  ServiceKeepAlive.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 5/2/57 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"

@protocol ServiceKeepAliveDelegate <NSObject>

- (void)serviceKeepAliveSuccess;
- (void)serviceKeepAliveError:(ResponseStatus *)status;

@end


@interface ServiceKeepAlive : Service

@property (nonatomic, assign)id<ServiceKeepAliveDelegate> delegate;

- (void)fungusRequest;

@end
