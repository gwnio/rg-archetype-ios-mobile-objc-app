#import "AboutFavoriteColorsManageView.h"
#import "UIView+CommonAutoLayout.h"
#import "UIButton+App.h"
#import "AppWidgetUtils.h"
#import "UITableView+App.h"

@implementation AboutFavoriteColorsManageView {
	UIView *_toolbar;
}

- (instancetype)initForAutoLayout
{
	self = [super initForAutoLayout];
	
	[self initToolbar];
	
	[self addSubview:self.titleBar];
	[self addSubview:_toolbar];
	[self addSubview:self.tableView];
	
	[self stackViewsVertically:@[self.titleBar, _toolbar, self.tableView]];
	
	return self;
}

- (TitleBar2 *)titleBar
{
	if (_titleBar == nil) {
		_titleBar = [[TitleBar2 alloc] initForAutoLayout];
		_titleBar.titleText.text = @"About - Favorite Colors";
	}
	return _titleBar;
}

- (void)initToolbar
{
	_toolbar = [[UIView alloc] initForAutoLayout];
	[AppWidgetUtils applyButtonToolbarStyle:_toolbar];
	[_toolbar addSubview:self.addButton];
	[_toolbar addSubview:self.refreshButton];
	[_toolbar stackViewsHorizontally:@[self.addButton, self.refreshButton] :ALEdgeLeft :NO :3.0];
}

- (UIButton *)addButton
{
	if (_addButton == nil) {
		_addButton = [UIButton app_newImageButton:@"icon_32_blue_circle_add" :45 :45];
	}
	return _addButton;
}

- (UIButton *)refreshButton
{
	if (_refreshButton == nil) {
		_refreshButton = [UIButton app_newImageButton:@"icon_32_blue_refresh" :45 :45];
	}
	return _refreshButton;
}

- (UITableView *)tableView
{
	if (_tableView == nil) {
		_tableView = [UITableView app_autoLayoutWithEstimatedCellheightTable];
	}
	return _tableView;
}

@end
