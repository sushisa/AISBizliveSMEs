//
//  PackageDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "PackageDetail.h"
#import "BizliveServiceParameter.h"

@implementation PackageDetail

@synthesize code, name, price, value;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.code = responseData[RES_KEY_PACKAGE_CODE];
        self.name = responseData[RES_KEY_PACKAGE_NAME];
        self.price = responseData[RES_KEY_PACKAGE_PRICE];
        self.value = responseData[RES_KEY_PACKAGE_VALUE];
    }
    return self;
}

- (id)initWithPackageDetail:(NSArray*)PackageDetail
{
    self = [super init];
    if (self) {
        self.code = PackageDetail[0];
        self.name = PackageDetail[1];
        self.price = PackageDetail[2];
        self.value = PackageDetail[3];
    }
    return self;
}

@end
