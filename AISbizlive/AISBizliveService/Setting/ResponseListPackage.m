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
        NSArray *arrPackageList = responseData[RES_KEY_SETTING_LISTPACKAGE];
        
        for (NSInteger i = 0; i < [arrPackageList count]; i++) {
            ListPackageDetail *packages = [[ListPackageDetail alloc] initWithResponseData:arrPackageList[i]];
            [self.listPackage addObject:packages];
        }
    }
    return self;
}
@end
