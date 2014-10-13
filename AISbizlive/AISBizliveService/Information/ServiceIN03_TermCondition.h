//
//  ServiceIN03_TermCondition.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
@protocol TermConditionDelegate <NSObject>

- (void)termConditionSuccess:(NSString *)reponseData;
- (void)termConditionError:(ResultStatus *)resultStatus;

@end

@interface ServiceIN03_TermCondition : BizliveService
@property (nonatomic, assign)id<TermConditionDelegate> delegate;


@end
