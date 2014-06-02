//
//  DetailNewsViewController.h
//  AISbizlive
//
//  Created by Wachirawit on 4/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNewsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *newsLabelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;

@property (weak, nonatomic) IBOutlet UITextView *newsDescrition;
@property (strong, nonatomic) NSString *titleItem;
@property (strong, nonatomic) NSString *imageItem;
@property (strong, nonatomic) NSString *descritionItem;
@end
