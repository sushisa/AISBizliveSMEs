//
//  ContactCell.h
//  AISbizlive
//
//  Created by Wachirawit on 4/23/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
@interface ContactCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageContact;
@property (weak, nonatomic) IBOutlet UILabel *nameContact;
@property (weak, nonatomic) IBOutlet UILabel *telContact;

@property (strong, nonatomic) IBOutlet UIImageView *checkContact;
@property (weak, nonatomic) IBOutlet UIImageView *discriptionImage;


@end
