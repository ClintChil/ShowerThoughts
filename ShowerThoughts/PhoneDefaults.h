//
//  PhoneDefaults.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/14/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneDefaults : NSObject

+(BOOL)hasSignedIn;
+(void)markAsSignedIn;

@end
