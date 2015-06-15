//
//  PostTextView.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "PostTextView.h"

@implementation PostTextView

-(void)prepareForInterfaceBuilder {
    [self setup];
}

-(void)awakeFromNib {
    [self setup];
}

-(void)setup {
    self.layer.cornerRadius = 5.0;
    self.clipsToBounds = YES;
}

@end
