//
//  RedditCall.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditCall : NSObject

+(void)makeCallToRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler;

@end
