//
//  AISNavigationBarLeftItem.m
//  AISbizlive
//
//  Created by Wachirawit on 5/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISNavigationBarLeftItem.h"
#import "AISImageGlobal.h"
#import "AISColor.h"
@implementation AISNavigationBarLeftItem

-(id)withAction:(SEL)actionbutton withTarget:(id)target{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:NAVIGATIONBAR_LEFTBUTTON] style:UIBarButtonItemStyleBordered target:target action:actionbutton];
    [backButton setTintColor:[AISColor grayColor]];
    return backButton;
}
@end
