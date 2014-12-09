//
//  DetailCell.m
//  AISbizlive
//
//  Created by Wachirawit on 10/28/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "DetailCell.h"
#import "AISGlobal.h"
@implementation DetailCell

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
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
    self.layer.borderWidth = 1.0f;
    return self;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.size.height -= 2*2;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}

@end
