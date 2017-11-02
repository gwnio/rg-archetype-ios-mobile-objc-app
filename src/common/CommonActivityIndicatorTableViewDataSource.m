#import "CommonActivityIndicatorTableViewDataSource.h"
#import "CommonActivityIndicatorTableViewCell.h"

@implementation CommonActivityIndicatorTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CommonActivityIndicatorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CommonActivityIndicatorTableViewCell reuseId]];
	if (cell == nil) {
		cell = [[CommonActivityIndicatorTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[CommonActivityIndicatorTableViewCell reuseId]];
	}
	cell.selectionStyle = self.selectionStyle;
	[cell.activityIndicatorView startAnimating];
	return cell;
}

@end
