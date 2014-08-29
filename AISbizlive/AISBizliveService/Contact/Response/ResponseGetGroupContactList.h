//
//  ResponseGetGroupContactList.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GroupContactDetail.h"

@interface ResponseGetGroupContactList : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *groupContactList;

@end
