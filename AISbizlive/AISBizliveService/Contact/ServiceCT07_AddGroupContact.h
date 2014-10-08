//
//  ServiceCT07_AddGroupContact.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 8/20/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BizliveService.h"
#import "GroupContactDetail.h"


@protocol AddGroupContactListDelegate <NSObject>

- (void)addGroupContactSuccess:(GroupContactDetail *)groupContactDetail;
- (void)addGroupContactError:(ResultStatus *)status;

@end


@interface ServiceCT07_AddGroupContact : BizliveService

- (void)setParameterWithGroupName:(NSString *)groupName
                            image:(NSString *)image
                        contactID:(NSArray *)contactID;


@property(nonatomic, strong)id<AddGroupContactListDelegate> delegate;
@property(nonatomic, strong)NSString *groupName, *image;
@property(nonatomic, strong)NSArray *contactID;
@end
