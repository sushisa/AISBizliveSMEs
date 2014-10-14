//
//  ServiceLogout.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 10/13/2557 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import "Service.h"


@protocol ServiceLogoutDelegate <NSObject>

- (void)serviceLogoutSuccess;
- (void)servicelogoutError:(ResponseStatus *)status;

@end

@interface ServiceLogout : Service

@property(nonatomic, assign) id<ServiceLogoutDelegate> delegate;
- (void)fungusRequest;

@end
