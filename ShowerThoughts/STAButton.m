//
//  STAButton.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "STAButton.h"
#import "UIColor+SRTColor.h"

@implementation STAButton

-(void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

-(void)setup {
    self.layer.borderColor = [[UIColor staBlueColor] CGColor];
    [self setTintColor:[UIColor staBlueColor]];
    self.layer.borderWidth = 3.0;
    self.layer.cornerRadius = 5.0;
}

@end
