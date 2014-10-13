//
//  ProfileDetail.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseListPackage.h"
@interface ProfileDetail : NSObject


- (id)initWithResponseData:(NSDictionary *)responseData;

@property (nonatomic, strong)NSString *firstname,*lastname,*mobileno,*topupbalance,*totalSMS,*usedSMS,*balanceSMS;
@property (nonatomic, strong)NSArray *listPackage;
@end
