//
//  Post.h
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STAError.h"
@class Post, Captcha;

typedef void(^PostBlockType) (BOOL result, NSError *error);


@interface Post : NSObject

@property NSString *body;
@property NSNumber *votes;
@property NSString *author;
@property NSDate *created;
@property Captcha *captcha;

+(NSArray *)postsFromArray:(NSArray *)array;
+(instancetype)defaultPost;
+(instancetype)postForError:(NSError *)error;

/**
 :Description: Method to call on an instance of Post, checks to see if the user is able to just post, or if they need a captcha. If they need a captcha, it will return the image of the captcha, so it can be desplayed, then this method called again with the correct captcha info
 @param: block: The block with parameters of a UIImage, which is the image of the captcha, if the user has to display a captcha to post, and a NSError to display the specific error.
 */
-(void)postOnRedditWithBlock:(PostBlockType)complete;

+(instancetype)postWithBody:(NSString *)body;

-(void)checkIfNeedCAPTCHAInBackground:(void(^)(BOOL result, UIImage *image, NSError *error))completed;

@end
