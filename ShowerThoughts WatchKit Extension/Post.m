//
//  Post.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "Post.h"

@implementation Post


-(instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    return self;
}

+(instancetype)postWithDictionary:(NSDictionary *)dict {
    return [[Post alloc]initWithDictionary:dict];
}


@end
