//
//  ServiceST01_SettingProfile.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
#import "ResponseSettingProfile.h"
@protocol SettingProfileDelegate <NSObject>

- (void)settingProfileSuccess:(ResponseSettingProfile *)responseSettingProfile;
- (void)settingProfileError:(ResultStatus *)resultStatus;

@end

@interface ServiceST01_SettingProfile : BizliveService

@property (nonatomic, assign)id<SettingProfileDelegate> delegate;

@end
