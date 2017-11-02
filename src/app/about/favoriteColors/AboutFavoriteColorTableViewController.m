#import "AboutFavoriteColorTableViewController.h"
#import "CommonDeviceUtils.h"
#import "CommonAsyncCommand.h"
#import "AboutHttpService.h"
#import "CommonPagingLoadListResult.h"
#import "CommonOkAlertView.h"
#import "CommonCustomMessages.h"

@interface AboutFavoriteColorTableViewController ()

@end

@implementation AboutFavoriteColorTableViewController

- (id)init:(UITableView *)tableView
{
	[self initWithTableView:tableView];
	
	_recordsDataSource = [[AboutFavoriteColorTableViewDataSource alloc] init];
	
	_pagingLoadConfig = [[CommonPagingLoadConfig alloc] init];
	_pagingLoadConfig.limit = 3;
	
	return self;
}

- (id<UITableViewDataSource>)currentDataSource
{
	if ([self.recordsDataSource.data count] > 0) {
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		self.tableView.delegate = self;
		return self.recordsDataSource;
	} else {
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		self.tableView.delegate = nil;
		return self.emptyDataSource;
	}
}

- (void)load
{
	[self.recordsDataSource.data removeAllObjects];
	[self load:YES :[self scrollToTopCmd] :nil];
}

- (void)load:(BOOL)showLoadingMsg :(void (^)())successCommand :(void (^)())afterLoadCommand
{
	if ([CommonDeviceUtils isConnectionAvailable]) {
		[CommonAsyncCommand execute:^{
			if (showLoadingMsg) {
				[self activateLoadingDataSource];
			}
		} :^NSObject*() {
			self.pagingLoadConfig.offset = (int) self.recordsDataSource.data.count;
			CommonBasicResponseDTO *response = [AboutHttpService getFavoriteColors:self.pagingLoadConfig.offset :self.pagingLoadConfig.limit];
			return response;
		} :^(NSObject *rslt) {
			CommonBasicResponseDTO *resp = (CommonBasicResponseDTO*)rslt;
			if (resp.resultCode == CommonBasicResponseResultOk) {
				[self.recordsDataSource.data addObjectsFromArray:((CommonPagingLoadListResult*)resp.data).data];
				
				[self activateCurrentDataSource];
				
				if (successCommand != nil) {
					successCommand();
				}
			} else {
				[self activateCurrentDataSource];
				[[[CommonOkAlertView alloc] initWithMessage:[NSString stringWithFormat:@"%@ [34FR18]", CommonCustomMessagesInternalError] onOkSelect:nil] show];
			}
			
			if (afterLoadCommand != nil) {
				afterLoadCommand();
			}
		}];
	} else {
		[self activateCurrentDataSource];
		[[[CommonOkAlertView alloc] initWithMessage:CommonCustomMessagesNoNetwork onOkSelect:nil] show];
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *color = [self.recordsDataSource.data objectAtIndex:indexPath.row];
	[self.recordsDataSource.rowSelectDelegate onAboutFavoriteColorSelect:self :indexPath :color];
}

@end
