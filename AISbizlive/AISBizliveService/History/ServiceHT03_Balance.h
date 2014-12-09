//
//  ServiceHT03_Balance.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "ResponseBalance.h"

@protocol BalanceDelegate <NSObject>

- (void)balanceSuccess:(ResponseBalance *)responseBalance;
- (void)balanceError:(ResultStatus *)resultStatus;

@end

@interface ServiceHT03_Balance : BizliveService
@property (nonatomic, assign)id<BalanceDelegate> delegate;
@end
