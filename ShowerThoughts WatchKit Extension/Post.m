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
#import "Captcha.h"

@implementation Post

-(instancetype)initWithLink:(RKLink *)link {
    self = [super init];
    self.body = link.title;
    self.author = link.author;
    self.votes = [NSNumber numberWithInteger:link.score];
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


-(void)postOnRedditWithBlock:(PostBlockType)complete {
    if (!self.captcha) {
        self.captcha = [Captcha new];
    }
    [[RKClient sharedClient] submitSelfPostWithTitle:self.body
                                       subredditName:@"test"
                                                text:nil
                                   captchaIdentifier:self.captcha.captchaID
                                        captchaValue:self.captcha.captchaValue
                                          completion:^(NSError *error) {
                                              complete(error ? NO : YES, error);
    }];
}

-(void)checkIfNeedCAPTCHAInBackground:(void(^)(BOOL result, UIImage *image, NSError *error))completed {
    if ([SharedDefaults hasSignedIn]) {
        if ([SharedDefaults needsCaptcha]) {
            RKClient *client = [RKClient sharedClient];
            [client needsCaptchaWithCompletion:^(BOOL result, NSError *error) {
                if (result) {
                    [client newCaptchaIdentifierWithCompletion:^(id object, NSError *error) {
                        if (!error) {
                            self.captcha = [Captcha captchaWithID:(NSString *)object];
                            [client imageForCaptchaIdentifier:object completion:^(id object, NSError *error) {
                                completed(YES, (UIImage *)object, error);
                            }];
                        }else {
                            completed(YES, nil, error);
                        }
                    }];
                }else {
                    [SharedDefaults setNeedsCaptcha:NO];
                    completed(NO, nil, error);
                }
                if (!result && error) {
                    completed(NO, nil, error);
                }
            }];
        }else {
            completed(NO, nil, nil);
        }
    } else {
        completed(YES, nil, [STAError notSignedInError]);
    }

}

@end
