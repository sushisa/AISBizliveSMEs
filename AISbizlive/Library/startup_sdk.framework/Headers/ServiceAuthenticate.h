//
//  ServiceAuthenticateNew.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 3/13/57 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"

@protocol ServiceAuthenticateDelegate <NSObject>

-(void)serviceAuthenticateSuccess;
-(void)serviceAuthenticateError:(ResponseStatus *)status;

@end

@interface ServiceAuthenticate : Service
@property (nonatomic, assign) id<ServiceAuthenticateDelegate> delegate;
-(void)fungusRequest;
@end