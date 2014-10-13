//
//  ResponseSettingProfile.m
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ResponseSettingProfile.h"
#import "BizliveServiceParameter.h"

@implementation ResponseSettingProfile

- (id)initWithResponseData:(NSDictionary *)responseData
{
    self = [super init];
    if (self) {
        self.settingProfile = [[NSMutableArray alloc] init];
        ProfileDetail *profile = [[ProfileDetail alloc]initWithResponseData:responseData];
        [self.settingProfile addObject:profile];
    }
    return self;
}

@end
