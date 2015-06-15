//
//  STAWButton.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "STAWButton.h"

@implementation STAWButton

-(void)awakeFromNib {
    [self setup];
}

-(void)prepareForInterfaceBuilder {
    [self setup];
}

-(void)setup {
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 5.0;
}

@end
