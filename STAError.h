#import <Foundation/Foundation.h>
#import "Constants.h"

@interface STAError : NSObject

+(NSError *)notSignedInError;
+(NSError *)checkCaptchaError;

@end
