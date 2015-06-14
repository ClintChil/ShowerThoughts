//
//  RedditCall.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditCall : NSObject

+(void)pullPostsFromRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler theSignUpInBackground:(void(^)(BOOL success, NSError *error))signedUp;

+(void)signInBackgroundWithUserName:(NSString *)username andPassword:(NSString *)password block:(void(^) (NSError *error))completionHandler;

@end
