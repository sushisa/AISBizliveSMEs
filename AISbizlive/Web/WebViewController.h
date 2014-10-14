//
//  WebViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 6/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceIN01_Help.h"
#import "ServiceIN02_Privacy.h"
#import "ServiceIN03_TermCondition.h"
#import "ServiceIN04_About.h"

@interface WebViewController : UIViewController<HelpDelegate,PrivacyDelegate,TermConditionDelegate,AboutDelegate>
{
    __weak IBOutlet UIWebView *webView;
}
@property(strong,nonatomic) NSString *Header,*indexRow;

@end
