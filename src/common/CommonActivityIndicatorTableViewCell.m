#import "CommonActivityIndicatorTableViewCell.h"
#import "UIView+AutoLayout.h"

@implementation CommonActivityIndicatorTableViewCell

+ (NSString*)reuseId
{
	return NSStringFromClass([self class]);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
		_activityIndicatorView.hidesWhenStopped = YES;
		
		[self.contentView addSubview:_activityIndicatorView];
		
		[_activityIndicatorView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.contentView];
		[_activityIndicatorView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.contentView];
	}
	return self;
}

@end
