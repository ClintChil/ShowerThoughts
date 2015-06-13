//
//  Post.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "Post.h"
#import <RedditKit/RedditKit.h>

@implementation Post


-(instancetype)initWithLink:(RKLink *)link {
    self = [super init];
    self.body = link.title;
    self.author = link.author;
    self.votes = [NSNumber numberWithInteger:link.upvotes];
    return self;
}

+(NSArray *)postsFromArray:(NSArray *)array {
    NSMutableArray *ma = [NSMutableArray new];
    for (RKLink *link in array) {
        Post *post = [[Post alloc]initWithLink:link];
        [ma addObject:post];
    }
    return  [NSArray arrayWithArray:ma];
}

+(instancetype)defaultPost {
    Post *post = [Post new];
    post.body = @"We are loading the data, give it a second.";
    return post;
}

+(instancetype)postForError:(NSError *)error {
    Post *post = [Post new];
    post.body = @"There was a network error, sorry we are working on this.";
    return post;
}

@end
