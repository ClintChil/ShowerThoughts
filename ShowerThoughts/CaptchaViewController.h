#import <UIKit/UIKit.h>
@class CaptchaViewController;

@protocol CaptchaVCDelegate <NSObject>

-(void)captchaVC:(CaptchaViewController *)vc didEnterCaptchaValue:(NSString *)value;

@end

@interface CaptchaViewController : UIViewController

@property id<CaptchaVCDelegate>delegate;
+(instancetype)fromNibWithImage:(UIImage *)image;

@end
