//
//  TemplateCell.m
//  AISbizlive
//
//  Created by Wachirawit on 7/10/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "TemplateCell.h"
#import "AISColor.h"
@implementation TemplateCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
//    self.layer.cornerRadius = 5.0f;
//    self.layer.masksToBounds = YES;
//    self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
//    self.layer.borderWidth = 1.0f;
    return self;
}
- (void)awakeFromNib
{
    // Initialization code
}

@end
