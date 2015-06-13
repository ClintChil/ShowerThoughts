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
@class Post;

@implementation RedditCall

+(void)makeCallToRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler {

    [[RKClient sharedClient] subredditWithName:@"showerthoughts" completion:^(id object, NSError *error) {
        RKSubreddit *selectedSubReddit = object;
        [[RKClient sharedClient] linksInSubreddit:selectedSubReddit pagination:nil completion:^(NSArray *collection, RKPagination *pagination, NSError *error) {
            completionHandler([Post postsFromArray:collection], error);
        }];
    }];

}

+(void)signInBackgroundWithUserName:(NSString *)username andPassword:(NSString *)password block:(void(^) (NSError *error))completionHandler {

    [[RKClient sharedClient] signInWithUsername:username password:password completion:^(NSError *error) {
        completionHandler(error);
    }];
}

+(void)pushPostToRedditInBackground:(void(^)(Post *post, NSError *error))completed {
    [[RKClient sharedClient] submitSelfPostWithTitle:@"testingtime" subredditName:@"test" text:nil captchaIdentifier:nil captchaValue:nil completion:^(NSError *error) {
        
    }];
}
@end
