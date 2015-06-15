//
//  SharedDefaults.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright © 2015 Clint Chilcott. All rights reserved.
//

#import "SharedDefaults.h"

@implementation SharedDefaults

static NSString *const GroupName = @"group.com.RichFell.ShowerThoughts";
static NSString *const UserNameKey = @"username";
static NSString *const PasswordKey = @"password";
static NSString *const HasSignedInKey = @"HasSignedIn";

+(void)setUsernameDefault:(NSString *)username andPasswordDefault:(NSString *)password{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    [defaults setObject:username forKey:UserNameKey];
    [defaults setObject:password forKey:PasswordKey];
    [defaults synchronize];
}

+(NSString *)usernameDefault {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    NSString *name = (NSString *)[defaults objectForKey:UserNameKey];
    NSLog(@"name: %@", name);
    return name;
}

+(NSString *)passwordDefault {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    NSString *password =  (NSString *)[defaults objectForKey:PasswordKey];
    NSLog(@"pass: %@", password);
    return password;
}

+(BOOL)hasSignedIn {
    NSUserDefaults *d = [[NSUserDefaults alloc]initWithSuiteName:GroupName];
    return [(NSNumber *)[d objectForKey:HasSignedInKey] boolValue];
}

+(void)markAsSignedIn {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:GroupName];
    [defaults setObject:@(YES) forKey:HasSignedInKey];
    [defaults synchronize];
}
@end
