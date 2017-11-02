#import <Foundation/Foundation.h>
#import "SWRevealViewController.h"

@interface AppData : NSObject

+ (AppData*)getInstance;

@property SWRevealViewController *appRevealController;

@end
