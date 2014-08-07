//
//  AISNavigationBarLeftItem.m
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISNavigationBarItem.h"
#import "AISImageGlobal.h"
#import "AISColor.h"
#import "AISString.h"
@implementation AISNavigationBarItem

-(id)BackButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:NAVIGATIONBAR_LEFTBUTTON] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [backButton setTintColor:[AISColor grayColor]];
    return backButton;
}
-(id)DoneButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:typeButton KeyOfValue:@"DONE"] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [doneButton setTintColor:[AISColor grayColor]];
    return doneButton;
}
-(id)AddButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:typeButton KeyOfValue:@"ADD"] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [cancelButton setTintColor:[AISColor lightgrayColor]];
    return cancelButton;
}
-(id)CancelButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:typeButton KeyOfValue:@"CANCEL"] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [cancelButton setTintColor:[AISColor lightgrayColor]];
    return cancelButton;
}
-(id)ClearButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:typeButton KeyOfValue:@"CLEAR"] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [clearButton setTintColor:[AISColor lightgrayColor]];
    return clearButton;
}
-(id)DeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithTitle:[AISString commonString:typeButton KeyOfValue:@"DELETE"] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [deleteButton setTintColor:[UIColor redColor]];
    return deleteButton;
}
-(id)PeopleAddButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *contactAddButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_PEOPLE_ADD] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    contactAddButton.tintColor = [AISColor lightgreenColor];
    return contactAddButton;
}
-(id)PeopleDeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *contactDeleteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_PEOPLE_DELETE] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    contactDeleteButton.tintColor = [AISColor lightgreenColor];
    return contactDeleteButton;
}
-(id)GroupAddButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *groupAddButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_GROUP_ADD] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    groupAddButton.tintColor = [AISColor lightgreenColor];
    return groupAddButton;
}
-(id)GroupDeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *groupDeleteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_GROUP_DELETE] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    groupDeleteButton.tintColor = [AISColor lightgreenColor];
    return groupDeleteButton;
}
-(id)TemplateAddButtonWithAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *templateRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:BUTTON_ADD_DEFAULT] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    return templateRightButton;
}
@end
