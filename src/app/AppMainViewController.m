#import "AppMainViewController.h"
#import "AppData.h"
#import "CommonYesNoAlertView.h"
#import "AppDelegate.h"
#import "AppNotifications.h"

@interface AppMainViewController ()

@end

@implementation AppMainViewController

- (void)loadView
{
	[super loadView];
	
	[AppData getInstance].appRevealController = self;
	
	[self setRearViewController:self.mainMenuViewController];
	
	[self goTo:AppMainMenuItemAbout];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self panGestureRecognizer];
	[self tapGestureRecognizer];
	
	[self sync];
	
	[[NSNotificationCenter defaultCenter] addObserverForName:AppNotificationAboutMenuItemSelected object:nil queue:nil usingBlock:^(NSNotification *note) {
		NSNumber *menuItem = [note.userInfo objectForKey:AppNotificationKey0];
		NSLog(@"About menu item %@ id selected.", menuItem);
	}];
}

- (AppMainMenuViewController *)mainMenuViewController
{
	if (_mainMenuViewController == nil) {
		__weak AppMainViewController *weakSelf = self;
		
		_mainMenuViewController = [[AppMainMenuViewController alloc] init];
		_mainMenuViewController.mainView.titleBar.titleText.text = @"Menu";
		_mainMenuViewController.onSelect = ^(AppMainMenuItem item) {
			[weakSelf goTo:item];
		};
	}
	return _mainMenuViewController;
}

- (AboutNavigationController *)aboutNavigationController
{
	if (_aboutNavigationController == nil) {
		_aboutNavigationController = [[AboutNavigationController alloc] init:self];
	}
	return _aboutNavigationController;
}

- (void)goTo:(AppMainMenuItem)item
{
	switch (item) {
		case AppMainMenuItemAbout:
			if (![self isAboutVisible]) {
				[self setFrontViewController:self.aboutNavigationController animated:YES];
			} else {
				[self revealToggleAnimated:YES];
			}
			break;
		case AppMainMenuItemLogout:
			[self revealToggle:self];
			[[[CommonYesNoAlertView alloc] initWithMessage:@"Are you sure you want to log out?" :^{} :^{
				[(AppDelegate*)[UIApplication sharedApplication].delegate logout];
			}] show];
			
			[self sync];
			break;
		default:
			break;
	}
}

- (BOOL)isAboutVisible
{
	return [self.frontViewController isKindOfClass:[AboutNavigationController class]];
}

- (void)sync
{
	if ([self isAboutVisible]) {
		[self.mainMenuViewController selectItem:AppMainMenuItemAbout];
	}
}

@end
