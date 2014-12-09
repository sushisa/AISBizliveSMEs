//
//  BalanceDetail.h
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BalanceDetail : NSObject


- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSString *name, *date, *status, *amount;
@end
