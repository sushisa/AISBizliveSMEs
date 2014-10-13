//
//  ServiceIN04_About.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
@protocol AboutDelegate <NSObject>

- (void)aboutSuccess:(NSString *)reponseData;
- (void)aboutError:(ResultStatus *)resultStatus;

@end

@interface ServiceIN04_About : BizliveService
@property (nonatomic, assign)id<AboutDelegate> delegate;


@end
