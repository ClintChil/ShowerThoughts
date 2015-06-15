//
//  NSString+DateFormat.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+STFormat.h"

@interface NSString (DateFormat)

+(instancetype)stringFromDateInSTFormat:(NSDate *)date;

-(NSDate *)dateInSTFormat;

@end
