#import <UIKit/UIKit.h>
#import "AppMainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) AppMainViewController *appViewController;

-(void)logout;

@end

