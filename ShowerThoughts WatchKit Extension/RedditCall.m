//
//  RedditCall.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RedditCall.h"
#import <RedditKit/RedditKit.h>
#import "Post.h"
#import "SharedDefaults.h"
@class Post;

@implementation RedditCall

+(void)pullPostsFromRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler theSignUpInBackground:(void(^)(BOOL success, NSError *error))signedUp {

    [[RKClient sharedClient] subredditWithName:@"showerthoughts" completion:^(id object, NSError *error) {
        RKSubreddit *selectedSubReddit = object;
        [[RKClient sharedClient] linksInSubreddit:selectedSubReddit pagination:nil completion:^(NSArray *collection, RKPagination *pagination, NSError *error) {
            completionHandler([Post postsFromArray:collection], error);
            if (!error) {
                [RedditCall signInBackgroundWithUserName:[SharedDefaults usernameDefault] andPassword:[SharedDefaults passwordDefault] block:^(NSError *error) {
                    signedUp(!error ? YES : NO, error);
                }];
            }
        }];
    }];

}

+(void)signInBackgroundWithUserName:(NSString *)username andPassword:(NSString *)password block:(void(^) (NSError *error))completionHandler {

    [[RKClient sharedClient] signInWithUsername:username password:password completion:^(NSError *error) {
        completionHandler(error);
    }];
}


@end
