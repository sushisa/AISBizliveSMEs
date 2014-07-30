//
//  ServiceKeyExchange.h
//  FungusLibrary
//
//  Created by Vasin Charoensuk on 11/28/55 BE.
//  Copyright (c) 2555 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tommath.h"
#import "Service.h"

@protocol ServiceKeyExchangeDelegate <NSObject>
- (void)serviceKeyExchangeSuccess;
- (void)serviceKeyExchangeError:(ResponseStatus *)status;
@end

@interface ServiceKeyExchange : Service
@property (nonatomic, assign) id<ServiceKeyExchangeDelegate> delegate;
- (void)fungusRequest;
@end