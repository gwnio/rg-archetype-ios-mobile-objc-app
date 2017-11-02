#import "CommonViewController.h"
#import "MenuView.h"

typedef NS_ENUM(NSInteger, AppMainMenuItem) {
	AppMainMenuItemAbout = 0,
	AppMainMenuItemLogout = 1
};

@interface AppMainMenuViewController : CommonViewController

@property (nonatomic) MenuView *mainView;
@property (strong) void (^onSelect)(AppMainMenuItem);

- (void)selectItem:(AppMainMenuItem)itm;

@end
