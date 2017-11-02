#import "UIControl+Common.h"
#import <objc/runtime.h>

@interface CommonUIControlEventHandlerTarget : NSObject

@property (nonatomic, copy) void (^blockActn)(void);

- (void) invokeBlock:(id)sender;

@end

@implementation CommonUIControlEventHandlerTarget

@synthesize blockActn;

- (void) invokeBlock:(id)sender {
	[self blockActn]();
}

@end

@implementation UIControl (Common)

- (void)common_addEventHandler:(void(^)(void))handler forControlEvents:(UIControlEvents)controlEvents
{
	NSMutableArray *blockActns = objc_getAssociatedObject(self, @"CommonUIControlEventHandlerTarget");
	if (blockActns == nil) {
		blockActns = [NSMutableArray array];
		objc_setAssociatedObject(self, @"CommonUIControlEventHandlerTarget", blockActns, OBJC_ASSOCIATION_RETAIN);
	}
	
	CommonUIControlEventHandlerTarget *target = [[CommonUIControlEventHandlerTarget alloc] init];
	[target setBlockActn:handler];
	[blockActns addObject:target];
	
	[self addTarget:target action:@selector(invokeBlock:) forControlEvents:controlEvents];
}

@end
