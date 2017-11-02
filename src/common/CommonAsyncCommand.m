#import "CommonAsyncCommand.h"

@implementation CommonAsyncCommand

+ (void)execute:(void (^)())preCommand :(NSObject* (^)())command :(void (^)(NSObject*))postCommand
{
	if (preCommand != nil) {
		preCommand();
	}
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void) {
		
		NSObject *result = command();
		
		dispatch_async(dispatch_get_main_queue(), ^{
			if (postCommand != nil) {
				postCommand(result);
			}
		});
	});
}

@end
