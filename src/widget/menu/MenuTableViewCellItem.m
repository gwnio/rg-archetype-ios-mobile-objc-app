#import "MenuTableViewCellItem.h"

@implementation MenuTableViewCellItem

- (id)init:(NSNumber*)row :(NSString*)label :(NSString*)imageNamed
{
	self = [super init];
	_row = row;
	_label = label;
	_imageNamed = imageNamed;
	return self;
}

@end
