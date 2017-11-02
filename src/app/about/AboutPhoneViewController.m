#import "AboutPhoneViewController.h"
#import "UIView+CommonAutoLayout.h"

@interface AboutPhoneViewController ()

@end

@implementation AboutPhoneViewController

- (void)loadView
{
	[super loadView];
	
	[self.view addSubview:self.mainView];
	
	[self.mainView autoPinTopBottomViewController:self];
	[self.mainView autoPinLeftRightToSuper];
}

- (AboutPhoneView *)mainView
{
	if (_mainView == nil) {
		_mainView = [[AboutPhoneView alloc] initForAutoLayout];
	}
	return _mainView;
}

@end
