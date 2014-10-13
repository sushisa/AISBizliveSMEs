//
//  ResponseListPackage.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseListPackage.h"
#import "BizliveServiceParameter.h"

@implementation ResponseListPackage

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.listPackage = [[NSMutableArray alloc] init];
        ListPackageDetail *list = [[ListPackageDetail alloc]initWithResponseData:responseData];
        [self.listPackage addObject:list];
    }
    return self;
}
@end
