#import "CommonTableViewController.h"
#import "CommonActivityIndicatorTableViewCell.h"
#import "CommonNoResultsTableViewCell.h"

@interface CommonTableViewController ()

@end

@implementation CommonTableViewController

- (void)initWithTableView:(UITableView*)tableView
{
	_tableView = tableView;
	
	[self initDataSrcs];
	[self regCellClasses];
}

- (void)initDataSrcs
{
	_loadingDataSource = [[CommonActivityIndicatorTableViewDataSource alloc] initWithCell:[CommonActivityIndicatorTableViewCell reuseId] :UITableViewCellSelectionStyleNone];
	_emptyDataSource = [[CommonSingleRowTableViewDataSource alloc] initWithCell:[CommonNoResultsTableViewCell reuseId] :UITableViewCellSelectionStyleNone];
}

- (void)regCellClasses
{
	[_tableView registerClass:[CommonActivityIndicatorTableViewCell class] forCellReuseIdentifier:[CommonActivityIndicatorTableViewCell reuseId]];
	[_tableView registerClass:[CommonNoResultsTableViewCell class] forCellReuseIdentifier:[CommonNoResultsTableViewCell reuseId]];
}

- (void)activateLoadingDataSource
{
	_tableView.dataSource = _loadingDataSource;
	_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[_tableView reloadData];
}

- (void)activateCurrentDataSource
{
	_tableView.dataSource = [self currentDataSource];
	[_tableView reloadData];
}

- (id<UITableViewDataSource>)currentDataSource
{
	@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You must override in subclass" userInfo:nil];
}

- (void (^)())scrollToTopCmd
{
	return ^{
		_tableView.contentOffset = CGPointMake(0, 0 - _tableView.contentInset.top);
	};
}

- (NSIndexPath*)getSelectedRow
{
	NSIndexPath *idxPath = [_tableView indexPathForSelectedRow];
	return idxPath;
}

- (void)reloadSelectedRow
{
	[self reloadRow:[self getSelectedRow]];
}

- (void)reloadRow:(int)row :(int)section
{
	[self reloadRow:[NSIndexPath indexPathForRow:row inSection:section]];
}

- (void)reloadRow:(NSIndexPath*)indexPath
{
	[_tableView beginUpdates];
	[_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
	[_tableView endUpdates];
}


@end
