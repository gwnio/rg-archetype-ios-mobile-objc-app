#import "CommonTableViewController.h"
#import "AboutFavoriteColorTableViewDataSource.h"
#import "CommonPagingLoadConfig.h"

@interface AboutFavoriteColorTableViewController : CommonTableViewController<UITableViewDelegate>

@property (nonatomic) AboutFavoriteColorTableViewDataSource *recordsDataSource;
@property (nonatomic) CommonPagingLoadConfig *pagingLoadConfig;

- (id)init:(UITableView*)tableView;
- (void)load;
- (void)load:(BOOL)showLoadingMsg :(void (^)())successCommand :(void (^)())afterLoadCommand;

@end
