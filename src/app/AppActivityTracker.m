#import "AppActivityTracker.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "CommonStringUtils.h"

@implementation AppActivityTracker

+ (void)trackScreenViews:(NSArray*)screenNames
{
	[self trackScreenView:[screenNames componentsJoinedByString:@" > "]];
}

+ (void)trackScreenView:(NSString*)screenName
{
	id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
	if (tracker != nil && [CommonStringUtils isNotEmpty:screenName]) {
		[tracker set:kGAIScreenName value:screenName];
		[tracker send:[[GAIDictionaryBuilder createScreenView] build]];
	}
}

+ (void)trackEvent:(NSString*)category :(NSString*)action :(NSString*)label :(NSNumber*)value
{
	id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
	if (tracker != nil) {
		NSMutableDictionary *event = [[GAIDictionaryBuilder createEventWithCategory:category action:action label:label value:value] build];
		[tracker send:event];
	}
}

@end
