//
//  ServiceTP04_DeleteTemplate.h
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
@protocol DeleteTemplateDelegate <NSObject>

- (void)deleteTemplateSuccess;
- (void)deleteTemplateError:(ResultStatus *)resultStatus;

@end

@interface ServiceTP04_DeleteTemplate : BizliveService


- (void)setParameterWithID:(NSString *)ID;
@property (nonatomic, assign)id<DeleteTemplateDelegate> delegate;

@property (nonatomic, strong)NSString *ID;

@end
