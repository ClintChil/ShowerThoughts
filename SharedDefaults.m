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
    return (NSString *)[defaults objectForKey:UserNameKey];
}

+(NSString *)passwordDefault {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    return (NSString *)[defaults objectForKey:PasswordKey];
}
@end
