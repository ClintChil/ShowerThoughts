//
//  SharedDefaults.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright © 2015 Clint Chilcott. All rights reserved.
//

#import "SharedDefaults.h"

@implementation SharedDefaults

static NSString *const GroupName = @"group.showerModel";
static NSString *const UserNameKey = @"username";
static NSString *const PasswordKey = @"password";

+(void)setUsernameDefault:(NSString *)username andPasswordDefault:(NSString *)password{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    [defaults setObject:username forKey:UserNameKey];
    [defaults setObject:password forKey:PasswordKey];
    [defaults synchronize];
}

+(NSString *)usernameDefault {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    NSString *name = (NSString *)[defaults objectForKey:UserNameKey] ? (NSString *)[defaults objectForKey:UserNameKey] : @"clintchil";
    return name;
}

+(NSString *)passwordDefault {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    NSString *password =  (NSString *)[defaults objectForKey:PasswordKey] ? (NSString *)[defaults objectForKey:PasswordKey] : @"poopfart2";
    return password;
}
@end