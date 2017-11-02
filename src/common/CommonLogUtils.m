#import "CommonLogUtils.h"

@implementation CommonLogUtils

+ (void)logError:(NSError*)error
{
	NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

+ (void)logException:(NSException*)exception
{
	NSLog(@"An exception occurred: %@", exception.name);
	NSLog(@"Exception details: %@", exception.reason);
}

@end
