//
//  ResponseGetPackageList.m
//  AISbizlive
//
//  Created by Wachirawit on 10/15/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseGetPackageList.h"
#import "BizliveServiceParameter.h"

@implementation ResponseGetPackageList


- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.packageList = [[NSMutableArray alloc] init];
        NSArray *arrPackageList = responseData[RES_KEY_PACKAGE_LIST];
        
        for (NSInteger i = 0; i < [arrPackageList count]; i++) {
            PackageDetail *packages = [[PackageDetail alloc] initWithResponseData:arrPackageList[i]];
            [self.packageList addObject:packages];
        }
        
    }
    return self;
}
@end
