#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "AboutMainMenuViewController.h"
#import "AboutNameViewController.h"
#import "AboutPhoneViewController.h"
#import "AboutFavoriteColorsManageViewController.h"

@interface AboutNavigationController : UINavigationController

@property (weak) SWRevealViewController *revealViewController;
@property (nonatomic) AboutMainMenuViewController *menuViewController;
@property (nonatomic) AboutNameViewController *aboutNameViewController;
@property (nonatomic) AboutPhoneViewController *aboutPhoneViewController;
@property (nonatomic) AboutFavoriteColorsManageViewController *aboutFavoriteManageViewController;

- (id)init:(SWRevealViewController*)revealViewController;

@end
