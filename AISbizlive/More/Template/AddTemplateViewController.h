//
//  AddTemplateViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/9/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTemplateViewController : UIViewController <UITextViewDelegate>
{
    
    __weak IBOutlet UITextField *nameTemplate;
    __weak IBOutlet UITextView *descritionTemplate;
    __weak IBOutlet UILabel *textLength;
}

@property (strong, nonatomic) NSString *descritionItem;
@end
