//
//  ServiceHT02_Topup.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "ResponseTopup.h"

@protocol TopupDelegate <NSObject>

- (void)topupSuccess:(ResponseTopup *)responseTopup;
- (void)topupError:(ResultStatus *)resultStatus;

@end

@interface ServiceHT02_Topup : BizliveService
@property (nonatomic, assign)id<TopupDelegate> delegate;

@end
