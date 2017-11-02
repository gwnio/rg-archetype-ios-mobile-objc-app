#import "MenuView.h"
#import "UIView+CommonAutoLayout.h"

@implementation MenuView

- (instancetype)initForAutoLayout
{
	self = [super initForAutoLayout];
	
	[self addSubview:self.titleBar];
	[self addSubview:self.tableView];
	
	[self stackViewsVertically:@[self.titleBar, self.tableView]];
	
	return self;
}

- (TitleBar *)titleBar
{
	if (_titleBar == nil) {
		_titleBar = [[TitleBar alloc] initForAutoLayout];
		[_titleBar configureForTitleOnly];
	}
	return _titleBar;
}

- (UITableView *)tableView
{
	if (_tableView == nil) {
		_tableView = [[UITableView alloc] initForAutoLayout];
		[_tableView setSeparatorInset:UIEdgeInsetsZero];
		_tableView.tableFooterView = [[UIView alloc] initForAutoLayout];
	}
	return _tableView;
}

@end
