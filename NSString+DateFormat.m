//
//  NSString+DateFormat.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "NSString+DateFormat.h"

@implementation NSString (DateFormat)

+(instancetype)stringFromDateInSTFormat:(NSDate *)date {
    NSDateFormatter *format = [NSDateFormatter standardSTFormat];
    return [format stringFromDate:[NSDate new]];
}

-(NSDate *)dateInSTFormat {
    NSDateFormatter *frmat = [NSDateFormatter standardSTFormat];
    return [frmat dateFromString:self];
}

@end
