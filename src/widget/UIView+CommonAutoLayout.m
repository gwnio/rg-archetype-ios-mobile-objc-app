#import "UIView+CommonAutoLayout.h"

@implementation UIView (CommonAutoLayout)

- (void)stackViewsVertically:(NSArray*)views
{
	[self stackViewsVertically:views :YES :0.0];
}

- (void)stackViewsVertically:(NSArray*)views :(float)offset
{
	[self stackViewsVertically:views :YES :offset];
}

- (void)stackViewsVertically:(NSArray*)views :(BOOL)fit :(float)offset
{
	UIView *previousView = nil;
	for (UIView *view in views) {
		if (previousView == nil) {
			[view autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:offset];
		} else {
			[view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:previousView withOffset:offset];
		}
		[view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:offset];
		[view autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:(-1 * offset)];
		previousView = view;
	}
	if (fit && previousView != nil) {
		[previousView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:(-1 * offset)];
	}
}

- (void)stackViewsHorizontally:(NSArray*)views :(ALEdge)startEdge :(BOOL)fit :(float)offset
{
	UIView *previousView = nil;
	
	if (startEdge == ALEdgeLeft) {
		for (UIView *view in views) {
			[view autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:offset];
			if (previousView == nil) {
				[view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:offset];
			} else {
				[view autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:previousView withOffset:offset];
			}
			[view autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:(-1 * offset)];
			previousView = view;
		}
		if (fit && previousView != nil) {
			[previousView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:(-1 * offset)];
		}
	} else if (startEdge == ALEdgeRight) {
		for (int i = (int)[views count]; i > 0; i--) {
			UIView *view = views[i - 1];
			
			[view autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:offset];
			if (previousView == nil) {
				[view autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self withOffset:(-1 * offset)];
			} else {
				[view autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:previousView withOffset:(-1 * offset)];
			}
			[view autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:(-1 * offset)];
			previousView = view;
		}
		if (fit && previousView != nil) {
			[previousView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self withOffset:(-1 * offset)];
		}
	}
}

- (NSDictionary *) autoPinTopBottomViewController:(UIViewController *)vc
{
	return [self autoPinTopBottomViewController:vc wthInset:0];
}

- (NSDictionary *) autoPinTopBottomViewController:(UIViewController *)vc wthInset:(CGFloat)inset
{
	NSMutableDictionary *dict = [NSMutableDictionary new];
	[dict setValue:[self autoPinToTopLayoutGuideOfViewController:vc withInset:inset] forKey:@"t"];
	[dict setValue:[self autoPinToBottomLayoutGuideOfViewController:vc withInset:inset] forKey:@"b"];
	return dict;
}

- (NSDictionary *) autoPinLeftRightToSuper
{
	return [self autoPinLeftRightToSuperWithInset:0];
}

- (NSDictionary *) autoPinLeftRightToSuperWithInset:(CGFloat)inset
{
	NSMutableDictionary *dict = [NSMutableDictionary new];
	[dict setValue:[self autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:inset] forKey:@"l"];
	[dict setValue:[self autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:inset] forKey:@"r"];
	return dict;
}

@end
