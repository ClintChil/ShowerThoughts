#import <Foundation/Foundation.h>
#import "Post.h"

@interface RedditCall : NSObject

+(void)pullPostsFromRedditInBackground:(void(^)(NSArray *posts, NSError *error))completionHandler;

+(void)signInBackgroundWithUserName:(NSString *)username andPassword:(NSString *)password block:(void(^) (NSError *error))completionHandler;

@end
