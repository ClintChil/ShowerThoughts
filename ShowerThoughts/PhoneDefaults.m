//
//  PhoneDefaults.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "PhoneDefaults.h"

@implementation PhoneDefaults

static NSString *const HasSignedInKey = @"HasSignedIn";

+(BOOL)hasSignedIn {
    return [(NSNumber *)[[NSUserDefaults standardUserDefaults]valueForKey:HasSignedInKey] boolValue];
}

+(void)markAsSignedIn {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(YES) forKey:HasSignedInKey];
    [defaults synchronize];
}

@end
