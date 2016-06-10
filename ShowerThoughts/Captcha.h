#import <Foundation/Foundation.h>

@interface Captcha : NSObject

@property NSString *captchaID;
@property NSString *captchaValue;

+(instancetype)captchaWithID:(NSString *)capID;

@end
