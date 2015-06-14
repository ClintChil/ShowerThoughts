//
//  SharedDefaults.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright © 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedDefaults : NSObject

+(void)setUsernameDefault:(NSString *)username andPasswordDefault:(NSString *)password;
+(NSString *)usernameDefault;
+(NSString *)passwordDefault;
@end
