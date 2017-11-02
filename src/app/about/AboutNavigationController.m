#import "AboutNavigationController.h"
#import "AppData.h"
#import "AppNotifications.h"

@interface AboutNavigationController ()

@end

@implementation AboutNavigationController

- (id)init:(SWRevealViewController*)revealViewController
{
	self = [super init];
	if (self) {
		self.revealViewController = revealViewController;
		[self setNavigationBarHidden:YES];
	}
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[self.revealViewController setRightViewController:self.menuViewController];
	
	[self goTo:AboutMainMenuItemName];
	[self sync];
}

- (AboutMainMenuViewController *)menuViewController
{
	if (_menuViewController == nil) {
		__weak AboutNavigationController *weakSelf = self;
		
		_menuViewController = [[AboutMainMenuViewController alloc] init];
		_menuViewController.onSelect = ^(AboutMainMenuItem item) {
			[[AppData getInstance].appRevealController rightRevealToggleAnimated:YES];
			[weakSelf goTo:item];
		};
	}
	return _menuViewController;
}

- (AboutNameViewController *)aboutNameViewController
{
	if (_aboutNameViewController == nil) {
		_aboutNameViewController = [[AboutNameViewController alloc] init];
		[_aboutNameViewController.mainView.titleBar.menuButton addTarget:self action:@selector(onMenuButtonSelect) forControlEvents:UIControlEventTouchUpInside];
		[_aboutNameViewController.mainView.titleBar.menu2Button addTarget:self action:@selector(onMenu2ButtonSelect) forControlEvents:UIControlEventTouchUpInside];
	}
	return _aboutNameViewController;
}

- (AboutPhoneViewController *)aboutPhoneViewController
{
	if (_aboutPhoneViewController == nil) {
		_aboutPhoneViewController = [[AboutPhoneViewController alloc] init];
		[_aboutPhoneViewController.mainView.titleBar.menuButton addTarget:self action:@selector(onMenuButtonSelect) forControlEvents:UIControlEventTouchUpInside];
		[_aboutPhoneViewController.mainView.titleBar.menu2Button addTarget:self action:@selector(onMenu2ButtonSelect) forControlEvents:UIControlEventTouchUpInside];
	}
	return _aboutPhoneViewController;
}

- (AboutFavoriteColorsManageViewController *)aboutFavoriteManageViewController
{
	if (_aboutFavoriteManageViewController == nil) {
		_aboutFavoriteManageViewController = [[AboutFavoriteColorsManageViewController alloc] init];
		[_aboutFavoriteManageViewController.mainView.titleBar.menuButton addTarget:self action:@selector(onMenuButtonSelect) forControlEvents:UIControlEventTouchUpInside];
		[_aboutFavoriteManageViewController.mainView.titleBar.menu2Button addTarget:self action:@selector(onMenu2ButtonSelect) forControlEvents:UIControlEventTouchUpInside];
	}
	return _aboutFavoriteManageViewController;
}

- (void)onMenuButtonSelect
{
	[[AppData getInstance].appRevealController revealToggleAnimated:YES];
}

- (void)onMenu2ButtonSelect
{
	[[AppData getInstance].appRevealController rightRevealToggleAnimated:YES];
}

- (void)goTo:(AboutMainMenuItem)item
{
	switch (item) {
		case AboutMainMenuItemName:
			if (![self isAboutNameVisible]) {
				if (![self.viewControllers containsObject:self.aboutNameViewController]) {
					[self pushViewController:self.aboutNameViewController animated:NO];
				} else {
					[self popToViewController:self.aboutNameViewController animated:YES];
				}
			}
			break;
		case AboutMainMenuItemPhone:
			if (![self isAboutPhoneVisible]) {
				if (![self.viewControllers containsObject:self.aboutPhoneViewController]) {
					[self pushViewController:self.aboutPhoneViewController animated:NO];
				} else {
					[self popToViewController:self.aboutPhoneViewController animated:YES];
				}
			}
			break;
		case AboutMainMenuItemFavoriteColors:
			if (![self isAboutFavoriteColorsVisible]) {
				if (![self.viewControllers containsObject:self.aboutFavoriteManageViewController]) {
					[self pushViewController:self.aboutFavoriteManageViewController animated:NO];
				} else {
					[self popToViewController:self.aboutFavoriteManageViewController animated:YES];
				}
				[self.aboutFavoriteManageViewController go];
			}
			break;
		default:
			break;
	}
	
	[[NSNotificationCenter defaultCenter] postNotificationName:AppNotificationAboutMenuItemSelected object:self userInfo:@{AppNotificationKey0 : [NSNumber numberWithInt:item]}];
}

- (BOOL)isAboutNameVisible
{
	return [self.visibleViewController isKindOfClass:[AboutNameViewController class]];
}

- (BOOL)isAboutPhoneVisible
{
	return [self.visibleViewController isKindOfClass:[AboutPhoneViewController class]];
}

- (BOOL)isAboutFavoriteColorsVisible
{
	return [self.visibleViewController isKindOfClass:[AboutFavoriteColorsManageViewController class]];
}

- (void)sync
{
	if ([self isAboutNameVisible]) {
		[self.menuViewController selectItem:AboutMainMenuItemName];
	} else if ([self isAboutPhoneVisible]) {
		[self.menuViewController selectItem:AboutMainMenuItemPhone];
	} else if ([self isAboutFavoriteColorsVisible]) {
		[self.menuViewController selectItem:AboutMainMenuItemFavoriteColors];
	}
}

@end
