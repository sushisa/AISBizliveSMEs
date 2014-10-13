//
//  ResponseListPackage.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPackageDetail.h"

@interface ResponseListPackage : NSObject

- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSMutableArray *listPackage;
@end
