#import "NSDateFormatter+STFormat.h"

@implementation NSDateFormatter (STFormat)

+(instancetype)standardSTFormat {
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"MMM ddd, yyyy";
    return format;
}

@end
