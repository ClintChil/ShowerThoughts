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

@protocol PostDelegate <NSObject>

-(Captcha *)needCaptchaFromImage:(UIImage *)image forPost:(Post *)post;

@end


typedef void(^PostBlockType) (BOOL result, NSError *error);


@interface Post : NSObject

@property NSString *body;
@property NSNumber *votes;
@property NSString *author;
@property NSDate *created;
@property id<PostDelegate>delegate;

+(NSArray *)postsFromArray:(NSArray *)array;
+(instancetype)defaultPost;
+(instancetype)postForError:(NSError *)error;

/**
 :Description: Method to call on an instance of Post, checks to see if the user is able to just post, or if they need a captcha. If they need a captcha, it will return the image of the captcha, so it can be desplayed, then this method called again with the correct captcha info
 @param: captchaId: This is the id of the captcha that is being displayed, or nil if no captcha.
 @param: captchaVal: This is the value the user will input to verify the captcha
 @param: block: The block with parameters of a UIImage, which is the image of the captcha, if the user has to display a captcha to post, and a NSError to display the specific error.
 */
-(void)postOnRedditInBackground:(PostBlockType)complete;

+(instancetype)postWithBody:(NSString *)body;

@end
