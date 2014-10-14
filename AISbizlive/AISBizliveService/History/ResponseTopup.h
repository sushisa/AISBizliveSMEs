//
//  ResponseTopup.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HistoryTopupDetail.h"

@interface ResponseTopup : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *topup;
@end
