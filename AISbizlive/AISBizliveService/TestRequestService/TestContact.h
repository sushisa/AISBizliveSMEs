//
//  TestContact.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestContact : NSObject

- (void)serviceCT01_GetContactList;
- (void)serviceCT02_AddContact;
- (void)serviceCT03_EditContact;
- (void)serviceCT04_DeleteContact;
- (void)serviceCT05_ContactMessageHistory;
- (void)serviceCT06_GetGroupContactList;
- (void)serviceCT07_AddGroupContact;
- (void)ServiceCT08_GroupMessageHistory;
- (void)ServiceCT09_GetContactListToEditGroup;
- (void)serviceCT10_EditGroupContact;
- (void)serviceCT11_DeleteGroupContact;
- (void)serviceCT12_ImportContact;



@end
