#import <UIKit/UIKit.h>

@interface CommonViewController : UIViewController

@property (nonatomic, strong) void (^vwDidAppr)();
@property (nonatomic, strong) void (^vwDidDisappr)();

@end
