#import "AboutFavoriteColorTableViewDataSource.h"

@implementation AboutFavoriteColorTableViewDataSource

- (id)init {
	self = [super init];
	_data = [[NSMutableArray alloc] init];
	[_data addObject:@"Red"];
	[_data addObject:@"Yellow"];
	[_data addObject:@"Black"];
	[_data addObject:@"White"];
	return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSMutableString *reuseId = [NSMutableString stringWithString:@"AboutFavoriteColorTableViewCell"];
	NSString *color = [self.data objectAtIndex:indexPath.row];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
	}
	
//	if (obj.dfault) {
//		cell.imageView.image = [UIImage imageNamed:@"ao_ico_24_blue_yes"];
//	} else {
//		cell.imageView.image = [UIImage imageNamed:@"ao_ico_24_trnsprnt"];
//	}
	cell.textLabel.text = color;
	
	return cell;
}

@end
