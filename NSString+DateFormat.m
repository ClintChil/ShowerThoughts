#import "NSString+DateFormat.h"

@implementation NSString (DateFormat)

+(instancetype)stringFromDateInSTFormat:(NSDate *)date {
    NSDateFormatter *format = [NSDateFormatter standardSTFormat];
    return [format stringFromDate:[NSDate new]];
}

-(NSDate *)dateInSTFormat {
    NSDateFormatter *frmat = [NSDateFormatter standardSTFormat];
    return [frmat dateFromString:self];
}

@end
