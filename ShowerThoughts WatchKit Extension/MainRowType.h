#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface MainRowType : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postBodyLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *postVoteLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *upArrowImage;

@end
