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

-(void)postOnRedditInBackground:(PostBlockType)complete {
    if ([SharedDefaults hasSignedIn]) {
        if ([SharedDefaults needsCaptcha]) {
            [self checkIfNeedCAPTCHAInBackground:^(BOOL result, UIImage *image) {
                if (result) {
                    Captcha *captcha = [self.delegate needCaptchaFromImage:image
                                                                            forPost:self];
                    [self postToRedditWithCaptchaID:captcha.captchaID
                                      andcaptchaVal:captcha.captchaValue
                                              block:^(NSError *error) {
                                                  complete(error ? NO : YES, error);

                    }];
                }else {
                    complete(result, [STAError checkCaptchaError]);
                }
            }];
        }else {
            [self postToRedditWithCaptchaID:nil andcaptchaVal:nil block:^(NSError *error) {
                complete(error ? NO : YES, error);
            }];
        }
    } else {
        complete(nil,[STAError notSignedInError]);
    }

}

-(void)postToRedditWithCaptchaID:(NSString *)captchaId andcaptchaVal:(NSString *)captchaVal block:(void(^)(NSError *error))completed {
    [[RKClient sharedClient] submitSelfPostWithTitle:self.body
                                       subredditName:@"test"
                                                text:nil
                                   captchaIdentifier:captchaId
                                        captchaValue:captchaVal
                                          completion:^(NSError *error) {
                                                completed(error);
    }];
}

-(void)checkIfNeedCAPTCHAInBackground:(void(^)(BOOL result, UIImage *image))completed {
    RKClient *client = [RKClient sharedClient];
    [client needsCaptchaWithCompletion:^(BOOL result, NSError *error) {
        if (result) {
            [client newCaptchaIdentifierWithCompletion:^(id object, NSError *error) {
                if (!error) {
                    [client imageForCaptchaIdentifier:object completion:^(id object, NSError *error) {
                        completed(YES, (UIImage *)object);
                    }];
                }else {
                    completed(YES, nil);
                }
            }];
        }else {
            [SharedDefaults setNeedsCaptcha:NO];
            completed(NO, nil);
        }
        if (!result && error) {
            completed(NO, nil);
        }
    }];
}

@end
