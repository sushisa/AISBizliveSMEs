//
//  ServicePK03_Cashcard.h
//  AISbizlive
//
//  Created by Wachirawit on 10/13/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "CashcardDetail.h"
@protocol CashcardDelegate <NSObject>

- (void)cashCardSuccess:(CashcardDetail *)cashcardDetail;
- (void)cashCardError:(ResultStatus *)resultStatus;

@end

@interface ServicePK03_Cashcard : BizliveService

- (void)setParameterWithSerialCode:(NSString *)SerialCode;
@property (nonatomic, assign)id<CashcardDelegate> delegate;

@property (nonatomic, strong)NSString *serialCode;

@end
