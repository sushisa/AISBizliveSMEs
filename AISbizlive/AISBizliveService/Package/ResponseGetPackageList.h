//
//  ResponseGetPackageList.h
//  AISbizlive
//
//  Created by Wachirawit on 10/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PackageDetail.h"
@interface ResponseGetPackageList : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *packageList;

@end
