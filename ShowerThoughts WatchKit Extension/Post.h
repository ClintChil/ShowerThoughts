//
//  Post.h
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STAError.h"

@interface Post : NSObject

@property NSString *body;
@property NSNumber *votes;
@property NSString *author;
@property NSDate *created;

+(NSArray *)postsFromArray:(NSArray *)array;
+(instancetype)defaultPost;
+(instancetype)postForError:(NSError *)error;

-(void)pushPostToRedditInBackground:(void(^)(NSError *error))completed;

+(instancetype)postWithBody:(NSString *)body;

@end
