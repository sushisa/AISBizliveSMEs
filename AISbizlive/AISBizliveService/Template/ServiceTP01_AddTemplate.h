//
//  ServiceTP01_AddTemplate.h
//  AISbizlive
//
//  Created by Wachirawit on 10/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "TemplateDetail.h"
@protocol AddTemplateDelegate <NSObject>

- (void)addTemplateSuccess:(TemplateDetail *)templateDetail;
- (void)addTemplateError:(ResultStatus *)resultStatus;

@end

@interface ServiceTP01_AddTemplate : BizliveService

- (void)setParameterWithName:(NSString *)name
                    Message:(NSString *)message;

@property (nonatomic, assign)id<AddTemplateDelegate> delegate;

@property (nonatomic, strong)NSString *name,*message;
@end
