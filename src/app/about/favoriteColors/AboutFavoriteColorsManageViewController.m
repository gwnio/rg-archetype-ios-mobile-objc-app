#import "AboutFavoriteColorsManageViewController.h"
#import "UIView+CommonAutoLayout.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "AppActivityTracker.h"
#import "CommonOkAlertView.h"

@interface AboutFavoriteColorsManageViewController () <AboutFavoriteColorSelectDelegate>

@end

@implementation AboutFavoriteColorsManageViewController

- (void)loadView
{
	[super loadView];
	
	[self.view addSubview:self.mainView];
	
	[self.mainView autoPinTopBottomViewController:self];
	[self.mainView autoPinLeftRightToSuper];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	__weak AboutFavoriteColorsManageViewController *weakSelf = self;
	
	[self.mainView.refreshButton addTarget:self action:@selector(onRefreshButtonSelect) forControlEvents:UIControlEventTouchUpInside];
	
	[self.mainView.tableView addInfiniteScrollingWithActionHandler:^{
		[weakSelf.tableViewController load:NO :nil :^{
			[weakSelf.mainView.tableView.infiniteScrollingView stopAnimating];
		}];
	}];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[AppActivityTracker trackScreenView:self.mainView.titleBar.titleText.text];
}

- (AboutFavoriteColorsManageView *)mainView
{
	if (_mainView == nil) {
		_mainView = [[AboutFavoriteColorsManageView alloc] initForAutoLayout];
	}
	return _mainView;
}

- (AboutFavoriteColorTableViewController *)tableViewController
{
	if (_tableViewController == nil) {
		_tableViewController = [[AboutFavoriteColorTableViewController alloc] init:self.mainView.tableView];
		_tableViewController.recordsDataSource.rowSelectDelegate = self;
	}
	return _tableViewController;
}

- (void)onRefreshButtonSelect
{
	[self.tableViewController load];
}

- (void)go
{
	[self.tableViewController load];
}

- (void)onAboutFavoriteColorSelect:(UIViewController *)vc :(NSIndexPath *)indexPath :(NSString *)color
{
	[[[CommonOkAlertView alloc] initWithMessage:[NSString stringWithFormat:@"%@ is the color selected.", color] onOkSelect:nil] show];
}

@end
