//
//  RedditCall.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/13/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "RedditCall.h"
#import <RedditKit/RedditKit.h>
@class Post;

@implementation RedditCall

+(void)makeCallToRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler {

    [[RKClient sharedClient] subredditWithName:@"showerthoughts" completion:^(id object, NSError *error) {
        RKSubreddit *selectedSubReddit = object;
        [[RKClient sharedClient] linksInSubreddit:selectedSubReddit pagination:nil completion:^(NSArray *collection, RKPagination *pagination, NSError *error) {
            completionHandler(collection, error);
        }];
    }];

}
@end
