#import "CommonSingleRowTableViewDataSource.h"

@implementation CommonSingleRowTableViewDataSource {
	NSString *_cellId;
	UITableViewCellSelectionStyle _slctnStyle;
}

- (id)initWithCell:(NSString*)cellId :(UITableViewCellSelectionStyle)selectionStyle
{
	self = [super init];
	_cellId = cellId;
	_selectionStyle = selectionStyle;
	return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellId forIndexPath:indexPath];
	cell.selectionStyle = self.selectionStyle;
	return cell;
}

@end
