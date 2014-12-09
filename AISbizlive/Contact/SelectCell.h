//
//  SelectCell.h
//  AISbizlive
//
//  Created by Wachirawit on 10/20/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageContact;
@property (weak, nonatomic) IBOutlet UILabel *nameContact;
@property (weak, nonatomic) IBOutlet UILabel *telContact;
@property (strong, nonatomic) IBOutlet UILabel *lastUpdate;

@property (strong, nonatomic) IBOutlet UIImageView *checkContact;
@end
