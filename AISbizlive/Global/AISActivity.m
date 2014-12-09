//
//  AISActivity.m
//  AISbizlive
//
//  Created by Wachirawit on 10/16/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISActivity.h"
#import "AppDelegate.h"
#import "AISColor.h"
#import "MBProgressHUD.h"
@implementation AISActivity
UIView* backGroundView;
MBProgressHUD *hud ;
UIActivityIndicatorView *activityView;
-(id)init{
    return self;
}
-(void)showActivity{
   
    UIWindow* mainWindow = (((AppDelegate *)[UIApplication sharedApplication].delegate).window);
    hud = [MBProgressHUD showHUDAddedTo:mainWindow animated:YES];
    hud.mode = MBProgressHUDAnimationFade;
    hud.color = [AISColor lightgrayColor];
    hud.labelText = @"Loading ..";
    hud.labelColor = [UIColor whiteColor];
    [hud show:YES];
//    activityView =[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    activityView.center=mainWindow.center;
//    backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
//    backGroundView.backgroundColor = [[UIColor alloc] initWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.3f];
//    [backGroundView addSubview:activityView];
//    [mainWindow addSubview:backGroundView];
//    [activityView startAnimating];
}
-(void)dismissActivity{
    
    [hud hide:YES];
//    [activityView stopAnimating];
//    [backGroundView removeFromSuperview];
//    [newView removeFromSuperview];
}
@end
