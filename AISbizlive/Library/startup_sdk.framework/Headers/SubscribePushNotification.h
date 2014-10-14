//
//  ServicePushNotification.h
//  FungusFramework
//
//  Created by Pluem Limrattanakan on 9/11/2557 BE.
//  Copyright (c) 2557 AIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestService.h"

@protocol SubscribePushNotificationDelegate <NSObject>

- (void)subscribePushNotificationSuccess;
- (void)subscribePushNotificationError:(ResponseStatus *)responseStatus;

@end

@interface SubscribePushNotification : RequestService

- (void)setParameterWithAccessToken:(NSString *)accessToken
                          eventName:(NSString *)eventName;

@property (nonatomic, assign)id<SubscribePushNotificationDelegate>  delegate;

- (void)fungusRequest;

@end
