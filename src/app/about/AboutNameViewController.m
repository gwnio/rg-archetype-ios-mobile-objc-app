#import "AboutNameViewController.h"
#import "UIView+CommonAutoLayout.h"
#import "AppActivityTracker.h"

@interface AboutNameViewController ()

@end

@implementation AboutNameViewController

- (void)loadView
{
	[super loadView];
	
	[self.view addSubview:self.mainView];
	
	[self.mainView autoPinTopBottomViewController:self];
	[self.mainView autoPinLeftRightToSuper];
}

- (AboutNameView *)mainView
{
	if (_mainView == nil) {
		_mainView = [[AboutNameView alloc] initForAutoLayout];
	}
	return _mainView;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[AppActivityTracker trackScreenView:self.mainView.titleBar.titleText.text];
}

@end
