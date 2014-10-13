//
//  ServiceIN01_Help.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BizliveService.h"
@protocol HelpDelegate <NSObject>

- (void)helpSuccess:(NSString *)reponseData;
- (void)helpError:(ResultStatus *)resultStatus;

@end

@interface ServiceIN01_Help : BizliveService
@property (nonatomic, assign)id<HelpDelegate> delegate;
@end
