#import "UITableView+App.h"
#import "CommonDeviceUtils.h"
#import "UIView+AutoLayout.h"

@implementation UITableView (App)

- (void)app_configEstimateHeight:(CGFloat)estimatedCellHeight
{
	if ([CommonDeviceUtils osVerLt:@"8.0"]) {
		self.rowHeight = estimatedCellHeight;
	} else {
		self.estimatedRowHeight = estimatedCellHeight;
		self.rowHeight = UITableViewAutomaticDimension;
	}
}

- (void)app_configDisableMarginsReadableContentGuide
{
	if ([CommonDeviceUtils osVerGtEq:@"9.0"]) {
		self.cellLayoutMarginsFollowReadableWidth = NO;
	}
}

+ (UITableView*)app_autoLayoutWithEstimatedCellheightTable
{
	if ([CommonDeviceUtils osVerGtEq:@"8.0"]) {
		return [self app_autoLayoutWithEstimatedCellHeightTable:40];
	} else {
		return [self app_autoLayoutWithEstimatedCellHeightTable:50];
	}
}

+ (UITableView*) app_autoLayoutWithEstimatedCellHeightTable:(CGFloat)estimatedCellHeight
{
	UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	view.translatesAutoresizingMaskIntoConstraints = NO;
	
	[view app_configEstimateHeight:estimatedCellHeight];
	[view app_configDisableMarginsReadableContentGuide];
	
	view.tableFooterView = [[UIView alloc] initForAutoLayout];
	[view setSeparatorInset:UIEdgeInsetsMake(5.0, 0, 5.0, 0)];
	
	return view;
}

@end
