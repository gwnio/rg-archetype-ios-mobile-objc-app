#import "UIView+Common.h"
#import "UIColor+Common.h"

@implementation UIView (Common)

- (void)common_touchHighlight:(NSString*)clearHex
{
	UIColor *beforeClearColor = self.backgroundColor;
	self.backgroundColor = [UIColor common_fromHex:clearHex];
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		self.backgroundColor = beforeClearColor;
	});
}

- (void)common_addTransitionAnimation:(NSString*)transitionDirection
{
	CATransition *transition = [CATransition animation];
	[transition setDuration:0.3];
	[transition setType:kCATransitionPush];
	[transition setSubtype:transitionDirection];
	[transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[self.layer addAnimation:transition forKey:kCATransition];
}
@end
