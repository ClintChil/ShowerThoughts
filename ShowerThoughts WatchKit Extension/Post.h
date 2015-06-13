//
//  Post.h
//  ShowerThoughts
//
//  Created by Clint Chilcott on 5/20/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property NSString *body;
@property NSInteger *votes;
@property NSString *author;

+(NSArray *)postsFromArray:(NSArray *)array;

@end
