#import <Foundation/Foundation.h>

@interface SharedDefaults : NSObject

+(void)setUsernameDefault:(NSString *)username andPasswordDefault:(NSString *)password;
+(NSString *)usernameDefault;
+(NSString *)passwordDefault;
+(BOOL)hasSignedIn;
+(void)markAsSignedIn;
+(BOOL)needsCaptcha;
+(void)setNeedsCaptcha:(BOOL)needs;
@end
