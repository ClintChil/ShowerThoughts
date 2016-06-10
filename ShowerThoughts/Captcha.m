#import "Captcha.h"

@implementation Captcha

+(instancetype)captchaWithID:(NSString *)capID {
    Captcha *cap = [Captcha new];
    cap.captchaID = capID;
    return cap;
}

@end
