#import <UIKit/UIKit.h>

@interface UIControl (Common)

- (void)common_addEventHandler:(void(^)(void))handler forControlEvents:(UIControlEvents)controlEvents;

@end
