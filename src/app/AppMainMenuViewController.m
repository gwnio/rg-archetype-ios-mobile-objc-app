#import "AppMainMenuViewController.h"
#import "UIView+CommonAutoLayout.h"
#import "MenuTableViewCellItem.h"
#import "MenuTableViewCell.h"

@interface AppMainMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AppMainMenuViewController {
	NSMutableArray *_items;
	NSNumber *_preSelectItem;
}

- (id)init
{
	self = [super init];
	if (self) {
		_items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) loadView {
	[super loadView];
	
	[_items addObject:[[MenuTableViewCellItem alloc] init:[NSNumber numberWithInt:AppMainMenuItemAbout] :@"About" :@""]];
	[_items addObject:[[MenuTableViewCellItem alloc] init:[NSNumber numberWithInt:AppMainMenuItemLogout] :@"Logout" :@""]];
	
	[self.view addSubview:self.mainView];
	
	[self.mainView autoPinTopBottomViewController:self];
	[self.mainView autoPinLeftRightToSuper];
}

- (MenuView *)mainView
{
	if (_mainView == nil) {
		_mainView = [[MenuView alloc] initForAutoLayout];
	}
	return _mainView;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.mainView.tableView.dataSource = self;
	self.mainView.tableView.delegate = self;
	
	[self.mainView.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:[MenuTableViewCell reuseId]];
	
	if (_preSelectItem != nil) {
		[self selectItem:[_preSelectItem longLongValue]];
		_preSelectItem = nil;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	MenuTableViewCellItem *selectedItem = nil;
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	NSInteger slctdRow = cell.tag;
	for (int i = 0; i < _items.count; i++) {
		MenuTableViewCellItem *cellItem = (MenuTableViewCellItem*)_items[i];
		if (cellItem.row.intValue == slctdRow) {
			selectedItem = cellItem;
			break;
		}
	}
	if (self.onSelect != nil && selectedItem != nil) {
		self.onSelect(selectedItem.row.intValue);
	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	int count = (int)_items.count;
	return count;
}

- (MenuTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MenuTableViewCellItem *data = [_items objectAtIndex:indexPath.row];
	
	MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MenuTableViewCell reuseId]];
	if (cell == nil) {
		cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[MenuTableViewCell reuseId]];
	}
	cell.tag = data.row.intValue;
	cell.imageView.image = [UIImage imageNamed:data.imageNamed];
	cell.textLabel.text = data.label;
	
	return cell;
}

- (void)selectItem:(AppMainMenuItem)item
{
	if ([_items count] > 0) {
		for (int i = 0; i < _items.count; i++) {
			MenuTableViewCellItem *cellItem = (MenuTableViewCellItem*)_items[i];
			if (cellItem.row.intValue == item) {
				[self.mainView.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
				break;
			}
		}
	} else {
		_preSelectItem = [NSNumber numberWithLongLong:item];
	}
}

@end
