//
//  ServiceIN02_Privacy.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
@protocol PrivacyDelegate <NSObject>

- (void)privacySuccess:(NSString *)reponseData;
- (void)privacyError:(ResultStatus *)resultStatus;

@end

@interface ServiceIN02_Privacy : BizliveService
@property (nonatomic, assign)id<PrivacyDelegate> delegate;
@end
