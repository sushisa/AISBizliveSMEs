//
//  ContactMessageHistory.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/19/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactMessageHistory : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSString *sendDate, *message;


@end
