//
//  ImportCell.m
//  AISbizlive
//
//  Created by Wachirawit on 6/26/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "ImportCell.h"
#import "AISGlobal.h"

@implementation ImportCell
{
    UIButton *btn;
    CGFloat offset;
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
    if(selected){
        self.layer.borderColor = [[AISColor lightgreenColor] CGColor];
        self.check.highlighted = YES;
        self.layer.borderWidth = 1.5f;
    }
    else{
        self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
        self.check.highlighted = NO;
        self.layer.borderWidth = 1.0f;
    }
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.origin.y += 5;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
