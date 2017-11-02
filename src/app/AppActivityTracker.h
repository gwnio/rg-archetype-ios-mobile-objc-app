#import <Foundation/Foundation.h>

@interface AppActivityTracker : NSObject

+ (void)trackScreenViews:(NSArray*)screenNames;
+ (void)trackScreenView:(NSString*)screenName;
+ (void)trackEvent:(NSString*)category :(NSString*)action :(NSString*)label :(NSNumber*)value;

@end
