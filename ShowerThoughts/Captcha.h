//
//  Captcha.h
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/16/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Captcha : NSObject

@property NSString *captchaID;
@property NSString *captchaValue;

+(instancetype)captchaWithID:(NSString *)capID;

@end
