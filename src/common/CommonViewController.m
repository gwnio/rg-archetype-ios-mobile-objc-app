#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

- (void) loadView {
	[super loadView];
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	if (self.vwDidAppr != nil) {
		self.vwDidAppr();
	}
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	
	if (self.vwDidDisappr != nil) {
		self.vwDidDisappr();
	}
}

@end
