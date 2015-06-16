//
//  STAError.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "STAError.h"

@implementation STAError

+(NSError *)notSignedInError {
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:@"User has not signed in yet."
                   forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:@"myDomain"
                               code:STANotSignedInErrorCode
                           userInfo:errorDetail];
}

+(NSError *)checkCaptchaError {
    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:@"Error checking if user needs captcha."
                   forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:@"myDomain"
                               code:STACaptchaError
                           userInfo:errorDetail];
}
@end
