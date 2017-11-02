#import "CommonViewController.h"
#import "AboutFavoriteColorsManageView.h"
#import "AboutFavoriteColorTableViewController.h"

@interface AboutFavoriteColorsManageViewController : CommonViewController

@property (nonatomic) AboutFavoriteColorsManageView *mainView;
@property (nonatomic) AboutFavoriteColorTableViewController *tableViewController;

- (void)go;

@end
