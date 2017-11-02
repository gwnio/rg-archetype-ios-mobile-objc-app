#import "CommonNoResultsTableViewCell.h"
#import "UIView+AutoLayout.h"
#import "UIColor+Common.h"

@implementation CommonNoResultsTableViewCell

+ (NSString*)reuseId
{
	return NSStringFromClass([self class]);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self.contentView addSubview:self.noResultsLabel];
		
		[self.noResultsLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.contentView withOffset:8.0];
		[self.noResultsLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.contentView withOffset:8.0];
		[self.noResultsLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.contentView withOffset:-8.0];
	}
	return self;
}

- (UILabel *)noResultsLabel
{
	if (_noResultsLabel == nil) {
		_noResultsLabel = [[UILabel alloc] initForAutoLayout];
		_noResultsLabel.textColor = [UIColor common_fromHex:@"B0B0B0"];
		_noResultsLabel.text = @"No Results";
	}
	return _noResultsLabel;
}

@end
