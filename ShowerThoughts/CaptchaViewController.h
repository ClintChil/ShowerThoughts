//
//  CaptchaViewController.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/15/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CaptchaViewController;

@protocol CaptchaVCDelegate <NSObject>

-(void)captchaVC:(CaptchaViewController *)vc didEnterCaptchaValue:(NSString *)value;

@end

@interface CaptchaViewController : UIViewController

@property id<CaptchaVCDelegate>delegate;
+(instancetype)fromNibWithImage:(UIImage *)image;

@end
