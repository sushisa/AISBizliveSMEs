//
//  TestContact.m
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/29/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TestContact.h"

#import "ServiceCT01_GetContactList.h"
#import "ServiceCT02_AddContact.h"
#import "ServiceCT03_EditContact.h"
#import "ServiceCT04_DeleteContact.h"
#import "ServiceCT05_ContactMessageHistory.h"
#import "ServiceCT06_GetGroupContactList.h"
#import "ServiceCT07_AddGroupContact.h"
#import "ServiceCT08_GroupMessageHistory.h"
#import "ServiceCT09_GetContactListToEditGroup.h"
#import "ServiceCT10_EditGroupContact.h"
#import "ServiceCT11_DeleteGroupContact.h"
#import "ServiceCT12_ImportContact.h"

@interface TestContact()
<GetContactListDelegate,
AddContactListDelegate,
EditContactDelegate,
DeleteContactDelegate,
ContactMessageHistoryDelegate,
GetGroupContactListDelegate,
AddGroupContactListDelegate,
GroupMessageHistoryDelegate,
GetContactListToEditGroupDelegate,
EditGroupContactDelegate,
DeleteGroupContactDelegate,
ImportContactDelegate>
@end

@implementation TestContact


#pragma mark - ServiceCT01_GetContactList
- (void)serviceCT01_GetContactList
{
    ServiceCT01_GetContactList *service = [[ServiceCT01_GetContactList alloc] init];
    [service setDelegate:self];
    [service requestService];
}

- (void)getContactListSuccess:(ResponseGetContactList *)responseGetContactList
{
    for (ContactDetail *contact in [responseGetContactList contactList]) {
        NSLog(@"Contact ID          : %@\n", [contact ID]);
        NSLog(@"Contact name        : %@\n", [contact name]);
        NSLog(@"Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"Contact imageURL    : %@\n", [contact imageURL]);
    }
    
}
- (void)getcontactListError:(ResultStatus *)status
{
    
}
#pragma mark - ServiceCT02_AddContact
- (void)serviceCT02_AddContact
{
    ServiceCT02_AddContact *service = [[ServiceCT02_AddContact alloc] init];
    [service setDelegate:self];
    [service setParameterWithName:@"Pluem" lastname:@"Limrattanakan" phoneNumber:@"088XXXXXXXX" image64:@"bra.jpg"];
    [service requestService];
}

- (void)addContactSuccess:(ContactDetail *)contactDetail
{
    NSLog(@"Contact ID          : %@\n", [contactDetail ID]);
    NSLog(@"Contact name        : %@\n", [contactDetail name]);
    NSLog(@"Contact lastname    : %@\n", [contactDetail lastname]);
    NSLog(@"Contact phonenumber : %@\n", [contactDetail phoneNumber]);
    NSLog(@"Contact lastUpdate  : %@\n", [contactDetail lastUpdate]);
    NSLog(@"Contact imageURL    : %@\n", [contactDetail imageURL]);
}
- (void)addContactError:(ResultStatus *)status;
{
    
}

#pragma mark - ServiceCT03_EditContact
- (void)serviceCT03_EditContact
{
    ServiceCT03_EditContact *service = [[ServiceCT03_EditContact alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:@"1234" name:@"Pluem" lastname:@"Limrattanakan" phoneNumber:@"088XXXXXXXX" image64:@"bra.jpg"];
    [service requestService];
}

- (void)editContactSuccess:(ContactDetail *)contactDetail
{
    NSLog(@"Contact ID          : %@\n", [contactDetail ID]);
    NSLog(@"Contact name        : %@\n", [contactDetail name]);
    NSLog(@"Contact lastname    : %@\n", [contactDetail lastname]);
    NSLog(@"Contact phonenumber : %@\n", [contactDetail phoneNumber]);
    NSLog(@"Contact lastUpdate  : %@\n", [contactDetail lastUpdate]);
    NSLog(@"Contact imageURL    : %@\n", [contactDetail imageURL]);
}
- (void)editContactError:(ResultStatus *)status
{
    
}

#pragma mark - ServiceCT04_DeleteContact
- (void)serviceCT04_DeleteContact
{
    ServiceCT04_DeleteContact *service = [[ServiceCT04_DeleteContact alloc] init];
    [service setDelegate:self];
    NSArray *contactIDList  = @[@"111",@"222",@"333"];
    [service setParameterWithContactIDList:contactIDList];
    [service requestService];
}

- (void)deleteContactSuccess:(NSDictionary *)responseData
{
    
}
- (void)deleteContactError:(ResultStatus *)status
{
    
}


#pragma mark - ServiceCT05_ContactMessageHistory
- (void)serviceCT05_ContactMessageHistory
{
    ServiceCT05_ContactMessageHistory *service = [[ServiceCT05_ContactMessageHistory alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:@"1234566"];
    [service requestService];
}

- (void)contactMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory
{
    for (ContactMessageHistory *history in [responseContactMessageHistory historyList]) {
        NSLog(@"%@\n",[history sendDate]);
        NSLog(@"%@\n",[history message]);
    }
}
- (void)contactMessageHistoryError:(ResultStatus *)status
{
    
}

#pragma mark - ServiceCT06_GetGroupContactList
- (void)serviceCT06_GetGroupContactList
{
    ServiceCT06_GetGroupContactList *service = [[ServiceCT06_GetGroupContactList alloc] init];
    [service setDelegate:self];
    [service requestService];
}

- (void)getGroupContactListSuccess:(ResponseGetGroupContactList *)responseData
{
    for (GroupContactDetail *groupContact in [responseData groupContactList]) {
        NSLog(@"Group ID         : %@\n", [groupContact ID]);
        NSLog(@"Group name       : %@\n", [groupContact name]);
        NSLog(@"Group imageURL   : %@\n", [groupContact imageURL]);
        NSLog(@"Group lastUpdate : %@\n", [groupContact lastUpdate]);
        
        for (ContactDetail *contact in [groupContact contactList]) {
            NSLog(@"  Contact ID          : %@\n", [contact ID]);
            NSLog(@"  Contact name        : %@\n", [contact name]);
            NSLog(@"  Contact lastname    : %@\n", [contact lastname]);
            NSLog(@"  Contact phonenumber : %@\n", [contact phoneNumber]);
            NSLog(@"  Contact lastUpdate  : %@\n", [contact lastUpdate]);
            NSLog(@"  Contact imageURL    : %@\n", [contact imageURL]);
        }
        
    }
    
    
}
- (void)getGroupContactListError:(ResultStatus *)status
{
    NSLog(@"%@",[status responseCode]);
    NSLog(@"%@",[status responseData]);
}

#pragma mark - ServiceCT07_AddGroupContact
- (void)serviceCT07_AddGroupContact
{
    ServiceCT07_AddGroupContact *service = [[ServiceCT07_AddGroupContact alloc] init];
    [service setDelegate:self];
    [service setParameterWithGroupName:@"PromptNow" image:@"image" contactID:@[@"111", @"112"]];
    [service requestService];
}
- (void)addGroupContactSuccess:(GroupContactDetail *)groupContactDetail
{
    NSLog(@"Group ID         : %@\n", [groupContactDetail ID]);
    NSLog(@"Group name       : %@\n", [groupContactDetail name]);
    NSLog(@"Group imageURL   : %@\n", [groupContactDetail imageURL]);
    NSLog(@"Group lastUpdate : %@\n", [groupContactDetail lastUpdate]);
    
    for (ContactDetail *contact in [groupContactDetail contactList]) {
        NSLog(@"  Contact ID          : %@\n", [contact ID]);
        NSLog(@"  Contact name        : %@\n", [contact name]);
        NSLog(@"  Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"  Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"  Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"  Contact imageURL    : %@\n", [contact imageURL]);
    }
}
- (void)addGroupContactError:(ResultStatus *)status
{
    
}

#pragma mark  - ServiceCT08_GroupMessageHistory
- (void)ServiceCT08_GroupMessageHistory
{
    ServiceCT08_GroupMessageHistory *service = [[ServiceCT08_GroupMessageHistory alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:@"111"];
    [service requestService];
}

- (void)groupMessageHistorySuccess:(ResponseContactMessageHistory *)responseContactMessageHistory
{
    for (ContactMessageHistory *history in [responseContactMessageHistory historyList]) {
        NSLog(@"%@\n",[history sendDate]);
        NSLog(@"%@\n",[history message]);
    }
}
- (void)groupMessageHistoryError:(ResultStatus *)status
{
    
}
#pragma mark - ServiceCT09_GetContactListToEditGroup
- (void)ServiceCT09_GetContactListToEditGroup
{
    ServiceCT09_GetContactListToEditGroup *service = [[ServiceCT09_GetContactListToEditGroup alloc] init];
    [service setDelegate:self];
    [service setParameterWithID:@"111"];
    [service requestService];
}

- (void)getContactListToEditGroupSuccess:(GroupContactDetail *)groupContactDetail
{
    NSLog(@"Group ID         : %@\n", [groupContactDetail ID]);
    NSLog(@"Group name       : %@\n", [groupContactDetail name]);
    NSLog(@"Group imageURL   : %@\n", [groupContactDetail imageURL]);
    NSLog(@"Group lastUpdate : %@\n", [groupContactDetail lastUpdate]);
    
    for (ContactDetail *contact in [groupContactDetail contactList]) {
        NSLog(@"  Contact ID          : %@\n", [contact ID]);
        NSLog(@"  Contact name        : %@\n", [contact name]);
        NSLog(@"  Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"  Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"  Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"  Contact imageURL    : %@\n", [contact imageURL]);
    }
}
- (void)getContactListToEditGroupError:(ResultStatus *)status
{
    
}

#pragma mark - ServiceCT10_EditGroupContact
- (void)serviceCT10_EditGroupContact
{
    ServiceCT10_EditGroupContact *service = [[ServiceCT10_EditGroupContact alloc] init];
    [service setDelegate:self];
    [service setParameterWithGroupID:@"111" name:@"name" image64:@"image" contactID:@[@"111",@"222",@"333"]];
}

- (void)editGroupContactSuccess:(GroupContactDetail *)groupContactDetail
{
    NSLog(@"Group ID         : %@\n", [groupContactDetail ID]);
    NSLog(@"Group name       : %@\n", [groupContactDetail name]);
    NSLog(@"Group imageURL   : %@\n", [groupContactDetail imageURL]);
    NSLog(@"Group lastUpdate : %@\n", [groupContactDetail lastUpdate]);
    
    for (ContactDetail *contact in [groupContactDetail contactList]) {
        NSLog(@"  Contact ID          : %@\n", [contact ID]);
        NSLog(@"  Contact name        : %@\n", [contact name]);
        NSLog(@"  Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"  Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"  Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"  Contact imageURL    : %@\n", [contact imageURL]);
    }
    
}
- (void)editGroupContactError:(ResultStatus *)status
{
    
}

#pragma mark - ServiceCT11_DeleteGroupContact.h
- (void)serviceCT11_DeleteGroupContact
{
    ServiceCT11_DeleteGroupContact *service  = [ServiceCT11_DeleteGroupContact new];
    [service setDelegate:self];
    [service setParameterWithGroupIDList:@[@"111", @"222"]];
    [service requestService];
}
- (void)deleteGroupContactSuccess
{
    
}
- (void)deleteGroupContactError:(ResultStatus *)status
{
    
}

#pragma mark - ServiceCT12_ImportContact
- (void)serviceCT12_ImportContact
{
    ServiceCT12_ImportContact *service = [ServiceCT12_ImportContact new];
    [service setDelegate:self];
    
    NSArray *contactList = [NSArray new];
    [service setContactList:contactList];
    [service requestService];
}

- (void)importContactSuccess:(ResponseGetContactList *)responseGetContactList
{
    for (ContactDetail *contact in [responseGetContactList contactList]) {
        NSLog(@"Contact ID          : %@\n", [contact ID]);
        NSLog(@"Contact name        : %@\n", [contact name]);
        NSLog(@"Contact lastname    : %@\n", [contact lastname]);
        NSLog(@"Contact phonenumber : %@\n", [contact phoneNumber]);
        NSLog(@"Contact lastUpdate  : %@\n", [contact lastUpdate]);
        NSLog(@"Contact imageURL    : %@\n", [contact imageURL]);
    }
}
- (void)importContactError:(ResultStatus *)status
{
    
}


@end
