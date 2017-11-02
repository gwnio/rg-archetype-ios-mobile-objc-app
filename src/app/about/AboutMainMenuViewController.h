#import "CommonViewController.h"
#import "MenuView.h"

typedef NS_ENUM(NSInteger, AboutMainMenuItem) {
	AboutMainMenuItemName = 0,
	AboutMainMenuItemPhone = 1,
	AboutMainMenuItemFavoriteColors = 2
};

@interface AboutMainMenuViewController : CommonViewController

@property (nonatomic) MenuView *mainView;
@property (strong) void (^onSelect)(AboutMainMenuItem);

- (void)selectItem:(AboutMainMenuItem)itm;

@end
