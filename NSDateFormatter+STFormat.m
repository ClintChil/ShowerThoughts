//
//  NSDateFormatter+STFormat.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "NSDateFormatter+STFormat.h"

@implementation NSDateFormatter (STFormat)

+(instancetype)standardSTFormat {
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"MMM ddd, yyyy";
    return format;
}

@end
