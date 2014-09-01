//
//  ResponseGetContactList.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseGetContactList : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *contactList;



@end
