#import "SWRevealViewController.h"
#import "AppMainMenuViewController.h"
#import "AboutNavigationController.h"

@interface AppMainViewController : SWRevealViewController

@property (nonatomic) AppMainMenuViewController *mainMenuViewController;
@property (nonatomic) AboutNavigationController *aboutNavigationController;

@end
