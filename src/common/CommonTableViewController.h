#import <UIKit/UIKit.h>
#import "CommonActivityIndicatorTableViewDataSource.h"
#import "CommonSingleRowTableViewDataSource.h"

@interface CommonTableViewController : UIViewController

@property CommonActivityIndicatorTableViewDataSource *loadingDataSource;
@property CommonSingleRowTableViewDataSource *emptyDataSource;
@property UITableView *tableView;

- (void)initWithTableView:(UITableView*)tableView;
- (void)activateLoadingDataSource;
- (void)activateCurrentDataSource;
- (id<UITableViewDataSource>)currentDataSource;
- (void (^)())scrollToTopCmd;

- (NSIndexPath*)getSelectedRow;
- (void)reloadSelectedRow;
- (void)reloadRow:(int)row :(int)section;
- (void)reloadRow:(NSIndexPath*)indexPath;

@end
