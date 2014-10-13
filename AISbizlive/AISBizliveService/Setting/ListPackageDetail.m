//
//  ListPackageDetail.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ListPackageDetail.h"
#import "BizliveServiceParameter.h"

@implementation ListPackageDetail

@synthesize name,expiredate;

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.name = responseData[RES_KEY_SETTING_PACKAGENAME];
        self.expiredate = responseData[RES_KEY_SETTING_EXPIREDATE];
    }
    return self;
}



@end
