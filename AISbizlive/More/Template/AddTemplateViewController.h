//
//  AddTemplateViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/9/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceTP01_AddTemplate.h"
#import "ServiceTP03_EditTemplate.h"
@class AddTemplateViewController;
@protocol AddTemplateViewControllerDelegate <NSObject>
- (void)didFinishAddTemplate:(TemplateDetail *)addTemplateArray;
- (void)didFinishUpdateTemplate:(TemplateDetail *)updateTemplateArray;
@end
@interface AddTemplateViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate,AddTemplateDelegate,EditTemplateDelegate>
{
    
    __weak IBOutlet UITextField *nameTemplate;
    __weak IBOutlet UILabel *nameTemplateLabel;
    __weak IBOutlet UITextView *descritionTemplate;
    __weak IBOutlet UILabel *descriptionTemplateLabel;
    __weak IBOutlet UILabel *textLength;
}
@property (nonatomic, weak) id <AddTemplateViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *TemplateName;
@property (strong, nonatomic) NSString *TemplateMessage;
@property (strong, nonatomic) NSString *descritionItem;
@end
