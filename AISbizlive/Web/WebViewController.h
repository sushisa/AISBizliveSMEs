//
//  WebViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 6/27/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
{
    __weak IBOutlet UIWebView *webView;
    
}
@property(strong,nonatomic) NSString *Header;

@end
