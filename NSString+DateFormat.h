#import <Foundation/Foundation.h>
#import "NSDateFormatter+STFormat.h"

@interface NSString (DateFormat)

+(instancetype)stringFromDateInSTFormat:(NSDate *)date;

-(NSDate *)dateInSTFormat;

@end
