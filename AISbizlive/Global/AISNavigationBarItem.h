//
//  AISNavigationBarLeftItem.h
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISNavigationBarItem : NSObject
-(id)BackButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)DoneButtonWithAction:(SEL)actionbutton withTarget:(id)target;

-(id)AddButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)CancelButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)ClearButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)DeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)PeopleAddButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)PeopleDeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)GroupAddButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)GroupDeleteButtonWithAction:(SEL)actionbutton withTarget:(id)target;
-(id)TemplateAddButtonWithAction:(SEL)actionbutton withTarget:(id)target;
@end
