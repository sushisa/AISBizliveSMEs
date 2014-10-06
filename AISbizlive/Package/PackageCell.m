//
//  PackageCell.m
//  AISbizlive
//
//  Created by Wachirawit on 7/8/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "PackageCell.h"
#import "AISColor.h"
@implementation PackageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    
    if(self){
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = NO;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(selected){
        self.layer.borderColor = [[AISColor lightgreenColor] CGColor];
        
        self.layer.borderWidth = 1.5f;
    }
    else{
        self.layer.borderColor = [[AISColor lightgrayColor] CGColor];
        self.layer.borderWidth = 1.0f;
    }
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
