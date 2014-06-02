//
//  AddPeopleViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/4/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPeopleViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    __weak IBOutlet UITextField *mobileNoTextField;
    __weak IBOutlet UITextField *lastNameTextField;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UIButton *imagePeople;
}
- (IBAction)selectPicture:(id)sender;

@end
