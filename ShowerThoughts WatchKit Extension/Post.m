#import "Post.h"
#import "SharedDefaults.h"
#import "Captcha.h"

@implementation Post

//-(instancetype)initWithLink:(NSString *)link {
//    self = [super init];
//    self.body = link.title;
//    self.author = link.author;
//    self.votes = [NSNumber numberWithInteger:link.score];
//    self.created = link.created;
//    return self;
//}

+(instancetype)postWithBody:(NSString *)body{
    Post *p = [Post new];
    p.author = [SharedDefaults usernameDefault];
    p.created = [NSDate new];
    p.body = body;
    return p;
}

+(NSArray *)postsFromArray:(NSArray *)array {
    NSMutableArray *ma = [NSMutableArray new];
//    for (RKLink *link in array) {
//        Post *post = [[Post alloc]initWithLink:link];
//        [ma addObject:post];
//    }
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
//    [[RKClient sharedClient] submitSelfPostWithTitle:self.body
//                                       subredditName:@"test"
//                                                text:nil
//                                   captchaIdentifier:self.captcha.captchaID
//                                        captchaValue:self.captcha.captchaValue
//                                          completion:^(NSError *error) {
//                                              complete(error ? NO : YES, error);
//    }];
}

//-(void)checkIfNeedCAPTCHAInBackground:(void(^)(BOOL result, UIImage *image, NSError *error))completed {
//    if (![SharedDefaults hasSignedIn]) {
//        completed(nil, nil, [STAError notSignedInError]);
//        return;
//    }
//    if (![SharedDefaults needsCaptcha]) {
//        completed(NO, nil, nil);
//        return;
//    }
//    RKClient *client = [RKClient sharedClient];
//    [client needsCaptchaWithCompletion:^(BOOL result, NSError *error) {
//        if (result) {
//            [client newCaptchaIdentifierWithCompletion:^(id object, NSError *error) {
//                if (!error) {
//                    self.captcha = [Captcha captchaWithID:(NSString *)object];
//                    [client imageForCaptchaIdentifier:self.captcha.captchaID completion:^(id object, NSError *error) {
//                        completed(YES, (UIImage *)object, error);
//                    }];
//                }else {
//                    completed(YES, nil, error);
//                }
//            }];
//        }else if(!result && !error){
//            [SharedDefaults setNeedsCaptcha:NO];
//            completed(NO, nil, error);
//        }else {
//            completed(YES, nil, error);
//        }
//    }];
//}

@end
