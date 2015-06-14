//
//  Post.m
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "Post.h"
#import <RedditKit/RedditKit.h>
#import "SharedDefaults.h"

@implementation Post


-(instancetype)initWithLink:(RKLink *)link {
    self = [super init];
    self.body = link.title;
    self.author = link.author;
    self.votes = [NSNumber numberWithInteger:link.upvotes];
    self.created = link.created;
    return self;
}

+(instancetype)postWithBody:(NSString *)body{
    Post *p = [Post new];
    p.author = [SharedDefaults usernameDefault];
    p.created = [NSDate new];
    p.body = body;
    return p;
}

+(NSArray *)postsFromArray:(NSArray *)array {
    NSMutableArray *ma = [NSMutableArray new];
    for (RKLink *link in array) {
        Post *post = [[Post alloc]initWithLink:link];
        [ma addObject:post];
    }
    return  [NSArray arrayWithArray:ma];
}


-(void)pushPostToRedditInBackground:(void(^)(NSError *error))completed {
    [[RKClient sharedClient] submitSelfPostWithTitle:self.body subredditName:@"test" text:nil captchaIdentifier:nil captchaValue:nil completion:^(NSError *error) {
        completed(error);
    }];
}

@end
