//
//  Captcha.m
//  ShowerThoughts
//
//  Created by Rich Fellure on 6/16/15.
//  Copyright (c) 2015 Clint Chilcott. All rights reserved.
//

#import "Captcha.h"

@implementation Captcha

+(instancetype)captchaWithID:(NSString *)capID {
    Captcha *cap = [Captcha new];
    cap.captchaID = capID;
    return cap;
}

@end
