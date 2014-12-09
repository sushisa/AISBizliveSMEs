//
//  ImportCell.h
//  AISbizlive
//
//  Created by Wachirawit on 6/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImportCell :UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *check;

@property (weak, nonatomic) IBOutlet UIImageView *imageContact;
@property (weak, nonatomic) IBOutlet UILabel *nameContact;
@property (weak, nonatomic) IBOutlet UILabel *telContact;

@end
